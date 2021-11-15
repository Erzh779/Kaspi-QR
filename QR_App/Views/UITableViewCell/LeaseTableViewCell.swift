//
//  LeaseTableViewCell.swift
//  QR_App
//
//  Created by Erzhan Taipov on 10/11/21.
//  Copyright © 2021 Erzhan Taipov. All rights reserved.
//

import UIKit

class LeaseTableViewCell : UITableViewCell {
    
  
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.isScrollEnabled = true
        return cv
    }()
    
    
    
    let leaseArray = [LeaseModel(img: #imageLiteral(resourceName: "1200x700-kaspi"), img2: #imageLiteral(resourceName: "1200x700-kaspi"), title1: "Рассрочка 0-0-12", subtitle1: "Одежда, Обувь, Учебные центры", title2: "Рассрочка 0-0-12", subtitle2 : "Одежда, Обувь, Учебные центры"),
                     LeaseModel(img: #imageLiteral(resourceName: "1200x700-kaspi"), img2: #imageLiteral(resourceName: "1200x700-kaspi"), title1: "Рассрочка 0-0-12", subtitle1: "Одежда, Обувь, Учебные центры", title2: "Рассрочка 0-0-12", subtitle2 : "Одежда, Обувь, Учебные центры"),
                      LeaseModel(img: #imageLiteral(resourceName: "1200x700-kaspi"), img2: #imageLiteral(resourceName: "1200x700-kaspi"), title1: "Рассрочка 0-0-12", subtitle1: "Одежда, Обувь, Учебные центры", title2: "Рассрочка 0-0-12", subtitle2 : "Одежда, Обувь, Учебные центры"),
                    LeaseModel(img: #imageLiteral(resourceName: "1200x700-kaspi"), img2: #imageLiteral(resourceName: "1200x700-kaspi"), title1: "Рассрочка 0-0-12", subtitle1: "Одежда, Обувь, Учебные центры", title2: "Рассрочка 0-0-12", subtitle2 : "Одежда, Обувь, Учебные центры")
                      ]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        
        setUpViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpViews() {
        contentView.addSubview(collectionView)
        collectionView.backgroundColor = .white
        
        setUpConstraints()
        setUpCollectionView()
    }
    
    func setUpCollectionView(){
        
        collectionView.register(LeaseCollectionViewCell.self, forCellWithReuseIdentifier: "LeaseCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        
        
        
    }
    
    func setUpConstraints(){
        
        collectionView.setAnchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 150) //180
    }
    
 
    
    
}
extension LeaseTableViewCell : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 310, height: 150 ) //120
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
}

extension LeaseTableViewCell : UICollectionViewDelegate ,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return leaseArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LeaseCollectionViewCell", for: indexPath) as! LeaseCollectionViewCell
        cell.generateCells(model : leaseArray[indexPath.item])
        return cell
    }
}




