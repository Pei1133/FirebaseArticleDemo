//
//  HomePageTableViewCell.swift
//  FirebaseArticle
//
//  Created by 黃珮鈞 on 2017/11/27.
//  Copyright © 2017年 黃珮鈞. All rights reserved.
//

import UIKit

class HomePageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var authorButton: UIButton!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
}
