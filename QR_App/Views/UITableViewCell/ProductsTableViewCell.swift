//
//  ProductsTableViewCell.swift
//  QR_App
//
//  Created by Erzhan Taipov on 10/11/21.
//  Copyright © 2021 Erzhan Taipov. All rights reserved.
//
import UIKit

class ProductsTableViewCell : UITableViewCell {
    
    
    
    let productsCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.isScrollEnabled = true
        return cv
    }()
    
    let productsArray = [OfferModel(photo: #imageLiteral(resourceName: "IMG_9233 3"), info: "Смартфоны"),
                       OfferModel(photo: #imageLiteral(resourceName: "IMG_9233 3"), info: "Смарт-часы"),
                       OfferModel(photo: #imageLiteral(resourceName: "IMG_9233 3"), info: "Смартфоны"),
                       OfferModel(photo: #imageLiteral(resourceName: "IMG_9233 3"), info: "Смарт-часы"),
                       OfferModel(photo: #imageLiteral(resourceName: "IMG_9233 3"), info: "Смартфоны")
        
    ]
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setUpViews() {
        contentView.addSubview(productsCollectionView)
        productsCollectionView.backgroundColor = .white
        
        setUpConstraints()
        setUpCollectionView()
    }
    
    func setUpCollectionView(){
        
        productsCollectionView.register(ProductsCollectionViewCell.self, forCellWithReuseIdentifier: "ProductsCollectionViewCell")
        productsCollectionView.dataSource = self
        productsCollectionView.delegate = self
        
        
        
        
        
    }
    
    func setUpConstraints(){
        
        productsCollectionView.setAnchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 160)
    }
    
    
    
    
}
extension ProductsTableViewCell : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
}

extension ProductsTableViewCell : UICollectionViewDelegate ,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  productsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as! ProductsCollectionViewCell
        cell.generateCells1(model : productsArray[indexPath.item])
        return cell
    }
    
    
}
