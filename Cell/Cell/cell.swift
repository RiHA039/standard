//
//  File.swift
//  Cell
//
//  Created by 김리하 on 9/9/25.
//

import UIKit

protocol MyCellDelegate: AnyObject {
    func didTapAddButton(in cell: MyCustomCell)
}

class MyCustomCell: UITableViewCell {
    
    weak var delegate: MyCellDelegate?
    
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("데이터 추가", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            addButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 100),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func addButtonTapped() {
        delegate?.didTapAddButton(in: self)
    }
}


