//
//  MenuTranslateFactorPresentStyle.swift
//  StarbucksClone
//
//  Created by Hailey Lee on 2020/03/07.
//  Copyright © 2020 Hailey. All rights reserved.
//

import Foundation
import SideMenu

class MenuTranslateFactorPresentStyle: SideMenuPresentationStyle {

    required init() {
        super.init()
        /// Background color behind the views and status bar color
        backgroundColor = .black
        /// The starting alpha value of the menu before it appears
        menuStartAlpha = 1
        /// Whether or not the menu is on top. If false, the presenting view is on top. Shadows are applied to the view on top.
        menuOnTop = false
        /// The amount the menu is translated along the x-axis. Zero is stationary, negative values are off-screen, positive values are on screen.
        menuTranslateFactor = 0
        /// The amount the menu is scaled. Less than one shrinks the view, larger than one grows the view.
        menuScaleFactor = 1
        /// The color of the shadow applied to the top most view.
        onTopShadowColor = .black
        /// The radius of the shadow applied to the top most view.
        onTopShadowRadius = 5
        /// The opacity of the shadow applied to the top most view.
        onTopShadowOpacity = 0
        /// The offset of the shadow applied to the top most view.
        onTopShadowOffset = .zero
        /// The ending alpha of the presenting view when the menu is fully displayed.
        presentingEndAlpha = 1
        /// The amount the presenting view is translated along the x-axis. Zero is stationary, negative values are off-screen, positive values are on screen.
        presentingTranslateFactor = 0
        /// The amount the presenting view is scaled. Less than one shrinks the view, larger than one grows the view.
        presentingScaleFactor = 1
        /// The strength of the parallax effect on the presenting view once the menu is displayed.
        presentingParallaxStrength = .zero
    }

    /// This method is called just before the presentation transition begins. Use this to setup any animations. The super method does not need to be called.
    override func presentationTransitionWillBegin(to presentedViewController: UIViewController, from presentingViewController: UIViewController) {}
    /// This method is called during the presentation animation. Use this to animate anything alongside the menu animation. The super method does not need to be called.
    override func presentationTransition(to presentedViewController: UIViewController, from presentingViewController: UIViewController) {}
    /// This method is called when the presentation transition ends. Use this to finish any animations. The super method does not need to be called.
    override func presentationTransitionDidEnd(to presentedViewController: UIViewController, from presentingViewController: UIViewController, _ completed: Bool) {}
    /// This method is called just before the dismissal transition begins. Use this to setup any animations. The super method does not need to be called.
    override func dismissalTransitionWillBegin(to presentedViewController: UIViewController, from presentingViewController: UIViewController) {}
    /// This method is called during the dismissal animation. Use this to animate anything alongside the menu animation. The super method does not need to be called.
    override func dismissalTransition(to presentedViewController: UIViewController, from presentingViewController: UIViewController) {}
    /// This method is called when the dismissal transition ends. Use this to finish any animations. The super method does not need to be called.
    override func dismissalTransitionDidEnd(to presentedViewController: UIViewController, from presentingViewController: UIViewController, _ completed: Bool) {}
}
