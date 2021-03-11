//
//  PostsViewController.swift
//  AssignmentMediSage
//
//  Created by Ganesh Sonawane on 11/03/21.
//

import UIKit

class PostsViewController: UIViewController {
    var service = ApiCall(baseUrl: NetworkUrl.urlShared.postUrl)
    var postDetails = [Posts]()
    
    @IBOutlet weak var searchpost: UISearchBar!
    @IBOutlet weak var pTblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        callApi()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        callApi()
    }
    func callApi(){
        postDetails.removeAll()
        service.getAllPosts(endPoint: "posts") { (bValue, postdetails) in
            if bValue == true{
                self.postDetails = postdetails
                DispatchQueue.main.async {
                    self.pTblView.reloadData()
                }
            }
        }
    }
    @IBAction func logoutBtn(_ sender: Any) {
        CRUD.shared.ClearData()
        dismiss(animated: true, completion: nil)
    }
}

extension PostsViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if postDetails.count == 0{
            pTblView.setEmptyView(title: "No data available!", message: "No data available!")
            return 0
        }
        else{
            pTblView.restore()
            return postDetails.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostsTableViewCell", for: indexPath) as! PostsTableViewCell
        cell.info = postDetails[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        CRUD.shared.saveFavPost(uid: postDetails[indexPath.row].userId ?? "NA", id: postDetails[indexPath.row].id ?? "NA", title: postDetails[indexPath.row].title ?? "NA", body: postDetails[indexPath.row].body ?? "NA")
        let alert = UIAlertController(title: "", message: "Added to Favorite!", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when){
          alert.dismiss(animated: true, completion: nil)
        }
    }
}

extension PostsViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        postDetails.removeAll()
        if searchText != "" || searchText != ""{
            postDetails = CRUD.shared.searchPost(txt: searchText)
        }
        else{
        }
        pTblView.reloadData()
    }
    
}
