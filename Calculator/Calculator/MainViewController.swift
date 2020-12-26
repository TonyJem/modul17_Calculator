import UIKit

// TODO: -1. Label can contain max: "999 999 999", if number is bigger it has to be turned into "7.901235e29" and operate with it. If anything wrong, just frop error to screen, that possible to delete with AC. As bigger number as smaller Fonts size comes <- need to do it flexible

class MainViewController: UIViewController {
    @IBOutlet private weak var backgroundView: UIView!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private var primaryButtons: [CalcButton]!
    @IBOutlet private var secondaryButtons: [CalcButton]!
    @IBOutlet private var actionButtons: [CalcButton]!
    
    // MARK: Properties:
    var currentOperation: BasicOperation? = nil
    var operandFirst: Double = 0
    var operandSecond: Double = 0
    
    var resultLabelIsEnabled: Bool = true {
        didSet {
            guard resultLabelIsEnabled else {
                setupLabelUI(for: resultLabel, with: .resultLabelNotActiveDTO)
                return
            }
            setupLabelUI(for: resultLabel, with: .resultLabelActiveDTO)
        }
    }
    
    private var currentLabelText: String = "" {
        didSet {
            resultLabel.text = currentLabelText
        }
    }
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        currentLabelText = "0"
        setupUI()
    }
    
    // MARK: - SetupUI Methods:
    private func setupUI() {
        setupViewUI(for: backgroundView)
        resultLabelIsEnabled = true
        setupAllButtonsUI()
    }
    
    private func setupViewUI(for view: UIView) {
        view.backgroundColor = Colors.applicationBackgroundColor
    }
      
    private func setupLabelUI(for label: UILabel, with dto: CalcLabelDTO) {
        label.textColor = dto.fontColor
        label.font = UIFont.systemFont(ofSize: dto.fontSize)
    }
    
    // MARK: - Calculation and Logic:
    private func calculate(_ operation: BasicOperation,
                           for operand1: Double,
                           with operand2: Double) -> Double {
            switch operation {
            case .addition:
                return operand1 + operand2
            case .subtraction:
                return operand1 - operand2
            case .multiplication:
                return operand1 * operand2
            case .division:
                return operand1 / operand2
            }
        }
    
    // MARK: - Actions:
    @IBAction func anyButtonTapped(_ sender: CalcButton) {
        sender.showAnimatedClick()
    }
    
    @IBAction func numericButtonTapped(_ sender: CalcButton) {
        guard currentLabelText != "0" else {
            currentLabelText = sender.explanation
            return
        }
        currentLabelText += sender.explanation
    }
    
    @IBAction func resetButtonTapped(_ sender: CalcButton) {
        currentLabelText = "0"
        resultLabelIsEnabled = true
        currentOperation = nil
    }
    
    @IBAction func squareRootButtonTapped(_ sender: CalcButton) {
    }
    
    @IBAction func percentButtonTapped(_ sender: CalcButton) {
    }
    
    @IBAction func basicOperationButtonTapped(_ sender: CalcButton) {
        guard let operation = sender.basicOperation else { return } // TODO: Throw Error if returned
        resultLabelIsEnabled = false
        if currentOperation == nil {
            currentOperation = operation
            print("🟢 Tapped operation is: \(operation)")
            print("🟢 There no previuose operations")
            
            if let value = Double(currentLabelText) {
                operandFirst = value
            } else {
                // TODO: Throw Error if can't unwrap
            }
            return
            
        } else {
            print("🟡 Tapped operation is: \(operation)")
            
            if let currentOperation = self.currentOperation {
                print("🟡 Previuose operation was: \(currentOperation)")
            } else {
                // TODO: Throw Error if can't unwrap
            }
            
            currentOperation = operation
        }
    }
    
    @IBAction func equalsButtonTapped(_ sender: CalcButton) {
    }
    
    @IBAction func decimalPointButtonTapped(_ sender: CalcButton) {
    }
    
    @IBAction func plusMinusButtonTapped(_ sender: CalcButton) {
    }
}

// MARK: - Buttons UI Setup:
extension MainViewController {
    private func setupAllButtonsUI() {
        setButtonsUI(for: primaryButtons, with: .primaryButtonDTO)
        setButtonsUI(for: secondaryButtons, with: .secondaryButtonDTO)
        setButtonsUI(for: actionButtons, with: .actionButtonActiveDTO)
    }

    private func setButtonsUI(for buttons: [CalcButton], with dto: CalcButtonDTO) {
        for button in buttons {
            setProperties(for: button)
            setFont(for: button, with: dto)
            setBackground(for: button, with: dto)
            setBorders(for: button, with: dto)
        }
    }
    
    private func setProperties(for button: CalcButton) {
        let buttonProperties = button.setProperties(for: button)
        button.title = buttonProperties.title
        button.explanation = buttonProperties.explanation
        button.setTitle(button.title, for: .normal)
    }
    
    private func setFont(for button: CalcButton, with dto: CalcButtonDTO) {
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: dto.fontSize)
        button.setTitleColor(dto.fontColor, for: .normal)
    }
    
    private func setBackground(for button: CalcButton, with dto: CalcButtonDTO) {
        button.backgroundColor = dto.backgroundColor
    }
    
    private func setBorders(for button: CalcButton, with dto: CalcButtonDTO) {
        button.layer.borderWidth = dto.borderWidth
        button.layer.borderColor = dto.borderColor.cgColor
        button.layer.cornerRadius = dto.cornerRadius
    }
}
