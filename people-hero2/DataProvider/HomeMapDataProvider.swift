//
//  HomeMapDataProvider.swift
//  people-hero2
//
//  Created by Denis Oliveira on 19/10/17.
//  Copyright © 2017 Denis Oliveira. All rights reserved.
//

import Foundation
import ObjectMapper

protocol HomeDataProviderProtocol: GenericDataProvider {
}

class HomeMapDataProvider: DataProviderManager<HomeDataProviderProtocol, MendingoViewModel> {
    
    func getAllMendingos() {
        API.getAllMendingos { (data) in
            if data.error == nil {
                
                guard let json = data.result.value as? [[String: Any]] else {
                    let error = NSError(domain: "PeopleHero2", code: -1, userInfo: nil)
                    self.delegate?.failure(error: error)
                    return
                }
                
                var mendingos = [Mendingo]()
                
                for value in json {
                    let mendingo = Mapper<Mendingo>().map(JSON: value)
                    if let mendingo = mendingo {
                        mendingos.append(mendingo)
                    }
                }
                
                let vm = MendingoViewModel()
                vm.mendingos = mendingos
                self.delegate?.success(viewModel: vm)
            }
            else {
                let error = NSError(domain: "PeopleHero2", code: -1, userInfo: nil)
                self.delegate?.failure(error: error)
                return                
            }
        }
    }
}
