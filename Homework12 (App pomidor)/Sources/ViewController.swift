//
//  ViewController.swift
//  Homework12 (App pomidor)
//
//  Created by Михаил Латий on 21.06.2023.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI Elements

    private lazy var timer: UILabel = {
        let timer = UILabel()
        timer.text = "25:00"
        timer.font = .systemFont(ofSize: 70, weight: .light)
        timer.textAlignment = .center
        timer.textColor = .white
        timer.translatesAutoresizingMaskIntoConstraints = false
        return timer
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
        view.addSubview(timer)
        view.addSubview(playOrPause)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            timer.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            timer.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            playOrPause.topAnchor.constraint(equalTo: timer.bottomAnchor, constant: 40),
            playOrPause.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playOrPause.widthAnchor.constraint(equalToConstant: 50)
        ])
    }

    // MARK: - Actions


}

