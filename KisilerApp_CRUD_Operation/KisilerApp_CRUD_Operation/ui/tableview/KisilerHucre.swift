//
//  KisilerHucre.swift
//  KisilerApp_CRUD_Operation
//
//  Created by Alptuğ Ağca on 26.10.2023.
//

import UIKit

class KisilerHucre: UITableViewCell { //Burada table view oluşturararak hucre için ayrı class açılması gerekiyor. İçeriside yaratılan UI elementleri ayrı class içerisinde tanımlamak gerekiyor. Ama tableview anasayfa classına bağlamak gerekiyor.

    
    @IBOutlet weak var labelKisiAd: UILabel!
    
    @IBOutlet weak var labelKisiTel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
