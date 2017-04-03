//
//  GitHubFriendsTableViewController.swift
//  GitHubFriends
//
//  Created by Timothy Hang on 4/2/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import UIKit

class GitHubFriendsTableViewController: UITableViewController, APIControllerProtocol, NewFriendViewControllerDelegate
{
  var friends = [Friend]()
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
//    let apiController = APIController(delegate: self)
//    apiController.searchItunesFor("Red Hot Chili Peppers")
  }
  
  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int
  {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    return friends.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
    let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath)
    let aFriend = friends[indexPath.row]
    cell.textLabel?.text = aFriend.login
    return cell
  }
  
  func didReceive(_ results: [Any])
  {
    let queue = DispatchQueue.main
    queue.async {
      self.friends = Friend.friendsWith(json: results)
      self.tableView.reloadData()
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    let newFriendViewController = segue.destination as! NewFriendViewController
    newFriendViewController.delegate = self
  }
  blah(results: results)
  {
  
  }
}
