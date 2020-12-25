    enum BasicOperation {
        case addition
        case subtraction
        case multiplication
        case division
        
        var selectedOperation: BasicOperation {
            switch self {
            case .addition:
                return BasicOperation.addition
            case .subtraction:
                return BasicOperation.subtraction
            case .multiplication:
                return BasicOperation.multiplication
            case .division:
                return BasicOperation.division
            }
        }
    }
