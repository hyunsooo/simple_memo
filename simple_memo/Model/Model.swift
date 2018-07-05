//
//  Model.swift
//  simple_memo
//
//  Created by hyunsu han on 2018. 7. 5..
//  Copyright © 2018년 hyunsoo. All rights reserved.
//

import UIKit

struct Model: Decodable { }

extension Model {
    struct Memo {
        let idx: Int
        let title: String
        let contents: String
        let image: UIImage?
        let regdate: Date
    }
}
