//
//  CustomAlertViewControllerViewController.swift
//  MasterMind
//
//  Created by Zoilo Mercedes on 2/5/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

class CustomAlertViewController: UIViewController {
    
    enum Entry {
        case top
        case bottom
    }
    
    var entryDirection: Entry = .bottom
    weak var alertView: UIView?
    
   init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomAlertViewController: UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}

extension CustomAlertViewController: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.viewController(forKey: .from)!.view!
        let toView = transitionContext.viewController(forKey: .to)!.view!
        
        let isPresentingAlert = toView == view
        let alert = isPresentingAlert ? toView : fromView
        
        let height = UIScreen.main.bounds.height
        let width = UIScreen.main.bounds.width
        
        let offScreenIn: CGRect
        let offScreenOut: CGRect
        
        let exitWidth = alertView!.frame.minX
        
        switch entryDirection {
        case .top:
            offScreenIn = CGRect(origin: CGPoint(x: width/2, y: -alertView!.frame.height - 100), size: alertView!.frame.size)
            offScreenOut = CGRect(origin: CGPoint(x: exitWidth, y: -alertView!.frame.height), size: alertView!.frame.size)
        case .bottom:
            offScreenIn = CGRect(origin: CGPoint(x: width/2, y: height+100), size: alertView!.frame.size)
            offScreenOut = CGRect(origin: CGPoint(x: exitWidth, y: height), size: alertView!.frame.size)
        }
        
        let onScreen = CGRect(origin: CGPoint(x: width/2, y: height/2), size: alertView!.frame.size)
        
        let bgIn = UIColor(white: 0, alpha: 0.5)
        let bgOut = UIColor(white: 0, alpha: 0)
        
        if isPresentingAlert {
            toView.frame = fromView.frame
            transitionContext.containerView.addSubview(alert)
            alertView!.frame = offScreenIn
            view.backgroundColor = bgOut
        }
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            
            self.view.backgroundColor = isPresentingAlert ? bgIn : bgOut
            self.alertView!.frame = isPresentingAlert ? onScreen : offScreenOut
            
        }, completion: { success in
            
            if !isPresentingAlert {
                alert.removeFromSuperview()
            }
            
            transitionContext.completeTransition(success)
        })
    }
}

