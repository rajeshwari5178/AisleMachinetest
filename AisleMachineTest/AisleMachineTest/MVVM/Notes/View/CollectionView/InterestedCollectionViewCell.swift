//
//  InterestedCollectionViewCell.swift
//  AisleMachineTest
//
//  Created by Rajeshwari Sharma on 24/08/23.
//

import UIKit

class InterestedCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var Imagevieww: UIImageView!
    @IBOutlet weak var Label1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        Imagevieww.layer.cornerRadius = 20
    }

}
