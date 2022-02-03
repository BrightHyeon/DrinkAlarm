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
        guard let data = UserDefaults.standard.value(forKey: "alerts") as? Data,
              var alerts = try? PropertyListDecoder().decode([Alert].self, from: data) else { return }
        
        alerts[sender.tag].isOn = sender.isOn
        UserDefaults.standard.set(try? PropertyListEncoder().encode(alerts), forKey: "alerts")
        
        print(alerts[sender.tag].isOn)
        print((try? PropertyListDecoder().decode([Alert].self, from: (UserDefaults.standard.value(forKey: "alerts") as? Data)!)) ?? "")
    }
    
}
