//
//  CleanViewController.swift
//  ViewCodeWithPreview
//
//  Created by Lucas C Barros on 2022-11-22.
//

import UIKit
import SwiftUI

class CleanViewController: UIViewController, ViewCodable {
    
    // MARK: - Views
    var greenView = CodableView()
    var orangeView = CodableView.View
    var purpleView = CodableView.Stack
    var pinkView: UIButton = CodableView.Button
    
    // MARK: - Public Variables
    var isPurpleViewHidden: Bool = true
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Methods
    func toggleHideView() {
        purpleView.isHidden = isPurpleViewHidden
        isPurpleViewHidden.toggle()
    }
    
    func promptButtonClicked() {
        print("Button has been clicked!")
    }
    
    // MARK: Actions
    @objc func tap_PinkButtonView() {
        toggleHideView()
        promptButtonClicked()
    }
}
    
//MARK: - Setup View Codable Methods
extension CleanViewController {
    func setupHierarchy() {
        addSubViews([greenView,
                     orangeView,
                     purpleView,
                     pinkView ])
    }
    
    func setupConstraints() {
        setupPinkViewContraints()
        setupGreenViewContraints()
        setupOrangeViewContraints()
        setupPurpleViewContraints()
    }
    
    func setupStyles() {
        setupPinkViewStyle()
        setupGreenViewStyle()
        setupOtherViewStyles()
    }
}

// MARK: Setup View Contraints
extension CleanViewController {
    func setupPinkViewContraints() {
        pinkView
            .heightTo(200)
            .widthTo(200)
            .bottomToSuperview()
            .trailingToSuperview()
    }
    
    func setupGreenViewContraints() {
        greenView
            .centerTo(to: self.view)
            .heightToSuperview()
            .widthOf(orangeView)
    }
    
    func setupOrangeViewContraints() {
        orangeView
            .heightTo(150)
            .widthTo(200)
            .trailingToLeading(of: pinkView)
            .bottomToTop(of: pinkView)
    }
    
    func setupPurpleViewContraints() {
        purpleView
            .heightTo(40)
            .widthOf(orangeView)
            .rightToSuperview(10)
            .topToSuperview(100)
    }
}

// MARK: Setup View Styles
extension CleanViewController {
    func setupPinkViewStyle() {
        pinkView.setTitle("hello", for: .normal)
        pinkView.setTitleColor(.white, for: .normal)
        pinkView.layer.cornerRadius = 30
        pinkView.backgroundColor = .systemPink
        pinkView.addTarget(self, action: #selector(tap_PinkButtonView), for: .touchUpInside)
    }
    
    func setupGreenViewStyle() {
        greenView.backgroundColor = .green
        greenView.layer.cornerRadius = 75
    }
    
    func setupOtherViewStyles() {
        view.backgroundColor = .blue
        orangeView.backgroundColor = .orange
        
        purpleView.backgroundColor = .purple
    }
}

struct PreviewViewController_CleanViewController: PreviewProvider {
    static var previews: some View {
        ZStack {
            ViewControllerPreview {
                CleanViewController()
            }
        }
    }
}
