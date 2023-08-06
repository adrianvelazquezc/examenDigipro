//
//  HomeViewUI.swift
//  examenDigipro
//
//  Created by Mac on 03/08/23.
//

import UIKit

class HomeViewUI: UIView{
    var tabBarBorders: UITabBarController?
    
    public convenience init(tabBarBorders: UITabBarController){
            self.init()
            self.tabBarBorders = tabBarBorders
            
            setUI()
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUI(){
        if let border = tabBarBorders?.tabBar {
            let separatorSize: CGFloat = 2.0
            let lineTop = CALayer()
            lineTop.backgroundColor = DigiproColors.darkColor.cgColor
            lineTop.frame = CGRect(x: 0, y: 0, width: border.frame.width, height: separatorSize)
            border.layer.addSublayer(lineTop)
            
            let separatorHeight = border.frame.size.height
            
            let separator = CALayer()
            separator.backgroundColor = DigiproColors.darkColor.cgColor
            separator.frame = CGRect(x: border.frame.width / 2 - separatorSize / 2, y: 0, width: separatorSize, height: separatorHeight)
            border.layer.addSublayer(separator)
            
            let lineBottom = CALayer()
            lineBottom.backgroundColor = DigiproColors.darkColor.cgColor
            lineBottom.frame = CGRect(x: 0, y: border.frame.height - 2, width: border.frame.width, height: separatorSize)
            border.layer.addSublayer(lineBottom)
        }
    }
}
