//
//  ButtonsCollectionViewCell.swift
//  QR_App
//
//  Created by Erzhan Taipov on 10/13/21.
//  Copyright © 2021 Erzhan Taipov. All rights reserved.
//

import UIKit

class ButtonsCollectionViewCell : UICollectionViewCell {
    
    let img = UIImageView()
    let txt = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        
//        backgroundColor = .blue
   
     
    
        txt.textAlignment = .center
        txt.textColor = .gray
        txt.font = UIFont.systemFont(ofSize: 14)

        addSubview(img)
        addSubview(txt)
        img.contentMode = .scaleAspectFit
        img.setAnchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 28, height: 28)

        txt.setAnchor(top: img.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 0, paddingBottom: -8, paddingRight: 0)


        
    }
    
    func generateCells2(model : ButtonsModel) {
        
        img.image = model.buttImage
        txt.text =  model.buttText
        
    }
    
    
    
    
}

