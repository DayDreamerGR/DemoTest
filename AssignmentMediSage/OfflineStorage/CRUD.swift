//
//  CRUD.swift
//  AssignmentMediSage
//
//  Created by Ganesh Sonawane on 11/03/21.
//

import Foundation
import CoreData
import UIKit

class CRUD : NSObject {
    static let shared = CRUD()
    func savePost(uid : String,id : String,title : String, body : String){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let postlist = NSEntityDescription.entity(forEntityName: "MyPosts", in: context)!
        let post = NSManagedObject(entity: postlist, insertInto: context)
        post.setValue(uid, forKey: "userId")
        post.setValue(id, forKey: "id")
        post.setValue(title, forKey: "title")
        post.setValue(body, forKey: "body")
        do{
            try context.save()
        }
        catch{
            print("Error in saving User info: \(error)")
        }
    }
    func saveFavPost(uid : String,id : String,title : String, body : String){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let postlist = NSEntityDescription.entity(forEntityName: "MyFavPost", in: context)!
        let post = NSManagedObject(entity: postlist, insertInto: context)
        post.setValue(uid, forKey: "userId")
        post.setValue(id, forKey: "id")
        post.setValue(title, forKey: "title")
        post.setValue(body, forKey: "body")
        do{
            try context.save()
        }
        catch{
            print("Error in saving User info: \(error)")
        }
    }
    func retrievePost() -> [Posts] {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        var postObj = [Posts]()
        postObj.removeAll()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MyPosts")
        do{
            let result = try context.fetch(fetchRequest)
            print(result)
            for data in result as! [NSManagedObject]{
                postObj.append(Posts(userId: data.value(forKey: "userId") as! String, id: data.value(forKey: "id") as! String, title: data.value(forKey: "title") as! String, body: data.value(forKey: "body") as! String))
            }
        }
        catch{
            
        }
        return postObj
    }
    func searchPost(txt : String) -> [Posts] {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        var postObj = [Posts]()
        postObj.removeAll()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MyPosts")
        fetchRequest.predicate = NSPredicate(format: "body CONTAINS[cd] %@", txt)
        do{
            let result = try context.fetch(fetchRequest)
            print(result)
            for data in result as! [NSManagedObject]{
                postObj.append(Posts(userId: data.value(forKey: "userId") as! String, id: data.value(forKey: "id") as! String, title: data.value(forKey: "title") as! String, body: data.value(forKey: "body") as! String))
            }
        }
        catch{
            
        }
        return postObj
    }
    func retrieveFavPost() -> [Posts] {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        var postObj = [Posts]()
        postObj.removeAll()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MyFavPost")
        do{
            let result = try context.fetch(fetchRequest)
            print(result)
            for data in result as! [NSManagedObject]{
                postObj.append(Posts(userId: data.value(forKey: "userId") as! String, id: data.value(forKey: "id") as! String, title: data.value(forKey: "title") as! String, body: data.value(forKey: "body") as! String))
            }
        }
        catch{
            
        }
        return postObj
    }
    
    func deletePostData(){
       let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
       let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MyPosts")
          do{
           let result = try context.fetch(fetchRequest)
           for data in result as! [NSManagedObject]{
               try context.delete(data)
           }
              
          }catch let error as NSError {//handle error here }
          }

       }
    func deleteFavPostData(){
       let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
       let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "MyFavPost")
          do{
           let result = try context.fetch(fetchRequest)
           for data in result as! [NSManagedObject]{
               try context.delete(data)
           }
          }catch let error as NSError {//handle error here }
          }

       }
    func ClearData(){
        deletePostData()
        deleteFavPostData()
    }
}
