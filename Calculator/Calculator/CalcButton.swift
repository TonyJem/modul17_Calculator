import UIKit

enum ButtonColorScheme {
    case actionButton
    case primaryButton
    case secondaryButton
    
    var buttonBackgroundColor: UIColor{
        switch self {
        case .actionButton:
            return .orange
        case .primaryButton:
            return .cyan
        case .secondaryButton:
            return .darkGray
        }
    }
}

class CalcButton: UIButton {
    var title: String = ""
    var colorScheme: ButtonColorScheme = .primaryButton
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
