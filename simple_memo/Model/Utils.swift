//
//  Utils.swift
//  simple_memo
//
//  Created by hyunsu han on 17/12/2018.
//  Copyright © 2018 hyunsoo. All rights reserved.
//

import Foundation

extension UIViewController {
    var tutorialSB: UIStoryboard {
        return UIStoryboard(name: "Tutorial", bundle: .main)
    }
    
    func instanceTutorialVC(name: String) -> UIViewController? {
        return self.tutorialSB.instantiateViewController(withIdentifier: name)
    }
}
