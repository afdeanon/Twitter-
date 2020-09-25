//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Angeli Faith Deanon on 9/18/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit 

class TweetCellTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    
    
    var favorited:Bool = false
    var tweetId: Int = -1
    
    func setRetweeted(_ isRetweeted:Bool){
        if (isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        } else{
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    
    func setFavorite(_ isFavorited:Bool){
            favorited = isFavorited
            if (favorited){
                favoriteButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
            }
            else{
                favoriteButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
            }
        }

    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
                if (toBeFavorited){
                    TwitterAPICaller.client?.favoriteTweet(tweetID: tweetId, success: {
                        self.setFavorite(true)
                    }, failure: { (error) in
                        print("Favorite did not succeed: \(error)")
                    })
                } else{
                    TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetId, success: {
                        self.setFavorite(false)
                    }, failure: { (error) in
                        print("Unfavorite did not succeed: \(error)")
                    })
                }
    }
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetID: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print("Error is retweeting: \(error)")
        })
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization c
        }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
