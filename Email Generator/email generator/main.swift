//
//  main.swift
//  email generator
//
//  Created by Даниил Храповицкий on 12.09.2020.
//

import Foundation

let alnum = "abcdefghijklmopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-1234567890"
let lower = "abcdefghijklmopqrstuvwxyz"

for _ in 0 ..< 20 {
    var email: String = ""
    
    for _ in 0 ..< Int.random(in: 4 ..< 10) {
        var random = Int.random(in: 0 ..< alnum.count)
        
        if alnum[random] == "-" && email.count == 0 {
            random += Int.random(in: -26 ... -1)
        }
        
        email += alnum[random]
    }
    
    email += "@"
    
    for _ in 0 ..< Int.random(in: 2 ... 7) {
        let random = Int.random(in: 0 ..< lower.count)
        
        email += lower[random]
    }
    
    email += "."
    
    for _ in 0 ..< Int.random(in: 2 ... 3) {
        let random = Int.random(in: 0 ..< lower.count)
        
        email += lower[random]
    }
    
    print(email)
}

extension String {
    subscript (i: Int) -> String {
        let start = index(startIndex, offsetBy: i)
        let end = index(start, offsetBy: 1)
        return String(self[start ..< end])
    }
}
