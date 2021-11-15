//
//  ProductsCollectionViewCell.swift
//  QR_App
//
//  Created by Erzhan Taipov on 10/19/21.
//  Copyright © 2021 Erzhan Taipov. All rights reserved.
//

import UIKit

class ProductsCollectionViewCell : UICollectionViewCell {
    
    let img = UIImageView(frame: CGRect(x: 0, y: 0, width: 180, height: 100))
    let txt = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpViews() {
        
        
        
        img.layer.cornerRadius = 8
        img.layer.masksToBounds = true
        img.contentMode = .scaleAspectFill
        txt.textAlignment = .center
        txt.textColor = .gray
        txt.font = UIFont.systemFont(ofSize: 16)
        
        addSubview(img)
        addSubview(txt)
        
        img.setAnchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 0, paddingBottom: -20, paddingRight: 0, width: 180, height: 100)
        
        txt.setAnchor(top: img.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        
        
    }
    
    func generateCells1(model : OfferModel) {
        
        img.image = model.photo
        txt.text =  model.info
        
    }
}




