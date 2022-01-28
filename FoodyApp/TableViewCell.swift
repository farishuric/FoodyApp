//
//  TableViewCell.swift
//  FoodyApp
//
//  Created by Macbook on 27. 1. 2022..
//

import UIKit


class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var receiptsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var recept: Recipe!{
        didSet{
            self.receiptsImageView.setImage(imageUrl: self.recept.image)
            self.titleLabel.text = String(self.recept.label)
            self.authorLabel.text = String(self.recept.source)
        }
    }
    
    
    
    override func awakeFromNib() {
        receiptsImageView.layer.cornerRadius = 15.0
    }
    
}
