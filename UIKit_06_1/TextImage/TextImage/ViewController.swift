//
//  ViewController.swift
//  TextImage
//
//  Created by 김혜림 on 5/20/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //뷰 생성
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        //이미지 뷰 생성
        let imageView = UIImageView(image: UIImage(systemName: "creditcard"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //이미지 뷰 사이즈
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        //뷰에 이미지 추가
        stackView.addArrangedSubview(imageView)
        
        //레이블 생성
        let label = UILabel()
        label.text = "Credit Card"
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        //뷰에 레이블 추가
        stackView.addArrangedSubview(label)
        
        //뷰에 스택 추가
        view.addSubview(stackView)
        
        //스택뷰 위치 조정
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250)
        ])
    }


}

