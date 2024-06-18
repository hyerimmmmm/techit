//
//  ViewController.swift
//  SegmentedControll2
//
//  Created by 김혜림 on 5/21/24.
//

import UIKit

extension UIColor {
    //배경색에 어울리는 틴트 컬러를 계산하는 함수 추가
    func appropriateTintColor() -> UIColor {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat  = 0
        var alpha: CGFloat = 0
        
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        //밝기 계산
        let luminace = 0.299 * red + 0.587 * green + 0.114 * blue
        
        //밝기가 0.5 이상이면 어두운 색 텍스트, 아니면 밝은 색 텍스트
        return luminace > 0.5 ? UIColor.black: UIColor.white
    }
}

class ViewController: UIViewController {
    
    let segmentedControll = UISegmentedControl(items: ["Red", "Green", "Blue"])

    override func viewDidLoad() {
        super.viewDidLoad()

        segmentedControll.selectedSegmentIndex = 0
        segmentedControll.addAction(UIAction { [weak self] _ in
            switch self?.segmentedControll.selectedSegmentIndex {
            case 0:
                self?.view.backgroundColor = .red
            case 1:
                self?.view.backgroundColor = .green
            case 2:
                self?.view.backgroundColor = .blue
            default:
                break
            }
            
            let tintColor: UIColor = (self?.view.backgroundColor?.appropriateTintColor())!
            let normalTextAttribute: [NSAttributedString.Key: Any] = [.foregroundColor: tintColor]
            self?.segmentedControll.setTitleTextAttributes(normalTextAttribute, for: .normal)
        }, for: .valueChanged)
        
        segmentedControll.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(segmentedControll)
        
        NSLayoutConstraint.activate([
            segmentedControll.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }


}

