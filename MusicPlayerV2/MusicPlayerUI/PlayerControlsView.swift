//
//  PlayerControlsView.swift
//  MusicPlayerV2
//
//  Created by Andy Peralta on 12/21/20.
//

import UIKit

class PlayerControlsView: UIView {
    //MARK: Buttons Initialization
    private lazy var playButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white

        let playIconConfig = UIImage.SymbolConfiguration(pointSize: 40)
        let playIcon = UIImage(systemName: "play.fill", withConfiguration: playIconConfig)
        let pauseIcon = UIImage(systemName: "pause.fill",  withConfiguration: playIconConfig)

        button.setImage(playIcon, for: .normal)
        button.setImage(pauseIcon, for: .highlighted)
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var fastForwardButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        let fastForwardIconConfig = UIImage.SymbolConfiguration(pointSize: 20)
        let fastForwardIcon = UIImage(systemName: "forward.fill", withConfiguration: fastForwardIconConfig)
        button.setImage(fastForwardIcon, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var rewindButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        let rewindButtonIconConfig = UIImage.SymbolConfiguration(pointSize: 20)
        let rewindIcon = UIImage(systemName: "backward.fill", withConfiguration: rewindButtonIconConfig)
        button.setImage(rewindIcon, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    private lazy var shuffleButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        let shuffleButtonConfig = UIImage.SymbolConfiguration(pointSize: 24)
        let shuffleIcon = UIImage(systemName: "shuffle", withConfiguration: shuffleButtonConfig)
        button.setImage(shuffleIcon, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var queueButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        let shuffleButtonConfig = UIImage.SymbolConfiguration(pointSize: 24)
        let shuffleIcon = UIImage(systemName: "shuffle", withConfiguration: shuffleButtonConfig)
        button.setImage(shuffleIcon, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button

    }()

    private lazy var repeatButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        let repeatButtonConfig = UIImage.SymbolConfiguration(pointSize: 24)
        let repeatIcon = UIImage(systemName: "repeat", withConfiguration: repeatButtonConfig)
        button.setImage(repeatIcon, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        // StackView for Play, Forward, Backward, Pause
        let controlsStackView = UIStackView(arrangedSubviews: [rewindButton, playButton, fastForwardButton])
        controlsStackView.axis = .horizontal
        controlsStackView.alignment = .fill
        controlsStackView.distribution = .fillEqually
        controlsStackView.translatesAutoresizingMaskIntoConstraints = false
        controlsStackView.spacing = 3
        addSubview(controlsStackView)

        //MARK: StackView for Song Options
        let controlsStackView2 = UIStackView(arrangedSubviews: [repeatButton, shuffleButton, queueButton])
        controlsStackView2.axis = .horizontal
        controlsStackView2.alignment = .fill
        controlsStackView2.distribution = .fillEqually
        controlsStackView2.translatesAutoresizingMaskIntoConstraints = false
        controlsStackView2.spacing = 0
        addSubview(controlsStackView2)

        let marginLayoutGuide = layoutMarginsGuide

        NSLayoutConstraint.activate( [
            //MusicPlayer Horizontal StackView
            controlsStackView.topAnchor.constraint(equalTo: topAnchor, constant: 450),
            controlsStackView.leadingAnchor.constraint(equalTo: marginLayoutGuide.leadingAnchor, constant:  40),
            controlsStackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),

            //MusicStack2
            controlsStackView2.topAnchor.constraint(equalTo: topAnchor, constant: 460),
            controlsStackView2.leadingAnchor.constraint(equalTo: controlsStackView.trailingAnchor, constant: 58)
        ])
    }
}
