//
//  MainViewCell.swift
//  TestTableViewApp
//
//  Created by Евгений Тимофеев on 13.02.2022.
//

import UIKit

class MainViewCell: UITableViewCell {

    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {

        super.awakeFromNib()
        // Initialization code
    }

    func setValue(objectCons: MyData) {
        self.emojiLabel.text = objectCons.emoji
        self.nameLabel.text = objectCons.name
        self.descriptionLabel.text = objectCons.decsription
    }

}
