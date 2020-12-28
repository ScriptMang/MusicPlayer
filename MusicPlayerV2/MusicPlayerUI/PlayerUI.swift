//
//  PlayerUI.swift
//  MusicPlayerV2
//
//  Created by Andy Peralta on 12/21/20.
//

import UIKit

class PlayerUI: UIViewController {
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

    override func viewDidLoad() {
        super.viewDidLoad()

        // AlbumArt
        let musicHouseArt = UIImage(systemName: "music.note.house.fill")
        let albumArt = UIImageView(image: musicHouseArt)
        albumArt.translatesAutoresizingMaskIntoConstraints = false
        albumArt.backgroundColor  = .white
        view.addSubview(albumArt)

        // StackView for Play, Forward, Backward, Pause
        let musicStackView = UIStackView(arrangedSubviews: [rewindButton, playButton, fastForwardButton])
        musicStackView.axis = .horizontal
        musicStackView.alignment = .fill
        musicStackView.distribution = .fillEqually
        musicStackView.translatesAutoresizingMaskIntoConstraints = false
        musicStackView.spacing = 3
        view.addSubview(musicStackView)

        //MARK: StackView for Song Options
        let musicStackView2 = UIStackView(arrangedSubviews: [repeatButton, shuffleButton, queueButton])
        musicStackView2.axis = .horizontal
        musicStackView2.alignment = .fill
        musicStackView2.distribution = .fillEqually
        musicStackView2.translatesAutoresizingMaskIntoConstraints = false
        musicStackView2.spacing = 0
        view.addSubview(musicStackView2)

        let marginLayoutGuide = view.layoutMarginsGuide
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide

        let controlsView = PlayerControlsView(frame: .zero)
        view.addSubview(controlsView)

        NSLayoutConstraint.activate( [
            // Album Art
            albumArt.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            albumArt.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            safeAreaLayoutGuide.trailingAnchor.constraint(lessThanOrEqualTo: albumArt.trailingAnchor,  constant: 50),
            safeAreaLayoutGuide.bottomAnchor.constraint(greaterThanOrEqualTo: albumArt.bottomAnchor,  constant: 50),
            albumArt.heightAnchor.constraint(equalToConstant:  320),
            albumArt.widthAnchor.constraint(equalToConstant:  320),

            //MusicPlayer Horizontal StackView
            musicStackView.topAnchor.constraint(equalTo: albumArt.bottomAnchor, constant: 20),
            musicStackView.leadingAnchor.constraint(equalTo: marginLayoutGuide.leadingAnchor, constant:  50),
            musicStackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),

            //MusicStack2
            musicStackView2.topAnchor.constraint(equalTo:  albumArt.bottomAnchor, constant:  30),
            musicStackView2.leadingAnchor.constraint(equalTo: musicStackView.trailingAnchor, constant: 58)
        ])
    }
}
