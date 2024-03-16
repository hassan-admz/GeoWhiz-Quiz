//
//  String+Extensions.swift
//  GeoWhiz Quiz
//
//  Created by user on 12/3/24.
//

import UIKit

extension String {
    func decodedAttributedString() -> NSAttributedString? {
        let encodedData = self.data(using: .utf8)!
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        
        return try? NSAttributedString(data: encodedData, options: options, documentAttributes: nil)
    }
    
    func decodedString() -> String {
        return self.decodedAttributedString()?.string ?? self
    }
}
