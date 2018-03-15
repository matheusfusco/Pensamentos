//
//  Configuration.swift
//  Pensamentos
//
//  Created by Usuário Convidado on 14/03/18.
//  Copyright © 2018 FIAP. All rights reserved.
//

import Foundation

enum UserDefaultsKeys: String {
    case timeInterval = "timeInterval"
    case colorScheme = "colorScheme"
    case autorefresh = "autorefresh"
    
    var key : String {
        return self.rawValue
    }
}

class Configuration {
    
    let defaults = UserDefaults.standard
    static var shared: Configuration = Configuration()
    
    var timeInterval: Double {
        get {
            return defaults.double(forKey: UserDefaultsKeys.timeInterval.key)
        }
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.timeInterval.key)
        }
    }
    
    var colorScheme: Int {
        get {
            return defaults.integer(forKey: UserDefaultsKeys.colorScheme.key)
        }
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.colorScheme.key)
        }
    }
    
    var autorefresh: Bool {
        get {
            return defaults.bool(forKey: UserDefaultsKeys.autorefresh.key)
        }
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.autorefresh.key)
        }
    }
    
    private init() {
        if defaults.double(forKey: UserDefaultsKeys.timeInterval.key) == 0 {
            defaults.set(8.0, forKey: UserDefaultsKeys.timeInterval.key)
        }
    }
    
}

