//
//  APIController.swift
//  GitHubFriends
//
//  Created by Timothy Hang on 4/2/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

//
//  APIController.swift
//  Albums
//
//  Created by Timothy Hang on 3/30/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import Foundation

protocol APIControllerProtocol
{
  func didReceive(_ results: [Any])
}

class APIController
{
  var delegate: APIControllerProtocol?
  
  init(delegate: APIControllerProtocol)
  {
    self.delegate = delegate
  }
  
  func searchItunesFor(_ searchTerm:String)                   //external parameter is unneeded -> _
  {
      let urlPath = "https://api.github.com/users/jcgholke"
      //                  {protocol{  location     }op function(ends at term){                   arguments                  }
      let url = URL(string: urlPath)!
      let session = URLSession.shared
      let task = session.dataTask(with: url, completionHandler: {data, response, error -> Void in
        print("Task completed")
        if let error = error
        {
          print(error.localizedDescription)
        }
        else
        {
          if let dictionary = self.parseJSON(data!)
          {
            if let results = dictionary["results"] as? [Any]
            {
              self.delegate?.didReceive(results)
            }
          }
        }
      })
      task.resume()
    }
  
  func parseJSON(_ data: Data) -> [String: Any]?
  {
    do
    {
      let json = try JSONSerialization.jsonObject(with: data, options: [])
      if let dictionary = json as? [String: Any]
      {
        return dictionary
      }
      else
      {
        return nil
      }
    }
    catch
    {
      print(error)
      return nil
    }
  }
}



