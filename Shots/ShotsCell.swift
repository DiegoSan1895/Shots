
//
//  ShotsCell.swift
//  Shots
//
//  Created by DiegoSan on 2/19/16.
//  Copyright © 2016 DiegoSan. All rights reserved.
//

import UIKit
import Kingfisher

class ShotsCell: UICollectionViewCell {
    
    var shot: DribbbleShot?
    
    // MARK: - IBOutlets
    @IBOutlet weak var shotImageView: UIImageView!
    @IBOutlet weak var shotDetailFooterView: UIView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var shotDescriptionLabel: UILabel!
    @IBOutlet weak var avatorImageView: UIImageView!
    @IBOutlet weak var shotTimeLabel: UILabel!
    @IBOutlet weak var shotAuthorLabel: UILabel!
    
    // MARK: - IBActions
    @IBAction func likeButtonDidPressed(sender: UIButton) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        
    }
    func setLikeStatusWithReverse(reverse: Bool){
        if reverse{
            likeButton.setImage(UIImage(named: "like_highlighted"), forState: .Normal)
        }else{
            likeButton.setImage(UIImage(named: "like"), forState: .Normal)
        }
    }
}
