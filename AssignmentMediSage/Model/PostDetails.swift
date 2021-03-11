//
//  PostDetails.swift
//  AssignmentMediSage
//
//  Created by Ganesh Sonawane on 11/03/21.
//

import Foundation
import SwiftyJSON
struct Posts : Codable{
    let userId : String?
    let id : String?
    let title : String?
    let body : String?
    init(userId : String,id : String,title : String,body : String){
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
        init(json : JSON){
        userId = json["userId"].stringValue
        id = json["id"].stringValue
        title = json["title"].stringValue
        body = json["body"].stringValue
        CRUD.shared.savePost(uid: userId ?? "NA", id: id ?? "NA", title: title ?? "NA", body: body ?? "NA")
    }
}
