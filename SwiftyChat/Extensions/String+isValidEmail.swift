//
//  String+isValidEmail.swift
//  SwiftChat
//
//  Created by Lucas Bighi on 09/06/25.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        self.contains("@") && self.contains(".")
    }
}
