//
//  MethodFirstLook.swift
//  SwiftSudoku
//
//  Created by Silas Schwarz on 3/31/17.
//  Copyright © 2017 Silas Schwarz. All rights reserved.
//

import Foundation

class Spot {
    let column: Int
    let row: Int
    var possible: Set<Int>
    
    init(column: Int, row: Int, board: Board) {
        self.column = column
        self.row = row
        self.possible = Set(1...board.length)
        self.update(board: board)
    }
    
    func update(board: Board) {
        let blockX = (row / board.n) * board.n
        let blockY = (column / board.n) * board.n
        for i in 0 ..< board.length {
            possible.remove(board.contents[self.row][i])
            possible.remove(board.contents[i][self.column])
            possible.remove(board.contents[blockX + (i % board.n)][blockY + (i / board.n)])
        }
    }
}

func MethodFirstLook(board: Board) -> Board? {
    var board = board
    var firstLook = [Spot]()
    for column in 0 ..< board.length {
        for row in 0 ..< board.length {
            if board.contents[row][column] == 0 {
                firstLook.append(Spot(column: column, row: row, board: board))
            }
        }
    }
    while true {
        if firstLook.count == 0 {
            return board
        }
        for item in firstLook {
            item.update(board: board)
        }
        firstLook.sort { (a: Spot, b: Spot) -> Bool in
            return a.possible.count < b.possible.count
        }
        var next = firstLook.first!
        if next.possible.count == 0 {
            return nil as Board?
        }
        if next.possible.count == 1 {
            repeat {
                board.contents[next.row][next.column] = next.possible.first!
                firstLook.removeFirst()
                guard firstLook.count > 0 else {
                    return board
                }
                next = firstLook.first!
            } while next.possible.count == 1
            continue
        } else {
            for item in next.possible {
                board.contents[next.row][next.column] = item
                if let finished = MethodFirstLook(board: board) {
                    return finished
                }
            }
        }
        
    }
}
