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
        timer.font = .systemFont(ofSize: 84, weight: .bold)
        timer.textAlignment = .center
        timer.textColor = .black
        timer.translatesAutoresizingMaskIntoConstraints = false
        return timer
    }()

    private lazy var playOrPause: UIButton = {
        let playOrPause = UIButton(type: .system)
        let playIcon = UIImage(named: "playRed")
        playOrPause.setImage(playIcon, for: .normal)
        playOrPause.titleLabel?.font = .systemFont(ofSize: 20, weight: .heavy)
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

    }

    private func setupLayout() {

    }

    // MARK: - Actions


}

