//
//  ViewController.swift
//  Github-Users
//
//  Created by Darshil Agrawal on 11/05/21.
//

import UIKit

class ViewController: UIViewController{
    var since=0
    let baseUrl="https://api.github.com/users?per_page=20"
    var fetchedUser=[User]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
        tableView.delegate=self
        fetchData()
    }

// MARK: API CALL
    func fetchData(){
         let finalURL = "\(baseUrl)&since=\(since)"
        guard let url = URL(string: finalURL) else{
        return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod="GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print(error.debugDescription)
                return
            }
            if let unwrappedData = data{
                do{
                    let resultantData=try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableLeaves) as! NSArray
//                    print(resultantData)
                    for individualUser in resultantData{
                        let eachUser=individualUser as! [String:Any]
                        let login = eachUser["login"] as! String
                        let id = eachUser["id"] as! Int
                        let avatar_url = eachUser["avatar_url"] as! String
                        let followers_url = eachUser["followers_url"] as! String
                        self.fetchedUser.append(User(login: login, id: id, avatar_url: avatar_url, followers_url: followers_url))
                        
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                }catch{
                    print("Failed in Storing Data")
                }
                
                
            }
        }
        task.resume()
    }
    
    
}

// MARK: Table View Delegate Components
extension ViewController:UITableViewDataSource  , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        cell.textLabel?.text=fetchedUser[indexPath.row].login
        cell.accessoryType = .detailDisclosureButton
        return cell

    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == fetchedUser.count-1{
            since=since+20
            fetchData()
            
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.row)
    }
}

// MARK: Preparation for Segues

extension ViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath=tableView.indexPathForSelectedRow
        
        let showDetailsController = segue.destination as! ShowDetailsController
        if let index = indexPath?.row {
        showDetailsController.login=fetchedUser[index].login
        showDetailsController.imageValue=fetchedUser[index].avatar_url
        }
    }
}
