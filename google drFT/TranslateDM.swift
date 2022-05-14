//
//  TranslateDM.swift
//  google drFT
//
//  Created by Azizbek Salimov on 13.05.2022.
//

import Foundation
import UIKit

// MARK: - Translate
struct Translate: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let translations: [Translation]
}

// MARK: - Translation
struct Translation: Codable {
    let translatedText: String
}
