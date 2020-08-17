import stomp

conn = stomp.Connection([("192.168.0.105", 61613)])  
conn.connect('guest', 'guest', wait=True)
#conn = stomp.Connection(host_and_ports=[('127.0.0.1', 61613)])
conn.send(body= 'RodaSuaMocreia', destination='/queue/test')
conn.disconnect()