//
//  ShowDetailsController.swift
//  Github-Users
//
//  Created by Darshil Agrawal on 11/05/21.
//

import UIKit

class ShowDetailsController: UIViewController {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameOfUser: UILabel!
    var login : String!
    var imageValue:String!
    override func viewDidLoad() {
        navigationItem.title=login
        super.viewDidLoad()
        //        print(imageValue!)
        //        print(login!)
        nameOfUser.text = login ?? "Default User"
        guard let url = URL(string: imageValue) else { return }
        profileImage.loadFrom(url: url)
        
        
    }
    
    
}


