//
//  ViewControllerPreview.swift
//  BattleScape
//
//  Created by Lucas C Barros on 2022-10-15.
//  Copyright © 2022 Lucas C Barros. All rights reserved.
//

import UIKit
import SwiftUI

/**
 This struct make it possible to have previews in ViewControllers like SwiftUI but using UIKit
 */
struct ViewControllerPreview: UIViewControllerRepresentable {
    let viewControllerBuilder: () -> UIViewController

    init(_ viewControllerBuilder: @escaping () -> UIViewController) {
        self.viewControllerBuilder = viewControllerBuilder
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return viewControllerBuilder()
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // Not needed
    }
}
