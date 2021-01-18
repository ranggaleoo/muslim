// 
//  MainProtocols.swift
//  muslim
//
//  Created by Rangga Leo on 07/12/20.
//

import UIKit


// MARK: View -
protocol MainPresenterToView: class {
    var presenter: MainViewToPresenter? { get set }
    
    func setupViews()
    func reloadTableView()
    func updateIntevalView(remaining: String)
    func updateQiblaView(angle: Double)
    func didTapInfo()
    func showLoaderIndicator()
    func dismissLoaderIndicator()
}

// MARK: Interactor -
protocol MainPresenterToInteractor: class {
    var presenter: MainInteractorToPresenter?  { get set }
    
    func requestData()
}


// MARK: Router -
protocol MainPresenterToRouter: class {
    static func createMainModule() -> UIViewController
    func navigateToInfo(from: MainPresenterToView?)
}

// MARK: Presenter -
protocol MainViewToPresenter: class {
    var view: MainPresenterToView? {get set}
    var interactor: MainPresenterToInteractor? {get set}
    var router: MainPresenterToRouter? {get set}
    
    func didLoad()
    func numberOfRowsInSection() -> Int
    func cellForRowClock() -> MainClock?
    func cellForRowTimeTable() -> MainTimeTable?
    func cellForRowQibla() -> MainQibla?
    func navigateToInfo()
}

protocol MainInteractorToPresenter: class {
    func didGetPrayerTimes(times: MuslimPrayerTimes)
    func failGetPrayerTimes(title: String, message: String)
    func failGetLocation(title: String, message: String)
    func didGetQiblaDirection(angle: Double)
}
