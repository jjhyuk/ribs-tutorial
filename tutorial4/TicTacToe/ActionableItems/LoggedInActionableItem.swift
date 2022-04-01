//
//  File.swift
//  TicTacToe
//
//  Created by Denver on 2022/04/01.
//  Copyright © 2022 Uber. All rights reserved.
//

import RxSwift

public protocol LoggedInActionableItem: class {
  func launchGame(with id: String?) -> Observable<(LoggedInActionableItem, ())>
}
