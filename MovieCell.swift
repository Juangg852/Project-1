//
//  MovieCell.swift
//  Unit1 Project
//
//  Created by Juan Gonzalez on 9/12/21.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var Poster: UIImageView!
    @IBOutlet weak var Rating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
