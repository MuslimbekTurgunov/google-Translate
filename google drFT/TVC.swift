//
//  TVC.swift
//  google drFT
//
//  Created by Azizbek Salimov on 13.05.2022.
//

import UIKit
import SnapKit


class TVC: UITableViewCell {
    static let identifierCell = "cell"
    let clearView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    let containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        view.backgroundColor = .systemBackground
        return view
    }()
    let lblUpLanguage: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 16, weight: .semibold)
        return lbl
    }()
    let lblDownLanguage: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 12, weight: .medium)
        return lbl
    }()
    
    func setupUI() {
        contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        contentView.addSubview(clearView)
        clearView.addSubview(containerView)
        containerView.addSubview(lblUpLanguage)
        containerView.addSubview(lblDownLanguage)
        
        clearView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        containerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(18)
            make.top.bottom.equalToSuperview().inset(6)
        }
        lblUpLanguage.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).inset(10)
            make.left.equalTo(containerView.snp.left).inset(8)
            make.right.equalTo(containerView.snp.right).inset(8)
            make.height.equalTo(20).constraint
            
        }
        lblDownLanguage.snp.makeConstraints { make in
            make.top.equalTo(lblUpLanguage.snp.bottom).inset(-10)
            make.left.equalTo(containerView.snp.left).inset(8)
            make.right.equalTo(containerView.snp.right).inset(8)
            make.height.equalTo(13).constraint
            make.bottom.equalTo(containerView.snp.bottom).inset(10)
        }
    }
    
    func updateCell(upLbl: String, downLbl: String) {
        setupUI()
        lblUpLanguage.text = upLbl
        lblDownLanguage.text = downLbl
    }
}
