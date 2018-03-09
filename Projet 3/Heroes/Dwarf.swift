//
//  Dwarf.swift
//  Projet 3
//
//  Created by Michael Favre on 02/02/2018.
//  Copyright © 2018 Michael Favre. All rights reserved.
//

import Foundation

// The feisty midget in town

class Dwarf: Hero {
    
    //MARK: -  init
    init(name: String) {
        super.init(name: name, energy: 75, weapon: Axe())
    }
}
