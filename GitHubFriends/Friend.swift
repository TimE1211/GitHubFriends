//
//  Friend.swift
//  GitHubFriends
//
//  Created by Timothy Hang on 4/2/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import Foundation

struct Friend
{
  let login: String
  let name: String
  let bio: String
  let avatarURL: String
  let repoURL: String
  let artistURL: String
  
  init(login: String, name: String, bio: String, avatarURL: String, repoURL: String, artistURL: String)
  {
    self.login = login
    self.name = name
    self.bio = bio
    self.avatarURL = avatarURL
    self.repoURL = repoURL
    self.artistURL = artistURL
  }
  
  static func friendsWith(json results: [Any]) -> [Friend]
  {
    var friends = [Friend]()
    
    if results.count > 0
    {
      for result in results
      {
        if let dictionary = result as? [String: Any]
        {
          if let login = dictionary["collectionName"] as? String
          {
            let name = dictionary["safl;"] as? String ?? ""
            let bio = dictionary["artworkUrl60"] as? String ?? ""
            let avatarURL = dictionary["artworkUrl100"] as? String ?? ""
            let artistURL = dictionary["artistViewUrl"] as? String ?? ""
            let repoURL = dictionary["collectionViewUrl"] as? String ?? ""
            let aFriend = Friend(login: login, name: name, bio: bio, avatarURL: avatarURL, repoURL: repoURL, artistURL: artistURL)
            friends.append(aFriend)
          }
        }
      }
    }
    
    return friends
  }
}
