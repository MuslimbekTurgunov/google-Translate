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
    var isUzbekSelected: Bool = true
    var flag = 0
    let headerLabel = UILabel()
    let profileBtn = UIButton()
    var myTranslatedText = ""
    var savedTexts: [String] = []
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
    var textViewBottom = UITextView()
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
        setupTableView()
        setupViews()
        profileBtnSetup()
    }

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
        savedTexts.append("\(textViewTop.text)~\(textViewBottom.text)")
        tableView.reloadData()
        }
    
    
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
        switchBtn.addTarget(self, action: #selector(switchBtnPressed), for: .touchUpInside)
        
        
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
        saveBtn.addTarget(self, action: #selector(saveBtnPressed), for: .touchUpInside)
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
        tableView.backgroundColor = .systemGray6
        tableView.isScrollEnabled = true
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
       
//        if isUzbekSelected {
//            UrlSessionSetup(from: .uz, to: .en, text: textViewTop.text)
//        } else {
//            UrlSessionSetup(from: .en, to: .uz, text: textViewTop.text)
//        }
        textViewBottom.text = textViewTop.text + "1!!"
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


//extension HomePage {
//    enum Language {
//        case uz
//        case en
//    }
//    func UrlSessionSetup(from: Language, to: Language, text: String){
//        let headers = [
//            "content-type": "application/x-www-form-urlencoded",
//            "Accept-Encoding": "application/gzip",
//            "X-RapidAPI-Host": "google-translate1.p.rapidapi.com",
//            "X-RapidAPI-Key": "593d66cda4mshc8044ca021e38bbp1a15f9jsn2b084577a41f"
//        ]
//
//    let postData = NSMutableData(data: "q=\(text)".data(using: String.Encoding.utf8)!)
//    postData.append("&target=\(to)".data(using: String.Encoding.utf8)!)
//    postData.append("&source=\(from)".data(using: String.Encoding.utf8)!)
//
//    let request = NSMutableURLRequest(url: NSURL(string: "https://google-translate1.p.rapidapi.com/language/translate/v2")! as URL,
//                                            cachePolicy: .useProtocolCachePolicy,
//                                        timeoutInterval: 10.0)
//    request.httpMethod = "POST"
//    request.allHTTPHeaderFields = headers
//    request.httpBody = postData as Data
//
//    let session = URLSession.shared
//    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//        if (error != nil) {
//            print(error)
//        } else {
//            let httpResponse = response as? HTTPURLResponse
//            if let data = data {
//                do {
//                    let decoder = JSONDecoder()
//                    let decodedData = try decoder.decode(Translate.self, from: data)
//                    self.myTranslatedText = decodedData.data.translations.first!.translatedText
//                    DispatchQueue.main.async {
//                        self.textViewBottom.text = decodedData.data.translations.first!.translatedText
//                    }
//
//
//
//                } catch {
//                    print(error)
//                }
//            }
//
//        }
//
//    })
//
//    dataTask.resume()
//
//    }
//
//}

extension HomePage: UITableViewDelegate, UITableViewDataSource {
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TVC.self, forCellReuseIdentifier: "cell")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedTexts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TVC
        let savedText = savedTexts[indexPath.row].components(separatedBy: "~")
        let upLbl = savedText[0]
        let downLbl = savedText[1]
        print(upLbl, downLbl)
        cell.updateCell(upLbl: upLbl, downLbl: downLbl)
        return cell
    }
    
    
//    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//
//    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "delete") { _,_,_   in
            self.savedTexts.remove(at: indexPath.row)
            tableView.reloadData()
        }
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
  
}
