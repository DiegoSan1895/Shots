//
//  ShotDataSourceAndDelegate.swift
//  Shots
//
//  Created by DiegoSan on 3/20/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import Kingfisher
import OLImageView
import Alamofire
import DateTools
import SVProgressHUD

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    // MARK: - datasource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shots.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ShotsCell
        
        let shot = shots[indexPath.row]
        
        if let normalImage = shot.images["normal"] as? String{
            cell.shotImageView.kf_setImageWithURL(NSURL(string: normalImage)!, placeholderImage: nil, optionsInfo: [KingfisherOptionsInfoItem.BackgroundDecode])
        }
        
        cell.shotDescriptionLabel.text = shot.title
        
        cell.shotAuthorLabel.text = "by \(shot.user.username)"
        cell.shotTimeLabel.text = shot.created_at.timeAgoSinceNow()
        cell.avatorImageView.kf_setImageWithURL(NSURL(string: shot.user.avatar_url)!, placeholderImage: nil, optionsInfo: [KingfisherOptionsInfoItem.BackgroundDecode])
        
        return cell
    }
}
