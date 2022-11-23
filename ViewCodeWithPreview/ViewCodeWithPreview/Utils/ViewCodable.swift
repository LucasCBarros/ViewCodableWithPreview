//
//  ViewCodable.swift
//  BattleScape
//
//  Created by Lucas C Barros on 2022-10-16.
//  Copyright © 2022 Lucas C Barros. All rights reserved.
//

import UIKit

//MARK: - Protocol
/*
    This is a protocol I use to easily organize UI handling code.
    Simply adopt this protocol, customize the methods which suit you best and call the main setup function.
*/
protocol ViewCodable {
    /*
        This function calls all other functions in the correct order.
        You can use it in an UIViewController viewDidLoad method or in a view initializer, for example.
    */
    func setupUI()
    
    //  This function should be used to add your custom views to the views hierarchy in correct order
    func setupHierarchy()
    
    // This function should be used to add constraints to your customs views
    func setupConstraints()
    
    /*
        This function should be used to apply styles to your customs views.
        You could change colors, fonts, alignments or other properties here.
    */
    func setupStyles()
    
    /*
        This function should be used to link actions to your customs views.
        For example, you could add a selector to a button or use reactive bindings here.
    */
    func setupComponentBindings()
    
    /*
        This function should be used to assign accessibility idientifiers to your custom views.
        It might come in handy if you are writing UI tests.
    */
    func setupAcessibilityIdentifiers()
}


//MARK: - Default implementations
extension ViewCodable {
    
    func setupUI() {
        setupHierarchy()
        setupConstraints()
        setupStyles()
        setupComponentBindings()
        setupAcessibilityIdentifiers()
    }
    
    // Optional functions, since they might not apply to every context
    func setupStyles() { }
    
    func setupComponentBindings() { }
    
    func setupAcessibilityIdentifiers() { }
    
}
