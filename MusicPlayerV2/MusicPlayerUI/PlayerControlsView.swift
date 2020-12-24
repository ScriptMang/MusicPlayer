//
//  PlayerControlsView.swift
//  MusicPlayerV2
//
//  Created by Andy Peralta on 12/22/20.
//

import UIKit

class PlayerControlsView: UIView {

    private lazy var albumTitle: UILabel = {
        let albumLabel = UILabel()
        albumLabel.text = "AlbumTitle"
        albumLabel.font = UIFont(name: "Hiragino Mincho ProN W3", size:  30.0)
        albumLabel.sizeToFit()
        return albumLabel
    }()

    private lazy var songTitle: UILabel = {
        let songLabel = UILabel()
        songLabel.text = "SongTitle"
        songLabel.font = UIFont(name: "Hiragino Mincho ProN W3", size:  30.0)
        return songLabel
    }()

    private lazy var artist: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Hiragino Mincho ProN W3", size:  25.0)
        label.text = "Artist"
        label.sizeToFit()
        return label
    }()

    private lazy var trackStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [songTitle, artist])
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .equalSpacing

        stackview.spacing = 15
        return stackview
    }()

    private lazy var startTime: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Hiragino Mincho ProN W3", size:  17.0)
        label.text = "0:00 "
        label.sizeToFit()
        return label
    }()

    private lazy var endTime: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Hiragino Mincho ProN W3", size:  17.0)
        label.text = " 0:00"
        label.sizeToFit()
        return label
    }()

    private lazy var progressBar: UIProgressView = {
        let pgBar = UIProgressView(progressViewStyle: .bar)
        pgBar.progress = 0.10
        pgBar.progressTintColor = .white
        pgBar.backgroundColor = .gray
        return pgBar
    }()

    private lazy var progressStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [startTime, progressBar, endTime])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.sizeToFit()
        return stackView
    }()

    private lazy var volumeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        let volumeButtonConfig = UIImage.SymbolConfiguration(pointSize: 32)
        let volumeIcon = UIImage(systemName: "speaker.wave.2.circle", withConfiguration: volumeButtonConfig)
        button.setImage(volumeIcon, for: .normal)
        return button
    }()

    private lazy var volumePercentage: UILabel = {
        let label = UILabel()
        label.text = "100%"
        label.textAlignment = .center
        return label
    }()

    private lazy var volumeStack: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [volumeButton, volumePercentage])
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .equalSpacing
        stackview.spacing = 15
        return stackview
    }()

    private lazy var volumeSlider: UISlider = {
        let slider = UISlider()
        slider.maximumValue = 100.0
        slider.minimumValue = 1.0
        slider.isContinuous = true
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.backgroundColor = .darkGray
        slider.tintColor = .white
        return slider
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // Add Views

        for sub in [albumTitle, trackStackView, progressStackView, volumeStack, volumeSlider] {
            addSubview(sub)
            sub.translatesAutoresizingMaskIntoConstraints = false
        }

        let marginLayoutGuide = self.layoutMarginsGuide
        let safeAreaLayoutGuide = self.safeAreaLayoutGuide

        // Setup Constraints
        NSLayoutConstraint.activate([
            // Album Title
            albumTitle.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            albumTitle.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 140),
            albumTitle.trailingAnchor.constraint(greaterThanOrEqualTo: marginLayoutGuide.trailingAnchor, constant: 30),

            //TrackStackView
            trackStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 550),
            trackStackView.leadingAnchor.constraint(equalTo: marginLayoutGuide.leadingAnchor, constant:  50),

            //Volume StackView
            volumeStack.topAnchor.constraint(equalTo:  trackStackView.topAnchor),
            volumeStack.leadingAnchor.constraint(greaterThanOrEqualTo: marginLayoutGuide.leadingAnchor, constant:  300),
            volumeStack.bottomAnchor.constraint(greaterThanOrEqualTo: trackStackView.bottomAnchor),

            //ProgressStackView
            progressStackView.topAnchor.constraint(lessThanOrEqualTo: trackStackView.bottomAnchor, constant: 30),
            progressStackView.leadingAnchor.constraint(greaterThanOrEqualTo: marginLayoutGuide.leadingAnchor, constant: 50),
            progressStackView.trailingAnchor.constraint(greaterThanOrEqualTo: marginLayoutGuide.trailingAnchor),

            // Inside the PorgressStackView
            progressBar.widthAnchor.constraint(equalToConstant: 250),
            progressBar.heightAnchor.constraint(equalToConstant: 3),

            //VolumeTouchBar
            volumeSlider.topAnchor.constraint(equalTo: progressStackView.bottomAnchor, constant: 40),
            volumeSlider.leadingAnchor.constraint(greaterThanOrEqualTo: marginLayoutGuide.leadingAnchor, constant: 50),
            volumeSlider.widthAnchor.constraint(equalToConstant: 330),
            volumeSlider.heightAnchor.constraint(equalToConstant: 5),
            volumeSlider.trailingAnchor.constraint(greaterThanOrEqualTo: progressStackView.trailingAnchor),
            progressStackView.bottomAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
