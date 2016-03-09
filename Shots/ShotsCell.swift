
//
//  ShotsCell.swift
//  Shots
//
//  Created by DiegoSan on 2/19/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import Kingfisher

class ShotsCell: UITableViewCell {

    @IBOutlet weak var shotImageView: UIImageView!
    @IBOutlet weak var shotDetailFooterView: UIView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var shotDescriptionLabel: UILabel!
    @IBOutlet weak var avatorImageView: UIImageView!
    @IBOutlet weak var shotTimeLabel: UILabel!
    @IBOutlet weak var shotAuthorLabel: UILabel!
    @IBAction func likeButtonDidPressed(sender: UIButton) {
    }
    
    var shot: DribbbleShot?{
        didSet{
            if let normalImage = shot?.images["normal"] as? String{
                shotImageView.kf_setImageWithURL(NSURL(string: normalImage)!, placeholderImage: nil, optionsInfo: [KingfisherOptionsInfoItem.BackgroundDecode])
            }
            avatorImageView.kf_setImageWithURL(NSURL(string: (shot?.user.avatar_url)!)!, placeholderImage: nil, optionsInfo: [KingfisherOptionsInfoItem.BackgroundDecode])
        }
    }
    
}
