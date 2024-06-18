//
//  ViewController.swift
//  AutoLayout
//
//  Created by 김혜림 on 5/20/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        //실습 1
        let label = UILabel()
        label.text = "Hello, Auto Layout"
        //오토 레이아웃을 사용하기 위해 화면이 마음대로 바뀌는 것을 막기 위한 것
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        //화면 배치 방법 1
        //제약 조건 하나하나 isActive 프로퍼티 설정하는 대신, activate 함수로 한번에 활성화 하는 방법
//        NSLayoutConstraint.activate([
//            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        ])
        
        //화면 배치 방법 2
        //label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = false
        //label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = false
        //세이프가이드 기준으로 탑앵커에 배치하기: 상단 상태바 등에 걸리지 않게 배치시킬 때 사용
        //label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        //뷰 배치에 수치 입력
        label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
         */
        
        /*
        //실습2
        //뷰 생성
        let box = UIView()
        box.backgroundColor = .systemBlue
        box.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(box)
        
        NSLayoutConstraint.activate([
            //사이즈 설정
            box.widthAnchor.constraint(equalToConstant: 100),
            box.heightAnchor.constraint(equalToConstant: 100),
            
            //위치 설정
            box.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            box.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            //최대값 정의
            box.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
            //최소값 정의
            box.heightAnchor.constraint(greaterThanOrEqualToConstant: 50)
        ])
         */
        
        /*
        //실습3: 동작 변경시 제약 조건
        let label = UILabel()
        label.backgroundColor = .systemBlue
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This is a"
        view.addSubview(label)
        
        //최소 및 최대 너비 제약 조건 설정
        let maxWidth: CGFloat = 100
        let maxHeight: CGFloat = 100
        
        //제약 조건 설정
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20),
            label.widthAnchor.constraint(lessThanOrEqualToConstant: maxWidth),
            label.heightAnchor.constraint(lessThanOrEqualToConstant: maxHeight),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
        
        //텍스트 길이를 동작으로 변경
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            label.text = "This is an even longer text that should definitely exceed the maximum width constraint of the label. The maximum width constraint should keep the label's width within the bounds we set.This is an even longer text that should definitely exceed the maximum width constraint of the label. The maximum width constraint should keep the label's width within the bounds we set."
        }
         */
        
        //실습4: 계층구조
        let containerView = UIView()
        containerView.backgroundColor = .lightGray
        containerView.translatesAutoresizingMaskIntoConstraints = false
        //뷰 추가
        view.addSubview(containerView)
        
        //뷰 위치 및 사이즈 설정
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 200),
            containerView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        //새로운 뷰 생성
        let subView1 = UIView()
        subView1.backgroundColor = .red
        subView1.translatesAutoresizingMaskIntoConstraints = false
        //컨테이너뷰 안에 서브뷰1 추가
        containerView.addSubview(subView1)
        
        let subView2 = UIView()
        subView2.backgroundColor = .yellow
        subView2.translatesAutoresizingMaskIntoConstraints = false
        //컨테이너뷰 안에 서브뷰2 추가
        containerView.addSubview(subView2)
        
        NSLayoutConstraint.activate([
            //서브뷰1 위치 및 사이즈
            subView1.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            subView1.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            subView1.widthAnchor.constraint(equalToConstant: 50),
            subView1.heightAnchor.constraint(equalToConstant: 50),
            
            //서브뷰2 위치 및 사이즈
            subView2.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            subView2.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            subView2.widthAnchor.constraint(equalToConstant: 50),
            subView2.heightAnchor.constraint(equalToConstant: 50),
        ])
    }


}

