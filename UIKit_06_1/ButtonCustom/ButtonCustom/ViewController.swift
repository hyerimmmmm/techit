//
//  ViewController.swift
//  SegmentedControll
//
//  Created by 김혜림 on 5/21/24.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .custom)
        //button.setTitleColor(.white, for: .normal)
        //button.backgroundColor = .systemBlue
        // 디자인을 추가할 때는 layer 사용, 하지만 레이어는 최대하 사용하지 않는 것이 좋음
        //button.layer.cornerRadius = 10
        //button.layer.borderWidth = 2
        // layer에서 컬러를 사용할때는 cgColor로 변경해줘야 함
        //button.layer.borderColor = UIColor.white.cgColor
        // 버튼 패딩
        //button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        
        // 버튼을 직접 수정하는 것이 아니라 설정이라는 레이어를 따로 만들어서 의존 분리
        // 옷을 만들어서 버튼에 입히는 느낌
        var config = UIButton.Configuration.filled()
        config.title = "Click me"
        config.baseBackgroundColor = .systemBlue
        config.baseForegroundColor = .white
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        
        // 버튼에 옷 입히기
        button.configuration = config
        
        //button.setTitle("Click me", for: .normal)
        button.addAction(UIAction { [weak self] _ in
            self?.count += 1
            print("Button was tapped! \(self?.count ?? 0)")
        }, for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

