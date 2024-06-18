//
//  ViewController.swift
//  PinchGesture
//
//  Created by 김혜림 on 5/22/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(image: UIImage(systemName: "star.fill"))
        imageView.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        imageView.isUserInteractionEnabled = true
        
        view.addSubview(imageView)
        
        let gesture = UIPinchGestureRecognizer(target: self, action: #selector(handleGesture))
        imageView.addGestureRecognizer(gesture)

    }
    
    @objc func handleGesture(_ sender: UIPinchGestureRecognizer) {
        /*
        print(sender.scale)
        if let view = sender.view {
            view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
        }
         */
        //확대 축소 최소 최대값 설정
        guard let view = sender.view else { return }
        let currentScale = sqrt(view.transform.a * view.transform.a + view.transform.c * view.transform.c)
        if sender.scale < 1.0 {
            if currentScale > 0.8 {
                view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
            }
        } else {
            if currentScale < 1.2 {
                view.transform = view.transform.scaledBy(x: sender.scale, y: sender.scale)
            }
        }
    }


}

