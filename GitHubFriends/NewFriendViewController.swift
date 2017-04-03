//
//  NewFriendViewController.swift
//  GitHubFriends
//
//  Created by Timothy Hang on 4/2/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import UIKit

class NewFriendViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
  
  @IBAction func SearchTapped(_ sender: UIButton)
  {
    self.dismiss(animated: true, completion: nil)
  }

  @IBAction func CancelTapped(_ sender: UIButton)
  {
    self.dismiss(animated: true, completion: nil)
  }
  //http://www.systeen.com/2016/11/26/use-protocols-delegates-segues-swift-3/
  //this is where i learned a bit more about delegates and near the end it shows how to dismiss a view i think...
}
