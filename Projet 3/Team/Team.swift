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
    var heroes = [Heroes]()
    var uniqueHeroNames = [String]()
    
    func uniqueHeroName() -> String {
        var heroName = ""
        
        repeat {
            heroName = Tools.inputString()
            if uniqueHeroNames.contains(heroName) {
                print("That hero's name has already been used! Enter a new name")
                heroName = ""
            }
            uniqueHeroNames.append(heroName)
            
        } while heroName == ""
        
        return heroName
    }
    
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
                let warrior = Warrior(name: uniqueHeroName())
                heroes.append(warrior)
            case 2:
                let wizard = Wizard(name: uniqueHeroName())
                heroes.append(wizard)
            case 3:
                let dwarf = Dwarf(name: uniqueHeroName())
                heroes.append(dwarf)
            case 4:
                let colossus = Colossus(name: uniqueHeroName())
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
    func isDead() -> Bool {
        var isDead = false
        for hero in heroes {
            if hero.energy == 0 {
                isDead = true
            } else {
                return false
            }
        }
        print("Your heroes \(heroes) are dead! 😖 😵 ⚰️ ☠️  👻 ")
        return isDead
    }
}

