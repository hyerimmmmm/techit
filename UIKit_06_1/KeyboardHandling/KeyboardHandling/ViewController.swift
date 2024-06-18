//
//  ViewController.swift
//  KeyboardHandling
//
//  Created by 김혜림 on 5/23/24.
//

import UIKit

class ViewController: UIViewController {
    
    let textField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        textField.borderStyle = .roundedRect
        textField.placeholder = "여기에 입력하세요."
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        //제스처: 키보드 내리기 제스처
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        
        view.addGestureRecognizer(tapGesture)
        
        //키보드 위치 자동 변경
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object/*뭔가를 반환할거?*/: nil/*아니*/)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func tapHandler(_ sender: UIView) {
        textField.resignFirstResponder()
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        print("keyboad up")
        
        //키보드가 올라오면 뷰가 키보드 높이 만큼 올라가도록
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            if view.frame.origin.y == 0 {
                view.frame.origin.y -= keyboardHeight
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        print("keyboad down")
        
        //입력창 위치 제자리로 만들기
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }
}

