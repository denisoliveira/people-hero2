//
//  MendingoViewModel.swift
//  people-hero2
//
//  Created by Denis Oliveira on 19/10/17.
//  Copyright © 2017 Denis Oliveira. All rights reserved.
//

import Foundation
import ObjectMapper

class Mendingo: Mappable {
    
    var identifier: Int?
    var latitude: Double?
    var longitude: Double?
    var localizado: Bool?
    
    required init?(map: Map) {   
    }
    
    func mapping(map: Map) {
        identifier <- map["id"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        localizado <- map["localizado"]
    }
}

class MendingoViewModel {
    var mendingos: [Mendingo]?
}
