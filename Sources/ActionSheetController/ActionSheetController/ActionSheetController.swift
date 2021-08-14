//
//  ActionSheetController.swift
//  CustomAlertController
//
//  Created by Mojisola Adebiyi on 24/07/2021.
//

import UIKit

public struct Size {
    let height: CGFloat
    let width: CGFloat
}

public class ActionSheetController: UIView {
    var tableViewCellArray: [ActionSheetCellType] = []
    var tableViewHeaderArray: [ActionSheetCellType] = []
    let contentView = ActionSheetControllerContainerView()
    
    public init(title: String?, message: String?) {
        super.init(frame: .zero)
        setupView()
        setupTableView()
        setupTapActionForBackDropView()
        addDefaultDoneAction()
        (title == nil && message == nil) ? () : tableViewHeaderArray.append(.title(title: title, message: message))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    private func addDefaultDoneAction() {
        self.contentView.setupDoneButton(title: "Cancel", type: .normal, action: {[weak self] in
            self?.removeActionSheetFromSuperView()
        })
    }
}

extension ActionSheetController {
    func setupTableView() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
    }
}

extension ActionSheetController {
    public func launch() {
        guard let appView = UIApplication.shared.windows.last?.rootViewController?.view else {return}
        appView.addSubview(self)
        self.topAnchor.constraint(equalTo: appView.topAnchor).isActive = true
        self.leftAnchor.constraint(equalTo: appView.leftAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: appView.rightAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: appView.bottomAnchor).isActive = true
        shouldEnableScrolling()
    }
    
    public func removeActionSheetFromSuperView() {
        self.removeFromSuperview()
    }
    
    func setupTapActionForBackDropView() {
        contentView.backDropView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapBackDropView)))
    }
    
    @objc private func didTapBackDropView() {
        removeActionSheetFromSuperView()
    }
    
    private func shouldEnableScrolling() {
        guard let appViewHeight = UIApplication.shared.windows.last?.rootViewController?.view.frame.height else {return}
        DispatchQueue.main.async {[weak self] in
            guard let self = self else {return}
            self.contentView.tableView.isScrollEnabled = self.contentView.tableView.intrinsicContentSize.height >= (appViewHeight * 0.7)
        }
    }

}

extension ActionSheetController: ActionSheetActions {
    public func addHeader(image: UIImage?, size: Size? = nil, cornerRadius: CGFloat? = nil, title: String?, message: String?) {
        tableViewHeaderArray.insert(.headerImage(image: image, size: size, cornerRadius: cornerRadius, title: title, message: message), at: 0)
        self.contentView.tableView.reloadData()
    }
    
    public func addHeader(view: UIView) {
        tableViewHeaderArray.insert(.headerView(view: view), at: 0)
        self.contentView.tableView.reloadData()
    }
    
    public func addAction(title: String, type: ActionSheetActionType, action: (() -> ())?) {
        tableViewCellArray.append(.defaultAction(title: title, type: type, action: action))
        self.contentView.tableView.reloadData()
    }
    
    public func addCustomAction(view: UIView) {
        tableViewCellArray.append(.custom(view: view))
        self.contentView.tableView.reloadData()
    }
    
    public func addDoneAction(title: String, type: ActionSheetActionType, action: (() -> ())?) {
        let doneAction = {[weak self] in
            action?()
            self?.removeFromSuperview()
        }
        self.contentView.setupDoneButton(title: title, type: type, action: doneAction)
    }
}

extension ActionSheetController: UITableViewDelegate, UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        tableViewHeaderArray.isEmpty ? 1 : 2
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return tableViewHeaderArray.isEmpty ? tableViewCellArray.count : tableViewHeaderArray.count
        case 1:
            return tableViewCellArray.count
        default:
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        if section == 0 && !tableViewHeaderArray.isEmpty {
            let cellType = tableViewHeaderArray[indexPath.row]
            switch cellType {
            case .headerImage:
                let cell = ActionSheetHeaderViewTableViewCell()
                cell.configureView(with: cellType)
                return cell
            case .headerView:
                let cell = ActionSheetHeaderViewTableViewCell()
                cell.configureView(with: cellType)
                return cell
            case .title(let title, let message):
                let cell = ActionSheetTitleViewTableViewCell()
                cell.set(title: title, message: message)
                return cell
            default:
                return UITableViewCell()
            }
        }else {
            let cellType = tableViewCellArray[indexPath.row]
            switch cellType {
            case .defaultAction:
                let cell = ActionSheetDefaultActionTableViewCell()
                cell.configureView(with: cellType)
                return cell
            case .custom:
                let cell = ActionSheetCustomViewTableViewCell()
                cell.configureView(with: cellType)
                return cell
            default:
                return UITableViewCell()
            }
        }
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        switch section {
        case 1:
            let cellType = tableViewCellArray[indexPath.row]
            switch cellType {
            case .defaultAction(_, _, let action):
                action?()
                removeActionSheetFromSuperView()
            default:
                break
            }
        default:
            break
        }
    }
    
}
