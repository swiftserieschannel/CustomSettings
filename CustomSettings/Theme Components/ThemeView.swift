//
//  ThemeButton.swift
//  CustomSettingsiOSApp
//
//  Created by Chandra Bhushan on 04/01/2020.
//  Copyright © 2020 Chandra Bhushan. All rights reserved.
//

import Foundation
import UIKit
class ThemeView : UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NotificationCenter.default.addObserver(self, selector: #selector(self.themeChanged), name: UserDefaults.didChangeNotification, object: nil)
    }
    
    @objc
    func themeChanged(){
        self.backgroundColor = SettingBundleHelper.getViewColor()
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
