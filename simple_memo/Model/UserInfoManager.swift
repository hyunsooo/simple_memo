//
//  UserInfoManager.swift
//  simple_memo
//
//  Created by hyunsu han on 16/12/2018.
//  Copyright © 2018 hyunsoo. All rights reserved.
//

import UIKit

struct UserInfoKey {
    static let loginId = "LOGINID"
    static let account = "ACCOUNT"
    static let name = "NAME"
    static let profile = "PROFILE"
    static let tutorial = "TUTORIAL"
}

class UserInfoManager {
    var loginId: Int {
        get {
            return UserDefaults.standard.integer(forKey: UserInfoKey.loginId)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserInfoKey.loginId)
            UserDefaults.standard.synchronize()
        }
    }
    
    var account: String? {
        get {
            return UserDefaults.standard.string(forKey: UserInfoKey.account)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserInfoKey.account)
            UserDefaults.standard.synchronize()
        }
    }
    
    var name: String? {
        get {
            return UserDefaults.standard.string(forKey: UserInfoKey.name)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserInfoKey.name)
            UserDefaults.standard.synchronize()
        }
    }
    
    var profile: UIImage? {
        get {
            if let _profile = UserDefaults.standard.data(forKey: UserInfoKey.profile) {
                return UIImage(data: _profile)
            } else {
                return UIImage(named: "account.jpg")
            }
        }
        set {
            if newValue != nil {
                UserDefaults.standard.set(UIImagePNGRepresentation(newValue!), forKey: UserInfoKey.profile)
                UserDefaults.standard.synchronize()
            } else {
                NSLog("[ERROR] profile data is nil")
            }
        }
    }
    
    var isLogin: Bool {
        return !( self.loginId == 0 || self.account == nil)
    }
    
    func login(account: String, passwd: String) -> Bool {
        if account == "dreamh1122@gmail.com" && passwd == "1234" {
            UserDefaults.standard.set(100, forKey: UserInfoKey.loginId)
            UserDefaults.standard.set(account, forKey: UserInfoKey.account)
            UserDefaults.standard.set("현수", forKey: UserInfoKey.name)
            UserDefaults.standard.synchronize()
            return true
        } else {
            return false
        }
    }
    
    func logout() -> Bool {
        UserDefaults.standard.removeObject(forKey: UserInfoKey.loginId)
        UserDefaults.standard.removeObject(forKey: UserInfoKey.account)
        UserDefaults.standard.removeObject(forKey: UserInfoKey.name)
        UserDefaults.standard.removeObject(forKey: UserInfoKey.profile)
        UserDefaults.standard.synchronize()
        return true
    }
}



