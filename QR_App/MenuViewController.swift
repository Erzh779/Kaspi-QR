//
//  SideBarViewController.swift
//  QR_App
//
//  Created by Erzhan Taipov on 10/19/21.
//  Copyright © 2021 Erzhan Taipov. All rights reserved.
//

import UIKit

protocol MenuViewControllerDelegate : AnyObject {
    func didSelect(menuItem: MenuOptions)
}

struct Menu {
    let title: String
    let subtitle: String?
    let img: UIImage?
    let option: MenuOptions
}

enum MenuOptions{
    
    case messages
    case main
    case store
    case travel
    case payments
    case myBank
    case transfers
    case discounts
    case government
    case guide
    case maps

    
    
}


class MenuViewController : UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    
    let someArray = [Menu(title: "Сообщения", subtitle: nil, img: nil, option: .messages),
                     Menu(title: "Главная Kaspi.kz", subtitle: nil, img: nil, option: .main),
                     Menu(title: "Магазин", subtitle: nil, img: nil, option: .store),
                     Menu(title: "Travel", subtitle: "Покупайте Авиа и ЖД билеты онлайн", img: #imageLiteral(resourceName: "new"), option: .travel),
                     Menu(title: "Платежи", subtitle: nil, img: nil, option: .payments),
                     Menu(title: "Мой Банк", subtitle: "Red, Gold, Кредит, Депозит, Бонус", img: nil, option: .myBank),
                     Menu(title: "Переводы", subtitle: nil, img: nil, option: .transfers),
                     Menu(title: "Акции", subtitle: nil, img: nil, option: .discounts),
                     Menu(title: "Госуслуги", subtitle: nil, img: nil, option: .government),
                     Menu(title: "Гид", subtitle: nil, img: nil, option: .guide),
                     Menu(title: "Kaspi Maps", subtitle: nil, img: nil, option: .maps)
                     
    ]
    
    weak var delegate: MenuViewControllerDelegate?
    

//    private let tableView : UITableView  = {
//
//        let table = UITableView()
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        return table
//
//
//    }()
    
    let tableView = UITableView()
    
    private func setupTableView() {
        tableView.register(SideBarFirstTableViewCell.self, forCellReuseIdentifier: "SideBarFirstTableViewCell")
        tableView.register(SideBarSecondTableViewCell.self, forCellReuseIdentifier: "SideBarSecondTableViewCell")
        tableView.register(SideBarThirdTableViewCell.self, forCellReuseIdentifier: "SideBarThirdTableViewCell")
        tableView.register(SideBarFourthTableViewCell.self, forCellReuseIdentifier: "SideBarFourthTableViewCell")
     
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.width, height: view.bounds.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews() {
        
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .white
        tableView.backgroundColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
        setupTableView()
        tableView.setAnchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: -50, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
//    UIColor(red: 0.16, green: 0.16, blue: 0.16, alpha: 1.00)
//   setupTableView()
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = MenuOptions.allCases[indexPath.row].rawValue
//        cell.backgroundColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
//        cell.textLabel?.textColor = .white
//
//
//        cell.contentView.backgroundColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
//        return cell
//    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("TAPPPEDD")
//        tableView.deselectRow(at: indexPath, animated: true)
//        let item = MenuOptions.allCases[indexPath.row]
//        delegate?.didSelect(menuItem: item)
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped")
        tableView.deselectRow(at: indexPath, animated: true)
//        let item = someArray[indexPath.row]
//        delegate?.didSelect(menuItem: item)
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: //1 section
            
        
            return 150
            
        case 1: //2 section
            return 70
            
        case 2: //3 section
            return 85
            
        default:
            
            return 60
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0: //1 section
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideBarFirstTableViewCell", for: indexPath) as! SideBarFirstTableViewCell
            cell.selectionStyle = .none
            cell.backgroundColor =  UIColor(red: 0.16, green: 0.16, blue: 0.16, alpha: 1.00)
            return cell
            
        case 1: //2 section
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideBarSecondTableViewCell", for: indexPath) as! SideBarSecondTableViewCell
            cell.selectionStyle = .none
            cell.backgroundColor =   UIColor(red: 0.16, green: 0.16, blue: 0.16, alpha: 1.00)
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideBarThirdTableViewCell", for: indexPath) as! SideBarThirdTableViewCell
            cell.selectionStyle = .none
            cell.backgroundColor =  UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
            return cell
         
            
        default: //2 section
            
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//                cell.textLabel?.text = MenuOptions.allCases[indexPath.row].rawValue
//                cell.backgroundColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
//                cell.textLabel?.textColor = .white
//        
//        
//                cell.contentView.backgroundColor = UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)
//                return cell
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SideBarFourthTableViewCell", for: indexPath) as! SideBarFourthTableViewCell
            cell.selectionStyle = .none
            cell.backgroundColor =  UIColor(red: 0.20, green: 0.20, blue: 0.20, alpha: 1.00)

            cell.generateCells(model : someArray[indexPath.item])
            return cell
            
            
            
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: //1 section
            
            
            return 1
        case 1: //2 section
            
            return 1
            
        case 2:
            
            return 1
         
            
        default: //2 section
            
           
            return someArray.count
            
            
            
        }
    }
    
   

}
