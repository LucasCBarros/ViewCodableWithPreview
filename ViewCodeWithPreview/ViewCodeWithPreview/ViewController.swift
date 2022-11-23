//
//  ViewController.swift
//  ViewCodeWithPreview
//
//  Created by Lucas C Barros on 2022-11-22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController, ViewCodable {
    var greenView = CodableView()
    var orangeView = CodableView.View
    var purpleView = CodableView.Stack
    var pinkView: UIButton = CodableView.Button
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - extension PreviewViewController {
    func setupHierarchy() {
        addSubViews([greenView,
                     orangeView,
                     purpleView,
                     pinkView ])
    }
    
    func setupConstraints() {
        pinkView
            .heightTo(200)
            .widthTo(200)
            .bottomToSuperview()
            .trailingToSuperview()
        
        greenView
            .centerTo(to: self.view)
            .heightToSuperview()
            .widthOf(orangeView)
        
        orangeView
            .heightTo(150)
            .widthTo(200)
            .trailingToLeading(of: pinkView)
            .bottomToTop(of: pinkView)
        
        purpleView
            .heightTo(40)
            .widthOf(orangeView)
            .rightToSuperview(10)
            .topToSuperview(100)
    }
    
    func setupStyles() {
        pinkView.setTitle("hello", for: .normal)
        pinkView.setTitleColor(.white, for: .normal)
        pinkView.layer.cornerRadius = 30
        
        greenView.backgroundColor = .green
        view.backgroundColor = .blue
        orangeView.backgroundColor = .orange
        pinkView.backgroundColor = .systemPink
        purpleView.backgroundColor = .purple
    }
}

struct PreviewViewController_ViewController: PreviewProvider {
    static var previews: some View {
        ZStack {
            ViewControllerPreview {
                ViewController()
            }
        }
    }
}
