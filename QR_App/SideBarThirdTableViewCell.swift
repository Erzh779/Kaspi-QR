//
//  SideBarThirdTableViewCell.swift
//  QR_App
//
//  Created by Erzhan Taipov on 05.11.2021.
//  Copyright © 2021 Erzhan Taipov. All rights reserved.
//

import UIKit

class SideBarThirdTableViewCell : UITableViewCell {
    
    let cellImg = UIImageView()
    
    let cellTitle = UILabel()
    
    let cellSubTitle = UILabel()
    
    
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        
        cellImg.image = #imageLiteral(resourceName: "qr 2")
        cellImg.contentMode = .scaleAspectFill
        cellImg.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        cellImg.layer.masksToBounds = true
        
        cellTitle.text = "Kaspi QR"
        cellTitle.font = UIFont.systemFont(ofSize: 18)
        cellTitle.textColor = UIColor(red: 0.72, green: 0.72, blue: 0.72, alpha: 1.00)
        cellSubTitle.text = "Сканируйте и платите"
        cellSubTitle.font = UIFont.systemFont(ofSize: 14)
        cellSubTitle.textColor = UIColor(red: 0.72, green: 0.72, blue: 0.72, alpha: 1.00)
        
        
        
        
    }
    
    func setUpConstraints(){
        
        contentView.addSubview(cellImg)
        contentView.addSubview(cellTitle)
        contentView.addSubview(cellSubTitle)
        
        cellImg.setAnchor(top: nil, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: -12, paddingRight: 0, width: 30, height: 30)
        
        cellSubTitle.setAnchor(top: nil, left: cellImg.rightAnchor, bottom: contentView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 12, paddingBottom: -4, paddingRight: 0)
        
        cellTitle.setAnchor(top: nil, left: cellImg.rightAnchor, bottom: cellSubTitle.topAnchor, right: nil, paddingTop: 0, paddingLeft: 12, paddingBottom: -8, paddingRight: 0)
        
        
        
        
    }
    
}
