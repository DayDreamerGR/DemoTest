//
//  FavoritesViewController.swift
//  AssignmentMediSage
//
//  Created by Ganesh Sonawane on 11/03/21.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var fpTblView: UITableView!
    var favPosts = [Posts]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchfavPost()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchfavPost()
    }
    func fetchfavPost(){
        favPosts.removeAll()
        favPosts = CRUD.shared.retrieveFavPost()
        DispatchQueue.main.async {
            self.fpTblView.reloadData()
        }
    }
    @IBAction func logoutBtn(_ sender: Any) {
        CRUD.shared.ClearData()
        dismiss(animated: true, completion: nil)
    }
    
}
extension FavoritesViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if favPosts.count == 0{
            fpTblView.setEmptyView(title: "No data available!", message: "No data available!")
            return 0
        }
        else{
            fpTblView.restore()
            return favPosts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostsTableViewCell", for: indexPath) as! PostsTableViewCell
        cell.info = favPosts[indexPath.row]
        return cell
    }
    
    
}
