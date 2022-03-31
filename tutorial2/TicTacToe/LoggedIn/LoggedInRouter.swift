//
//  LoggedInRouter.swift
//  TicTacToe
//
//  Created by Denver on 2022/03/31.
//  Copyright © 2022 Uber. All rights reserved.
//

import RIBs

protocol LoggedInInteractable: Interactable, OffGameListener {
  var router: LoggedInRouting? { get set }
  var listener: LoggedInListener? { get set }
}

protocol LoggedInViewControllable: ViewControllable {
  // TODO: Declare methods the router invokes to manipulate the view hierarchy. Since
  // this RIB does not own its own view, this protocol is conformed to by one of this
  // RIB's ancestor RIBs' view.
  func present(viewController: ViewControllable)
  func dismiss(viewController: ViewControllable)
}

final class LoggedInRouter: Router<LoggedInInteractable>, LoggedInRouting {
  
  // TODO: Constructor inject child builder protocols to allow building children.
  init(interactor: LoggedInInteractable,
       viewController: LoggedInViewControllable,
       offGameBuilder: OffGameBuildable) {
    self.viewController = viewController
    self.offGameBuilder = offGameBuilder
    super.init(interactor: interactor)
    interactor.router = self
  }
  
  override func didLoad() {
    super.didLoad()
    attachOffGame()
  }
  
  func cleanupViews() {
    // TODO: Since this router does not own its view, it needs to cleanup the views
    // it may have added to the view hierarchy, when its interactor is deactivated.
    
    if let currentChild = currentChild {
      viewController.dismiss(viewController: currentChild.viewControllable)
    }
  }
  
  // MARK: - Private
  
  private let viewController: LoggedInViewControllable
  private let offGameBuilder: OffGameBuildable
  
  // MARK: - Private
  
  private var currentChild: ViewableRouting?
  
  private func attachOffGame() {
    let offGame = offGameBuilder.build(withListener: interactor)
    self.currentChild = offGame
    attachChild(offGame)
    viewController.present(viewController: offGame.viewControllable)
  }

  func routeToOffGame() {
      detachCurrentChild()
      attachOffGame()
  }
  
  func routeToTicTacToe() {
    
  }
  
  private func detachCurrentChild() {
      if let currentChild = currentChild {
          detachChild(currentChild)
          viewController.dismiss(viewController: currentChild.viewControllable)
      }
  }
}
