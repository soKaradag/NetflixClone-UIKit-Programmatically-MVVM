//
//  Extentions.swift
//  ProgrammaticUI
//
//  Created by Serdar Onur KARADAĞ on 26.05.2023.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
