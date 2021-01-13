//
//  CustomTableViewCell.swift
//  picsums
//
//  Created by Admin on 13/01/21.
//  Copyright © 2021 Admin. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imageName: UILabel!
   
    @IBOutlet weak var lazyImage: LazyImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
