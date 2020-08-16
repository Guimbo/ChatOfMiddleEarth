//
//  ChatRoomImplementation.swift
//  Socket
//
//  Created by Guilherme Araujo on 09/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation
import Domain


public class ChatRoom: NSObject {
    
    //properties
    private var inputStream: InputStream!
    private var outputStream: OutputStream!
    weak var delegate: ChatRoomDelegate?
    private var username: String?
    private var portnumber: UInt32?
    private let maxReadLength = 4096
    
    public func attachDelegate(delegate: ChatRoomDelegate) {
        self.delegate = delegate
    }
    
}

extension ChatRoom: ChatRoomInterface {
    
    public func setupNetworkCommunication(inPort portnumber: UInt32) {
        
        //0 - Atualiza numero da porta
        self.portnumber = portnumber
        //1 - Configura fluxos de socket não inicializados sem gerenciamento automático de memória
        var readStream: Unmanaged<CFReadStream>?
        var writeStream: Unmanaged<CFWriteStream>?
        
        //2 - Liga os fluxos e os conecta ao socket do host na porta digitada
        //------>Função usa o Allocator para inicializar os streams. Especifica o hostname. a porta. Inicializa os fluxos internamente
        CFStreamCreatePairWithSocketToHost(kCFAllocatorDefault, "localhost" as CFString, portnumber, &readStream, &writeStream)
          
        // permite capturar simultaneamente uma referência retida
        //e gravar uma retenção desequilibrada, para que a memória
        //não vaze mais tarde. Agora você pode usar os fluxos de entrada
        //e saída quando precisar deles.
        
        inputStream = readStream!.takeRetainedValue()
        outputStream = writeStream!.takeRetainedValue()
        
        inputStream.delegate = self
        
        //Add streams em um run loop
        inputStream.schedule(in: .current, forMode: .common)
        outputStream.schedule(in: .current, forMode: .common)
        
        //abrir portão de comunicação
        inputStream.open()
        outputStream.open()
    }
    
    public func joinChat(username: String, friend: String) {
        //Contrói a mensagem com um chat room protocol
        let data = "iam:\(username):\(friend)".data(using: .utf8)!
        
        //salva o nome para usar no chat depois
        self.username = username
        
        //Uma maneira conveniente de trabalhar com uma versão de ponteiro insegura de alguns dados dentro dos limites seguros de uma closure.
        _ = data.withUnsafeBytes{
          guard let pointer = $0.baseAddress?.assumingMemoryBound(to: UInt8.self) else {
            print("Error joining chat")
            return
          }
          // Escreve a mensagem limitando os caracteres
          outputStream.write(pointer, maxLength: data.count)
        }
    }
    
    public func send(message: String, toFriend friend: String) {
        let data = "msg:\(message):\(friend)".data(using: .utf8)!
        
        _ = data.withUnsafeBytes{
          guard let pointer = $0.baseAddress?.assumingMemoryBound(to: UInt8.self) else {
            print("Error joining chat")
            return
        }
        // Escreve a mensagem limitando os caracteres
        outputStream.write(pointer, maxLength: data.count)
        }
    }
    
    public func stopChatSession() {
        inputStream.close()
        outputStream.close()
    }
    
     
}

extension ChatRoom: StreamDelegate {

    //Verificar mensagem recebida
    public func stream(_ aStream: Stream, handle eventCode: Stream.Event) {
       switch eventCode {
       case .hasBytesAvailable:
         print("New message received")
         readAvailableBytes(stream: aStream as! InputStream)
       case .endEncountered:
         print("New message received")
         stopChatSession()
       case .errorOccurred:
         print("Error Occured")
       case .hasSpaceAvailable:
         print("Has space Available")
       default:
         print("Some Other Event...")
       }
     }

     private func readAvailableBytes(stream: InputStream) {
       //Configura o buffer no qual se pode ler os bytes recebidos.
       let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: maxReadLength)
       
       //Fz um loop enquanto o stream de entrada tiver bytes para ler.
       while stream.hasBytesAvailable {
       
       //Em cada ponto, chama a função de read, para ler os bytes do stream
       //e os colocará no buffer passado.
         let numberOfBytesRead = inputStream.read(buffer, maxLength: maxReadLength)
         
       // Se a chamada no read retornar algum valor negativo, algum erro ocorreu e break
         if numberOfBytesRead < 0, let error = stream.streamError {
           print(error)
           break
         }
         
         //Contruct The message Object
         if let message = processMessageString(buffer: buffer, length: numberOfBytesRead) {
           //notify interested parties
           delegate?.received(message: message)
           print("dentro do delegate")
           print(message)
         }
       }
     }
     
     private func processMessageString(buffer: UnsafeMutablePointer<UInt8>, length: Int) -> Message? {
       //Init String usandi o buffer e o tamanho. Trata o texto como UTF-8, diz pra string liberar o buffer de
       // bytes quando estiver concluída. Depois divide a mensagem para tratat o nome e a mensagem separadamente.
        guard let stringArray = String( bytesNoCopy: buffer, length: length, encoding: .utf8,
                                   freeWhenDone: true)?.components(separatedBy: ":") else { return nil }
        guard let name = stringArray.first else { return nil }
        let message = stringArray[2]
        guard let destiny = stringArray.last else { return nil }
       // Descobre se este cliente ou outro enviou a mensagem com base no nome. Em produção usaria-se um token exclusivo.
       let messageSender: MessageSender = (name == self.username) ? .ourself : .someoneElse
       
       //Contrói a mensagem e a retorna.
       return Message(message: message, messageSender: messageSender, username: name, destiny: destiny)
     }
}
