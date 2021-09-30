//
//  CustomTableViewCell.swift
//  Github-Users
//
//  Created by Darshil Agrawal on 11/05/21.
//

import UIKit
import SDWebImage

class CustomTableViewCell: UITableViewCell {
    var userDataObject:User?
    @IBOutlet weak var rowImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textLabel?.text=userDataObject?.login
        self.textLabel?.textAlignment = .center
        self.accessoryType = .detailDisclosureButton
        
        // Image in The Cell
        if let imageValue=userDataObject?.avatar_url{
            if let url = URL(string: imageValue){
                self.rowImage.sd_setImage(with: url,placeholderImage: UIImage(named: "placeholder"), completed: nil)
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
