//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Alex on 08.06.2021.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count{
            if matching.id == self[index].id{
                return index
            }
        }
        return nil
    }
}
