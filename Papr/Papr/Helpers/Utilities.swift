//
//  Utilities.swift
//  Papr
//
//  Created by Mitchell Sturba on 2020-03-22.
//  Copyright © 2020 Mitchell Sturba. All rights reserved.
//

import Foundation
import UIKit

class Utitilies {
    
    static func isPassValid(password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z//d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
        
    }
    
}
