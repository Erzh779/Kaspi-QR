//
//  HomeViewController.swift
//  QR_App
//
//  Created by Erzhan Taipov on 10/21/21.
//  Copyright © 2021 Erzhan Taipov. All rights reserved.
//

import UIKit

class ContainerViewController : UIViewController {
    
    enum MenuState{
        
        case opened
        case closed
        
    }
    
    private var menuState : MenuState = .closed
    
    let menuVC = MenuViewController()
    
    let homeVC = ViewController()
    
    var navVC : UINavigationController?
    
    lazy var QR_VC = QRViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
        
    }
    
    func setUpViews(){
        
        addChildVCs()
        
        
    }
    
    private func addChildVCs() {
        
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        menuVC.delegate = self
        homeVC.delegate = self
        let navVC = UINavigationController(rootViewController: homeVC)
//         navVC.navigationBar.isHidden = true
        
//        navVC.navigationBar.barTintColor = .green
    
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        self.navVC = navVC
        
    }
    
}
extension ContainerViewController : ViewControllerDelegate {
    
    func didTapMenuButton() {
        
       toggleMenu(completion: nil)
        
        
        
    }
    
    func toggleMenu(completion: (() -> Void)?) {
        
        print("come on")
        
        switch menuState {
        case .closed:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
                self.navVC?.view.frame.origin.x = self.homeVC.view.frame.size.width - 130
                
            }) { [weak self] (done) in
                if done {
                    self?.menuState = .opened
                   
                }
            }
        case .opened:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
                self.navVC?.view.frame.origin.x = 0
                
            }) { [weak self] (done) in
                if done {
                    self?.menuState = .closed
                    DispatchQueue.main.async {
                        completion?()
                    }
                }
            }
        }
    }
    
}
extension ContainerViewController : MenuViewControllerDelegate {
    
    func didSelect(menuItem: MenuOptions) {
    
        toggleMenu { [weak self] in
            
            switch menuItem{
                
            case .messages:
                break
            case .main:
                print("Tapped info")
//                guard let strongSelf = self,
//                    let vc = self?.QR_VC else {
//                    return
//                }
//                self?.addChild(vc)
//                self?.homeVC.view.addSubview(vc.view)
//                vc.view.frame = self?.homeVC.view.bounds ?? .zero
//                vc.didMove(toParent: strongSelf)
                
                self?.addQR()
//
//                self?.present(vc, animated: true, completion: nil)
            case .store:
                break
            case .travel:
                break
            case .payments:
                break
            case .myBank:
                break
            case .transfers:
                break
            case .discounts:
                break
            case .government:
                break
            case .guide:
                break
            case .maps:
                break
            }
        }
        
    }

    func addQR(){
        
        let vc = QR_VC
        
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        
    }
}




