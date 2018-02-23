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
    
    func createHeroes() {
       
        for _ in 0..<3 {
           
            print("")
            print("==========================")
            print("1 - The Warrior: The handsome bloke 🕺🏻")
            print("2 - The Wizard: The healer who is always high 🧙🏻‍♂️")
            print("3 - The Dwarf: The feisty midget in town ☠️")
            print("4 - The Colossus: The big dumb brute who loves picking daffodils 🌼")
            print("=========================")
            
            //MARK: Variables
            var userName = ""
            var userChoice = 0
            
            // User's choice of hero
            
            repeat {
                userChoice = Tools.inputInt()
                
            } while userChoice != 1 && userChoice != 2 && userChoice != 3 && userChoice != 4
            
            // User's choice of hero name
            
            print("Enter your hero's name")
            
            repeat {
                userName = Tools.inputString()
                
            } while userName == ""
            
            switch userChoice {
            case 1:
                let warrior = Warrior(name: userName)
                heroes.append(warrior)
            case 2:
                let wizard = Wizard(name: userName)
                heroes.append(wizard)
            case 3:
                let dwarf = Dwarf(name: userName)
                heroes.append(dwarf)
            case 4:
                let colossus = Colossus(name: userName)
                heroes.append(colossus)
            default:
                break
            }
        }
        
    }

    func teamDescription() {
            // Parcourir tableau "Heroes"
            // Appeler la fonction "describe" de chacun des héros
            // Utiliser une boucle "for" pour parcourir le tableau
        
        for hero in heroes {
            hero.describe()
        }
    }
    
    func isDead() -> Bool {
        var isDead = false
        for hero in heroes {
            if hero.energy == 0 {
                isDead = true
            } else {
                return false
            }
        }
        return isDead
        
    }
}

