//
//  Spot.swift
//  SwiftSudoku
//
//  Created by Silas Schwarz on 3/10/17.
//  Copyright © 2017 Silas Schwarz. All rights reserved.
//

import Foundation

struct Spot: Hashable {
    var value = 0
    public var hashValue: Int {
        get {
            return value
        }
    }
    
    init(value: Int) {
        self.value = value
    }
    
    public static func ==(lhs: Spot, rhs: Spot) -> Bool {
        return lhs.value == rhs.value
    }
}
