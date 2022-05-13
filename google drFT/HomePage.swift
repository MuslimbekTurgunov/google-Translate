//
//  HomePage.swift
//  google drFT
//
//  Created by Azizbek Salimov on 12.05.2022.
//

import UIKit
import SnapKit
import CloudKit

class HomePage: UIViewController {
    var istextViewTopFilled: Bool = false
    var flag = 0
    let headerLabel = UILabel()
    let profileBtn = UIButton()
    let myView = UIView()
    let stripeViewTop = UIView()
    let stripeViewBottom = UIView()
    let stripeViewBottom2 = UIView()
    let stripeViewBottom3 = UIView()
    let leftLangBtn = UIButton()
    let clearBtn = UIButton()
    let rightLangBtn = UIButton()
    let switchBtn = UIButton()
    let textViewTop = UITextView()
    let textViewBottom = UITextView()
    let languageTopBtn = UIButton()
    let languageBottomBtn = UIButton()
    let cameraBtn = UIButton()
    let speechBtn = UIButton()
    let speechAndTextBtn = UIButton()
    let tableView = UITableView()
    let saveBtn = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        navigationItem.title = "Google Переводчик"
        textViewDelegateSetup()
        setupViews()
        profileBtnSetup()
    }

    @objc func profileBtnPressed(){
        
    }
    
    @objc func clearBtnPressed(){
        clearBtn.isHidden = true
        languageTopBtn.isHidden = true
        textViewTop.text = ""
        if textViewTop.endEditing(true) && textViewTop.text == "" {
            textViewTop.text = "Write a text"
            textViewTop.textColor = .systemGray4
            flag = 0
        } else {
            textViewTop.text = ""
            textViewTop.textColor = .label
        }
    }
    
    func setupViews(){
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
        self.view.addSubview(myView)
        myView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        myView.backgroundColor = .systemBackground
        
        leftLangBtn.setTitle("uzbek", for: .normal)
        leftLangBtn.setTitleColor(#colorLiteral(red: 0.2597772479, green: 0.5198659897, blue: 0.9595910907, alpha: 1) , for: .normal)
        leftLangBtn.isUserInteractionEnabled = false
        rightLangBtn.setTitle("english", for: .normal)
        rightLangBtn.setTitleColor(#colorLiteral(red: 0.2597772479, green: 0.5198659897, blue: 0.9595910907, alpha: 1) , for: .normal)
        rightLangBtn.isUserInteractionEnabled = false
        switchBtn.setImage(UIImage(systemName: "arrow.left.arrow.right")?.applyingSymbolConfiguration(.init(weight: UIImage.SymbolWeight.light)), for: .normal)
        switchBtn.tintColor = .systemGray
        
        
        let stackView = UIStackView()
        stackView.addArrangedSubview(leftLangBtn)
        stackView.addArrangedSubview(switchBtn)
        stackView.addArrangedSubview(rightLangBtn)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        self.myView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(5)
            make.left.right.equalTo(myView).inset(32)
            
        }
        
        // Stripe View below languages
        self.myView.addSubview(stripeViewTop)
        stripeViewTop.backgroundColor = .systemGray5
        stripeViewTop.snp.makeConstraints { make in
            make.right.equalTo(myView.snp.right).inset(0)
            make.left.equalTo(myView.snp.left).inset(0)
            make.height.equalTo(2).constraint
            make.top.equalTo(stackView.snp.bottom).inset(-5)
        }
        
        
        //Clear buttoon
        self.myView.addSubview(clearBtn)
        clearBtn.setImage(UIImage(systemName: "xmark")?.applyingSymbolConfiguration(.init(weight: .semibold))?.applyingSymbolConfiguration(.init(pointSize: 15)), for: .normal)
        clearBtn.addTarget(self, action: #selector(clearBtnPressed), for: .touchUpInside)
        clearBtn.isHidden = true
        clearBtn.tintColor = .systemGray
        clearBtn.snp.makeConstraints { make in
            make.right.equalTo(myView.snp.right).inset(15)
            make.width.equalTo(20).constraint
            make.height.equalTo(20).constraint
            make.top.equalTo(stripeViewTop.snp.bottom).inset(-10)
        }
        
        //top language buttoon
        self.myView.addSubview(languageTopBtn)
        languageTopBtn.setTitle("uzbek", for: .normal)
        languageTopBtn.isHidden = true
        //clearBtn.addTarget(self, action: #selector(clearBtnPressed), for: .touchUpInside)
        languageTopBtn.setTitleColor(.systemGray, for: .normal)
        languageTopBtn.snp.makeConstraints { make in
            make.left.equalTo(myView.snp.left).inset(30)
           // make.width.equalTo(100).constraint
           // make.height.equalTo(20).constraint
            make.top.equalTo(stripeViewTop.snp.bottom).inset(-10)
            //make.right.equalTo(clearBtn.snp.left).inset(30)
        }
        
        // TextView
        self.myView.addSubview(textViewTop)
        textViewTop.text = "Write a text"
        textViewTop.clearsContextBeforeDrawing = true
        textViewTop.font = UIFont.systemFont(ofSize: 16)
        textViewTop.returnKeyType = .go
        textViewTop.textColor = .systemGray4
        textViewTop.snp.makeConstraints { make in
            make.right.equalTo(myView.snp.right).inset(30)
            make.left.equalTo(myView.snp.left).inset(20)
            make.height.equalTo(78).constraint
            make.top.equalTo(languageTopBtn.snp.bottom).inset(3)
        }
        
        // Stripe View below languages
        self.myView.addSubview(stripeViewBottom)
        stripeViewBottom.backgroundColor = .systemGray5
        stripeViewBottom.snp.makeConstraints { make in
            make.right.equalTo(myView.snp.right).inset(0)
            make.left.equalTo(myView.snp.left).inset(0)
            make.height.equalTo(2).constraint
            make.top.equalTo(textViewTop.snp.bottom).inset(-5)
        }
        
        let stackView2 = UIStackView()
        stackView2.addArrangedSubview(cameraBtn)
        cameraBtn.setTitle("Camera", for: .normal)
        cameraBtn.setImage(UIImage(named: "photo_camera_FILL0_wght400_GRAD0_opsz48")!.applyingSymbolConfiguration(.init(weight: .semibold))?.applyingSymbolConfiguration(.init(pointSize: 5)), for: .normal )
        cameraBtn.configuration?.preferredSymbolConfigurationForImage = .init(weight: .bold)
        cameraBtn.alignImageAndTitleVertically(left: 62)

        
        stackView2.addArrangedSubview(speechBtn)
        speechBtn.setTitle("Conversation", for: .normal)
        speechBtn.setImage(UIImage(systemName: "person.2.fill"), for: .normal )
        speechBtn.alignImageAndTitleVertically()
        
        stackView2.addArrangedSubview(speechAndTextBtn)
        speechAndTextBtn.setTitle("Transcribe", for: .normal)
        speechAndTextBtn.setImage(UIImage(systemName: "person.wave.2.fill"), for: .normal )
        speechAndTextBtn.configuration?.preferredSymbolConfigurationForImage = .init(weight: .bold)
        speechAndTextBtn.alignImageAndTitleVertically()
        
        stackView2.axis = .horizontal
        stackView2.distribution = .fillEqually
        stackView2.alignment = .fill
        self.myView.addSubview(stackView2)
        stackView2.snp.makeConstraints { make in
            make.top.equalTo(stripeViewBottom.snp.bottom).inset(-25)
            make.left.equalTo(stripeViewBottom.snp.left).inset(0)
            make.right.equalTo(stripeViewBottom.snp.right).inset(0)
            
        }
        
        
        // Stripe View below camera conversation buttons
        self.myView.addSubview(stripeViewBottom2)
        stripeViewBottom2.backgroundColor = .systemGray5
        stripeViewBottom2.snp.makeConstraints { make in
            make.right.equalTo(myView.snp.right).inset(0)
            make.left.equalTo(myView.snp.left).inset(0)
            make.height.equalTo(2).constraint
            make.top.equalTo(stackView2.snp.bottom).inset(-5)
        }
        
        //bottom language buttoon
        self.myView.addSubview(languageBottomBtn)
        languageBottomBtn.setTitle("english", for: .normal)
        languageBottomBtn.isHidden = true
        //clearBtn.addTarget(self, action: #selector(clearBtnPressed), for: .touchUpInside)
        languageBottomBtn.setTitleColor(.systemGray, for: .normal)
        languageBottomBtn.snp.makeConstraints { make in
            make.left.equalTo(myView.snp.left).inset(30)
           // make.width.equalTo(100).constraint
           // make.height.equalTo(20).constraint
            make.top.equalTo(stripeViewBottom2.snp.bottom).inset(-10)
            //make.right.equalTo(clearBtn.snp.left).inset(30)
        }
        
        //save buttoon
        self.myView.addSubview(saveBtn)
        saveBtn.setImage(UIImage(systemName: "star")?.applyingSymbolConfiguration(.init(weight: .semibold))?.applyingSymbolConfiguration(.init(pointSize: 15)), for: .normal)
        saveBtn//.addTarget(self, action: #selector(clearBtnPressed), for: .touchUpInside)
        saveBtn.isHidden = true
        saveBtn.tintColor = #colorLiteral(red: 0.2597772479, green: 0.5198659897, blue: 0.9595910907, alpha: 1)
        saveBtn.snp.makeConstraints { make in
            make.right.equalTo(myView.snp.right).inset(15)
            make.width.equalTo(20).constraint
            make.height.equalTo(20).constraint
            make.top.equalTo(stripeViewBottom2.snp.bottom).inset(-10)
        }
        
        // TextView bootom
        self.myView.addSubview(textViewBottom)
       // textViewBottom.text = "Write a text"
        textViewBottom.isEditable = false
        textViewBottom.clearsContextBeforeDrawing = true
        textViewBottom.font = UIFont.systemFont(ofSize: 16)
        //textViewBottom.returnKeyType = .go
        //textViewBottom.textColor = .systemGray4
        textViewBottom.snp.makeConstraints { make in
            make.right.equalTo(myView.snp.right).inset(30)
            make.left.equalTo(myView.snp.left).inset(20)
            make.height.equalTo(78).constraint
            make.top.equalTo(languageBottomBtn.snp.bottom).inset(-5)
        }
        
        // Stripe View on the table view
        self.myView.addSubview(stripeViewBottom3)
        stripeViewBottom3.backgroundColor = .systemGray5
        stripeViewBottom3.snp.makeConstraints { make in
            make.right.equalTo(myView.snp.right).inset(0)
            make.left.equalTo(myView.snp.left).inset(0)
            make.height.equalTo(2).constraint
            make.top.equalTo(textViewBottom.snp.bottom).inset(-5)
        }
        
        
        //tableView
        self.myView.addSubview(tableView)
        tableView.backgroundColor = .green
        tableView.isScrollEnabled = true
        tableView.separatorStyle = .singleLine
        tableView.snp.makeConstraints { make in
            make.top.equalTo(stripeViewBottom3.snp.bottom).inset(-3)
            make.right.equalTo(myView.snp.right).inset(8)
            make.left.equalTo(myView.snp.left).inset(8)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
    }
    
    func profileBtnSetup(){
        let profileBtn = UIBarButtonItem(image: UIImage(named: "personM") , style: .plain, target: self, action: #selector(profileBtnPressed))
        
        navigationItem.rightBarButtonItem = profileBtn
        
    }
    
    

 

}


extension HomePage: UITextViewDelegate {
    func textViewDelegateSetup(){
        textViewTop.delegate = self
    }
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if flag == 0 {
        textViewTop.text = ""
            flag == 1
        }
        return true
    }
    func textViewDidChange(_ textView: UITextView) {
        // write a translation code here
        if textViewTop.text.isEmpty {
            clearBtn.isHidden = true
            languageTopBtn.isHidden = true
            saveBtn.isHidden = true
            languageBottomBtn.isHidden = true
            //textViewTop.text = "Write a text"
            //textViewTop.textColor = .systemGray4
            flag = 0
        }
        textViewTop.textColor = .label
        clearBtn.isHidden = false
        languageTopBtn.isHidden = false
        saveBtn.isHidden = false
        languageBottomBtn.isHidden = false
       
        
        textViewBottom.text = textViewTop.text
        textViewBottom.contentOffset.y = textViewTop.contentOffset.y
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            clearBtn.isHidden = true
            languageTopBtn.isHidden = true
            languageBottomBtn.isHidden = true
            saveBtn.isHidden = true
            textViewTop.text = "Write a text"
            textViewTop.textColor = .systemGray4
            flag = 0
            
        } else {
            textViewTop.textColor = .label
            clearBtn.isHidden = false
            languageTopBtn.isHidden = false
            languageBottomBtn.isHidden = false
            saveBtn.isHidden = false
            flag = 1
        }
        
        
    }
   
    
   
    
}

extension UIButton {

    func alignImageAndTitleVertically(padding: CGFloat = 8.0, left: CGFloat = 55.0, imageViewColor: UIColor = #colorLiteral(red: 0.2597772479, green: 0.5198659897, blue: 0.9595910907, alpha: 1), titleLabelColor: UIColor = .systemGray) {
        let imageSize = self.imageView!.frame.size
        let titleSize = self.titleLabel!.frame.size
        self.imageView?.tintColor = imageViewColor
        self.titleLabel!.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        self.setTitleColor(titleLabelColor, for: .normal)
        let totalHeight = imageSize.height + titleSize.height + padding

        self.imageEdgeInsets = UIEdgeInsets(
            top: -(totalHeight - imageSize.height),
            left: left ,
            bottom: 0,
            right: -titleSize.width
        )

        self.titleEdgeInsets = UIEdgeInsets(
            top: 0,
            left: -imageSize.width,
            bottom: -(totalHeight - titleSize.height),
            right: 0
        )
    }

}


