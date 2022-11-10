import XCTest

class WallaMarvelUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app.launch()
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testNavigation() {
        // Opens first item on ListHeroesViewController
        let threeDManPredicate = NSPredicate(format: "label beginswith '3-D Man'")
        app.tables.cells.staticTexts.element(matching: threeDManPredicate).tap()
        // Goes back to ListHeroesViewController
        app.navigationBars.buttons["List of Heroes"].tap()
        
        // Opens second item on ListHeroesViewController
        let aBombHASPredicate = NSPredicate(format: "label beginswith 'A-Bomb (HAS)'")
        app.tables.cells.staticTexts.element(matching: aBombHASPredicate).tap()
        
        // Goes back to ListHeroesViewController
        app.navigationBars.buttons["List of Heroes"].tap()
    }
    
    func testHEroDetailView() {
        // Opens first item on ListHeroesViewController
        let threeDManPredicate = NSPredicate(format: "label beginswith '3-D Man'")
        app.tables.cells.staticTexts.element(matching: threeDManPredicate).tap()
        
        // Checks if the Detail view contanins the following items
        XCTAssert(app.staticTexts["3-D Man"].exists)
        XCTAssert(app.staticTexts["COMICS"].exists)
        XCTAssert(app.staticTexts["SERIES"].exists)
    }
    
}
