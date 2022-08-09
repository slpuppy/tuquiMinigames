//
//  GameSelectViewController.swift
//  minigames
//
//  Created by Gabriel Puppi on 08/08/22.
//

import SnapKit
import UIKit



class GameSelectViewController: UIViewController {
    
    
    lazy var minigame1Button: UIButton = {
        let button = UIButton()
        button.setTitle("Minigame1", for: .normal)
        
        return button
    }()
    
    lazy var minigame2Button: UIButton = {
        let button = UIButton()
        button.setTitle("Minigame2", for: .normal)
        return button
    }()
    
    lazy var minigame3Button: UIButton = {
        let button = UIButton()
        button.setTitle("Minigame3", for: .normal)
        return button
    }()
    
    lazy var minigame4Button: UIButton = {
        let button = UIButton()
        button.setTitle("Minigame4", for: .normal)
        return button
    }()
    
  override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presentButtons()
    }
    
    func presentButtons() {
        addButtons()
        setupButtons()
  }
    
    
    func addButtons(){
        self.view.addSubview(minigame1Button)
        self.view.addSubview(minigame2Button)
        self.view.addSubview(minigame3Button)
        self.view.addSubview(minigame4Button)
    }
    
    func setupButtons(){
        minigame1Button.backgroundColor = .black
        minigame2Button.backgroundColor = .black
        minigame3Button.backgroundColor = .black
        minigame4Button.backgroundColor = .black
        
        minigame1Button.snp.makeConstraints { make in
            make.top.equalTo(self.view.frame.maxY).offset(200)
            make.centerX.equalTo(self.view.frame.midX)
        }
        minigame2Button.snp.makeConstraints { make in
            make.top.equalTo(minigame1Button.snp.bottom).offset(50)
            make.centerX.equalTo(self.view.frame.midX)
        }
        minigame3Button.snp.makeConstraints { make in
            make.top.equalTo(minigame2Button.snp.bottom).offset(50)
            make.centerX.equalTo(self.view.frame.midX)
        }
        minigame4Button.snp.makeConstraints { make in
            make.top.equalTo(minigame3Button.snp.bottom).offset(50)
            make.centerX.equalTo(self.view.frame.midX)
        }
    }
}
