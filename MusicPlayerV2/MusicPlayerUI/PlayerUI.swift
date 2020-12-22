//
//  PlayerUI.swift
//  MusicPlayerV2
//
//  Created by Andy Peralta on 12/21/20.
//

import UIKit

class PlayerUI: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let v1 = UIView()
        v1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(v1)

        // AlbumArt
        let musicHouseArt = UIImage(systemName: "music.note.house.fill")
        let albumArt = UIImageView(image: musicHouseArt)
        albumArt.translatesAutoresizingMaskIntoConstraints = false
        albumArt.backgroundColor  = .white
        view.addSubview(albumArt)
        
        // MARK: Music Control Buttons
        let playButton = UIButton(type: .system)
        playButton.tintColor = .white
        let playIconConfig = UIImage.SymbolConfiguration(pointSize: 40)
        let playIcon = UIImage(systemName: "play.fill", withConfiguration: playIconConfig)
        let pauseIcon = UIImage(systemName: "pause.fill")
        playButton.setImage(playIcon, for: .normal)
        playButton.setImage(pauseIcon, for: .highlighted)
        playButton.translatesAutoresizingMaskIntoConstraints = false

        let fastForwardButton = UIButton(type: .system)
        fastForwardButton.tintColor = .white
        let fastForwardIconConfig = UIImage.SymbolConfiguration(pointSize: 20)
        let fastForwardIcon = UIImage(systemName: "forward.fill", withConfiguration: fastForwardIconConfig)
        fastForwardButton.setImage(fastForwardIcon, for: .normal)
        fastForwardButton.translatesAutoresizingMaskIntoConstraints = false

        let rewindButton = UIButton(type: .system)
        rewindButton.tintColor = .white
        let rewindButtonConfig = UIImage.SymbolConfiguration(pointSize: 20)
        let rewindIcon = UIImage(systemName: "backward.fill", withConfiguration: rewindButtonConfig)
        rewindButton.setImage(rewindIcon, for: .normal)
        rewindButton.translatesAutoresizingMaskIntoConstraints = false

        // Song Options
        let shuffleButton = UIButton(type: .system)
        shuffleButton.tintColor = .white
        let shuffleButtonConfig = UIImage.SymbolConfiguration(pointSize: 24)
        let shuffleIcon = UIImage(systemName: "shuffle", withConfiguration: shuffleButtonConfig)
        shuffleButton.setImage(shuffleIcon, for: .normal)
        shuffleButton.translatesAutoresizingMaskIntoConstraints = false

        let queueButton = UIButton(type: .system)
        queueButton.tintColor = .white
        let queueButtonConfig = UIImage.SymbolConfiguration(pointSize: 24)
        let queueIcon = UIImage(systemName: "list.dash", withConfiguration: queueButtonConfig)
        queueButton.setImage(queueIcon, for: .normal)
        queueButton.translatesAutoresizingMaskIntoConstraints = false

        let repeatButton = UIButton(type: .system)
        repeatButton.tintColor = .white
        let repeatButtonConfig = UIImage.SymbolConfiguration(pointSize: 24)
        let repeatIcon = UIImage(systemName: "repeat", withConfiguration: repeatButtonConfig)
        repeatButton.setImage(repeatIcon, for: .normal)
        repeatButton.translatesAutoresizingMaskIntoConstraints = false

        // StackView for Play, Forward, Backward, Pause
        let musicStackView = UIStackView(arrangedSubviews: [rewindButton, playButton, fastForwardButton])
        musicStackView.axis = .horizontal
        musicStackView.alignment = .fill
        musicStackView.distribution = .fillEqually
        musicStackView.translatesAutoresizingMaskIntoConstraints = false
        musicStackView.spacing = 0
        self.view.addSubview(musicStackView)

        //MARK: StackView for Song Options
        let musicStackView2 = UIStackView(arrangedSubviews: [repeatButton, shuffleButton, queueButton])
        musicStackView2.axis = .horizontal
        musicStackView2.alignment = .fill
        musicStackView2.distribution = .fillEqually
        musicStackView2.translatesAutoresizingMaskIntoConstraints = false
        musicStackView2.spacing = 0
        self.view.addSubview(musicStackView2)

        let marginLayoutGuide = self.view.layoutMarginsGuide
        let safeAreaLayoutGuide = self.view.safeAreaLayoutGuide

        NSLayoutConstraint.activate( [
            // Album Art
            albumArt.topAnchor.constraint(equalTo: v1.topAnchor, constant: 120),
            albumArt.leadingAnchor.constraint(equalTo: v1.leadingAnchor, constant: 50),
            albumArt.heightAnchor.constraint(equalToConstant:  320),
            albumArt.widthAnchor.constraint(equalToConstant:  320),

            //MusicPlayer Horizontal StackView
            musicStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 450),
            musicStackView.leadingAnchor.constraint(equalTo: marginLayoutGuide.leadingAnchor, constant:  50),
            musicStackView.bottomAnchor.constraint(lessThanOrEqualTo: self.view.bottomAnchor),

            //MusicStack2
            musicStackView2.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant:  460),
            musicStackView2.leadingAnchor.constraint(equalTo: marginLayoutGuide.leadingAnchor, constant: 250)
        ])
    }
}
