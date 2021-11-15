//
//  SideBarThirdTableViewCell.swift
//  QR_App
//
//  Created by Erzhan Taipov on 09.11.2021.
//  Copyright © 2021 Erzhan Taipov. All rights reserved.
//

import UIKit

class SideBarFourthTableViewCell : UITableViewCell {
    
    let titleLabel = UILabel()
    var subTitleLabel = UILabel()
    var iconImageView = UIImageView()
    let someView = UIView()
    
    lazy var stackViewH = UIStackView(arrangedSubviews: [titleLabel, iconImageView, someView])
    lazy var stackViewV = UIStackView(arrangedSubviews: [stackViewH, subTitleLabel])
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        configureViews()
        setUpViews()
        setUpConstraints()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureViews(){
        
        titleLabel.font = UIFont.systemFont(ofSize: 18)
        titleLabel.textColor =  UIColor(red: 0.72, green: 0.72, blue: 0.72, alpha: 1.00)
        subTitleLabel.font = UIFont.systemFont(ofSize: 14)
        subTitleLabel.textColor =  UIColor(red: 0.72, green: 0.72, blue: 0.72, alpha: 1.00)
        
        iconImageView.frame = CGRect(x: 0, y: 0, width: 48, height: 24)
        iconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.layer.cornerRadius = 12
        iconImageView.layer.masksToBounds = true
        
        stackViewH.axis = .horizontal
        stackViewH.spacing = 8
        stackViewV.axis = .vertical
        
        
        
        
        
    }
    
    func setUpViews() {
        
        contentView.addSubview(stackViewV)
        
        
        
        
    }
    
    func setUpConstraints(){
        
        stackViewV.setAnchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0)
        
        
        
        
    }
    
    

        
        
        func generateCells(model : Menu) {
           
            titleLabel.text = model.title
            subTitleLabel.text = model.subtitle
            iconImageView.image = model.img
        
            if model.img == nil {
                [iconImageView, someView].forEach { view in
                    stackViewH.removeArrangedSubview(view)
                }
                
            }
    }
    
}

