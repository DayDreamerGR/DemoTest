//
//  NetworkUrl.swift
//  AssignmentMediSage
//
//  Created by Ganesh Sonawane on 11/03/21.
//

import Foundation
class NetworkUrl : NSObject{
    static let urlShared = NetworkUrl()
    var postUrl : String = "https://jsonplaceholder.typicode.com/"
}
