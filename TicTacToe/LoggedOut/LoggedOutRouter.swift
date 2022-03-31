//
//  LoggedOutRouter.swift
//  TicTacToe
//
//  Created by Denver on 2022/03/31.
//  Copyright © 2022 Uber. All rights reserved.
//

import RIBs

// 5) Interactor이 준수하는 Router와의 통신 프로토콜
// 6) Dependency Inversion

// 8) Interactor와 통신하기 위해, 필요한 것들을 나열한다.
protocol LoggedOutInteractable: Interactable {
    var router: LoggedOutRouting? { get set }
    var listener: LoggedOutListener? { get set }
}

// 9) 아래 프로토콜을 사용하여 ViewController와 통신
protocol LoggedOutViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class LoggedOutRouter: ViewableRouter<LoggedOutInteractable, LoggedOutViewControllable>, LoggedOutRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: LoggedOutInteractable, viewController: LoggedOutViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
