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

    private lazy var albumImageView: UIImageView = {
        let albumArtImage = UIImage(systemName: "music.note.house.fill")
        let imageView = UIImageView(image: albumArtImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor  = .white
        return imageView
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
        return label
    }()

    private lazy var trackStackView: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [songTitle, artist])
        stackview.axis = .vertical
        stackview.alignment = .leading
        stackview.distribution = .equalSpacing
        stackview.spacing = 20
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
        stackView.distribution = .fill
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
        slider.backgroundColor = .black
        slider.tintColor = .white
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)

        UIView.animate(withDuration: 0.8) {
            slider.setValue(80.0, animated: true)
        }
        return slider
    }()

    func delay(_ delay: Double, closure: @escaping () -> ()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)

    }

    @objc func sliderValueChanged(_ sender: UISlider!) {
        let step: Float = 10.0
        let approximateStepVal =  round(sender.value / step) * step
        sender.value = approximateStepVal

    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // Add Views

        for sub in [albumTitle, albumImageView, trackStackView, progressStackView, volumeStack, volumeSlider] {
            addSubview(sub)
            sub.translatesAutoresizingMaskIntoConstraints = false
        }

        // Setup Constraints
        NSLayoutConstraint.activate([
            // Album Title
            albumTitle.topAnchor.constraint(equalTo: topAnchor),
            albumTitle.centerXAnchor.constraint(equalTo: centerXAnchor),

            // Album Art
            albumImageView.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            albumImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            safeAreaLayoutGuide.trailingAnchor.constraint(lessThanOrEqualTo: albumImageView.trailingAnchor,  constant: 50),
            safeAreaLayoutGuide.bottomAnchor.constraint(greaterThanOrEqualTo: albumImageView.bottomAnchor,  constant: 50),
            albumImageView.heightAnchor.constraint(equalToConstant:  320),
            albumImageView.widthAnchor.constraint(equalToConstant:  320),

            //TrackStackView
            trackStackView.topAnchor.constraint(equalTo: albumImageView.bottomAnchor),
            trackStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant:  50),

            //Volume StackView
            volumeStack.topAnchor.constraint(equalTo:  trackStackView.topAnchor),
            volumeStack.leadingAnchor.constraint(equalTo: trackStackView.trailingAnchor, constant:  120),
            volumeStack.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -10),
            volumeStack.bottomAnchor.constraint(greaterThanOrEqualTo: trackStackView.bottomAnchor),

            //ProgressStackView
            progressStackView.topAnchor.constraint(equalTo: trackStackView.bottomAnchor, constant: 30),
            progressStackView.leadingAnchor.constraint(equalTo: trackStackView.leadingAnchor),
            progressStackView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),

            // Inside the PorgressStackView
            progressBar.widthAnchor.constraint(equalToConstant: 250),
            progressBar.heightAnchor.constraint(equalToConstant: 3),

            //VolumeTouchBar
            volumeSlider.topAnchor.constraint(equalTo: progressStackView.bottomAnchor, constant: 15),
            volumeSlider.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 50),
            volumeSlider.widthAnchor.constraint(equalToConstant: 330),
            volumeSlider.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            volumeSlider.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -5)
        ])
    }
}
