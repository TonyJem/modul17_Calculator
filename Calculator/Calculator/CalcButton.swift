import UIKit

enum ButtonColorScheme {
    case actionButton
    case primaryButton
    case secondaryButton
}

class CalcButton: UIButton {
    var title: String = ""
    var colorScheme: ButtonColorScheme = .primaryButton
    
    private var buttonBackgroundColor: UIColor{
        switch colorScheme {
        case .actionButton:
            return .orange
        case .primaryButton:
            return .cyan
        case .secondaryButton:
            return .darkGray
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
    }
}
