//
//  Theme.swift
//  Serena
//
//  Created by Luis Perez on 8/2/18.
//  Copyright © 2018 Luis Perez. All rights reserved.
//

import UIKit

let SelectedThemeKey = "SelectedTheme"

enum Theme: Int {
    case Default = 1
    case Dark = 2
    case Graphical = 3
    
    var mainColor: UIColor {
        switch self {
        case .Default:
            return UIColor(red: 237.0/255.0, green: 92/255.0, blue: 92/255.0, alpha: 1.0)
        case .Dark:
            return UIColor(red: 242.0/255.0, green: 101.0/255.0, blue: 34.0/255.0, alpha: 1.0)
        case .Graphical:
            return UIColor(red: 10.0/255.0, green: 10.0/255.0, blue: 10.0/255.0, alpha: 1.0)
        }
    }
}

class ThemeManager {
    static func currentTheme() -> Theme {
        if let storedTheme = UserDefaults.standard.value(forKey: SelectedThemeKey) as? Int {
            return Theme(rawValue: storedTheme)!
        } else {
            return .Default
        }
    }
    
    static func applyTheme(theme: Theme) {
        
        UserDefaults.standard.setValue(theme.rawValue, forKey: SelectedThemeKey)
        UserDefaults.standard.synchronize()
        
        UIApplication.shared.delegate?.window??.tintColor = theme.mainColor
    }
}
