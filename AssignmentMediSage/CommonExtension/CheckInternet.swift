//
//  CheckInternet.swift
//  AssignmentMediSage
//
//  Created by Ganesh Sonawane on 11/03/21.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
