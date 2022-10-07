//
//  Toastable.swift
//  mvvmcDevSprint
//
//  Created by Pedro Menezes on 06/10/22.
//

import Foundation
import UIKit

protocol Toastable where Self: UIViewController {
    func showToast(message: String)
}

extension Toastable {
    func showToast(message: String) {
        let font: UIFont = .systemFont(ofSize: 14)
        let toastColor: UIColor = UIColor.white
        let toastBackground: UIColor = UIColor.purple
        let toastLabel = UILabel()
        toastLabel.textColor = toastColor
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 0.0
        toastLabel.layer.cornerRadius = 12
        toastLabel.backgroundColor = toastBackground
        //        toastLabel.layer.borderColor = UIColor.purple.cgColor
        //        toastLabel.layer.borderWidth = 2
        
        toastLabel.clipsToBounds  =  true
        
        let toastWidth: CGFloat = toastLabel.intrinsicContentSize.width + 20
        let toastHeight: CGFloat = 36
        
        toastLabel.frame = CGRect(x: self.view.frame.width / 2 - (toastWidth / 2),
                                  y: self.view.frame.height - (toastHeight * 2),
                                  width: toastWidth, height: toastHeight)
        
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 1) {
            toastLabel.alpha = 1.0
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
            UIView.animate(withDuration: 1) {
                toastLabel.alpha = 0
            } completion: { _ in
                toastLabel.removeFromSuperview()
            }
        }
    }
}

