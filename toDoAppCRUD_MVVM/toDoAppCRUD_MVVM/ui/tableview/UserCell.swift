//
//  UserCell.swift
//  toDoAppCRUD_MVVM
//
//  Created by Alptuğ Ağca on 27.11.2023.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var labelUserName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
