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
  let title: String
  let price: String
  let thumbnailImageURL: String
  let largeImageURL: String
  let itemURL: String
  let artistURL: String
  
  init(name: String, price: String, thumbnailImageURL: String, largeImageURL: String, itemURL: String, artistURL: String)
  {
    title = name
    self.price = price
    self.thumbnailImageURL = thumbnailImageURL
    self.largeImageURL = largeImageURL
    self.itemURL = itemURL
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
          if let name = dictionary["collectionName"] as? String
          {
            var price = dictionary["formattedPrice"] as? String
            if price == nil
            {
              price = dictionary["collectionPrice"] as? String
              if price == nil
              {
                if let priceFloat = dictionary["collectionPrice"] as? Float
                {
                  let nf = NumberFormatter()
                  nf.maximumFractionDigits = 2
                  price = "S\(nf.string(from: NSNumber(value: priceFloat))!)"
                }
              }
            }
            let thumbnailURL = dictionary["artworkUrl60"] as? String ?? ""
            let imageURL = dictionary["artworkUrl100"] as? String ?? ""
            let artistURL = dictionary["artistViewUrl"] as? String ?? ""
            var itemURL = dictionary["collectionViewUrl"] as? String
            if itemURL == nil
            {
              itemURL = dictionary["trackViewUrl"] as? String
            }
            let aFriend = Friend(name: name, price: price!, thumbnailImageURL: thumbnailURL, largeImageURL: imageURL, itemURL: itemURL!, artistURL: artistURL)
            friends.append(aFriend)
          }
        }
      }
    }
    
    return friends
  }
}
