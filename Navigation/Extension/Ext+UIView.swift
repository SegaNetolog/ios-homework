//
//  Ext+UIView.swift
//  Navigation
//
//  Created by Sergey Bragin on 16.06.2023.
//

import UIKit

extension UIView {
    static var identifier: String {
        String(describing: self)
    }
    
    func shake(count : Float = 4,for duration : TimeInterval = 0.3,withTranslation translation : Float = 5) {
        
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration/TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.values = [translation, -translation]
        layer.add(animation, forKey: "shake")
    }
    
    
}
extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) {_ in
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}
