//
//  DataModel.swift
//  Starwars
//
//  Created by Elijah Armande on 6/13/23.
//

import Foundation


struct PeopleList: Codable, Identifiable {
    
    let id = UUID()
    let count: Int
    var next: String
    var previous: String? // Made this an optional because the JSON value for this key is null
    var results: [Results]
    
    
}


struct Results: Codable, Identifiable {
    let id = UUID()
    var name: String
    var films: [Films] // Films is apart of the results array so it must be included for the Results array to be valid
}

struct Films: Codable {
    
    // no key value pairs for this. However I still needed to include it. No other objects lived within Films so I could stop here.
    
}


