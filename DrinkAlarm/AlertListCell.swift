//
//  AlertListCell.swift
//  DrinkAlarm
//
//  Created by HyeonSoo Kim on 2022/01/31.
//

import UIKit

class AlertListCell: UITableViewCell {

    @IBOutlet weak var meridiemLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var alertSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func alertSwitchValueChanged(_ sender: UISwitch) {
    }
    
}
