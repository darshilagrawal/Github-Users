//
//  InitialViewController.swift
//  Github-Users
//
//  Created by Darshil Agrawal on 01/07/21.
//

import UIKit
import Lottie
class InitialViewController: UIViewController {
    private var animationView: AnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
        animationView = .init(name: "coffee")
          
          animationView!.frame = view.bounds
          
          // 3. Set animation content mode
          
          animationView!.contentMode = .scaleAspectFit
          
          // 4. Set animation loop mode
          
          animationView!.loopMode = .loop
          
          // 5. Adjust animation speed
          
          animationView!.animationSpeed = 0.5
          
          view.addSubview(animationView!)
          
          // 6. Play animation
          
          animationView!.play()
        // Do any additional setup after loading the view.
    }


    

}
