//
//  String+trimm.swift
//  Foody
//
//  Created by Khalid Gad on 06/09/2024.
//


import Foundation

extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
