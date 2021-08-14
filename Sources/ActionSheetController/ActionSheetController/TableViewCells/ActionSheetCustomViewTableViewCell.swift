//
//  ActionSheetCustomViewTableViewCell.swift
//  CustomAlertController
//
//  Created by Mojisola Adebiyi on 24/07/2021.
//

import UIKit

class ActionSheetCustomViewTableViewCell: UITableViewCell {
    
    var onCellTappedAction: (()->())?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupView() {
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8).isActive = true
        containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
    }
    
    private func constrainCustom(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        let tempContainer: UIView = {
            let tempContainer = UIView()
            tempContainer.addSubview(view)
            tempContainer.translatesAutoresizingMaskIntoConstraints = false
            if view.frame.isEmpty {
                view.topAnchor.constraint(equalTo: tempContainer.topAnchor).isActive = true
                view.centerXAnchor.constraint(equalTo: tempContainer.centerXAnchor).isActive = true
                view.bottomAnchor.constraint(equalTo: tempContainer.bottomAnchor).isActive = true
            }else {
                view.centerXAnchor.constraint(equalTo: tempContainer.centerXAnchor).isActive = true
                view.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
                view.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
                view.widthAnchor.constraint(equalToConstant: view.frame.height).isActive = true
            }
            return view
        }()
        
        containerView.addSubview(tempContainer)
        tempContainer.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        tempContainer.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        tempContainer.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        
    }
        
    func configureView(with type: ActionSheetCellType) {
        switch type {
        case .custom(let view):
            self.constrainCustom(view)
        default:
            break
        }
    }

}
