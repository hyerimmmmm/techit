//
//  ViewController.swift
//  Gesture
//
//  Created by 김혜림 on 5/22/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rectangle = UIView()
        rectangle.backgroundColor = .yellow
        rectangle.frame = CGRect(x: 100, y: 100, width: 175, height: 125)
        //터치를 받을 수 있게 설정
        rectangle.isUserInteractionEnabled = true
        
        view.addSubview(rectangle)
        
        //제스처 객체 생성
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        
        //탭 횟수 지정
        tapGesture.numberOfTapsRequired = 2
        rectangle.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        if let view = sender.view {
            view.backgroundColor = (view.backgroundColor == .yellow) ? .red : .yellow
        }
    }


}

