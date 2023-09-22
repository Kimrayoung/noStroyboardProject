//
//  ViewController.swift
//  NoStoryboardProject
//
//  Created by 김라영 on 2023/09/22.
//

import Foundation
import UIKit

class UsageViewController: UIViewController {
    //lazy var -> 변수를 실제로 사용할때 메모리에 올라간다
    lazy var topStackView: UIStackView = { //클로저의 형태
        let stackView = UIStackView()
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(#fileID, #function, #line, "- <#comment#>")
        self.view.backgroundColor = .white
        
        topStackView.addArrangedSubview(MyCardView.generateMyCardView())
        topStackView.addArrangedSubview(MyCardView.generateMyCardView())
        topStackView.addArrangedSubview(MyCardView.generateMyCardView())
        
        //storyboard의 mainview에 데이터를 넣어주는 것처럼 stackview를 view에 넣어준 후 위치를 잡아준다
        self.view.addSubview(topStackView)
        
        topStackView.snp.makeConstraints { make in
            //크기 잡기
            make.top.equalToSuperview().offset(100) //부모와 맞춤
            //edge는 view에서 어느 거리에 삽입할 것인지를 의미한다
            make.horizontalEdges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)) //왼쪽, 오른쪽을 supreview에서 부터 걸어버림
            //위치 잡기
        }
        
//        let leadingImageView = UIImageView(image: UIImage(systemName: "arrow.left"))
//        leadingImageView.tintColor = .black
//        leadingImageView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            leadingImageView.widthAnchor.constraint(equalToConstant: 40),
//            leadingImageView.heightAnchor.constraint(equalToConstant: 40)
//        ])
//
//        let centerLabel = UILabel()
//        centerLabel.text = "젤리 교환소"
//        centerLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        let traillingImageView = UIImageView(image: UIImage(systemName: "info.circle"))
//        traillingImageView.tintColor = .black
//        traillingImageView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            traillingImageView.widthAnchor.constraint(equalToConstant: 40),
//            traillingImageView.heightAnchor.constraint(equalToConstant: 40)
//        ])
//
//        let secondStackView : UIStackView = {
//            let stackView = UIStackView(arrangedSubviews: [
//                leadingImageView, centerLabel, traillingImageView
//            ])
//            stackView.spacing = 0
//            stackView.alignment = .fill
//            stackView.axis = .horizontal
//            stackView.distribution = .equalCentering
//            stackView.backgroundColor = .magenta
//
//            //padding을 넣는 방법 -> storyboard로 따지면 margin padding
//            stackView.isLayoutMarginsRelativeArrangement = true
//            stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
//            stackView.layer.borderColor = UIColor.blue.cgColor
//            stackView.layer.borderWidth = 2
//            stackView.layer.cornerRadius = 10
//            stackView.translatesAutoresizingMaskIntoConstraints = false
//            return stackView
//        }()
        
        let secondStackView = generateJellyStackView()
        
        self.view.addSubview(secondStackView)
        
        NSLayoutConstraint.activate([
            secondStackView.topAnchor.constraint(equalTo: self.topStackView.bottomAnchor, constant: 10),
            secondStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            secondStackView.leadingAnchor.constraint(equalTo: self.topStackView.leadingAnchor),
            
        ])
        
        let thirdStackView = generateKakaoStackView()
        
        self.view.addSubview(thirdStackView)
        
        NSLayoutConstraint.activate([
            thirdStackView.topAnchor.constraint(equalTo: secondStackView.bottomAnchor, constant: 10),
            thirdStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            thirdStackView.leadingAnchor.constraint(equalTo: self.topStackView.leadingAnchor),
            
        ])
        
        let forthStackView : UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [
                generateKakaoStackView(),
                generateKakaoStackView(),
                generateKakaoStackView(),
                generateKakaoStackView()
            ])
            stackView.spacing = 10
            stackView.alignment = .fill
            stackView.axis = .vertical
            stackView.distribution = .fillEqually //equalCentering요소가 무조건 center로 오게끔한다
            stackView.backgroundColor = .systemTeal
            
            //padding을 넣는 방법 -> storyboard로 따지면 margin padding
            stackView.isLayoutMarginsRelativeArrangement = true
            stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            stackView.layer.borderColor = UIColor.blue.cgColor
            stackView.layer.borderWidth = 2
            stackView.layer.cornerRadius = 10
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        self.view.addSubview(forthStackView)
        
        NSLayoutConstraint.activate([
            forthStackView.topAnchor.constraint(equalTo: thirdStackView.bottomAnchor, constant: 10),
            forthStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            forthStackView.leadingAnchor.constraint(equalTo: self.topStackView.leadingAnchor),
        ])
    }
}

extension UsageViewController {
    /// 카카오스택뷰 생성
    /// - Returns: 생성된 스택뷰
    fileprivate func generateKakaoStackView() -> UIStackView {
        let firstLabel = UILabel()
        firstLabel.text = "내 카카오 밷크 입출금 통장"
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let secondLabel = UILabel()
        secondLabel.text = "젤리 교환소"
        secondLabel.font = UIFont.systemFont(ofSize: 12)
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let traillingImageView = UIImageView(image: UIImage(systemName: "pencil"))
        traillingImageView.tintColor = .black
        traillingImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            traillingImageView.widthAnchor.constraint(equalToConstant: 20),
            traillingImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        let stackView = UIStackView(arrangedSubviews: [
            firstLabel, secondLabel, traillingImageView
        ])
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering //equalCentering요소가 무조건 center로 오게끔한다
        stackView.backgroundColor = .systemIndigo
        
        //padding을 넣는 방법 -> storyboard로 따지면 margin padding
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        stackView.layer.borderColor = UIColor.blue.cgColor
        stackView.layer.borderWidth = 2
        stackView.layer.cornerRadius = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    /// 젤리스택뷰 생성
    /// - Returns: 생성된 스택뷰
    fileprivate func generateJellyStackView() -> UIStackView {
        let leadingImageView = UIImageView(image: UIImage(systemName: "arrow.left"))
        leadingImageView.tintColor = .black
        leadingImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            leadingImageView.widthAnchor.constraint(equalToConstant: 40),
            leadingImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let centerLabel = UILabel()
        centerLabel.text = "젤리 교환소"
        centerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let traillingImageView = UIImageView(image: UIImage(systemName: "info.circle"))
        traillingImageView.tintColor = .black
        traillingImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            traillingImageView.widthAnchor.constraint(equalToConstant: 40),
            traillingImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let stackView = UIStackView(arrangedSubviews: [
            leadingImageView, centerLabel, traillingImageView
        ])
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.backgroundColor = .magenta
        
        //padding을 넣는 방법 -> storyboard로 따지면 margin padding
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        stackView.layer.borderColor = UIColor.blue.cgColor
        stackView.layer.borderWidth = 2
        stackView.layer.cornerRadius = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
}

#if DEBUG

import SwiftUI

struct ViewControllerPresentable: UIViewControllerRepresentable { //UIViewControllerRepresentable -> swiftUI에서 uiviewcontroller를 사용할 수 있게 해주는 것
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { //상태가 변경되면 업데이트가 된다
        print(#fileID, #function, #line, "- <#comment#>")
    }
    
    func makeUIViewController(context: Context) -> some UIViewController { //처음에 뷰를 그릴때 여기를 탄다
        UsageViewController() //메모리에 viewController를 올려줌
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
