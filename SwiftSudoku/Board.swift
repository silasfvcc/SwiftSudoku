//
//  Board.swift
//  SwiftSudoku
//
//  Created by Silas Schwarz on 3/10/17.
//  Copyright © 2017 Silas Schwarz. All rights reserved.
//

import Foundation

struct Board {
    var contents: [[Spot]]
    let n: Int
    let length: Int
    
    init(contents: [[Int]]) {
        self.contents = [[Spot]]()
        for row in 0 ..< contents.count {
            var item = [Spot]()
            for column in 0 ..< contents.count {
                item.append(Spot(value: contents[row][column]))
            }
            self.contents.append(item)
        }
        self.n = Int(sqrt(Double(contents.count)))
        self.length = n * n
    }
    
    func print() {
        for row in contents {
            for item in row {
                Swift.print("\(item.value),", terminator: "")
            }
            Swift.print()
        }
    }
    
    func isSolved() -> Bool {
        for i in 0 ..< length {
            var rowSet = Set(1...length)
            var columnSet = Set(1...length)
            var blockSet = Set(1...length)
            
            let blockX = (i % n) * n
            let blockY = (i / n) * n
            for j in 0 ..< length {
                rowSet.remove(contents[i][j].value)
                columnSet.remove(contents[j][i].value)
                blockSet.remove(contents[blockX + j % n][blockY + j / n].value)
            }
            if rowSet.count + columnSet.count + blockSet.count != 0 {
                return false
            }
        }
        return true
    }
}
