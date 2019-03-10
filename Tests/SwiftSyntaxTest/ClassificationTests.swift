import XCTest
import SwiftSyntax

public class ClassificationTests: XCTestCase {
  public static let allTests = [
    ("testClassification", testClassification),
  ]

  public func testClassification() {
    let source = "// blah.\nlet x/*yo*/ = 0"
    let tree = try! SyntaxParser.parse(source: source)
    do {
      let classif = Array(tree.classifications)
      XCTAssertEqual(classif.count, 7)
      guard classif.count == 7 else {
        return
      }
      XCTAssertEqual(classif[0].kind, .lineComment)
      XCTAssertEqual(classif[0].range, ByteSourceRange(offset: 0, length: 8))
      XCTAssertEqual(classif[1].kind, .none)
      XCTAssertEqual(classif[1].range, ByteSourceRange(offset: 8, length: 1))
      XCTAssertEqual(classif[2].kind, .keyword)
      XCTAssertEqual(classif[2].range, ByteSourceRange(offset: 9, length: 3))
      XCTAssertEqual(classif[3].kind, .none)
      XCTAssertEqual(classif[3].range, ByteSourceRange(offset: 12, length: 2))
      XCTAssertEqual(classif[4].kind, .blockComment)
      XCTAssertEqual(classif[4].range, ByteSourceRange(offset: 14, length: 6))
      XCTAssertEqual(classif[5].kind, .none)
      XCTAssertEqual(classif[5].range, ByteSourceRange(offset: 20, length: 3))
      XCTAssertEqual(classif[6].kind, .integerLiteral)
      XCTAssertEqual(classif[6].range, ByteSourceRange(offset: 23, length: 1))
    }
    do {
      let classif = Array(tree.classifications(in: ByteSourceRange(offset: 7, length: 8)))
      XCTAssertEqual(classif.count, 5)
      guard classif.count == 5 else {
        return
      }
      XCTAssertEqual(classif[0].kind, .lineComment)
      XCTAssertEqual(classif[0].range, ByteSourceRange(offset: 0, length: 8))
      XCTAssertEqual(classif[1].kind, .none)
      XCTAssertEqual(classif[1].range, ByteSourceRange(offset: 8, length: 1))
      XCTAssertEqual(classif[2].kind, .keyword)
      XCTAssertEqual(classif[2].range, ByteSourceRange(offset: 9, length: 3))
      XCTAssertEqual(classif[3].kind, .none)
      XCTAssertEqual(classif[3].range, ByteSourceRange(offset: 12, length: 2))
      XCTAssertEqual(classif[4].kind, .blockComment)
      XCTAssertEqual(classif[4].range, ByteSourceRange(offset: 14, length: 6))
    }
    do {
      let classif = Array(tree.classifications(in: ByteSourceRange(offset: 21, length: 1)))
      XCTAssertEqual(classif.count, 1)
      guard classif.count == 1 else {
        return
      }
      XCTAssertEqual(classif[0].kind, .none)
      XCTAssertEqual(classif[0].range, ByteSourceRange(offset: 20, length: 3))
    }
    do {
      let initializer = (tree.statements[0].item as! VariableDeclSyntax).bindings[0].initializer!
      XCTAssertEqual(initializer.description, "/*yo*/ = 0")
      // Classify with a relative range inside this node.
      let classif = Array(initializer.classifications(in: ByteSourceRange(offset: 5, length: 2)))
      XCTAssertEqual(classif.count, 2)
      guard classif.count == 2 else {
        return
      }
      XCTAssertEqual(classif[0].kind, .blockComment)
      XCTAssertEqual(classif[0].range, ByteSourceRange(offset: 14, length: 6))
      XCTAssertEqual(classif[1].kind, .none)
      XCTAssertEqual(classif[1].range, ByteSourceRange(offset: 20, length: 3))

      do {
        let singleClassif = initializer.classification(at: 5)
        XCTAssertEqual(singleClassif, classif[0])
      }
      do {
        let singleClassif = initializer.classification(at: AbsolutePosition(utf8Offset: 19))
        XCTAssertEqual(singleClassif, classif[0])
      }
    }

    do {
      let source = "func foo() {}"
      let tree = try! SyntaxParser.parse(source: source)
      // For `classification(at:)` there's an initial walk to find the token that
      // the offset is contained in and the classified ranges are processed from that
      // token. That means that a `none` classified range would be restricted inside
      // the token range.
      let classif = tree.classification(at: 11)!
      XCTAssertEqual(classif.kind, .none)
      XCTAssertEqual(classif.range, ByteSourceRange(offset: 11, length: 1))
    }
  }
}
