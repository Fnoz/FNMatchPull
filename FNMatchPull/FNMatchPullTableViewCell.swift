//
//  FNMatchPullTableViewCell.swift
//  FNMatchPull
//
//  Created by Fnoz on 16/6/24.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class FNMatchPullTableViewCell: UITableViewCell {
    var centerImageView: UIImageView = UIImageView.init(frame: CGRectMake(0, 0, 80, 76))
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        centerImageView.alpha = 0.5
        contentView.addSubview(centerImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
