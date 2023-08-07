//
//  String+Extension.swift
//  moviesProgramatically
//
//  Created by Mac on 26/02/23.
//

import UIKit

public func getDecorativeTitleText(text: String, color: UIColor = .black, font: UIFont = .systemFont(ofSize: 20, weight: .medium)) -> NSMutableAttributedString {
    let multipleAttributes: [NSAttributedString.Key : Any] = [
        NSAttributedString.Key.foregroundColor: color,
        NSAttributedString.Key.font: font
    ]
    let attributedString = NSMutableAttributedString(string: text, attributes: multipleAttributes)
    
    return attributedString
}

extension String {
    func isEmail() -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
