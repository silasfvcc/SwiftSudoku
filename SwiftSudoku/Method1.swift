//
//  Method1.swift
//  SwiftSudoku
//
//  Created by Silas Schwarz on 3/10/17.
//  Copyright © 2017 Silas Schwarz. All rights reserved.
//

import Foundation

func Method1(board: Board) -> Board? {
    var board = board
    for row in 0 ..< board.length {
        for column in 0 ..< board.length {
            if board.contents[row][column] == 0 {
                for possible in 1...board.length {
                    board.contents[row][column] = possible
                    if let solution = Method1(board: board) {
                        return solution
                    }
                }
                return nil
            }
        }
    }
    return board.isSolved() ? board : nil
}
