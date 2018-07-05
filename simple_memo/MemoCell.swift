//
//  MemoCell.swift
//  simple_memo
//
//  Created by hyunsu han on 2018. 7. 5..
//  Copyright © 2018년 hyunsoo. All rights reserved.
//

import UIKit

class MemoCell: UITableViewCell {

    @IBOutlet var img: UIImageView!
    @IBOutlet var subject: UILabel!
    @IBOutlet var contents: UILabel!
    @IBOutlet var regdate: UILabel!
    
}

extension MemoCell {
    func update(data: Model.Memo) {
        if let image = data.image { img.image = image }
        subject.text = data.title
        contents.text = data.contents
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        regdate.text = formatter.string(from: data.regdate)
        
    }
}


