//
//  Wizard.swift
//  Projet 3
//
//  Created by Michael Favre on 02/02/2018.
//  Copyright © 2018 Michael Favre. All rights reserved.
//

import Foundation

// The healer who is always high!

class Wizard: Heroes {
    
    //MARK: -  init
    init(name: String) {
        super.init(name: name, energy: 125, weapon: Hansaplast())
    }
    
    override func attack(target: Heroes) {
        print("I hate violence!")
    }

    func heal(target: Heroes) {
        target.energy += weapon.heal
    }
}
