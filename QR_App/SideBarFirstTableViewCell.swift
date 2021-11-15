//
//  SideBarFirstTableViewCell.swift
//  QR_App
//
//  Created by Erzhan Taipov on 05.11.2021.
//  Copyright © 2021 Erzhan Taipov. All rights reserved.
//

import UIKit

class SideBarFirstTableViewCell : UITableViewCell {
    
    let cellTitle = UILabel()
    
    let cellSubTitle = UILabel()
    
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
    
    func setUpViews(){
        
        
        backgroundColor = UIColor(red: 0.16, green: 0.16, blue: 0.16, alpha: 1.00)
        cellTitle.text = "Ержан"
        cellTitle.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        cellTitle.textAlignment = .left
        cellTitle.font = UIFont.systemFont(ofSize: 20)
        
        cellSubTitle.text = "Настройки"
        cellSubTitle.textColor = .gray
        cellSubTitle.font = UIFont.systemFont(ofSize: 14)
        
        cellImg.image = #imageLiteral(resourceName: "PRO")
        
        arrowImg.image = #imageLiteral(resourceName: "arrow side")
        let frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        arrowImg.frame = frame
        arrowImg.layer.masksToBounds = true
        arrowImg.contentMode = .scaleAspectFill
    }
    
    
    
    func setUpConstraints() {
        
        contentView.addSubview(cellTitle)
        contentView.addSubview(cellSubTitle)
        contentView.addSubview(cellImg)
        contentView.addSubview(arrowImg)
        
        cellImg.setAnchor(top: nil, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: -20, paddingRight: 0, width: 65, height: 65)
        
   
        
        cellTitle.setAnchor(top: contentView.topAnchor, left: cellImg.rightAnchor, bottom: nil, right: nil, paddingTop: 75, paddingLeft: 12, paddingBottom: 0, paddingRight: 0)
        
        
        cellSubTitle.setAnchor(top: cellTitle.bottomAnchor, left: cellImg.rightAnchor, bottom: nil, right: nil, paddingTop: 6, paddingLeft: 12, paddingBottom: 0, paddingRight: 0)
        
        
   
        arrowImg.setAnchor(top: nil, left: cellTitle.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: self.contentView.frame.width/2 - 80, paddingBottom: 0, paddingRight: 0, width: 16, height: 16)
        arrowImg.centerYAnchor.constraint(equalTo: cellImg.centerYAnchor).isActive = true
        
//        self.navVC?.view.frame.origin.x = self.homeVC.view.frame.size.width - 130
    }
}
