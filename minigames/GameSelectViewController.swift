//
//  GameSelectViewController.swift
//  minigames
//
//  Created by Gabriel Puppi on 08/08/22.
//

import SnapKit
import UIKit
import SpriteKit

class GameSelectViewController: UIViewController {
    
    lazy var polishCrystalButton: UIButton = {
        let button = UIButton()
        button.setTitle("PolishCrystal", for: .normal)
        button.addTarget(self, action: #selector(openPolishCrystal), for: .touchUpInside)
        
        return button
    }()
    
    lazy var mazeButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(openMaze), for: .touchUpInside)
        button.titleLabel?.font = UIFont(name: "QuimbyMayoral", size: 12)
        button.setTitle("Maze", for: .normal)
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
    
    private var gameStarViewController = UIViewController()
    private var currentMiniGame: MiniGameType = .maze

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
        self.view.addSubview(polishCrystalButton)
        self.view.addSubview(mazeButton)
        self.view.addSubview(minigame3Button)
        self.view.addSubview(minigame4Button)
    }
    
    func setupButtons() {
        polishCrystalButton.backgroundColor = .black
        mazeButton.backgroundColor = .black
        minigame3Button.backgroundColor = .black
        minigame4Button.backgroundColor = .black
        
        makeContraints(view: polishCrystalButton, anchorView: self.view, offSet: 200)
        makeContraints(view: mazeButton, anchorView: polishCrystalButton, offSet: 50)
        makeContraints(view: minigame3Button, anchorView: mazeButton, offSet: 50)
        makeContraints(view: minigame4Button, anchorView: minigame3Button, offSet: 50)
    }
    
    func makeContraints(view: UIView, anchorView: UIView, offSet: ConstraintOffsetTarget) {
        view.snp.makeConstraints {
            $0.top.equalTo(anchorView == self.view ? view.frame.maxY : anchorView.snp.bottom).offset(offSet)
            $0.centerX.equalTo(self.view.frame.midX)
        }
    }
    
    func gameStarter() {
    #warning("TODO: Need to change navigation")
    gameStarViewController = GameStartViewController(currentMiniGame: currentMiniGame)
    gameStarViewController.modalPresentationStyle = .fullScreen
    self.present(gameStarViewController, animated: true)
    }
}

@objc
private extension GameSelectViewController {
    func openPolishCrystal() {
        currentMiniGame = .polyshCrystal
        gameStarter()
    }
    
    func openMaze() {
        currentMiniGame = .maze
        gameStarter()
    #warning("TODO: Need to change navigation")
    }
}

extension GameSelectViewController: MazeDelegate {
    func finishGame() {
    #warning("TODO: Need to change navigation")
        self.dismiss(animated: true)
        // TODO: Call NFC reader/ dismiss/ delivery track
    }
}

