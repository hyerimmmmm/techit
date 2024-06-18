//
//  ViewController.swift
//  Picker2
//
//  Created by 김혜림 on 5/21/24.
//

import UIKit

class ViewController: UIViewController {
    let datePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        return picker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let today = Date()
        var dateComponents = DateComponents()
        dateComponents.year = 2 // 1년 저장
        // 달력의 범위를 오늘로부터 1년까지로
        let oneYearFromNow = Calendar.current.date(byAdding/*달력 선택 기간*/: dateComponents/*달력의 선택 범위를 1년으로 정함*/, to/*범위 기준점*/: today/*현재 시점*/)
        
        // 선택 범위
        datePicker.minimumDate = today
        datePicker.maximumDate = oneYearFromNow
        
        datePicker.addAction(UIAction { [weak self] _ in
            print("sender: \(self?.datePicker.date.formatted() ?? "N/A")")
        }, for: .valueChanged)
        
        view.addSubview(datePicker)
        
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


}

