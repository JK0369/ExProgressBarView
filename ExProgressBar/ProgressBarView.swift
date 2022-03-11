//
//  ProgressBarView.swift
//  ExProgressBar
//
//  Created by 김종권 on 2022/03/12.
//

import UIKit
import SnapKit

final class ProgressBarView: UIView {
  var ratio: CGFloat = 0.0 {
    didSet {
      self.isHidden = !self.ratio.isLess(than: 1.0)
      
      self.progressBarView.snp.remakeConstraints {
        $0.top.bottom.equalTo(self.safeAreaLayoutGuide)
        $0.width.equalToSuperview().multipliedBy(self.ratio)
      }
      
      UIView.animate(
        withDuration: 0.5,
        delay: 0,
        options: .curveEaseInOut, // In과 Out 부분을 천천히하라는 의미 (나머지인 중간 부분은 빠르게 진행)
        animations: self.layoutIfNeeded, // autolayout에 애니메이션을 적용시키고 싶은 경우 사용
        completion: nil
      )
    }
  }
  
  private let progressBarView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemBlue
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.isUserInteractionEnabled = false
    self.backgroundColor = .systemGray
    self.addSubview(self.progressBarView)
  }
  required init?(coder: NSCoder) {
    fatalError()
  }
}
