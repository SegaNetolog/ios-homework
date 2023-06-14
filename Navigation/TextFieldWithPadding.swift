//
//  TextFieldWithPadding.swift
//  Navigation
//
//  Created by Sergey Bragin on 09.06.2023.
//

import UIKit

class TextFieldWithPadding: UITextField {
    var textPadding = UIEdgeInsets(
        top: 0,
        left: 20,
        bottom: 0,
        right: 20
    )
    override func textRect(forBounds bounds: CGRect) -> CGRect {
         let rect = super.textRect(forBounds: bounds)
         return rect.inset(by: textPadding)
     }

     override func editingRect(forBounds bounds: CGRect) -> CGRect {
         let rect = super.editingRect(forBounds: bounds)
         return rect.inset(by: textPadding)
     }
 }
