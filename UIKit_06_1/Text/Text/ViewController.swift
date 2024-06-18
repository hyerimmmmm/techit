//
//  ViewController.swift
//  Text
//
//  Created by 김혜림 on 5/20/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        //텍스트 줄바꿈
        let label = UILabel()
        label.text = "This is a long text that should wrap into multiple lines if it exceeds the width of the label."
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 1 // 줄바꿈. 0일 경우에는 그냥 텍스트 길이만큼 여러줄 생성, 1이상일 경우 줄 보다 텍스트 길이가 길면 뒤는 출력 안함
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
         */
        
        //패딩 뷰 추가
        let paddingView = UIView()
        paddingView.translatesAutoresizingMaskIntoConstraints = false
        paddingView.backgroundColor = .systemCyan
        
        //텍스트 스타일링
        let label = UILabel()
        label.text = "Stylized Text"
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .yellow
        label.backgroundColor = .systemBlue
        label.textAlignment = .center
        
        //배경 스타일링
        label.layer.cornerRadius = 10
        
        //내 영역 외에는 그리지 말 것(영역 넘어가면 잘림)
        label.clipsToBounds = true // false로 하면 영역을 넘어가도 잘리지 않음
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        //view.addSubview(label)
        
        //label과 padding 합쳐서 하나의 버튼으로 만들기
        paddingView.addSubview(label)
        view.addSubview(paddingView)
        
        NSLayoutConstraint.activate([
            //패딩뷰를 기준으로 레이블뷰 위치 설정
            label.topAnchor.constraint(equalTo: paddingView.topAnchor, constant: 20),
            label.bottomAnchor.constraint(equalTo: paddingView.bottomAnchor, constant: -20),
            label.leadingAnchor.constraint(equalTo: paddingView.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: paddingView.trailingAnchor, constant: -20),
            
            //패딩뷰 위치 및 사이즈 설정
            paddingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            paddingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            paddingView.widthAnchor.constraint(equalToConstant: 200),
            paddingView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }


}

