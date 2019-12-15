//
//  PadViewViewController.swift
//  PadView
//
//  Created by Tai Le on 11/17/19.
//  Copyright © 2019 Tai Le. All rights reserved.
//

import UIKit

public class PadViewViewController: UIViewController {
    public weak var contentView: UIView?
    public var backgroundColor: UIColor?
    public var contentLeading: CGFloat = 10
    public var contentTrailing: CGFloat = -10
    public var contentBottom: CGFloat = -10
    public var tapToDismiss = true
    public var transitionAnimation: TimeInterval = 0.25
    public var onWillDismiss: (() -> Void)?
    public var onDidDismiss: (() -> Void)?
    public var statusBarStyle: UIStatusBarStyle = .default
    
    public init(contentView: UIView) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overCurrentContext
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public lazy var contentWrapperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.15
        view.layer.shadowRadius = 20
        view.layer.shadowOffset = CGSize(width: 5, height: 5)
        return view
    }()
    
    var contentWrapperViewBottom: NSLayoutConstraint?
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: transitionAnimation, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.backgroundColor = self.backgroundColor?.withAlphaComponent(0.9)
            self.contentWrapperViewBottom?.constant = self.contentBottom - UIApplication.shared.safeAreaInsets.bottom
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        guard tapToDismiss,
            let location = touches.first?.location(in: view),
            !contentWrapperView.frame.contains(location) else { return }
        dismiss()
    }
}

// MARK: - Privates

extension PadViewViewController {
    private func setupViews() {
        if let contentView = contentView {
            contentView.translatesAutoresizingMaskIntoConstraints = false
            contentWrapperView.addSubview(contentView)
            NSLayoutConstraint.activate([
                contentView.leadingAnchor.constraint(equalTo: contentWrapperView.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: contentWrapperView.trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: contentWrapperView.bottomAnchor),
                contentView.topAnchor.constraint(equalTo: contentWrapperView.topAnchor)
            ])
        }
        
        contentWrapperView.layoutIfNeeded()
        view.addSubview(contentWrapperView)
        
        
        contentWrapperViewBottom = contentWrapperView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: contentWrapperView.frame.height)
        
        NSLayoutConstraint.activate([
            contentWrapperView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: contentLeading),
            contentWrapperView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: contentTrailing),
            contentWrapperViewBottom!
        ])
    }
    
    private func dismiss() {
        onWillDismiss?()
        UIView.animate(withDuration: transitionAnimation, delay: 0.0, options: .curveEaseIn, animations: {
            self.contentWrapperViewBottom?.constant = self.contentWrapperView.frame.height
            self.view.layoutIfNeeded()
        }, completion: { [weak self] _ in
            self?.dismiss(animated: false, completion: self?.onDidDismiss)
        })
    }
}

extension UIApplication {
    var safeAreaInsets: UIEdgeInsets {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            return window?.safeAreaInsets ?? .zero
        }
        return .zero
    }
}
