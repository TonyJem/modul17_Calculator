import UIKit

// TODO: -1. Label can contain max: "999 999 999", if number is bigger it has to be turned into "7.901235e29" and operate with it. If anything wrong, just frop error to screen, that possible to delete with AC. As bigger number as smaller Fonts size comes <- need to do it flexible

class MainViewController: UIViewController {
    @IBOutlet private weak var backgroundView: UIView!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private var primaryButtons: [CalcButton]!
    @IBOutlet var secondaryButtons: [CalcButton]!
    @IBOutlet var actionButtons: [CalcButton]!
    
    // MARK: Properties:
    
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Methods:
    private func setupUI() {
        setupViewUI(for: backgroundView)
        setupLabelUI(for: resultLabel)
        setupButtonsUI(for: primaryButtons, with: .primaryButtonBackground)
        setupButtonsUI(for: secondaryButtons, with: .secondaryButtonBackground)
        setupButtonsUI(for: actionButtons, with: .actionButtonActiveBackground)
    }
    
    private func setupViewUI(for view: UIView) {
        view.backgroundColor = Colors.applicationBackgroundColor
    }
      
    private func setupLabelUI(for label: UILabel) {
        label.textColor = CalcLabelDTO.resultLabelActive.fontColor
        label.font = UIFont.systemFont(ofSize: CalcLabelDTO.resultLabelActive.fontSize)
    }
    
    private func setupButtonsUI(for buttons: [CalcButton], with background: ButtonBackground) {
        for button in buttons {
            createTitle(for: button)
            setBackground(for: button, with: background)
        }
    }
    
    private func createTitle(for button: CalcButton) {
            button.setTitle(button.titleToShow, for: .normal)
    }
    
    private func setBackground(for button: CalcButton, with background: ButtonBackground) {
        button.backgroundColor = background.color
    }
    
    // MARK: Actions:
    @IBAction func numericButtonTapped(_ sender: CalcButton) {
    }
    
    @IBAction func resetButtonTapped(_ sender: CalcButton) {
    }
    
    @IBAction func squareroot(_ sender: CalcButton) {
    }
    
    @IBAction func percentButtonTapped(_ sender: CalcButton) {
    }
    
    @IBAction func basicOperationButtonTapped(_ sender: CalcButton) {
    }
    
    @IBAction func equalsButtonTapped(_ sender: CalcButton) {
    }
    
    @IBAction func decimalpointButtonTapped(_ sender: CalcButton) {
    }
    
    @IBAction func plusminusButtonTapped(_ sender: CalcButton) {
    }
}
