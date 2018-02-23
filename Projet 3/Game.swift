//
//  Game.swift
//  Projet 3
//
//  Created by Michael Favre on 02/02/2018.
//  Copyright © 2018 Michael Favre. All rights reserved.
//

import Foundation


class Game {
    
    //MARK: - Vars
    var teams = [Team]()
    
    //MARK: - Methods
    func start() {
       
        print("")
        print("==========================")
        print("Welcome to Mortal Kombat!")
        print("=========================")
        print("")
        
        for i in 0..<2 {
            print("")
            print("Team \(i+1) - Select your heroes")
            
            let team = createTeam()
            teams.append(team)
        }
        fight()

    }
    
    // Welcome interface
    func createTeam() -> Team {
        let team = Team()
        team.createHeroes()
        return team
    }
    
    //MARK: - Methods
    func fight() {
        //Annoncer l'équipe qui va jouer
        //Lister l'équipe qui va jouer
        //Sélectionner le joueur qui va faire l'équipe
        while true {
            for i in 0..<teams.count {
                
                var userHero = 0
                
                print("Team \(i+1) begin!")
                teams[i].teamDescription()
                
                
                //MARK: Hero selection
                
                repeat {
                    userHero = Tools.inputInt()
                    
                } while userHero != 1 && userHero != 2 && userHero != 3
                
                let contender = teams[i].heroes[userHero - 1]
                
                // Vérifier les charactéristiques du héro (e.g. mage ou guerrier)
                if let wizard = contender as? Wizard {
                    print("Team N°\(i+1)")
                    // Si c'est un mage, lister son équipe
                    teams[i].teamDescription()
                    // Sélectionner le membre de son équipe qu'il veut soigner
                    repeat {
                        userHero = Tools.inputInt()
                    } while userHero != 1 && userHero != 2 && userHero != 3
                    // Soigner la target
                    wizard.heal(target: teams[i].heroes[userHero-1])
                    
                } else {
                    if i == 0 {
                        // Si c'est un guerrier, lister l'équipe adverse
                        teams[i+1].teamDescription()
                        // Sélectionner le membre de l'équipe à attaquer
                        repeat {
                            userHero = Tools.inputInt()
                        } while userHero != 1 && userHero != 2 && userHero != 3
                        // Infliger les dégats à la target
                        contender.attack(target: teams[i+1].heroes[userHero-1])
                        if teams[i+1].isDead() {
                            return
                        }
                    } else {
                        // Si c'est un guerrier, lister l'équipe adverse
                        teams[i-1].teamDescription()
                        // Sélectionner le membre de l'équipe à attaquer
                        repeat {
                            userHero = Tools.inputInt()
                        } while userHero != 1 && userHero != 2 && userHero != 3
                        // Infliger les dégats à la target
                        contender.attack(target: teams[i-1].heroes[userHero-1])
                        if teams[i-1].isDead() {
                            return
                        }
                    }
                }
            }
        }
    }
}

