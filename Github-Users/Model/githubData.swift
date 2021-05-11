//
//  githubData.swift
//  Github-Users
//
//  Created by Darshil Agrawal on 11/05/21.
//

import Foundation

class User {
    let login: String
    let id: Int
    let avatar_url: String
    let followers_url:String

    init(login:String,id:Int,avatar_url:String,followers_url:String) {
        self.login=login
        self.id=id
        self.avatar_url=avatar_url
        self.followers_url=followers_url
    }
}
