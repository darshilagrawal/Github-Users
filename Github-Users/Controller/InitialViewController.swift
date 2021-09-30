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
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        view.addSubview(animationView!)
        animationView!.play()
    }
}
