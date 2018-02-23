//
//  Tools.swift
//  Projet 3
//
//  Created by Michael Favre on 07/02/2018.
//  Copyright © 2018 Michael Favre. All rights reserved.
//

import Foundation

// Toolbox

class Tools {
    
    static func inputInt() -> Int {
        guard let input = readLine() else { return 0 }
        guard let number = Int(input) else { return 0 }
        return number
        
    }
    
    static func inputString() -> String {
        guard let input = readLine() else { return "" }
        return input
        
    }
}
