//
//  PartyCellTableViewCell.swift
//  09-tableViews
//
//  Created by Alex Comunian on 13/09/16.
//  Copyright © 2016 Hackademy. All rights reserved.
//

import UIKit

class PartyCellTableViewCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func updateUI(partyRock: PartyRock){
        videoTitle.text = partyRock.videoTitle
        
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async {
            do{
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    // update user interface with sync operation
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            }catch {
                // Handle the error
            }
        }
        
    }
    
}
