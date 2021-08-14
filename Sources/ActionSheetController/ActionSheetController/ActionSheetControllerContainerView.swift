//
//  ActionSheetControllerContainerView.swift
//  CustomAlertController
//
//  Created by Mojisola Adebiyi on 24/07/2021.
//

import UIKit

class ActionSheetControllerContainerView: UIView {
    
    private var doneAction: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupTapActionForButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
    
    lazy var backDropView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tableView: SelfSizedTableView = {
        let view = SelfSizedTableView(frame: .zero, style: .plain)
        view.isScrollEnabled = false
        view.showsVerticalScrollIndicator = false
        view.layer.cornerRadius = 14
        view.layer.masksToBounds = true
        view.backgroundColor = .clear
        view.separatorInset =   UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var doneButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 14
        button.layer.masksToBounds = true
        button.heightAnchor.constraint(equalToConstant: 52).isActive = true
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addSubview(blurView)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.topAnchor.constraint(equalTo: button.topAnchor).isActive = true
        blurView.leftAnchor.constraint(equalTo: button.leftAnchor).isActive = true
        blurView.rightAnchor.constraint(equalTo: button.rightAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setupTapActionForButton() {
        blurView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didPressDoneButton)))
    }
    
    @objc private func didPressDoneButton() {
        doneAction?()
    }
    
    func setupDoneButton(title: String, type: ActionSheetActionType, action: (() -> ())?) {
        doneButton.setTitle(title, for: .normal)
        doneButton.setTitleColor(type.color() , for: .normal)
        doneAction = action
    }
    
    private func addBlurViewToTableViewBackground() {
        let blurView = UIVisualEffectView(frame: tableView.frame)
        blurView.effect = UIBlurEffect(style: .systemMaterial)
        tableView.backgroundView = blurView
    }
    
    private func setMaxTableViewHeight() {
        guard let appViewHeight = UIApplication.shared.windows.last?.rootViewController?.view.frame.height else {return}
        let maxHeight = appViewHeight * 0.75
        tableView.maxHeight = maxHeight
    }
    
    private func setupView() {
        setMaxTableViewHeight()
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(backDropView)
        addSubview(tableView)
        addSubview(doneButton)
        
        tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        
        doneButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 8).isActive = true
        doneButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        doneButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        
        backDropView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backDropView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        backDropView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        backDropView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        addBlurViewToTableViewBackground()
    }
    
}
