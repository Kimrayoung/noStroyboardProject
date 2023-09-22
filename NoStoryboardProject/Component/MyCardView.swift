//
//  MyCardView.swift
//  NoStoryboardProject
//
//  Created by 김라영 on 2023/09/22.
//

import Foundation
import UIKit


/// Custom view로 UIView만들기
class MyCardView: UIView {
    
    //view를 프로그램으로 만드는 것이므로 생성자를 넣어줘야 한다
    //view의 생성조건은 frame을 가지고 있음
    //MyCardView는 UIView가 가지고 있는 것을 상속받는 것이기 override해줘야 한다
    override init(frame: CGRect) {
        super.init(frame: frame) //부모가 가진 init메소드 호출
        setupLayout() //레이아웃 설정
        print(#fileID, #function, #line, "- my card view")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //layout 설정
    fileprivate func setupLayout() { //UIView의 레이아웃을 짜는 것
        self.backgroundColor = UIColor.systemYellow
        self.translatesAutoresizingMaskIntoConstraints = false
        
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
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabelContainer)
        self.addSubview(bottomImageView)
        
        //firstview의 크기잡고 하위요소들 위치 잡기
        NSLayoutConstraint.activate([
            //firstview 크기 잡기
            self.widthAnchor.constraint(equalToConstant: 100),
            self.heightAnchor.constraint(equalToConstant: 200),
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            subTitleLabelContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            subTitleLabelContainer.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            //bottom과 trailing은 위치를 잡을 때 음수로 잡아야 한다
            bottomImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            bottomImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
        ])
    }
    
    
}


//MARK: - static method 관련
extension MyCardView {
    //static method나 class method는 해당 하는 객체를 메모리에 올리지 않아도 호출할 객체를 호출할 수 있음
    
    /// 카드뷰 만들기
    /// - Returns: 만들어진 카드뷰
    static func generateMyCardView() -> MyCardView {
        let firstView = MyCardView() //cardView를 생성해준다
        firstView.translatesAutoresizingMaskIntoConstraints = false
        return firstView
    }
}
