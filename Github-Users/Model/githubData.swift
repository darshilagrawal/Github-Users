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
//    let node_id: String
//    let gravatar_id:String
//    let url:String
//    let html_url:String
//    let following_url:String
//    let gists_url: String
//    let starred_url: String
//    let subscriptions_url:String
//    let organizations_url: String
//    let repos_url:String
//    let events_url: String
//    let received_events_url: String
//    let type: String
//    let site_admin:Bool

    init(login:String,id:Int,avatar_url:String,followers_url:String) {
        self.login=login
        self.id=id
        self.avatar_url=avatar_url
        self.followers_url=followers_url
    }
}
