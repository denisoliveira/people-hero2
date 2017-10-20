//
//  API.swift
//  people-hero2
//
//  Created by Denis Oliveira on 19/10/17.
//  Copyright © 2017 Denis Oliveira. All rights reserved.
//

import Foundation
import Alamofire

class API {
    
    class func getAllMendingos(handle: @escaping  (DataResponse<Any>) -> Void) {
        Alamofire.request("http://localhost:8080/moradores", method: .get)
            .responseJSON(queue: .main, options: .allowFragments,
        completionHandler: handle)
    }
    
    class func getMendingo(identifier: String, handle: @escaping (DataResponse<Any>) -> Void) {
        Alamofire.request("http://localhost:8080/moradores/\(identifier)", method: .get)
        .responseJSON(queue: .main, options: .allowFragments, completionHandler: handle)
    }
    
    class func postMendingo(mendingo: [String: Any], handle: @escaping (DataResponse<Any>) -> Void) {
        Alamofire.request("http://localhost:8080/moradores", method: .post)
        .responseJSON(queue: .main, options: .allowFragments, completionHandler: handle)
    }
    
    class func putMendingo(mendingo: [String: Any], _ handle: @escaping (DataResponse<Any>) -> Void) {
        Alamofire.request("http://localhost:8080/moradores", method: .put)
        .responseJSON(queue: .main, options: .allowFragments, completionHandler: handle)
    }
}
