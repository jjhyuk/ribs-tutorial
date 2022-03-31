//
//  LoggedInViewController.swift
//  TicTacToe
//
//  Created by Denver on 2022/03/31.
//  Copyright © 2022 Uber. All rights reserved.
//

import RIBs
import RxSwift
import UIKit

protocol LoggedInPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class LoggedInViewController: UIViewController, LoggedInPresentable, LoggedInViewControllable {

    weak var listener: LoggedInPresentableListener?
}
