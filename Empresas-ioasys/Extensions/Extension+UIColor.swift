//
//  Extension+UIColor.swift
//  Empresas-ioasys
//
//  Created by João Tribuzy on 17/04/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
}

extension UIColor{
    static let ioasysLoginButtonColor = UIColor.init(red: 224, green: 30, blue: 105)
    static let ioasysEnterpriseScreenBackgroundColor = UIColor.init(red: 177, green: 27, blue: 140)
    static let ioasysBlueCell = UIColor.init(red: 121, green: 187, blue: 202)
    static let ioasysRedCell = UIColor.init(red: 235, green: 151, blue: 151)
    static let ioasysGreenCell = UIColor.init(red: 144, green: 187, blue: 129)
    static let ioasysDetailBackButton = UIColor.init(red: 245, green: 245, blue: 245)
    static let ioasysSearchBarColor = UIColor.init(red: 245, green: 245, blue: 245)
    static let ioasysSearchTintColor = UIColor.init(red: 224, green: 30, blue: 105)
    static let ioasysSearchBarTextColor = UIColor.init(red: 102, green: 102, blue: 102)
}
