//
//  LoaderView.swift
//  NewsApp
//
//  Created by suhemparashar on 15/06/23.
//

import UIKit

class LoaderView: UIView {
    private let loadingLabel: UILabel = {
        let label = UILabel()
        label.text = "Fetching Top Headlines ⌛..."
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 23)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(#colorLiteral(red: 0.7250172496, green: 1, blue: 0.9783920646, alpha: 1))
        addSubview(loadingLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        loadingLabel.frame = bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show() {
        if #available(iOS 13.0, *) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let viewController = windowScene.windows.first?.rootViewController {
                self.frame = viewController.view.frame
                viewController.view.addSubview(self)
            }
        } else {
            if let viewController = UIApplication.shared.keyWindow?.rootViewController {
                self.frame = viewController.view.frame
                viewController.view.addSubview(self)
            }
        }
    }

    func hide() {
        removeFromSuperview()
    }
}
