//
//  TableCellMiddle.swift
//  AppStoreLikeExample
//
//  Created by piyush sinroja on 26/05/16.
//  Copyright © 2016 piyush sinroja. All rights reserved.
//

import UIKit

class TableCellMiddle: UITableViewCell {
    var flowLayout: UICollectionViewFlowLayout {
        return collectionviewmiddle?.collectionViewLayout as! UICollectionViewFlowLayout
    }
    @IBOutlet weak var collectionviewmiddle: UICollectionView!
    @IBOutlet weak var lblMiddle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    collectionviewmiddle.decelerationRate = UIScrollViewDecelerationRateNormal;
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
