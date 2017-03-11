//
//  Method2.swift
//  SwiftSudoku
//
//  Created by Silas Schwarz on 3/11/17.
//  Copyright © 2017 Silas Schwarz. All rights reserved.
//

import Foundation

func Method2(board: Board) -> Board? {
    var board = board
    for row in 0 ..< board.length {
        for column in 0 ..< board.length {
            if board.contents[row][column].value == 0 {
                var possible = Set(1...board.length)
                let blockX = (row / board.n) * board.n
                let blockY = (column / board.n) * board.n
                for i in 0 ..< board.length {
                    possible.remove(board.contents[row][i].value)
                    possible.remove(board.contents[i][column].value)
                    possible.remove(board.contents[blockX + (i % board.n)][blockY + (i / board.n)].value)
                }
                for item in possible {
                    board.contents[row][column].value = item
                    if let solution = Method2(board: board) {
                        return solution
                    }
                }
                return nil
            }
        }
    }
    return board.isSolved() ? board : nil
}
