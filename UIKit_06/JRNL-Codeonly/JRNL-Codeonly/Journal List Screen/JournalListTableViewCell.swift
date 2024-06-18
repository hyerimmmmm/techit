//
//  JournalListTableViewCell.swift
//  JRNL-Codeonly
//
//  Created by 김혜림 on 5/13/24.
//

import UIKit

class JournalListTableViewCell: UITableViewCell {
    
    private lazy var thumbnailView: UIImageView = {
       let imageView = UIImageView()
        //기본 이미지
        imageView.image = UIImage(systemName: "face.smiling")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
        
    }()
    
    
    //폰트 설정
    private lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        
        dateLabel.text = "Date"
        dateLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        return dateLabel
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        
        titleLabel.text = "Title"
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        return titleLabel
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(thumbnailView)
        addSubview(dateLabel)
        addSubview(titleLabel)
        
        //오토 레이아웃 설정
        thumbnailView.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //기본 여백 설정을 위한 마진 설정
        let safeArea = safeAreaLayoutGuide
        let marginGuide = layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            //이미지 위치
            thumbnailView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            thumbnailView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            thumbnailView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            thumbnailView.widthAnchor.constraint(equalToConstant: 90),
            
            //날짜 위치
            dateLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: thumbnailView.trailingAnchor, constant: 8),
            
            //타이틀 위치
            titleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: thumbnailView.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - configureCell
    func configureCell(journalEntry: JournalEntry) {
        thumbnailView.image = journalEntry.photo
        dateLabel.text = journalEntry.date.formatted(.dateTime.year().month().day())
        titleLabel.text = journalEntry.entryTitle
    }

}
