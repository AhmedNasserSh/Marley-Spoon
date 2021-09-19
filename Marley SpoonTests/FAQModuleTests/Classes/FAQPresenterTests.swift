//
//  FAQPresenterTests.swift
//  Marley SpoonTests
//
//  Created by Ahmed Naser on 19/09/2021.
//

import XCTest
@testable import Marley_Spoon

class FAQPresenterTests: XCTestCase {

    var presenter: FAQScenePresenter?
    var view: FAQViewMock?
    
    override func setUpWithError() throws {
        view = FAQViewMock()
        presenter = FAQScenePresenter(view: view!)
        
    }

    override func tearDownWithError() throws {
        view = nil
        presenter = nil
    }

    func testMapFAQs() {
        let expectation = self.expectation(description: "testMapFAQs")
        FAQServiceMock().getFAQSections(limit: 1, skip: 0) { result in
            switch result {
            case .success(let data):
                self.presenter?.displayFAQs(items: data)
                expectation.fulfill()
                XCTAssertTrue(self.view!.items.count  > 0, "Presenter doesn't display View")
                XCTAssertEqual(self.view!.items[0].title, "Offer",
                               "Presenter dosen't map to View data")
            case .failure:break
            }
        }
        wait(for: [expectation], timeout: 5)
    }

}
