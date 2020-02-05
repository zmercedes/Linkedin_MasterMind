//
//  String.swift
//  MasterMind
//
//  Created by Zoilo Mercedes on 2/4/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import Foundation

extension String {
    func match(other: String) -> [Int] {
        var result: [Int] = [0,0]
        var dict: [Character: Int] = [:]
       
        for i in 0..<self.count {
            let letter = self[index(startIndex, offsetBy: i)]
            if let c = dict[letter] {
                dict[letter] = c + 1
            } else {
                dict[letter] = 1
            }
            if letter == other[index(startIndex, offsetBy: i)] {
                result[1] = result[1] + 1
            }
        }
        
        for letter in other {
            if let c = dict[letter], c > 0 {
                dict[letter] = c - 1
                result[0] = result[0] + 1
            }
        }
        
        return result
    }
}
