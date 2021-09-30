//
//  MainViewModel.swift
//  Github-Users
//
//  Created by Darshil Agrawal on 20/07/21.
//

import Foundation

class MainViewModel {
    var fetchedUser=[User]()
    var since=0
    var succesBindingToVC: (() -> ()) = {}
    var failedBindingToVC: (() -> ()) = {}
    func fetchData(){
        let finalURL = "\(StringConstants.baseUrl)&since=\(since)"
        guard let url = URL(string: finalURL) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod="GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                self.failedBindingToVC()
                print(error.debugDescription)
                return
            }
            if let unwrappedData = data {
                do {
                    let resultantData=try JSONSerialization.jsonObject(with: unwrappedData, options: .mutableLeaves) as! NSArray
                    for individualUser in resultantData {
                        let eachUser=individualUser as! [String:Any]
                        let login = eachUser["login"] as! String
                        let id = eachUser["id"] as! Int
                        let avatar_url = eachUser["avatar_url"] as! String
                        let followers_url = eachUser["followers_url"] as! String
                        self.fetchedUser.append(User(login: login, id: id, avatar_url: avatar_url, followers_url: followers_url))
                        self.succesBindingToVC()
                    }
                } catch {
                    print("Failed in Storing Data")
                }
            }
        }
        task.resume()
    }
}
