import UIKit

class CompetitionListCollectionViewCell: UICollectionViewCell {
    private let crest = UIImageView()
    private let content = UIView()
    private let container = UIStackView()
    private let name = UILabel()
    private let season = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.buildViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildViews() {
        self.addSubviews()
        self.formatSubviews()
        self.addConstraintsToSubviews()
    }

    private func addSubviews() {
        self.container.addArrangedSubviews([self.name,
                                            self.season])
        self.content.addSubview(self.container)
        self.contentView.addSubviews([self.crest,
                                      self.content])
    }

    private func formatSubviews() {
        self.contentView.layer.cornerRadius = 16
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = UIColor.gray.cgColor
        
        self.crest.clipsToBounds = true
        self.crest.contentMode = .scaleAspectFit
        
        self.content.layer.cornerRadius = 16
        self.content.layer.borderColor = UIColor.gray.cgColor
        self.content.layer.borderWidth = 0.5
        
        self.container.alignment = .center
        self.container.spacing = 8
        self.container.translatesAutoresizingMaskIntoConstraints = false
        self.container.axis = .vertical
        
        self.name.setContentHuggingPriority(.defaultHigh, for: .vertical)
        self.name.numberOfLines = 0
        self.name.textAlignment = .center
        self.name.textColor = .black
        self.name.font = .systemFont(ofSize: 16)
        
        self.season.textColor = .gray
        self.season.font = .systemFont(ofSize: 12)
        self.season.textAlignment = .center
    }
    
    private func addConstraintsToSubviews() {
        crest.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(8)
            make.height.equalTo(144)
        }
        
        content.snp.makeConstraints { make in
            make.top.equalTo(self.crest.snp.bottom).offset(8)
            make.left.right.bottom.equalToSuperview()
        }
        
        container.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(16)
            make.left.right.equalToSuperview().inset(8)
        }
    }
}

extension CompetitionListCollectionViewCell {
    func set(viewModel: CompetitionViewModel) {
        self.crest.image = viewModel.crest
        self.name.text = viewModel.name
        self.season.text = viewModel.currentSeason.year
    }
}
