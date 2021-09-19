//
//  FAQInteractorTests.swift
//  Marley SpoonTests
//
//  Created by Ahmed Naser on 19/09/2021.
//

import XCTest
@testable import Marley_Spoon

class FAQInteractorTests: XCTestCase {

    var interactor: FAQSceneInteractor?
    var presenterMock: FAQPresenterMock?
    var workerMock: FAQSceneWorkerType?

    override func setUpWithError() throws {
        presenterMock = FAQPresenterMock()
        workerMock = FAQSceneWorker(service: FAQServiceMock())

        presenterMock?.view = FAQViewMock()
        interactor = FAQSceneInteractor(presenter: presenterMock!, worker: workerMock!, limit: 2)
    }

    override func tearDownWithError() throws {
        interactor = nil
        presenterMock = nil
        workerMock = nil
    }

    func testFetchFAQs() throws {
        // fetch FAQs
        interactor?.getFAQs()
        XCTAssertTrue(presenterMock!.items.count > 0, "Interactor doesn't Fetch data correctly")
    }
    
    func testExpandItems() throws {
        interactor?.setExpanded(section: 0, items: [], id: "")
        XCTAssertTrue(presenterMock!.didSetExpanded , "Interactor doesn't expand Cell correctly")
    }


}
