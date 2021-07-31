//
//  ActionSheetDefaultActionTableViewCell.swift
//  CustomAlertController
//
//  Created by Mojisola Adebiyi on 24/07/2021.
//

import UIKit

class ActionSheetDefaultActionTableViewCell: UITableViewCell {
    
    var onCellTappedAction: (()->())?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let cellTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupView() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.addSubview(cellTitle)
        cellTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 21).isActive = true
        cellTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8).isActive = true
        cellTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
        cellTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -21).isActive = true
    }
        
    func configureView(with type: ActionSheetCellType) {
        switch type {
        case .defaultAction(let title, let type, let action):
            cellTitle.text = title
            cellTitle.textColor = type.color()
            self.onCellTappedAction = action
        default:
            break
        }
    }

}
