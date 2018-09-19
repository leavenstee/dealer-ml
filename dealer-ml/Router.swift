//
//  Router.swift
//  dealer-ml
//
//  Created by Steven Lee on 9/18/18.
//  Copyright © 2018 leavenstee. All rights reserved.
//

import UIKit

class Router: NSObject {
    
    static let sharedRouter = Router()
    
    public func transitionToBlackjackViewController() {
        let vm = BlackjackViewModel()
        let vc = BlackjackViewController(vm)
        self.presentViewController(vc)
    }
    
    
    private func presentViewController(_ vc:UIViewController) {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            print(topController)
            topController.present(vc, animated: true
                , completion: nil)
            
        }
    }

}
