//
//  ViewController.swift
//  NoStoryboardProject
//
//  Created by 김라영 on 2023/09/22.
//

import UIKit
import SnapKit

class BasicViewController: UIViewController {
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
        
//        let firstView = generateCardView()
//        let secondView = generateCardView()
//        let thirdView = generateCardView()
        
        topStackView.addArrangedSubview(MyCardView.generateMyCardView())
        topStackView.addArrangedSubview(MyCardView.generateMyCardView())
        topStackView.addArrangedSubview(MyCardView.generateMyCardView())
        
        //storyboard의 mainview에 데이터를 넣어주는 것처럼 stackview를 view에 넣어준 후 위치를 잡아준다
        self.view.addSubview(topStackView)
        
        topStackView.snp.makeConstraints { make in
            //크기 잡기
            make.top.equalToSuperview().offset(100) //부모와 맞춤
//            make.centerX.equalToSuperview()
//            make.left.equalToSuperview().offset(20)
            //edge는 view에서 어느 거리에 삽입할 것인지를 의미한다
            make.horizontalEdges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)) //왼쪽, 오른쪽을 supreview에서 부터 걸어버림
            //위치 잡기
        }
        
        //위치잡기 - 기존 코드
//        NSLayoutConstraint.activate([
//            topStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            topStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
//            topStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
//        ])
        
        //storyboard에서 uiview를 생성해서 붙여주는 것
//        let yellowView = UIView()
//        yellowView.backgroundColor = UIColor.yellow
        //translatesAutoresizingMaskIntoConstraints를 하는 이유
        //일단 기본적으로 uikit은 frame베이스이기 때문에 그걸 막기 위해서
        //기본적으로 시스테은 뷰의 프레임과 자동크기조정 마스크를 기반으로 한 세트의 제약조건을 자동으로 생성한다
//        yellowView.translatesAutoresizingMaskIntoConstraints = false
        
//        self.view.addSubview(yellowView)
        
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
        /*
        yellowView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(200)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100) //offset은 ~만큼 띄었다를 의미
        }
         */
        
    }
}

//MARK: - view 관련
extension BasicViewController {
    
//    fileprivate func generateMyCardView() -> MyCardView {
//        let firstView = MyCardView() //cardView를 생성해준다
//        firstView.translatesAutoresizingMaskIntoConstraints = false
//        return firstView
//    }
    
    /// 카드뷰 생성 및 반환
    /// - Returns: 카드 뷰
    fileprivate func generateCardView() -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = UIColor.systemYellow
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = "사운드\n테라피"
        titleLabel.numberOfLines = 0 //여러줄 가능함
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //서브타이틀 설정
        let subTitleLabel = UILabel()
        subTitleLabel.text = "무료"
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //subtitle을 담고 있는 컨테이너 설정
        let subTitleLabelContainer = UIView()
        subTitleLabelContainer.backgroundColor = .systemMint
        subTitleLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        
        subTitleLabelContainer.addSubview(subTitleLabel)
        
        //subtitleContainer의 하위요소 위치잡기
        NSLayoutConstraint.activate([
            subTitleLabel.centerXAnchor.constraint(equalTo: subTitleLabelContainer.centerXAnchor),
            subTitleLabel.centerYAnchor.constraint(equalTo: subTitleLabelContainer.centerYAnchor),
            subTitleLabel.leadingAnchor.constraint(equalTo: subTitleLabelContainer.leadingAnchor, constant: 5),
            subTitleLabel.topAnchor.constraint(equalTo: subTitleLabelContainer.topAnchor, constant: 5)
        ])
        
        //이미지뷰 만들기
        let bottomImageView = UIImageView(image: UIImage(systemName: "person.crop.circle"))
        bottomImageView.contentMode = .scaleAspectFit
        bottomImageView.tintColor = .black
        bottomImageView.translatesAutoresizingMaskIntoConstraints = false
        
        //이미지뷰 크기 정하기
        NSLayoutConstraint.activate([
            bottomImageView.widthAnchor.constraint(equalToConstant: 50),
            bottomImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        //항상 똑같이 label을 만들때는 1. view에 집어넣고 -> addSubview(storyboard에 올리는 것과 동일) 2. 위치 잡기 -> LSLayoutConstraint(Stroyboard의 autolayout)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subTitleLabelContainer)
        containerView.addSubview(bottomImageView)
        
        //firstview의 크기잡고 하위요소들 위치 잡기
        NSLayoutConstraint.activate([
            //firstview 크기 잡기
            containerView.widthAnchor.constraint(equalToConstant: 100),
            containerView.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            
            subTitleLabelContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subTitleLabelContainer.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            //bottom과 trailing은 위치를 잡을 때 음수로 잡아야 한다
            bottomImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5),
            bottomImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5)
        ])
        
        return containerView
    }
}

//#if DEBUG
//
//import SwiftUI
//
//struct ViewControllerPresentable: UIViewControllerRepresentable { //UIViewControllerRepresentable -> swiftUI에서 uiviewcontroller를 사용할 수 있게 해주는 것
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { //상태가 변경되면 업데이트가 된다
//        print(#fileID, #function, #line, "- <#comment#>")
//    }
//    
//    func makeUIViewController(context: Context) -> some UIViewController { //처음에 뷰를 그릴때 여기를 탄다
//        ViewController() //메모리에 viewController를 올려줌
//    }
//}
//
//
//struct ViewControllerPrepresentable_PreviewProvider : PreviewProvider { //previewProvider이라는 타입을 이용해서 ViewControllerPresentable를 미리 보기로 제공할 수가 있으
//    static var previews: some View { //static이 붙었으므로 타입프로퍼티에 해당한다, 특정 타입에서 사용되는 프로퍼티에 해당한다
//        ViewControllerPresentable()
//            .previewDevice("iphone 14")
//            .previewDisplayName("iphone 14")
//            .ignoresSafeArea()
//    }
//}
//
//#endif
