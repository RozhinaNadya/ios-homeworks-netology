//
//  TableViewCell.swift
//  Navigation
//
//  Created by Надежда on 21.12.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    weak var myView: UIView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        accessoryType = .none
    }
    
}
