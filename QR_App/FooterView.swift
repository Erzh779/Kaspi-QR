//
//  FooterView.swift
//  QR_App
//
//  Created by Erzhan Taipov on 10/15/21.
//  Copyright © 2021 Erzhan Taipov. All rights reserved.
//

import UIKit

class FooterView: UITableViewHeaderFooterView {
    
    let separatorView = UIView()
    
    override init(reuseIdentifier: String?) {
        super.init( reuseIdentifier: reuseIdentifier)
        self.backgroundView = UIView()
        self.backgroundView?.backgroundColor = .clear
        setUpViews()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews(){
        
        separatorView.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.00)
        addSubview(separatorView)
        separatorView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height : 9)
        
        
    }
}
