//
//  OverlayAnimationCoordinator.swift
//  OverlayContainer
//
//  Created by Gaétan Zanella on 14/11/2018.
//

import UIKit

/// A protocol that provides information about an in-progress translation.
/// Do not adopt this protocol in your own classes. Use the one provided by the `OverlayContainerTransitionCoordinator`.
public protocol OverlayContainerTransitionCoordinatorContext {

    /// A Boolean value indicating whether the transition is explicitly animated.
    var isAnimated: Bool { get }
    /// A Boolean value indicating whether the transition was cancelled.
    var isCancelled: Bool { get }
    /// The notch's height the container expects to reach.
    var targetTranslationHeight: CGFloat { get }
    /// The current translation height.
    var overlayTranslationHeight: CGFloat { get }
    /// The notch indexes.
    var notchIndexes: Range<Int> { get }
    /// The reachable indexes.
    var reachableIndexes: [Int] { get }
    /// Returns the height of the specified notch.
    func height(forNotchAt index: Int) -> CGFloat
}

/// A protocol that provides support for animations associated with a overlay translation.
///
/// Do not adopt this procotol in your own classes. Use the one provided by the `OverlayContainerDelegate` to
/// add any extra animations alongside the translation animations.
public protocol OverlayContainerTransitionCoordinator: OverlayContainerTransitionCoordinatorContext {
    /// Runs the specified animations at the same time as overlay translation end animations.
    func animate(alongsideTransition animation: ((OverlayContainerTransitionCoordinatorContext) -> Void)?,
                 completion: ((OverlayContainerTransitionCoordinatorContext) -> Void)?)
}
