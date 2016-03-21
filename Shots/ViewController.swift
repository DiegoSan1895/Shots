//
//  ViewController.swift
//  Shots
//
//  Created by DiegoSan on 2/19/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import SafariServices

let ShotsToTimeLineNotification = "ShotsToTimeLineNotification"
class ViewController: UIViewController {
    
    // MARK: - IBOutlets and Properties
    
    @IBOutlet weak var appLogo: UIImageView!
    @IBOutlet weak var signInWithDribbbleButton: UIButton!
    @IBOutlet weak var footerMessageLabel: UILabel!
    
    var safariViewController: SFSafariViewController?
    var collectionView: UICollectionView?
    var shotsLayout = ShotsLayout()
    
    var shots = [DribbbleShot]()
    
    @IBAction func signWithDribbble(sender: UIButton) {
        let URL = "\(DribbbleOauthURL)?client_id=\(DribbbleClientID)&redirect_uri=\(callbackURL)&scope=public+comment+write"
        
        safariViewController = SFSafariViewController(URL: NSURL(string: URL)!)
        presentViewController(safariViewController!, animated: true, completion: nil)
        
    }
    
    func becomeTimeLine(){
        self.appLogo.hidden = true
        self.signInWithDribbbleButton.hidden = true
        self.footerMessageLabel.hidden = true
        self.collectionView?.hidden = false
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: ShotsLayout())
        collectionView?.backgroundColor = UIColor.backgroundColor()
        collectionView?.delegate = self
        view.addSubview(collectionView!)
    }
    
    func becomeSignWithDribbble(){
        self.appLogo.hidden = false
        self.signInWithDribbbleButton.hidden = false
        self.footerMessageLabel.hidden = false
        self.collectionView?.hidden = true
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        becomeSignWithDribbble()
        safariViewController?.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "becomeTimeLine", name: ShotsToTimeLineNotification, object: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}

extension ViewController: SFSafariViewControllerDelegate{
    func safariViewControllerDidFinish(controller: SFSafariViewController) {
        print("finish")
    }
}
