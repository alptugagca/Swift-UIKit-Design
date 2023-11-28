//
//  ViewController.swift
//  toDoAppCRUD_MVVM
//
//  Created by Alptuğ Ağca on 27.11.2023.
//

import UIKit

class HomePage: UIViewController {

    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var userTableView: UITableView!
    
    var userList = [User]()
    var homePageViewModel = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        userTableView.delegate = self
        userTableView.dataSource = self
        
        _ = homePageViewModel.userLists.subscribe(onNext: { list in
            
            self.userList = list
            self.userTableView.reloadData()
            
        })
       
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
     
        homePageViewModel.readData()
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetail"
        {
            if let us = sender as? User{
                
                let goDetailPageVC = segue.destination as! UserDetailPage
                
                goDetailPageVC.us = us
                
            }
        }
        
    }
    
    
    

}

extension HomePage : UISearchBarDelegate
{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        homePageViewModel.searchData(searchTextViewModelParameters: searchText)
        
    }
    
}

extension HomePage : UITableViewDelegate , UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let userIndex = userList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell_Id") as! UserCell
        
        cell.labelUserName.text = userIndex.user_name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let userIndex = userList[indexPath.row]
        
        performSegue(withIdentifier: "toDetail", sender: userIndex)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil")
        {contextualAction,view,bool in
            
            let userIndex = self.userList[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(userIndex.user_name!) silinsin mi ? ", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Evet", style: .destructive){_ in
                
                self.homePageViewModel.deleteData(user_id: userIndex.user_id!)
                
            }
            alert.addAction(yesAction)
            
            self.present(alert,animated: true)
            
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}

