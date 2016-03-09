//
//  ViewController.swift
//  Shots
//
//  Created by DiegoSan on 2/19/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    @IBOutlet weak var appLogo: UIImageView!
    @IBOutlet weak var signInWithDribbbleButton: UIButton!
    @IBOutlet weak var footerMessageLabel: UILabel!
    
    var safariViewController: SFSafariViewController?
    var tableView: UITableView?
    
    @IBAction func signWithDribbble(sender: UIButton) {
        let url = NSURL()
        
        safariViewController = SFSafariViewController(URL: url)
        presentViewController(safariViewController!, animated: true, completion: nil)
        
    }
    
    func becomeTimeLine(){
        self.appLogo.hidden = true
        self.signInWithDribbbleButton.hidden = true
        self.footerMessageLabel.hidden = true
        self.tableView?.hidden = false
    }
    
    func becomeSignWithDribbble(){
        self.appLogo.hidden = false
        self.signInWithDribbbleButton.hidden = false
        self.footerMessageLabel.hidden = false
        self.tableView?.hidden = true
    }
    
    // MARK: - view cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

