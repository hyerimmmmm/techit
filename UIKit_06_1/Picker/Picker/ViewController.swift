//
//  ViewController.swift
//  Picker
//
//  Created by 김혜림 on 5/21/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    private lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()
    
    let options1 = ["Option 1", "Option 2", "Option 3", "Option 4", "Option 5"]
    let options2 = ["옵션 1", "옵션 2", "옵션 3", "옵션 4", "옵션 5"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(pickerView)
        
        NSLayoutConstraint.activate([
            pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    
    //MARk: - UIPickerViewDataSource
    //피커로 선택할 수 있는 옵션 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2 // 옵션 1개 선택 가능, 만약 2이면 옵션 2개 선택 가능
    }
    //피커 안에 들어있는 옵션 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //options.count
        switch component {
        case 0:
            return options1.count
        case 1:
            return options2.count
        default:
            return 0
        }
    }
    
    
    //MARK: - UIPickerViewDelegate
    //선택된 값 전달
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return options1[row]
        case 1:
            return options2[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("selected row: \(row)")
    }


}

