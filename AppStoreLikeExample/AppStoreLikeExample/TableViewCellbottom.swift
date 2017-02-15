//
//  TableViewCellbottom.swift
//  AppStoreLikeExample
//
//  Created by piyush sinroja on 26/05/16.
//  Copyright © 2016 piyush sinroja. All rights reserved.
//

import UIKit

class TableViewCellbottom: UITableViewCell {
    @IBOutlet weak var collectionviewBottom: UICollectionView!
    @IBOutlet weak var constrLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var lblBottom: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
