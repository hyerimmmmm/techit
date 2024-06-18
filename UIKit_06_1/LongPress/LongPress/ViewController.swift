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
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleGesture))
        
        //프레스 시간 지정
        gesture.minimumPressDuration = 2.0
        rectangle.addGestureRecognizer(gesture)
    }
    
    @objc func handleGesture(_ sender: UITapGestureRecognizer) {
        if let view = sender.view, sender.state == .began {
            view.backgroundColor = (view.backgroundColor == .yellow) ? .red : .yellow
        }
    }


}

