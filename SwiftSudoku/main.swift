//
//  main.swift
//  SwiftSudoku
//
//  Created by Silas Schwarz on 3/10/17.
//  Copyright © 2017 Silas Schwarz. All rights reserved.
//

import Foundation

func StopwatchBlock(block: () -> ()) -> Double {
    let startTime = clock()
    block()
    return Double(clock() - startTime) / Double(CLOCKS_PER_SEC)
}

let board4x4 = Board(contents: [
    [0,4,0,3],
    [3,0,0,0],
    [0,0,0,1],
    [1,0,2,0]
    ])
let board9x9 = Board(contents: [
    [0,0,0,0,0,2,0,0,0],
    [0,0,0,9,1,0,0,6,8],
    [0,5,0,0,4,0,0,3,2],
    [0,0,0,0,3,0,4,0,9],
    [7,6,0,0,5,0,0,1,3],
    [5,0,3,0,9,0,0,0,0],
    [1,7,0,0,6,0,0,2,0],
    [4,2,0,0,8,9,0,0,0],
    [0,0,0,1,0,0,0,0,0]
    ])
let board16x16 = Board(contents: [
    [0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0xE,0x7,0x2,0x5,0x0,0x0,0x0],
    [0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0xF,0x0,0x0,0x5,0x0,0x2,0xA,0x4],
    [0x0,0x0,0x0,0x0,0x0,0x0,0x8,0xB,0x0,0x4,0x6,0x3,0x1,0xD,0x0,0x0],
    [0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x4,0x0,0x0,0x0,0xA,0x0,0x0,0x0,0x9],
    [0x0,0x0,0x2,0x0,0x0,0x0,0x0,0xA,0x0,0xF,0x0,0x0,0xB,016,0x0,0x0],
    [0x0,0x4,0x0,0x0,0x9,0x0,0x0,0xF,0x0,0x2,0x5,0x0,0x0,0x8,0x0,0x3],
    [0x9,0x0,0x7,0x0,0x0,0x0,0x0,0x0,0x0,0xA,0x3,0x0,0x0,0x0,0xC,0x0],
    [0x1,0xF,0x0,0x0,0x0,0x3,0x0,0x7,0x9,0x0,016,0x0,0x0,0x0,0x0,0xA],
    [0x0,0x0,0x0,0x2,0x8,0x0,016,0x6,0x7,0x0,0x0,0x9,0x0,0x0,0x0,0x0],
    [0x7,0x0,0x0,0x1,0xA,0x0,0x0,0x0,0x0,0x8,0x0,0xD,0x0,0x0,0x4,0x0],
    [0xB,0x0,0x0,0x5,0x0,0x4,0x0,0x0,0x6,0x0,0xE,0xC,0x9,0x0,0xF,0x7],
    [0x0,0x0,0x0,0x6,0x0,0x0,0x0,0x0,0x3,0x0,0x0,0x4,016,0x0,0x0,0x0],
    [0x0,0x9,0x0,0x0,0x0,0x0,0x1,0x5,0x0,0x0,0x0,0x0,0x4,0xB,0x0,016],
    [0x4,0x7,0x1,0x8,0x0,0xA,0xD,0x0,0xE,0x0,0x0,0x0,0x0,0x0,0x0,0x0],
    [0xA,0x0,0x5,0x0,0xB,0x0,0x0,0x9,0x0,0x0,0x0,0xF,0x0,0x0,0xE,0x6],
    [0xC,0x0,0xE,0xD,0x0,0x0,0x3,0x8,0x0,0x0,0x0,0x0,0x0,0x5,0x7,0x2]
    ])

print("Testing different methods for solving Sudoku puzzles:")
print("\n--- Method1 ---\n")

let time4x4Method1 = StopwatchBlock {
    if let solution4x4 = Method1(board: board4x4) {
        solution4x4.print()
    } else {
        print("4x4 sample has no solution.")
    }
}
print("Method1 solved the 4x4 sample in \(time4x4Method1) seconds.")

print("\n––– Method2 ---\n")

let time4x4Method2 = StopwatchBlock {
    if let solution4x4 = Method2(board: board4x4) {
        solution4x4.print()
    } else {
        print("4x4 sample has no solution.")
    }
}
print("Method2 solved the 4x4 sample in \(time4x4Method2) seconds.\n")

let time9x9Method2 = StopwatchBlock {
    if let solution9x9 = Method2(board: board9x9) {
        solution9x9.print()
    } else {
        print("9x9 sample has no solution.")
    }
}
print("Method2 solved the 9x9 sample in \(time9x9Method2) seconds.\n")

let time16x16Method2 = StopwatchBlock {
    if let solution16x16 = Method2(board: board16x16) {
        solution16x16.print()
    } else {
        print("16x16 sample has no solution.")
    }
}
print("Method2 solved the 16x16 sample in \(time16x16Method2) seconds.\n")