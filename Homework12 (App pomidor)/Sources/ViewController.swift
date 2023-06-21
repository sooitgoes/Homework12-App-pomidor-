//
//  ViewController.swift
//  Homework12 (App pomidor)
//
//  Created by Михаил Латий on 21.06.2023.
//

import UIKit

class ViewController: UIViewController {

    private var timer = Timer()
    private var durationTimer = 25
    private var isWork = true
    private var isStart = false

    // MARK: - UI Elements
    private lazy var timerLabel: UILabel = {
        let timerLabel = UILabel()
        timerLabel.text = "\(durationTimer):00"
        timerLabel.font = .systemFont(ofSize: 70, weight: .light)
        timerLabel.textAlignment = .center
        timerLabel.textColor = .white
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        return timerLabel
    }()

    private lazy var playOrPause: UIButton = {
        let playOrPause = UIButton()
        let playIcon = UIImage(named: "playRed")
        playOrPause.setImage(playIcon, for: .normal)
        playOrPause.translatesAutoresizingMaskIntoConstraints = false
        return playOrPause
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setups
    private func setupView() {
        view.backgroundColor = .black
    }

    private func setupHierarchy() {
        view.addSubview(timerLabel)
        view.addSubview(playOrPause)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            timerLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            playOrPause.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 40),
            playOrPause.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playOrPause.widthAnchor.constraint(equalToConstant: 50)
        ])
    }

    // MARK: - Actions


}

