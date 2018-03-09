//
//  Team.swift
//  Projet 3
//
//  Created by Michael Favre on 02/02/2018.
//  Copyright © 2018 Michael Favre. All rights reserved.
//

import Foundation

// Team creation
class Team {
    var heroes = [Hero]()
    
    
    
    
    func createHeroes() {
        
        for _ in 0..<3 {
            
            print("")
            print("==========================")
            print("1 - The Warrior: The handsome bloke 🤺")
            print("2 - The Wizard: The healer who is always high 🧙🏻‍♂️")
            print("3 - The Dwarf: The feisty midget in town 💀")
            print("4 - The Colossus: The big dumb brute who loves picking daffodils 🌼")
            print("=========================")
            
            //MARK: Variables
            var userChoice = 0
            
            // User's choice of hero
            repeat {
                userChoice = Tools.inputInt()
                
            } while userChoice != 1 && userChoice != 2 && userChoice != 3 && userChoice != 4
            
            // User's choice of hero name
            print("Enter your hero's name")
            
            switch userChoice {
            case 1:
                let warrior = Warrior(name: NameCheck.shared.uniqueHeroName())
                heroes.append(warrior)
            case 2:
                let wizard = Wizard(name: NameCheck.shared.uniqueHeroName())
                heroes.append(wizard)
            case 3:
                let dwarf = Dwarf(name: NameCheck.shared.uniqueHeroName())
                heroes.append(dwarf)
            case 4:
                let colossus = Colossus(name: NameCheck.shared.uniqueHeroName())
                heroes.append(colossus)
            default:
                break
            }
        }
    }
    // Team description
    func teamDescription() {
        // Go through the array "Heroes"
        // Call the function "describe" of each hero
        // Use a "for" loop to view the array
        
        for i in 0..<heroes.count {
            let hero = heroes[i]
            hero.describe(index: i)
        }
    }
    // A hero is dead! ⛪️
    func isDead(index: Int) -> Bool {
        var isDead = false
        for hero in heroes {
            if hero.energy == 0 {
                isDead = true
            } else {
                return false
            }
        }
        print("Team \(index) all your heroes are dead! 😖 😵 ⚰️ ☠️  👻  ====== GAME OVER!")
        return isDead
    }
}

