//
//  ViewController.swift
//  Image
//
//  Created by 김혜림 on 5/20/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let circleView = UIView()
        circleView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        circleView.backgroundColor = .yellow
        circleView.layer.cornerRadius = 50
        circleView.layer.borderWidth = 5
        circleView.layer.borderColor = UIColor.orange.cgColor
        self.view.addSubview(circleView)
        
        let squareView = UIView()
        squareView.frame = CGRect(x: 220, y: 100, width: 100, height: 100)
        squareView.backgroundColor = .systemBlue
        
        let gradiantLayer = CAGradientLayer()
        gradiantLayer.frame = squareView.bounds
        gradiantLayer.colors = [UIColor.blue.cgColor, UIColor.systemBlue.cgColor]
        gradiantLayer.startPoint = CGPoint(x: 0, y: 0)
        gradiantLayer.endPoint = CGPoint(x: 1, y: 1)
        
        //스퀘어뷰 위에 서브레이어로 그라디언트레이어 추가
        squareView.layer.insertSublayer(gradiantLayer, at: 0)
        
        view.addSubview(squareView)
    }


}

