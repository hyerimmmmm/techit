//
//  ViewController.swift
//  ImageIcon
//
//  Created by 김혜림 on 5/20/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(image: UIImage(systemName: "hare.fill"))
        imageView.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        imageView.tintColor = .systemBlue
        imageView.contentMode = .scaleAspectFit // 이미지 가로세로 모두 프레임 안에 들어오도록
        
        //효과
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.clipsToBounds = true
        
        imageView.layer.shadowColor = UIColor.blue.cgColor
        imageView.layer.shadowOpacity = 0.8
        imageView.layer.shadowOffset = CGSize(width: 10, height: 10)
        imageView.layer.shadowRadius = 6
        
        imageView.layer.borderColor = UIColor.yellow.cgColor
        imageView.layer.borderWidth = 10
        
        imageView.alpha = 0.75
        
        self.view.addSubview(imageView)
        
        let flagImageView = UIImageView(image: UIImage(systemName: "flag"))
        flagImageView.frame = CGRect(x: 50, y: 200, width: 100, height: 50)
        flagImageView.clipsToBounds = true
        flagImageView.contentMode = .scaleAspectFill // 이미지 가로가 프레임 가로에 맞도록
        self.view.addSubview(flagImageView)
    }


}

