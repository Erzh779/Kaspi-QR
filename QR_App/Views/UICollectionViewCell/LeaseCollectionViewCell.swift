//
//  LeaseCollectionViewCell.swift
//  QR_App
//
//  Created by Erzhan Taipov on 10/15/21.
//  Copyright © 2021 Erzhan Taipov. All rights reserved.
//

import UIKit

class LeaseCollectionViewCell : UICollectionViewCell {
   
    let img = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
    let img2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 30))
    let title1 = UILabel()
    let title2 = UILabel()
    let subtitle1 = UILabel()
    let subtitle2 = UILabel()
    
    lazy var stackLabels1 = UIStackView(arrangedSubviews: [ title1, subtitle1])
    lazy var stackImg = UIStackView(arrangedSubviews: [img, stackLabels1] )
    
    lazy var stackLabels2 = UIStackView(arrangedSubviews: [title2, subtitle2])
    lazy var stackImg2 = UIStackView(arrangedSubviews: [img2, stackLabels2])
    
    lazy var unitedStack = UIStackView(arrangedSubviews: [stackImg, stackImg2])
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpViews() {
        
        backgroundColor = .white
        [img, img2].forEach { (image) in
            image.layer.masksToBounds = true
            image.contentMode = .scaleAspectFill
            image.widthAnchor.constraint(equalToConstant: 60).isActive = true
            image.heightAnchor.constraint(equalToConstant: 30).isActive = true
            image.layer.cornerRadius = 6
        }
        
      
        
        
        
        
      
        [title1, title2].forEach { (label) in
            label.textAlignment = .left
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 18)
        }

        [subtitle1, subtitle2].forEach { (label2) in
            label2.textAlignment = .left
            label2.textColor = .gray
            label2.font = UIFont.systemFont(ofSize: 14)
        }
        
        stackLabels1.axis = .vertical
        stackLabels1.spacing = 4
        stackLabels1.distribution = .fillProportionally
        
        stackLabels1.heightAnchor.constraint(equalToConstant: 52).isActive = true
        stackLabels1.widthAnchor.constraint(equalToConstant: 80).isActive = true

        
        stackImg.axis = .horizontal
        stackImg.spacing = 8
        stackImg.distribution = .fill

        stackLabels2.axis = .vertical
        stackLabels2.spacing = 4
        stackLabels2.distribution = .equalSpacing

        stackImg2.axis = .horizontal
        stackImg2.spacing = 8
        stackImg2.distribution = .fill

        unitedStack.axis = .vertical
        unitedStack.spacing = 24
        unitedStack.distribution = .fillEqually
        
     
        addSubview(unitedStack)
        unitedStack.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 12, paddingBottom: -20, paddingRight: 0)

        
//        addSubview(stackLabels1)
//        stackLabels1.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
//        addSubview(img)
//        addSubview(img2)
//         addSubview(label1)
//          addSubview(label2)
//         addSubview(label3)
//         addSubview(label4)
//
//        img.setAnchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 65, height: 53)
//        img2.setAnchor(top: img.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 16, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 65, height: 53)
//
//
//        label1.setAnchor(top: topAnchor, left: img.rightAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 115, height: 25)
//
//
//
//        label3.setAnchor(top: label1.bottomAnchor, left: img.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 115, height: 25)
//
//        label2.centerXAnchor.constraint(equalTo: label1.centerXAnchor).isActive = true
//        label2.setAnchor(top: label1.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 115, height: 25)
//
//        label4.centerXAnchor.constraint(equalTo: label3.centerXAnchor).isActive = true
//        label4.setAnchor(top: label3.bottomAnchor, left: nil, bottom: bottomAnchor, right: nil, paddingTop: 9, paddingLeft: 16, paddingBottom: -9, paddingRight: 0, width: 115, height: 25)
//
        
    }
    
    func generateCells(model : LeaseModel) {
       
        img.image = model.img
        img2.image = model.img2
        title1.text = model.title1
        subtitle1.text = model.subtitle1
        title2.text = model.title2
        subtitle2.text = model.subtitle2


    }
}




