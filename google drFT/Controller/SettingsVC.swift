//
//  SettingsVC.swift
//  google drFT
//
//  Created by Azizbek Salimov on 13.05.2022.
//

import UIKit
import Lottie

class SettingsVC: UIViewController {
    
    
    let clearView = UIView()
    let lottieView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        setupUI()
    }
    
    
    func setupUI(){
        
        self.view.addSubview(clearView)
        clearView.backgroundColor = .systemBackground
        clearView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.clearView.addSubview(lottieView)
        lottieView.snp.makeConstraints { make in
            make.edges.equalTo(clearView).inset(0)
        }
        lottieView.animation = .named("98599-settings")
        lottieView.contentMode = .scaleAspectFit
        lottieView.loopMode = .loop
        lottieView.animationSpeed = 1
        lottieView.play()
        
    }
    
}
