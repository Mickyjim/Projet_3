//
//  NameCheck.swift
//  Projet 3
//
//  Created by Michael Favre on 09/03/2018.
//  Copyright © 2018 Michael Favre. All rights reserved.
//

import Foundation

// Use of Singleton Pattern for name check to avoid use of name repetition
class NameCheck {
    static let shared = NameCheck()
    private init() {}
    
    var uniqueHeroNames = [String]()
    
    func uniqueHeroName() -> String {
        var heroName = ""
        
        repeat {
            heroName = Tools.inputString()
            if uniqueHeroNames.contains(heroName) {
                print("That hero's name has already been used! Be more creative and find him a new name!🙄")
                heroName = ""
            }
            uniqueHeroNames.append(heroName)
            
        } while heroName == ""
        
        return heroName
    }
}
