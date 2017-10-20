//
//  GenericDataProvider.swift
//  people-hero2
//
//  Created by Denis Oliveira on 19/10/17.
//  Copyright © 2017 Denis Oliveira. All rights reserved.
//

import Foundation

protocol GenericDataProvider: class {
    func success(viewModel: Any)
    func failure(error: NSError?)
}

class DataProviderManager <T, S> {
    var delegate: T?
    var viewModel: S?
}
