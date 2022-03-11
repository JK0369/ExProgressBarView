//
//  ViewController.swift
//  ExProgressBar
//
//  Created by 김종권 on 2022/03/12.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
  private let progressBarView = ProgressBarView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "ProgressBar 테스트"
    self.view.addSubview(self.progressBarView)
    self.progressBarView.snp.makeConstraints {
      $0.left.top.right.equalTo(self.view.safeAreaLayoutGuide)
      $0.height.equalTo(5)
    }
    
    var timer = 0.0
    let finish = 10.0
    Timer.scheduledTimer(
      withTimeInterval: 1,
      repeats: true) { _ in
        timer += 1
        self.progressBarView.ratio = timer / finish
      }
  }
}
