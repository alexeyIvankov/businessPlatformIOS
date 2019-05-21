//
//  ChainableAnimator.swift
//  JHChainableAnimations
//
//  Created by Jeff Hurray on 1/17/17.
//  Copyright © 2017 jhurray. All rights reserved.
//

import Foundation
import UIKit

internal extension Float {
    
    var toCG: CGFloat {
        return CGFloat(self)
    }
}


public final class ChainableAnimator {
    
    fileprivate let animator: JHChainableAnimator!
    
    public init(view: UIView) {
        animator = JHChainableAnimator(view: view)
    }
    
    public var completion: () -> Void {
        get {
            return animator.completionBlock
        }
        set (newCompletion) {
            animator.completionBlock = newCompletion
        }
    }
    
    public var isAnimating: Bool {
        return animator.isAnimating
    }
    
    public var isPaused: Bool {
        return animator.isPaused
    }
    
    public var view: UIView {
        return animator.view
    }
    
    public func pause() {
        animator.pause()
    }
    
    public func resume() {
        animator.resume()
    }
    
    public func stop() {
        animator.stop()
    }
}


public extension ChainableAnimator {
    
    func make(frame: CGRect) -> Self {
        animator.makeFrame()(frame)
        return self;
    }
    
    func make(bounds: CGRect) -> Self {
        animator.makeBounds()(bounds)
        return self
    }
    
    func make(height: Float, width: Float) -> Self {
        animator.makeSize()(height.toCG, width.toCG)
        return self
    }
    
    func makeOrigin(x: Float, y: Float) -> Self {
        animator.makeOrigin()(x.toCG, y.toCG)
        return self
    }
    
    func makeCenter(x: Float, y: Float) -> Self {
        animator.makeCenter()(x.toCG, y.toCG)
        return self
    }
    
    func make(x: Float) -> Self {
        animator.makeX()(x.toCG)
        return self
    }
    
    func make(y: Float) -> Self {
        animator.makeY()(y.toCG)
        return self
    }
    
    func make(width: Float) -> Self {
        animator.makeWidth()(width.toCG)
        return self
    }
    
    func make(height: Float) -> Self {
        animator.makeHeight()(height.toCG)
        return self
    }
    
    func make(alpha: Float) -> Self {
        animator.makeOpacity()(alpha.toCG)
        return self
    }
    
    func make(backgroundColor color: UIColor) -> Self {
        animator.makeBackground()(color)
        return self
    }
    
    func make(borderColor color: UIColor) -> Self {
        animator.makeBorderColor()(color)
        return self
    }
    
    func make(borderWidth width: Float) -> Self {
        animator.makeBorderWidth()(width.toCG)
        return self
    }
    
    func make(cornerRadius: Float) -> Self {
        animator.makeCornerRadius()(cornerRadius.toCG)
        return self
    }
    
    func make(scale: Float) -> Self {
        animator.makeScale()(scale.toCG)
        return self
    }
    
    func make(scaleY: Float) -> Self {
        animator.makeScaleY()(scaleY.toCG)
        return self
    }
    
    func make(scaleX: Float) -> Self {
        animator.makeScaleX()(scaleX.toCG)
        return self
    }
    
    func makeAnchor(x: Float, y: Float) -> Self {
        animator.makeAnchor()(x.toCG, y.toCG)
        return self
    }
    
    func move(x: Float) -> Self {
        animator.moveX()(x.toCG)
        return self
    }
    
    func move(y: Float) -> Self {
        animator.moveY()(y.toCG)
        return self
    }
    
    func move(x: Float, y: Float) -> Self {
        animator.moveXY()(x.toCG, y.toCG)
        return self
    }
    
    func move(width: Float) -> Self {
        animator.moveWidth()(width.toCG)
        return self
    }
    
    func move(height: Float) -> Self {
        animator.moveHeight()(height.toCG)
        return self
    }
    
    func movePolar(radius: Float, angle: Float) -> Self {
        animator.movePolar()(radius.toCG, angle.toCG)
        return self
    }
    
    var transformIdentity: ChainableAnimator {
        animator.transformIdentity()
        return self
    }
    
    func rotate(angle: Float) -> Self {
        animator.rotate()(angle.toCG)
        return self
    }
    
    func rotateX(angle: Float) -> Self {
        animator.rotateX()(angle.toCG)
        return self
    }
    
    func rotateY(angle: Float) -> Self {
        animator.rotateY()(angle.toCG)
        return self
    }
    
    func rotateZ(angle: Float) -> Self {
        animator.rotateZ()(angle.toCG)
        return self
    }
    
    func transform(x: Float) -> Self {
        animator.transformX()(x.toCG)
        return self
    }
    
    func transform(y: Float) -> Self {
        animator.transformY()(y.toCG)
        return self
    }
    
    func transform(x: Float, y: Float) -> Self {
        animator.transformXY()(x.toCG, y.toCG)
        return self
    }
    
    func transform(scale: Float) -> Self {
        animator.transformScale()(scale.toCG)
        return self
    }
    
    func transform(scaleX: Float) -> Self {
        animator.transformScaleX()(scaleX.toCG)
        return self
    }
    
    func transform(scaleY: Float) -> Self {
        animator.transformScaleY()(scaleY.toCG)
        return self
    }
    
    func move(onPath path: UIBezierPath, rotate: Bool = false, isReversed: Bool = false) -> Self {
        if rotate {
            if isReversed {
                animator.moveAndReverseRotateOnPath()(path)
            } else {
                animator.moveAndRotateOnPath()(path)
            }
        } else {
            animator.moveOnPath()(path)
        }
        return self
    }
    
    enum AnchorPosition {
        case normal
        case center
        case topLeft
        case topRight
        case bottomLeft
        case bottomRight
        case top
        case bottom
        case left
        case right
    }
    
    func anchor(_ position: AnchorPosition) -> ChainableAnimator {
        switch position {
        case .normal:
            animator.anchorDefault()
        case .center:
            animator.anchorCenter()
        case .topLeft:
            animator.anchorTopLeft()
        case .topRight:
            animator.anchorTopRight()
        case .bottomLeft:
            animator.anchorBottomLeft()
        case .bottomRight:
            animator.anchorBottomRight()
        case .top:
            animator.anchorTop()
        case .bottom:
            animator.anchorBottom()
        case .left:
            animator.anchorLeft()
        case .right:
            animator.anchorRight()
        }
        return self
    }
    
    func delay(t: TimeInterval) -> Self {
        animator.delay()(t)
        return self
    }
    
    func wait(t: TimeInterval) -> Self {
        animator.wait()(t)
        return self
    }
    
    var easeIn: ChainableAnimator {
        animator.easeIn()
        return self
    }
    
     var easeOut: ChainableAnimator {
        animator.easeOut()
        return self
    }
    
    var easeInOut: ChainableAnimator {
        animator.easeInOut()
        return self
    }
    
    var easeBack: ChainableAnimator {
        animator.easeBack()
        return self
    }
    
    var spring: ChainableAnimator {
        animator.spring()
        return self
    }
    
     var bounce: ChainableAnimator {
        animator.bounce()
        return self
    }
    
    var easeInQuad: ChainableAnimator {
        animator.easeInQuad()
        return self
    }
    
    var easeOutQuad: ChainableAnimator {
        animator.easeOutQuad()
        return self
    }
    
    var easeInOutQuad: ChainableAnimator {
        animator.easeInOutQuad()
        return self
    }
    
     var easeInCubic: ChainableAnimator {
        animator.easeInCubic()
        return self
    }
    
   var easeOutCubic: ChainableAnimator {
        animator.easeOutCubic()
        return self
    }
    
     var easeInOutCubic: ChainableAnimator {
        animator.easeInOutCubic()
        return self
    }
    
    var easeInQuart: ChainableAnimator {
        animator.easeInQuart()
        return self
    }
    
     var easeOutQuart: ChainableAnimator {
        animator.easeOutQuart()
        return self
    }
    
     var easeInOutQuart: ChainableAnimator {
        animator.easeInOutQuart()
        return self
    }
    
     var easeInQuint: ChainableAnimator {
        animator.easeInQuint()
        return self
    }
    
    var easeOutQuint: ChainableAnimator {
        animator.easeOutQuint()
        return self
    }
    
     var easeInOutQuint: ChainableAnimator {
        animator.easeInOutQuint()
        return self
    }
    
    var easeInSine: ChainableAnimator {
        animator.easeInSine()
        return self
    }
    
    var easeOutSine: ChainableAnimator {
        animator.easeOutSine()
        return self
    }
    
    var easeInOutSine: ChainableAnimator {
        animator.easeInOutSine()
        return self
    }
    
     var easeInExpo: ChainableAnimator {
        animator.easeInExpo()
        return self
    }
    
    var easeOutExpo: ChainableAnimator {
        animator.easeOutExpo()
        return self
    }
    
     var easeInOutExpo: ChainableAnimator {
        animator.easeInOutExpo()
        return self
    }
    
     var easeInCirc: ChainableAnimator {
        animator.easeInCirc()
        return self
    }
    
    var easeOutCirc: ChainableAnimator {
        animator.easeOutCirc()
        return self
    }
    
     var easeInOutCirc: ChainableAnimator {
        animator.easeInOutCirc()
        return self
    }
    
     var easeInElastic: ChainableAnimator {
        animator.easeInElastic()
        return self
    }
    
    var easeOutElastic: ChainableAnimator {
        animator.easeOutElastic()
        return self
    }
    
    var easeInOutElastic: ChainableAnimator {
        animator.easeInOutElastic()
        return self
    }
    
    var easeInBack: ChainableAnimator {
        animator.easeInBack()
        return self
    }
    
    var easeOutBack: ChainableAnimator {
        animator.easeOutBack()
        return self
    }
    
    var easeInOutBack: ChainableAnimator {
        animator.easeInOutBack()
        return self
    }
    
    var easeInBounce: ChainableAnimator {
        animator.easeInBounce()
        return self
    }
    
    var easeOutBounce: ChainableAnimator {
        animator.easeOutBounce()
        return self
    }
    
    var easeInOutBounce: ChainableAnimator {
        animator.easeInOutBounce()
        return self
    }
    
    func customAnimationFunction(function: @escaping (Double, Double, Double, Double) -> (Double)) -> Self {
        animator.customAnimationFunction()(function)
        return self
    }
    
    func preAnimationBlock(block: @escaping () -> ()) -> Self {
        animator.preAnimationBlock()(block)
        return self
    }
    
    func postAnimationBlock(block: @escaping () -> ()) -> Self {
        animator.postAnimationBlock()(block)
        return self
    }
    
    func `repeat`(t: TimeInterval, count: Int) -> Self {
        animator.`repeat`()(t, count)
        return self
    }
    
    func thenAfter(t: TimeInterval) -> Self {
        animator.thenAfter()(t)
        return self
    }
    
    func animate(t: TimeInterval) {
        animator.animate()(t)
    }
    
    func animateWithRepeat(t: TimeInterval, count: Int) {
        animator.animateWithRepeat()(t, count)
    }
    
    func animate(t: TimeInterval, completion: @escaping () -> ()) {
        animator.animateWithCompletion()(t, completion)
    }
}
