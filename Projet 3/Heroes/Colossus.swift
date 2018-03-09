//
//  Colossus.swift
//  Projet 3
//
//  Created by Michael Favre on 02/02/2018.
//  Copyright © 2018 Michael Favre. All rights reserved.
//

import Foundation

// The big dumb brute who loves picking daffodils

class Colossus: Hero {
    
    //MARK: -  init
    init(name: String) {
        super.init(name: name, energy: 150, weapon: RubberChicken())
    }
}
