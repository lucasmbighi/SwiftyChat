//
//  String+isValidPassword.swift
//  SwiftChat
//
//  Created by Lucas Bighi on 09/06/25.
//

import Foundation

extension String {
    var isValidPassowrd: Bool {
        self.count >= 6
    }
}
