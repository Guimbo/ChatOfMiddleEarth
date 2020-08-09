//
//  StringExtension.swift
//  Domain
//
//  Created by Guilherme Araujo on 09/08/20.
//  Copyright © 2020 Guilherme Araujo. All rights reserved.
//

import Foundation

extension String {
  func withoutWhitespace() -> String {
    return self.replacingOccurrences(of: "\n", with: "")
      .replacingOccurrences(of: "\r", with: "")
      .replacingOccurrences(of: "\0", with: "")
  }
}
