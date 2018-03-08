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
        print("☠️☠️☠️ WELCOME TO MORTAL KOMBAT ☠️☠️☠️")
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
    
    // The Magic chest feature
    func magicChest(hero: Heroes) {
        let magicChestRandom = arc4random_uniform(5)
        if magicChestRandom == 3 {
            print("Look! A magic chest 🎁! Cool!")
            if hero is Wizard {
                let theKissItBetter = TheKissItBetter()
                hero.weapon = theKissItBetter
                print(hero.name + " is equiped with the Holy Graal 💉 🏥! Choose your teammate to heal")
            } else {
                let theKickAss = TheKickAss()
                hero.weapon = theKickAss
                print(hero.name + " is equiped with a weapon sent from the Gods 🏓 and is up for some wopping! Who's your daddy now 😱! Choose your target")
            }
        }
    }
    
    // Chuck Norris appears!
    func chuckNorris(target: Heroes) {
        let chuckNorris = ChuckNorris(name: "Chuck Norris")
        chuckNorris.attack(target: target)
        print("Your hero has just been BITCH SLAPED by Chuck Norris 👋🏻 💥 💩! That ugly!!! 😧 🤢 🔞")
    }
    
    // MARK: Methods - User's hero choice
    var userHero = 0
    
    func userHeroChoice() {
        repeat {
            userHero = Tools.inputInt()
        } while userHero != 1 && userHero != 2 && userHero != 3
    }
    
    //MARK: - Methods
    func fight() {
        //Announce the playing team
        //List the playing team
        //Select the player
        while true {
            for i in 0..<teams.count {
                
                
                print("")
                print("Team \(i+1) begin!")
                print("")
                teams[i].teamDescription()
                
                //MARK: Hero selection
                
                userHeroChoice()
                let contender = teams[i].heroes[userHero - 1]
                magicChest(hero: contender)
                
                // Verify the characteristics of a hero
                if let wizard = contender as? Wizard {
                    print("")
                    print("Team N°\(i+1) your turn!")
                    print("")
                    
                    // If the hero is a wizard, list his team
                    teams[i].teamDescription()
                    
                    // List the member of his team to heal
                    userHeroChoice()
                    
                    // Heal the target
                    wizard.heal(target: teams[i].heroes[userHero-1])
                    
                } else {
                    if i == 0 {
                        print("")
                        print("Team N°\(i+1)")
                        print("")
                        
                        // If it's a warrior, list the members of the adversary's team
                        teams[i+1].teamDescription()
                        
                        // Select the target to attack
                        userHeroChoice()
                        
                        // Enabling bonus
                        if arc4random_uniform(5) == 3 {
                            chuckNorris(target: teams[i+1].heroes[userHero-1])
                        } else {
                            contender.attack(target: teams[i+1].heroes[userHero-1])
                        }
                        
                        // Inflict damage to the target
                        if teams[i+1].isDead() {
                            return
                        }
                    } else {
                        print("")
                        print("Team N°\(i+1)")
                        print("")
                        // If it's a warrior, list the members of the adversary's team
                        teams[i-1].teamDescription()
                        // Select the target to attack
                        userHeroChoice()
                        // Inflict damage to the target
                        if arc4random_uniform(5) == 3 {
                            chuckNorris(target: teams[i-1].heroes[userHero-1])
                        } else {
                            contender.attack(target: teams[i-1].heroes[userHero-1])
                        }
                        if teams[i-1].isDead() {
                            return
                        }
                    }
                }
            }
        }
    }
}

