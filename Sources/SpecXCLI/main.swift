import Foundation
import Dispatch

Task {
    await SpecXCLI.main()
    Foundation.exit(EXIT_SUCCESS)
}

dispatchMain()
