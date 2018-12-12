//
//  MemoFormVC.swift
//  simple_memo
//
//  Created by hyunsu han on 2018. 7. 5..
//  Copyright © 2018년 hyunsoo. All rights reserved.
//

import UIKit

class MemoFormVC: UIViewController {

    var subject: String?
    
    @IBOutlet var contents: UITextView!
    @IBOutlet var preview: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contents.delegate = self
        
        let bgImage = UIImage(named: "memo-background.png")!
        self.view.backgroundColor = UIColor(patternImage: bgImage)
        
        self.contents.layer.borderWidth = 0
        self.contents.layer.borderColor = UIColor.clear.cgColor
        self.contents.backgroundColor = .clear
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 9
        self.contents.attributedText = NSAttributedString(string: " ", attributes: [.paragraphStyle: style])
        self.contents.text = ""
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let bar = self.navigationController?.navigationBar
        let ts = TimeInterval(0.3)
        UIView.animate(withDuration: ts) {
            bar?.alpha = (bar?.alpha == 0 ? 1 : 0)
        }
    }
}

extension MemoFormVC: UITextViewDelegate {
    @IBAction func save(_ sender: Any) {
        let alertV = UIViewController()
        let iconImage = UIImage(named: "warning-icon-60")
        alertV.view = UIImageView(image: iconImage)
        alertV.preferredContentSize = iconImage?.size ?? .zero
        
        guard contents.text.isEmpty == false else {
            let alert = UIAlertController(title: nil, message: "내용을 입력해주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            alert.setValue(alertV, forKey: "contentViewController")
            self.present(alert, animated: true)
            return
        }
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let memo = Model.Memo(idx: delegate.memoList.count, title: subject ?? "", contents: contents.text, image: preview.image, regdate: Date())
        
        delegate.memoList.append(memo)
        
        navigationController?.popViewController(animated: true)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let contents = textView.text as NSString
        let length = contents.length > 15 ? 15 : contents.length
        subject = contents.substring(with: NSRange(location: 0, length: length))
        navigationItem.title = subject
    }
}

extension MemoFormVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBAction func pick(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: false)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        preview.image = info[UIImagePickerControllerEditedImage] as? UIImage
        picker.dismiss(animated: false)
    }
}


extension UIViewController {
    func alert(_ message: String) {
        let alertController = UIAlertController(title: "Simple Memo", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default))
        present(alertController, animated: true)
    }
}
