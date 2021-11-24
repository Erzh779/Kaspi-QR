//
//  ViewController.swift
//  QR_App
//
//  Created by Erzhan Taipov on 10/7/21.
//  Copyright © 2021 Erzhan Taipov. All rights reserved.
//

import UIKit

protocol ViewControllerDelegate : AnyObject {
    func didTapMenuButton()
}

class ViewController: UIViewController {
    
    weak var delegate : ViewControllerDelegate?
    
    let mainTableView = UITableView(frame: .zero, style: .grouped)
    
    let firstView = UIView()
    
    let menuButton = UIButton()
    
    let searchTextField = UITextField()
    
    let textField = UITextField()
    
    let leftImg = UIImageView()
    
    var imageView = UIImageView()
    var image = UIImage(named: "Search")
    
    let padView = UIView()
    
    
    
    
    
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func configureViews(){
        
        // Remove space between sections.
        mainTableView.sectionHeaderHeight = 0
        mainTableView.sectionFooterHeight = 9
        
        // Remove space at top and bottom of tableView.
        mainTableView.tableHeaderView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 0, height: CGFloat.leastNormalMagnitude)))
        mainTableView.tableFooterView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: view.bounds.width, height: 9)))
        
        view.backgroundColor = .white
        
        firstView.backgroundColor = .green
        
        menuButton.setImage(UIImage(named: "burger"), for: .normal)
        
//        menuButton.setBackgroundImage(UIImage(named: "burger"), for: .normal)
        
        menuButton.backgroundColor = .white
        
        searchTextField.placeholder = "  Поиск по Kaspi.kz"
        
        searchTextField.layer.cornerRadius = 8
        
        searchTextField.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.00)
        
        mainTableView.backgroundColor = .white
        mainTableView.separatorStyle = .none
        
        menuButton.addTarget(self, action: #selector(ViewController.didTapMenuButton(_:)), for: .touchUpInside)
        
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .red
        navigationController?.navigationBar.isTranslucent = true
        
        leftImg.image = #imageLiteral(resourceName: "burger")
        let frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        leftImg.frame = frame
        leftImg.layer.masksToBounds = true
        leftImg.contentMode = .scaleAspectFill
        
        
        let leftBarItem  = UIBarButtonItem(customView: menuButton)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "burger"), style: .done, target: self, action: #selector(didTapMenuButton(_:)))
        
        navigationItem.leftBarButtonItem = leftBarItem
        
        textField.text = "   Поиск по Kaspi.kz"
        textField.textAlignment = .left
        textField.textColor = .gray
        textField.frame = CGRect(x: 0, y: 0, width: 340, height: 40)
        textField.backgroundColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.00)
        navigationItem.titleView = textField
        textField.layer.cornerRadius = 8
        
       
        imageView.image = image
        imageView.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
//        textField.leftView = imageView
//        textField.leftViewMode = .always
//
        textField.setLeftIcon(UIImage(named: "Search")!)
       
    }
    
    func setUpViews(){
        configureViews()
//        view.addSubview(firstView)
        view.addSubview(mainTableView)
//        firstView.addSubview(menuButton)
//        firstView.addSubview(searchTextField)
        setUpConstraints()
        setupTableView()
    }
    
    func setUpConstraints(){
//
//        firstView.setAnchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 40)
////
//        menuButton.setAnchor(top: firstView.topAnchor, left: firstView.leftAnchor, bottom: firstView.bottomAnchor, right: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: -8, paddingRight: 0, width: 20, height: 20)
//
//        searchTextField.setAnchor(top: firstView.topAnchor, left: menuButton.rightAnchor, bottom: firstView.bottomAnchor, right: firstView.rightAnchor, paddingTop: 4, paddingLeft: 16, paddingBottom: -6, paddingRight: 20, height: 40)
        
        mainTableView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
        
        
        
    }
    
   
    
    
    private func setupTableView() {
        mainTableView.register(SpecialOffersTableViewCell.self, forCellReuseIdentifier: "SpecialOffersTableViewCell")
        mainTableView.register(FooterView.self, forHeaderFooterViewReuseIdentifier: "FooterView")
        mainTableView.register(ButtonsTableViewCell.self, forCellReuseIdentifier: "ButtonsTableViewCell")
        mainTableView.register(LeaseTableViewCell.self, forCellReuseIdentifier: "LeaseTableViewCell")
        mainTableView.register(ProductsTableViewCell.self, forCellReuseIdentifier: "ProductsTableViewCell")
        mainTableView.dataSource = self
        mainTableView.delegate = self
    }
    
    
    @objc func didTapMenuButton(_ sender: UIButton){
        
//        let vc = RegistrationVC()
//
//        self.navigationController?.pushViewController(vc, animated: true)
        
        delegate?.didTapMenuButton()
    }
    
}
extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0: //1 section
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SpecialOffersTableViewCell", for: indexPath) as! SpecialOffersTableViewCell
            cell.selectionStyle = .none
            return cell
            
        case 1: //2 section
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonsTableViewCell", for: indexPath) as! ButtonsTableViewCell
            cell.selectionStyle = .none
            return cell
            
        case 2: //1 section
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "LeaseTableViewCell", for: indexPath) as! LeaseTableViewCell
            cell.selectionStyle = .none
            return cell
            
        default: //2 section
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell", for: indexPath) as! ProductsTableViewCell
            cell.selectionStyle = .none
            return cell
            
            
            
        }
        
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: "FooterView") as! FooterView
        return header
    }
    
   
    
    
}
extension UITextField {

 /// set icon of 20x20 with left padding of 8px
 func setLeftIcon(_ icon: UIImage) {

    let padding = 8
    let size = 20

    let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding, height: size) )
    let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
    iconView.image = icon
    outerView.addSubview(iconView)

    leftView = outerView
    leftViewMode = .always
  }
}


