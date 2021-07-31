//
//  ActionSheetHeaderViewTableViewCell.swift
//  CustomAlertController
//
//  Created by Mojisola Adebiyi on 24/07/2021.
//

import UIKit

class ActionSheetHeaderViewTableViewCell: UITableViewCell {
    
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
    
    private func constrain(_ view: UIView) {
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
    
    private func constrain(image: UIImage?, size: Size? = nil, cornerRadius: CGFloat? = nil, title: String?, message: String?) {
        
        let imageView: UIImageView = {
            let view = UIImageView(image: image)
            view.layer.masksToBounds = true
            view.layer.cornerRadius = cornerRadius ?? 0
            view.heightAnchor.constraint(equalToConstant: size?.height ?? 100).isActive = true
            view.widthAnchor.constraint(equalToConstant: size?.width ?? 100).isActive = true
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        let title: UILabel = {
            let label = UILabel()
            label.text = title
            label.numberOfLines = 0
            label.textAlignment = .center
            label.textColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 1)
            label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let subtitle: UILabel = {
            let label = UILabel()
            label.text = message
            label.numberOfLines = 0
            label.textAlignment = .center
            label.textColor = UIColor(red: 0.51, green: 0.51, blue: 0.51, alpha: 1)
            label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let stackView: UIStackView = {
            let view = UIStackView(arrangedSubviews: [imageView, title, subtitle])
            view.spacing = 10
            view.axis = .vertical
            view.alignment = .center
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()

        
        containerView.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
        
    func configureView(with type: ActionSheetCellType) {
        switch type {
        case .headerImage(let image, let size, let cornerRadius, let title, let message):
            self.constrain(image: image, size: size, cornerRadius: cornerRadius, title: title, message: message)
        case .headerView(let view):
            self.constrain(view)
        default:
            break
        }
    }

}
