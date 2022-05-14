//
//  HomePage.swift
//  google drFT
//
//  Created by Azizbek Salimov on 12.05.2022.
//

import UIKit
import SnapKit
import RealmSwift
import Lottie

class HomePage: UIViewController {
    
    // Labels
    let headerLabel = UILabel()
    
    // Buttons
    let profileBtn = UIButton()
    let leftLangBtn: UIButton = {
        let leftLangBtn = UIButton()
        leftLangBtn.setTitle("uzbek", for: .normal)
        leftLangBtn.setTitleColor(#colorLiteral(red: 0.2597772479, green: 0.5198659897, blue: 0.9595910907, alpha: 1) , for: .normal)
        leftLangBtn.isUserInteractionEnabled = false
        return leftLangBtn
    }()
    let clearBtn: UIButton = {
    let clearBtn = UIButton()
        clearBtn.setImage(UIImage(systemName: "xmark")?.applyingSymbolConfiguration(.init(weight: .semibold))?.applyingSymbolConfiguration(.init(pointSize: 15)), for: .normal)
        clearBtn.addTarget(self, action: #selector(clearBtnPressed), for: .touchUpInside)
        clearBtn.isHidden = true
        clearBtn.tintColor = .systemGray
        return clearBtn
    }()
    let rightLangBtn: UIButton = {
        let rightLangBtn = UIButton()
        rightLangBtn.setTitle("english", for: .normal)
        rightLangBtn.setTitleColor(#colorLiteral(red: 0.2597772479, green: 0.5198659897, blue: 0.9595910907, alpha: 1) , for: .normal)
        rightLangBtn.isUserInteractionEnabled = false
    return rightLangBtn
    }()
    let switchBtn:UIButton = {
        let switchBtn = UIButton()
        
         switchBtn.setImage(UIImage(systemName: "arrow.left.arrow.right")?.applyingSymbolConfiguration(.init(weight: UIImage.SymbolWeight.light)), for: .normal)
         switchBtn.tintColor = .systemGray
         switchBtn.addTarget(self, action: #selector(switchBtnPressed), for: .touchUpInside)
    return switchBtn
    }()
    let saveBtn: UIButton = {
        let saveBtn = UIButton()
        saveBtn.setImage(UIImage(systemName: "star")?.applyingSymbolConfiguration(.init(weight: .semibold))?.applyingSymbolConfiguration(.init(pointSize: 15)), for: .normal)
        saveBtn.addTarget(self, action: #selector(saveBtnPressed), for: .touchUpInside)
        saveBtn.isHidden = true
        saveBtn.tintColor = .systemGray
        return saveBtn
    }()
    let languageTopBtn: UIButton = {
        let languageTopBtn = UIButton()
        languageTopBtn.setTitle("uzbek", for: .normal)
        languageTopBtn.isHidden = true
        //clearBtn.addTarget(self, action: #selector(clearBtnPressed), for: .touchUpInside)
        languageTopBtn.setTitleColor(.systemGray, for: .normal)
    return languageTopBtn
    }()
    let languageBottomBtn: UIButton = {
        let languageBottomBtn = UIButton()
        languageBottomBtn.setTitle("english", for: .normal)
        languageBottomBtn.isHidden = true
        //clearBtn.addTarget(self, action: #selector(clearBtnPressed), for: .touchUpInside)
        languageBottomBtn.setTitleColor(.systemGray, for: .normal)
        return languageBottomBtn
    }()
    let cameraBtn: UIButton = {
        let cameraBtn = UIButton()
        cameraBtn.setTitle("Camera", for: .normal)
        cameraBtn.setImage(UIImage(named: "photo_camera_FILL0_wght400_GRAD0_opsz48")!.applyingSymbolConfiguration(.init(weight: .semibold))?.applyingSymbolConfiguration(.init(pointSize: 5)), for: .normal )
        cameraBtn.configuration?.preferredSymbolConfigurationForImage = .init(weight: .bold)
        cameraBtn.alignImageAndTitleVertically(left: 62)

        return cameraBtn
    }()
    let speechBtn: UIButton = {
        let speechBtn = UIButton()
        speechBtn.setTitle("Conversation", for: .normal)
        speechBtn.setImage(UIImage(systemName: "person.2.fill"), for: .normal )
        speechBtn.alignImageAndTitleVertically()
        return speechBtn
    }()
    let speechAndTextBtn: UIButton = {
        let speechAndTextBtn = UIButton()
        speechAndTextBtn.setTitle("Transcribe", for: .normal)
        speechAndTextBtn.setImage(UIImage(systemName: "person.wave.2.fill"), for: .normal )
        speechAndTextBtn.configuration?.preferredSymbolConfigurationForImage = .init(weight: .bold)
        speechAndTextBtn.alignImageAndTitleVertically()
    return speechAndTextBtn
    }()
    
    // Views
    let myView: UIView = {
        let myView = UIView()
        myView.backgroundColor = .systemBackground
        return myView
    }()
    let stripeViewTop: UIView = {
    let view = UIView()
        view.backgroundColor = .systemGray5
    return view
    }()
    let stripeViewBottom: UIView = {
        let stripeViewBottom = UIView()
        stripeViewBottom.backgroundColor = .systemGray5
    return stripeViewBottom
    }()
    let stripeViewBottom2: UIView = {
        let stripeViewBottom2 = UIView()
        stripeViewBottom2.backgroundColor = .systemGray5
    return stripeViewBottom2
    }()
    let stripeViewBottom3: UIView = {
        let stripeViewBottom3 = UIView()
        stripeViewBottom3.backgroundColor = .systemGray5
        return stripeViewBottom3
    }()
    let clearView = UIView()
    
    // TextView
    let textViewTop: UITextView = {
        let textViewTop = UITextView()
        textViewTop.text = "Write a text"
        textViewTop.clearsContextBeforeDrawing = true
        textViewTop.font = UIFont.systemFont(ofSize: 16)
        textViewTop.returnKeyType = .go
        textViewTop.textColor = .systemGray4
        return textViewTop
    }()
    let textViewBottom: UITextView = {
        let textViewBottom = UITextView()
        textViewBottom.isEditable = false
        textViewBottom.clearsContextBeforeDrawing = true
        textViewBottom.font = UIFont.systemFont(ofSize: 16)
    return textViewBottom
    }()
    
    var istextViewTopFilled: Bool = false
    var isUzbekSelected: Bool = true
    var flag = 0
    var myTranslatedText = ""
    var savedTexts: [String] = []
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .secondarySystemBackground
        tableView.isScrollEnabled = true
        return tableView
    }()
    
    let lottieView = AnimationView()
    var realm: Realm!
    var savedTranlations: [SavedTranslations] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        navigationItem.title = "Google Translate"
        realm = try! Realm()
        fetchFromDB()
        textViewDelegateSetup()
        setupTableView()
        setupConstraints()
        profileBtnSetup()
    }

    //MARK: Buuton actions
    @objc func profileBtnPressed(){
        
    }
    
    @objc func clearBtnPressed(){
        clearBtn.isHidden = true
        languageTopBtn.isHidden = true
        textViewTop.text = ""
        textViewBottom.text = ""
        if textViewTop.endEditing(true) && textViewTop.text == "" {
            textViewTop.text = "Write a text"
            textViewTop.textColor = .systemGray4
            flag = 0
        } else {
            textViewTop.text = ""
            textViewTop.textColor = .label
        }
    }
    
    @objc func switchBtnPressed(){
        isUzbekSelected = !isUzbekSelected
        setupSwitchChanges()
        
    }
    
    @objc func saveBtnPressed(){
        let data = SavedTranslations()
        setupDoneLottieUI()
        data.text = "\(textViewTop.text)~\(textViewBottom.text)"
        savedTranlations.append(data)
        writeToDB(dataText: data)
        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
        print(savedTranlations)
        }
    
    //MARK: Setup UI
    func setupSwitchChanges(){
        if isUzbekSelected {
            leftLangBtn.setTitle("uzbek", for: .normal)
            rightLangBtn.setTitle("english", for: .normal)
            languageTopBtn.setTitle("uzbek", for: .normal)
            languageBottomBtn.setTitle("english", for: .normal)
            
            
        } else {
            leftLangBtn.setTitle("english", for: .normal)
            rightLangBtn.setTitle("uzbek", for: .normal)
            languageTopBtn.setTitle("english", for: .normal)
            languageBottomBtn.setTitle("uzbek", for: .normal)
            
        }
    }
    
    func setupDoneLottieUI(){
        clearView.isHidden = false
        self.view.addSubview(clearView)
        clearView.backgroundColor = .systemBackground.withAlphaComponent(0.7)
        clearView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.clearView.addSubview(lottieView)
        lottieView.snp.makeConstraints { make in
            make.edges.equalTo(clearView).inset(50)
        }
        lottieView.animation = .named("103989-done")
        lottieView.contentMode = .scaleAspectFit
        lottieView.loopMode = .playOnce
        lottieView.animationSpeed = 3
        lottieView.play()
        lottieView.play { _ in
            self.clearView.isHidden = true
        }
    }
    
    func setupDeleteLottieUI(){
        clearView.isHidden = false
        self.view.addSubview(clearView)
        clearView.backgroundColor = .systemBackground.withAlphaComponent(0.7)
        clearView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        self.clearView.addSubview(lottieView)
        lottieView.snp.makeConstraints { make in
            make.edges.equalTo(clearView).inset(50)
        }
        lottieView.animation = .named("87669-delete-animation")
        lottieView.contentMode = .scaleAspectFit
        lottieView.loopMode = .playOnce
        lottieView.animationSpeed = 2
        lottieView.play()
        lottieView.play { _ in
            self.clearView.isHidden = true
        }
    }
    
    func setupConstraints(){
        // Keyboard extension
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
        self.view.addSubview(myView)
        myView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
      
        // Languageleft Switch button
        let stackView = UIStackView()
        stackView.addArrangedSubview(leftLangBtn)
        stackView.addArrangedSubview(switchBtn)
        stackView.addArrangedSubview(rightLangBtn)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        self.myView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(5)
            make.left.right.equalTo(myView).inset(32)
        }
        
        // Stripe View below languages
        self.myView.addSubview(stripeViewTop)
        stripeViewTop.snp.makeConstraints { make in
            make.right.equalTo(myView.snp.right).inset(0)
            make.left.equalTo(myView.snp.left).inset(0)
            make.height.equalTo(2).constraint
            make.top.equalTo(stackView.snp.bottom).inset(-5)
        }
        
        
        //Clear buttoon
        self.myView.addSubview(clearBtn)
        clearBtn.snp.makeConstraints { make in
            make.right.equalTo(myView.snp.right).inset(15)
            make.width.equalTo(20).constraint
            make.height.equalTo(20).constraint
            make.top.equalTo(stripeViewTop.snp.bottom).inset(-10)
        }
        
        //top language buttoon
        self.myView.addSubview(languageTopBtn)
        languageTopBtn.snp.makeConstraints { make in
            make.left.equalTo(myView.snp.left).inset(30)
            make.top.equalTo(stripeViewTop.snp.bottom).inset(-10)
        }
        
        // TextView
        self.myView.addSubview(textViewTop)
        textViewTop.snp.makeConstraints { make in
            make.right.equalTo(myView.snp.right).inset(30)
            make.left.equalTo(myView.snp.left).inset(20)
            make.height.equalTo(78).constraint
            make.top.equalTo(languageTopBtn.snp.bottom).inset(3)
        }
        
        // Stripe View below languages
        self.myView.addSubview(stripeViewBottom)
        stripeViewBottom.snp.makeConstraints { make in
            make.right.equalTo(myView.snp.right).inset(0)
            make.left.equalTo(myView.snp.left).inset(0)
            make.height.equalTo(2).constraint
            make.top.equalTo(textViewTop.snp.bottom).inset(-5)
        }
        
        // Camera Speesh buttons
        let stackView2 = UIStackView()
        stackView2.addArrangedSubview(cameraBtn)
        stackView2.addArrangedSubview(speechBtn)
        stackView2.addArrangedSubview(speechAndTextBtn)
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
        stripeViewBottom2.snp.makeConstraints { make in
            make.right.equalTo(myView.snp.right).inset(0)
            make.left.equalTo(myView.snp.left).inset(0)
            make.height.equalTo(2).constraint
            make.top.equalTo(stackView2.snp.bottom).inset(-5)
        }
        
        //bottom language buttoon
        self.myView.addSubview(languageBottomBtn)
        languageBottomBtn.snp.makeConstraints { make in
            make.left.equalTo(myView.snp.left).inset(30)
            make.top.equalTo(stripeViewBottom2.snp.bottom).inset(-10)
        }
        
        //Save buttoon
        self.myView.addSubview(saveBtn)
        saveBtn.snp.makeConstraints { make in
            make.right.equalTo(myView.snp.right).inset(15)
            make.width.equalTo(20).constraint
            make.height.equalTo(20).constraint
            make.top.equalTo(stripeViewBottom2.snp.bottom).inset(-10)
        }
        
        // TextView bootom
        self.myView.addSubview(textViewBottom)
        textViewBottom.snp.makeConstraints { make in
            make.right.equalTo(myView.snp.right).inset(30)
            make.left.equalTo(myView.snp.left).inset(20)
            make.height.equalTo(78).constraint
            make.top.equalTo(languageBottomBtn.snp.bottom).inset(-5)
        }
        
        // Stripe View on the table view
        self.myView.addSubview(stripeViewBottom3)
        stripeViewBottom3.snp.makeConstraints { make in
            make.right.equalTo(myView.snp.right).inset(0)
            make.left.equalTo(myView.snp.left).inset(0)
            make.height.equalTo(2).constraint
            make.top.equalTo(textViewBottom.snp.bottom).inset(-5)
        }
        
        //tableView
        self.myView.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(stripeViewBottom3.snp.bottom).inset(-3)
            make.right.equalTo(myView.snp.right).inset(0)
            make.left.equalTo(myView.snp.left).inset(0)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
    }
    
    func profileBtnSetup(){
        let profileBtn = UIBarButtonItem(image: UIImage(named: "personM") , style: .plain, target: self, action: #selector(profileBtnPressed))
        
        navigationItem.rightBarButtonItem = profileBtn
        
    }
    
}


//MARK: TextView delegate
extension HomePage: UITextViewDelegate {
    
    //TODO: - Future versions
    func conversationBtnPressed() {
        
    }
    
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
//        if textViewTop.text.isEmpty {
//            clearBtn.isHidden = true
//            languageTopBtn.isHidden = true
//            saveBtn.isHidden = true
//            languageBottomBtn.isHidden = true
//            //textViewTop.text = "Write a text"
//            //textViewTop.textColor = .systemGray4
//            flag = 0
//        }
        textViewTop.textColor = .label
        clearBtn.isHidden = false
        languageTopBtn.isHidden = false
        saveBtn.isHidden = false
        languageBottomBtn.isHidden = false
       
        if isUzbekSelected {
            UrlSessionSetup(from: .uz, to: .en, text: textViewTop.text!)
        } else {
            UrlSessionSetup(from: .en, to: .uz, text: textViewTop.text!)
        }
        
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
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
          if(text == "\n") {
              textView.resignFirstResponder()
              return false
          }
          return true
      }
   
    
   
    
}

//MARK: - Table view methods
extension HomePage: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TVC.self, forCellReuseIdentifier: "cell")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedTranlations.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TVC
        let data: String = savedTranlations[indexPath.row].text!
        let savedText = data.split(separator: "~")
        let upLbl: String = String(savedText[0].replacingOccurrences(of: "Optional", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").replacingOccurrences(of: "\"", with: ""))
        let downLbl : String = String(savedText[1].replacingOccurrences(of: "Optional", with: "").replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "").replacingOccurrences(of: "\"", with: ""))
        cell.updateCell(upLbl: upLbl, downLbl: downLbl)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "delete") { _,_,_   in
            self.removeFromDB(index: indexPath.row)
            tableView.reloadData()
        }
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
  
}


//MARK: - Realm methods
extension HomePage {
    func writeToDB(dataText: SavedTranslations) {
        try! realm.write({
            self.realm.add(dataText)
        })
    }
    
    func fetchFromDB() {
        savedTranlations = realm.objects(SavedTranslations.self).compactMap {$0}
        self.tableView.reloadSections(IndexSet(integer: .zero), with: .automatic)
        print(savedTranlations[0])
    }
    
    func removeFromDB(index: Int) {
        try! realm.write({
            setupDeleteLottieUI()
            self.realm.delete(savedTranlations[index])
            self.savedTranlations.remove(at: index)
            self.tableView.reloadSections(IndexSet(integer: 0), with: .top)
        })
    }
}
