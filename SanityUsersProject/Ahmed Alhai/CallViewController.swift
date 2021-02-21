//
//  CallViewController.swift
//  MobileProgrammingProject
//
//  Created by MobileProg on 6/17/19.
//  Copyright © 2019 MobileProg. All rights reserved.
//

import UIKit
import CallKit

class CallViewController: UIViewController, CXProviderDelegate {
    
    override func viewDidLoad() {
        let provider = CXProvider(configuration: CXProviderConfiguration(localizedName: "My App"))
        provider.setDelegate(self, queue: nil)
        let controller = CXCallController()
        let transaction = CXTransaction(action: CXStartCallAction(call: UUID(), handle: CXHandle(type: .generic, value: "Pete Za")))
        controller.request(transaction, completion: { error in })
    }
    
    func providerDidReset(_ provider: CXProvider) {
    }
    
}

