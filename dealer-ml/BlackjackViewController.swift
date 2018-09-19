//
//  BlackjackViewController.swift
//  dealer-ml
//
//  Created by Steven Lee on 9/18/18.
//  Copyright © 2018 leavenstee. All rights reserved.
//

import UIKit

class BlackjackViewController: UIViewController {

    public var viewModel: BlackjackViewModel!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(_ viewModel:BlackjackViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        viewModel.shuffleDeck()
        
        viewModel.startRound()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
