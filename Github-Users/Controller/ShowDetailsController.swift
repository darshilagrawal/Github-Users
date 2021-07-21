//
//  ShowDetailsController.swift
//  Github-Users
//
//  Created by Darshil Agrawal on 11/05/21.
//

import UIKit
import Lottie
import SDWebImage


class ShowDetailsController: UIViewController {
    
    @IBOutlet weak var animationView: AnimationView!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameOfUser: UILabel!
    var login : String!
    var imageValue:String!
    override func viewDidLoad() {
        navigationItem.title=login
        super.viewDidLoad()
        animationView.contentMode = .scaleAspectFit
          animationView.loopMode = .loop
          animationView.animationSpeed = 0.5
          animationView.play()
        
        nameOfUser.text = login ?? "Default User"
        guard let url = URL(string: imageValue) else { return }
        profileImage.sd_setImage(with: url, completed: nil)
        
        
    }
    
    
}


