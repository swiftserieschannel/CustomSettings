//
//  SettingBundleHelper.swift
//  CustomSettingsiOSApp
//
//  Created by Chandra Bhushan on 08/01/2020.
//  Copyright © 2020 Chandra Bhushan. All rights reserved.
//

import Foundation
import UIKit
class SettingBundleHelper {
    
    enum UserDefaultKeys: String {
        case RESET = "RESET_THEME"
        case BACKGROUND_COLOR = "BACKGROUND_COLOR"
        case TEXT_COLOR = "TEXT_COLOR"
        case APP_VERSION = "APP_VERSION"
    }
    
    class func checkForReset(){
        if UserDefaults.standard.bool(forKey: UserDefaultKeys.RESET.rawValue) ?? false {
            UserDefaults.standard.set(nil, forKey: UserDefaultKeys.BACKGROUND_COLOR.rawValue)
            UserDefaults.standard.set(nil, forKey: UserDefaultKeys.TEXT_COLOR.rawValue)
            UserDefaults.standard.set(false, forKey: UserDefaultKeys.RESET.rawValue)
        }
    }
    
    class func setVersionAndBuild(){
        let version:String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        let build: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        let buildVersion = "v"+version+"."+build
        UserDefaults.standard.set(buildVersion, forKey: UserDefaultKeys.APP_VERSION.rawValue)
    }
    
    class func getViewColor()->UIColor{
        let color:UIColor = UIColor(hexString: UserDefaults.standard.string(forKey: UserDefaultKeys.BACKGROUND_COLOR.rawValue) ?? "#5bc0de")
        return color;
    }
    
    class func getTextColor()->UIColor{
        let color:UIColor = UIColor(hexString: UserDefaults.standard.string(forKey: UserDefaultKeys.TEXT_COLOR.rawValue) ?? "#292b2c")
        return color;
    }
}
