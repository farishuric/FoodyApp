//
//  DetailsViewController.swift
//  FoodyApp
//
//  Created by Macbook on 27. 1. 2022..
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var recipeNameLbl: UILabel!
    
    @IBOutlet weak var recipeIngrediensLbl: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    var recept: Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.layer.cornerRadius = 15.0
        self.imageView.setImage(imageUrl: self.recept.image)
        self.recipeNameLbl.text = recept.label
        self.recipeIngrediensLbl.text = desc()
        // Do any additional setup after loading the view.
    }
    
    func desc() -> String{
        var description: String = ""
        for item in self.recept.ingredientLines{
            description.append(item)
            description.append(",")
        }
        return description
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
