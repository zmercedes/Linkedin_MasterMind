//
//  RandomAPI.swift
//  MasterMind
//
//  Created by Zoilo Mercedes on 2/2/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import Foundation

enum RandomAPI { }

extension RandomAPI {
    struct get {
        let result: (()-> [Int]?)
        init(total: Int, min: Int, max: Int){
            let url = "https://www.random.org/integers/?num=\(total)&min=\(min)&max=\(max)&col=1&base=10&format=plain&rnd=new"
            result = {
                do {
                    let data = try Data(contentsOf: URL(string: url)!)
                    let numbers = String(data: data, encoding: .utf8)!.components(separatedBy: "\n")
                        .compactMap { Int($0) }
                    return numbers
                } catch {
                    return nil
                }
            }
        }
    }
}
