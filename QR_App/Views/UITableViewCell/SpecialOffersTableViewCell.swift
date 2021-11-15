//
//  specialOffersTableViewCelll.swift
//  QR_App
//
//  Created by Erzhan Taipov on 10/11/21.
//  Copyright © 2021 Erzhan Taipov. All rights reserved.
//


import UIKit

class SpecialOffersTableViewCell : UITableViewCell {
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
//        layout.minimumInteritemSpacing
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.isScrollEnabled = true
        return cv
    }()
    
    
    
    let offersArray = [OfferModel(photo: #imageLiteral(resourceName: "rassroka-24"), info: "11 октября - 17 октября"),
                       OfferModel(photo: #imageLiteral(resourceName: "rassrocka-0-0-12-s-kaspi_5cca87514f83e"), info: "Выгодное предложение!"),
                       OfferModel(photo: #imageLiteral(resourceName: "rassroka-24"), info: "11 октября - 17 октября"),
                       OfferModel(photo: #imageLiteral(resourceName: "rassrocka-0-0-12-s-kaspi_5cca87514f83e"), info: "Выгодное предложение!"),
                       OfferModel(photo: #imageLiteral(resourceName: "rassroka-24"), info: "11 октября - 17 октября")
    
    ]
    
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setUpViews() {
        contentView.backgroundColor = .white
        contentView.addSubview(collectionView)
        
        setUpConstraints()
        setUpCollectionView()
    }
    
    func setUpCollectionView(){
        
        collectionView.register(SpecialOffersCollectionViewCell.self, forCellWithReuseIdentifier: "SpecialOffersCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        
        
        
    }
    
    func setUpConstraints(){
        
        collectionView.setAnchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, height: 160)
    }
    
    
}
extension SpecialOffersTableViewCell : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
}

extension SpecialOffersTableViewCell : UICollectionViewDelegate ,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SpecialOffersCollectionViewCell", for: indexPath) as! SpecialOffersCollectionViewCell
        cell.generateCells1(model : offersArray[indexPath.item])
        cell.contentView.backgroundColor = .white
        return cell
    }
}


