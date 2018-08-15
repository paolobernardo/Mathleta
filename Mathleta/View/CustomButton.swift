//
//  CustomButton.swift
//  Mathleta
//
//  Created by Paolo Bernardo on 15/08/18.
//  Copyright © 2018 Paolo Bernardo. All rights reserved.
//

import UIKit

@IBDesignable

class CustomButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    
    

}
