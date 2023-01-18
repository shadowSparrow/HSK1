//
//  LauchVC.swift
//  HSK1
//
//  Created by mac on 01.11.2022.
//

import UIKit
import SwiftUI

class LauchVC: UIViewController {
 fileprivate let contentViewInHC =
    UIHostingController(rootView: SwiftUILaunchScreenView())
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(contentViewInHC)
        contentViewInHC.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentViewInHC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentViewInHC.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentViewInHC.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        view.addSubview(contentViewInHC.view)
       
    }
    private func addConstrains() {
        contentViewInHC.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentViewInHC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentViewInHC.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentViewInHC.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
    private func setUpHc() {
        addChild(contentViewInHC)
        view.addSubview(contentViewInHC.view)
        contentViewInHC.didMove(toParent: self)
    }
}
