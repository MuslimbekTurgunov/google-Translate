//
//  Extencions.swift
//  google drFT
//
//  Created by Azizbek Salimov on 14.05.2022.
//

import Foundation
import UIKit

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
