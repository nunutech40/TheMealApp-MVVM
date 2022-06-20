//
//  ErrorView.swift
//  TheMealApp-MVVM-Prodia
//
//  Created by mac on 17/4/22.
//

import UIKit

final class ErrorView: UIView {

    // MARK: - Public Properties

    var onRetryButtonTapped: (() -> Void)?

    // MARK: - Private Properties

    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var messageLabel: UILabel!

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        loadContentView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        loadContentView()
    }

    // MARK: - Public Methods

    func configureElementLocalization() {
        messageLabel.text = "Gagal Memua Data, Silahkan Coba Lagi."
    }

    // MARK: - Private Methods

    private func loadContentView() {

        UIView.loadFromNib(nibClass: ErrorView.self, owner: self)

        guard let contentView = contentView else {
            return
        }

        contentView.frame = self.bounds
        addSubview(contentView)

        configureElementLocalization()
    }

    @IBAction private func onRetryButtonTapped(sender: UIButton) {
        onRetryButtonTapped?()
    }
}
