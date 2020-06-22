//
//  MenuTableViewCell.swift
//  AVSoft
//
//  Created by Роман Ковайкин on 17.06.2020.
//  Copyright © 2020 Роман Ковайкин. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    
    var myLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(myLabel)
        
        backgroundColor = Colors.backColor
        
        myLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
