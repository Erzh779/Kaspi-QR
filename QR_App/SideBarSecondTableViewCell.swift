//
//  SideBarSeconfTableViewCell.swift
//  QR_App
//
//  Created by Erzhan Taipov on 05.11.2021.
//  Copyright © 2021 Erzhan Taipov. All rights reserved.
//

import UIKit

class SideBarSecondTableViewCell : UITableViewCell {
    
    let cellTitle = UILabel()
    
    let cellImg = UIImageView()
    
    let arrowImg = UIImageView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        
        cellTitle.text = "Алматы"
        cellTitle.textColor = .white
        cellTitle.font = UIFont.systemFont(ofSize: 18)
        
        
        cellImg.image = #imageLiteral(resourceName: "location")
        cellImg.contentMode = .scaleAspectFit
        
        arrowImg.image = #imageLiteral(resourceName: "arrow side")
        arrowImg.contentMode = .scaleAspectFill
        arrowImg.frame = CGRect(x: 0, y: 0, width: 16, height: 16)
        arrowImg.layer.masksToBounds = true
        
        
    }
    
    func setUpConstraints() {
        
        contentView.addSubview(cellTitle)
        
        contentView.addSubview(cellImg)
        
        contentView.addSubview(arrowImg)
        
        cellImg.setAnchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: nil, paddingTop: 12, paddingLeft: 20, paddingBottom: -12, paddingRight: 0, width: 24, height: 24)
        
        cellTitle.setAnchor(top: nil, left: cellImg.rightAnchor, bottom: nil, right: nil, paddingTop: 16, paddingLeft: 20, paddingBottom: -16, paddingRight: 0)
        cellTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        arrowImg.setAnchor(top: nil, left: cellTitle.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: self.contentView.frame.width/2 - 55, paddingBottom: 0, paddingRight: 0, width: 16, height: 16)
        arrowImg.centerYAnchor.constraint(equalTo: cellTitle.centerYAnchor).isActive = true
        
    }
    
}
