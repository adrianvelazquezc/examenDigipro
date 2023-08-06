//
//  digipro_TextField.swift
//  inventoryProgramatically
//
//  Created by Mac on 03/08/23.
//

import UIKit

open class Digipro_TextField: UITextField {
    
    init(placeholderText: String) {
        super.init(frame: .zero)
        
        self.textColor = .black
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        self.leftViewMode = .always
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = 2.0
        self.layer.cornerRadius = 10.0
        self.layer.borderColor = DigiproColors.darkColor.cgColor
        let placeholderAttributes = [NSAttributedString.Key.foregroundColor: DigiproColors.placeHolderText]
        self.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: placeholderAttributes)
        
    }
    public func setError(){
        self.layer.borderColor = DigiproColors.errorColor.cgColor
    }
    public func setSuccess(){
        self.layer.borderColor = DigiproColors.successColor.cgColor
    }
    public func clearField(){
        self.text = ""
        self.layer.borderColor = DigiproColors.darkColor.cgColor
    }
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

