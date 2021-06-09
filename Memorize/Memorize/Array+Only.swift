//
//  Array+Only.swift
//  Memorize
//
//  Created by Alex on 09.06.2021.
//

import Foundation

extension Array{
    var only: Element?{
        count == 1 ? first : nil
    }
}
