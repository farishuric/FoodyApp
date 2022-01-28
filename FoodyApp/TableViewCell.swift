//
//  TableViewCell.swift
//  FoodyApp
//
//  Created by Macbook on 27. 1. 2022..
//

import UIKit


class TableViewCell: UITableViewCell {

   
    @IBOutlet weak var createdByLbl: UILabel!
    @IBOutlet weak var receiptsImageView: UIImageView!
    
    @IBOutlet weak var recipeTitleLbl: UILabel!
    
    var recept: Recipe!{
        didSet{
            
            self.receiptsImageView.setImage(imageUrl: self.recept.image)
            self.createdByLbl?.text = self.recept.label
            self.recipeTitleLbl?.text = self.recept.source
            
        }
    }
    
    override func awakeFromNib() {
        receiptsImageView.layer.cornerRadius = 15.0
    }
    
}
