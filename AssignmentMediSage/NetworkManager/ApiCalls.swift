//
//  ApiCalls.swift
//  AssignmentMediSage
//
//  Created by Ganesh Sonawane on 11/03/21.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiCall{
    var postList = [Posts]()
    fileprivate var baseUrl = ""
    init(baseUrl : String) {
        self.baseUrl = baseUrl
    }
    //Posts Api
    func getAllPosts(endPoint : String,completionHandler : @escaping (Bool,[Posts]) -> ()){
        let url = URL(string: self.baseUrl + endPoint)
        if Connectivity.isConnectedToInternet(){
            CRUD.shared.deletePostData()
            URLSession.shared.dataTask(with: url!) { (data, response, error) in
                guard let data = data else { return }
                do{
                    let json = try JSON(data: data)
                    for rdata in json.arrayValue{
                        self.postList.append(Posts(json: rdata))
                    }
                    completionHandler(true, self.postList)
                }
                catch{
                    print(error.localizedDescription)
                    completionHandler(false, self.postList)
                }
            }.resume()
        }
        else{
            postList = CRUD.shared.retrievePost()
            completionHandler(true, self.postList)
        }
        
    }
    
}
