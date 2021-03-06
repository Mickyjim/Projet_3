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
   private var teams = [Team]()
    
    //MARK: - Methods
    func start() {
        
        print("")
        print("=======================================")
        print("☠️☠️☠️ WELCOME TO MORTAL KOMBAT ☠️☠️☠️")
        print("=======================================")
        print("")
        print("🥊 🥊 🥊 Let's RRRRRRRUMBLEEE!!! 🥊 🥊 🥊")
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
    private func createTeam() -> Team {
        let team = Team()
        team.createHeroes()
        return team
    }
    
    // The Magic chest feature
    private func magicChest(hero: Hero) {
        let magicChestRandom = arc4random_uniform(5)
        if magicChestRandom == 3 {
            print("Look!😀 A magic chest 🎁! Cool!😁")
            if hero is Wizard {
                let theKissItBetter = TheKissItBetter()
                hero.weapon = theKissItBetter
                print(hero.name + " is equiped with Advil 💊💊💊! Choose your teammate to heal")
            } else {
                let theKickAss = TheKickAss()
                hero.weapon = theKickAss
                print(hero.name + " is equiped with Excalibur 🗡 and is up for some wopping! Who's your daddy now 😱! Choose your target")
            }
        }
    }
    
    // Bonus Chuck Norris appears in the game!
    private func chuckNorris(target: Hero) {
        let chuckNorris = ChuckNorris(name: "Chuck Norris")
        chuckNorris.attack(target: target)
        print("Your hero has just been BITCH SLAPED by Chuck Norris 👋🏻 💥 💩! Uuuuh, that's ugly!!! Poor guy! 😧 🤢 🔞")
    }
    
    // MARK: Methods - User's hero choice
    private func userHeroChoice() -> Int {
        var userHero = 0
        repeat {
            if let data = readLine() {
                if let dataToInt = Int(data) {
                    userHero = dataToInt
                }
            }
        } while userHero != 1 && userHero != 2 && userHero != 3
        return userHero
    }
    // Attack phase in combat
    private func attackPhase(teamIndex: Int, contender: Hero) {
        teams[teamIndex].teamDescription()
        
        // Enabling bonus
        if arc4random_uniform(5) == 3 {
            chuckNorris(target: teams[teamIndex].heroes[userHeroChoice() - 1])
        } else {
            contender.attack(target: teams[teamIndex].heroes[userHeroChoice() - 1])
        }
    }
    
    //MARK: - Methods
   private func fight() {
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
                let contender = teams[i].heroes[userHeroChoice() - 1]
                magicChest(hero: contender)
                
                // Verify the characteristics of a hero
                if let wizard = contender as? Wizard {
                    print("")
                    print("Team N°\(i+1) your turn!")
                    print("")
                    
                    // If the hero is a wizard, list his team
                    teams[i].teamDescription()
                    
                    // Heal the target
                    wizard.heal(target: teams[i].heroes[userHeroChoice() - 1])
                    
                } else {
                    if i == 0 {
                        print("")
                        print("Team N°2")
                        print("")
                        
                        attackPhase(teamIndex: i+1, contender: contender)
                        // Inflict damage to the target
                        if teams[i+1].isDead(index: 2) {
                            return
                        }
                    } else {
                        print("")
                        print("Team N°1")
                        print("")
                        
                        // If it's a warrior, list the members of the adversary's team
                        attackPhase(teamIndex: i-1, contender: contender)
                        if teams[i-1].isDead(index: 1) {
                            return
                        }
                    }
                }
            }
        }
    }
}

