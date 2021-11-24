//
//  ButtonsTableViewCell.swift
//  QR_App
//
//  Created by Erzhan Taipov on 10/11/21.
//  Copyright © 2021 Erzhan Taipov. All rights reserved.
//

import UIKit

class ButtonsTableViewCell : UITableViewCell {
    
   
    
    let buttonCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.isScrollEnabled = false
        return cv
    }()
    
    let buttonsArray = [ButtonsModel(buttImage: #imageLiteral(resourceName: "qr 2"), buttText: "Kaspi QR"),
                      ButtonsModel(buttImage: #imageLiteral(resourceName: "bank"), buttText: "Мой Банк"),
                       ButtonsModel(buttImage: #imageLiteral(resourceName: "check"), buttText: "Платежи"),
                       ButtonsModel(buttImage: #imageLiteral(resourceName: "perevod"), buttText: "Переводы"),
                       ButtonsModel(buttImage: #imageLiteral(resourceName: "Rectangle"), buttText: "Магазин"),
                       ButtonsModel(buttImage: #imageLiteral(resourceName: "Vector-1"), buttText: "Акции"),
                       ButtonsModel(buttImage: #imageLiteral(resourceName: "la_suitcase"), buttText: "Travel"),
                      ButtonsModel(buttImage: UIImage(named: "Government")!, buttText: "Госуслуги"),
                        ]

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setUpViews() {
        addSubview(buttonCollectionView)
        buttonCollectionView.backgroundColor = .white
        
        setUpConstraints()
        setUpCollectionView()
    }
    
    func setUpCollectionView(){
        
        buttonCollectionView.register(ButtonsCollectionViewCell.self, forCellWithReuseIdentifier: "ButtonsCollectionViewCell")
        buttonCollectionView.dataSource = self
        buttonCollectionView.delegate = self
        
        
        
        
        
    }
    
    func setUpConstraints(){
        
        buttonCollectionView.setAnchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 180)
    }
    
   
    
    
}
extension ButtonsTableViewCell : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
}

extension ButtonsTableViewCell : UICollectionViewDelegate ,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  buttonsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ButtonsCollectionViewCell", for: indexPath) as! ButtonsCollectionViewCell
        cell.generateCells2(model : buttonsArray[indexPath.item])
        return cell
    }
    
    
}
