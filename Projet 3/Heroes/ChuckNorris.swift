//
//  Chuck_Norris.swift
//  Projet 3
//
//  Created by Michael Favre on 23/02/2018.
//  Copyright © 2018 Michael Favre. All rights reserved.
//

import Foundation

// Chuck Norris, no further comment needed!

class ChuckNorris: Hero {
    
    //MARK: -  init
    init(name: String) {
        super.init(name: name, energy: 10^307, weapon: BitchSlap())
    }
}
