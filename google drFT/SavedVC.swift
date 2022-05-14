//
//  SavedVC.swift
//  google drFT
//
//  Created by Azizbek Salimov on 13.05.2022.
//

import UIKit
import Lottie
import SnapKit

class SavedVC: UIViewController {
    let clearView = UIView()
    let lottieView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            make.edges.equalTo(clearView).inset(50)
        }
        //lottieView.animation = .named("97484-clock-time")
        lottieView.animation = .named("cooming soon") 
        lottieView.contentMode = .scaleAspectFit
        lottieView.loopMode = .loop
        lottieView.animationSpeed = 1
        lottieView.play()

    }
    

}
