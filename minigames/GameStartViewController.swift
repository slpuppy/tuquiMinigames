import UIKit
import SnapKit

final class GameStartViewController: UIViewController {
    
    // MARK: - Attributes
    
    private var tasksProgressView: UIView!
    private var headerLabelsHolder: UIView!
    private var taskName: UILabel!
    private var taskHeader: UILabel!
    private var assetImageView: UIImageView!
    private var descriptionLabel: UILabel!
    private var playButton: UIButton!
    private var currentMiniGame: MiniGameType
    private var taskStackView: UIStackView!
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        let systemIconConfiguration = UIImage.SymbolConfiguration(pointSize: 24, weight: .black)
        button.setImage(UIImage(systemName: "x.circle.fill", withConfiguration: systemIconConfiguration), for: .normal)
        button.addTarget(self, action: #selector(dimissView), for: .touchUpInside)
        button.tintColor = UIColor(red: 255/255, green: 240/255, blue: 211/255, alpha: 1)
        
        return button
    }()
    
    // MARK: - Initialization
    
    init(currentMiniGame: MiniGameType) {
        self.currentMiniGame = currentMiniGame
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        setupAllView()
    }
}

// MARK: Private Methods

private extension GameStartViewController {
    
    func setupAllView() {
        createViews()
        configureStackView()
        addButton()
        setupButton()
        setupTaskProgressViewContraints()
        setupStackViewContraints()
        setupButtonConstraints()
        setupImage()
        addViewsToStack()
        setupHeaderLabelsHolder()
        setupDescriptionLabel()
        view.backgroundColor = currentMiniGame.background
    }
    
    func configureStackView() {
        taskStackView.axis = .vertical
        taskStackView.alignment = .center
        taskStackView.distribution = .fill
        taskStackView.spacing = 32
    }
    
    func createViews() {
        headerLabelsHolder = UIView()
        tasksProgressView = UIView()
        taskName = UILabel()
        taskHeader = UILabel()
        assetImageView = UIImageView()
        descriptionLabel = UILabel()
        playButton = UIButton()
        taskStackView = UIStackView()
    }
    
    func addButton() {
        closeButton.translatesAutoresizingMaskIntoConstraints = true
        view.addSubview(closeButton)
        
        closeButton.snp.makeConstraints {
            $0.top.equalTo(view.snp_topMargin).offset(20)
            $0.right.equalTo(view.snp_rightMargin).offset(-20)
        }
    }
    
    func setupTaskProgressViewContraints() {
#warning("Need add progress game inside this view")
        self.view.addSubview(tasksProgressView)
        tasksProgressView.backgroundColor = .white
        
        tasksProgressView.snp.makeConstraints {
            $0.top.equalTo(closeButton.snp_bottomMargin).offset(30)
            $0.leading.equalToSuperview().offset(35)
            $0.trailing.equalToSuperview().offset(-35)
            $0.height.equalTo(54)
        }
    }
    
    func setupStackViewContraints() {
        self.view.addSubview(taskStackView)
        
        taskStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.top.greaterThanOrEqualTo(tasksProgressView.snp_bottomMargin).offset(60)
            $0.leading.equalToSuperview().offset(60)
            $0.trailing.equalToSuperview().offset(-60)
        }
    }
    
    func setupButtonConstraints() {
        self.view.addSubview(playButton)
        playButton.backgroundColor = .blue
        
        playButton.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(taskStackView.snp_bottomMargin).offset(60)
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.bottom.equalToSuperview().offset(-64)
            $0.height.equalTo(70)
        }
    }
    
    func addViewsToStack() {
        taskStackView.addArrangedSubview(headerLabelsHolder)
        taskStackView.addArrangedSubview(assetImageView)
        taskStackView.addArrangedSubview(descriptionLabel)
    }
    
    func setupHeaderLabelsHolder() {
        headerLabelsHolder.addSubview(taskHeader)
        headerLabelsHolder.addSubview(taskName)
        
        taskHeader.snp.makeConstraints {
            $0.topMargin.leadingMargin.trailingMargin.equalToSuperview()
        }
        
        taskName.snp.makeConstraints {
            $0.top.equalTo(taskHeader.snp_bottomMargin).offset(0)
            $0.leadingMargin.trailingMargin.bottom.equalToSuperview()
        }
        
        taskHeader.text = String("Next Task").uppercased()
        taskHeader.textAlignment = .center
        taskHeader.numberOfLines = 0
        taskHeader.font = UIFont.systemFont(ofSize: 20, weight: .black)
        
        taskName.text = currentMiniGame.name
        taskName.textAlignment = .center
        taskName.numberOfLines = 0
        taskName.font = UIFont(name: "QuimbyMayoral", size: 48)
    }
    
    func setupImage() {
        assetImageView.image = currentMiniGame.assetImage
    }
    
    func setupDescriptionLabel() {
        descriptionLabel.text = currentMiniGame.gameDescription
        descriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular  )
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
    }
    
    func setupButton() {
        playButton.addTarget(self, action: #selector(openGame), for: .touchUpInside)
    }
}

// MARK: - Obj-c Methods

@objc
private extension GameStartViewController {
    
    func dimissView() {
#warning("TODO: Need to change navigation")
        self.dismiss(animated: true)
    }
    
    func openGame() {
        var gameViewController = GameViewController(scene: currentMiniGame.scene)
        
        if currentMiniGame == .maze {
            let scene = currentMiniGame.scene as! MazeScene
            scene.setupMaze(.medium, delegate: self)
            gameViewController = GameViewController(scene: scene)
        }
        
        gameViewController.modalPresentationStyle = .fullScreen
        
        self.present(gameViewController, animated: true)
    }
}

// MARK: - Obj-c Methods

extension GameStartViewController: MazeDelegate {
    func finishGame() {
#warning("TODO: Need to change navigation")
        self.dismiss(animated: true)
        // TODO: Call NFC reader/ dismiss/ delivery track
    }
}
