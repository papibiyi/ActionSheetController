//
//  ActionSheetTitleViewTableViewCell.swift
//  CustomAlertController
//
//  Created by Mojisola Adebiyi on 24/07/2021.
//

import UIKit

class ActionSheetTitleViewTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [title, subtitle])
        view.spacing = 10
        view.axis = .vertical
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private func setupView() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8).isActive = true
        stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
    }
            
    func set(title: String?, message: String?) {
        self.title.text = title
        self.subtitle.text = message
    }

}
