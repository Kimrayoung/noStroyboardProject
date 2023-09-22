//
//  ViewController.swift
//  NoStoryboardProject
//
//  Created by 김라영 on 2023/09/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(#fileID, #function, #line, "- <#comment#>")
        self.view.backgroundColor = .white
        
        //storyboard에서 uiview를 생성해서 붙여주는 것
        let yellowView = UIView()
        yellowView.backgroundColor = UIColor.yellow
        //translatesAutoresizingMaskIntoConstraints를 하는 이유
        //일단 기본적으로 uikit은 frame베이스이기 때문에 그걸 막기 위해서
        //기본적으로 시스테은 뷰의 프레임과 자동크기조정 마스크를 기반으로 한 세트의 제약조건을 자동으로 생성한다
//        yellowView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(yellowView)
        
        //autolayout 사용
        /*
        //크기 잡기
        yellowView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        yellowView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        //위치 잡기
        yellowView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        yellowView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        */
        
        //NSLayoutConstraint사용
        /*
        NSLayoutConstraint.activate([
            //크기 잡기
            yellowView.widthAnchor.constraint(equalToConstant: 200),
            yellowView.heightAnchor.constraint(equalToConstant: 200),
            
            //위치 잡기
            yellowView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            yellowView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100)
        ])
         */
        
        //snapkit 사용
        yellowView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100) //offset은 ~만큼 띄었다를 의미
        }
        
    }
}

#if DEBUG

import SwiftUI

struct ViewControllerPresentable: UIViewControllerRepresentable { //UIViewControllerRepresentable -> swiftUI에서 uiviewcontroller를 사용할 수 있게 해주는 것
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { //상태가 변경되면 업데이트가 된다
        print(#fileID, #function, #line, "- <#comment#>")
    }
    
    func makeUIViewController(context: Context) -> some UIViewController { //처음에 뷰를 그릴때 여기를 탄다
        ViewController() //메모리에 viewController를 올려줌
    }
}


struct ViewControllerPrepresentable_PreviewProvider : PreviewProvider { //previewProvider이라는 타입을 이용해서 ViewControllerPresentable를 미리 보기로 제공할 수가 있으
    static var previews: some View { //static이 붙었으므로 타입프로퍼티에 해당한다, 특정 타입에서 사용되는 프로퍼티에 해당한다
        ViewControllerPresentable()
            .previewDevice("iphone 14")
            .previewDisplayName("iphone 14")
            .ignoresSafeArea()
    }
}

#endif
