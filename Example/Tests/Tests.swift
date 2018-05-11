// https://github.com/Quick/Quick

import Quick
import Nimble
import SafeBootRecord

class SafeBootRecordSpec: QuickSpec {
  override func spec() {
    describe("a safe boot record") {
      
      beforeEach {
        let record = BootRecord()
        expect(record.markFinish()) == true
        expect(record.didBootSuccessfully) == true
      }
      
      it("assumes a successful boot") {
        let record = BootRecord()
        expect(record.didBootSuccessfully) == true
      }
      
      it("can mark a boot start and finish") {
        let record = BootRecord()
        expect(record.markStart()) == true
        expect(record.markFinish()) == true
      }

      it("marks boot start and finish with success as expected") {
        let record = BootRecord()
        expect(record.markStart()) == true
        expect(record.didBootSuccessfully) == false
        expect(record.markFinish()) == true
        expect(record.didBootSuccessfully) == true
      }
    }
  }
}
