//
//  ViewController.swift
//  NoStoryboardProject
//
//  Created by 김라영 on 2023/09/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(#fileID, #function, #line, "- <#comment#>")
        self.view.backgroundColor = .systemYellow
    }


}

#if DEBUG

import SwiftUI

struct ViewControllerPresentable: UIViewControllerRepresentable { //UIViewControllerRepresentable -> swiftUI에서 uiviewcontroller를 사용할 수 있게 해주는 것
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        print(#fileID, #function, #line, "- <#comment#>")
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
}

#endif
