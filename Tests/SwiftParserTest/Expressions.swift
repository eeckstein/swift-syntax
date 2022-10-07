@_spi(RawSyntax) import SwiftSyntax
@_spi(RawSyntax) import SwiftParser
import XCTest

final class ExpressionTests: XCTestCase {
  func testTernary() {
    AssertParse(
      "let a =1️⃣",
      diagnostics: [
        DiagnosticSpec(message: "expected expression in variable")
      ]
    )

    AssertParse("a ? b : c ? d : e")
    AssertParse(
      "a ? b :1️⃣",
      diagnostics: [
        DiagnosticSpec(message: "expected expression")
      ]
    )
  }

  func testSequence() {
    AssertParse(
       "A as? B + C -> D is E as! F ? G = 42 : H"
    )
  }

  func testClosureLiterals() {
    AssertParse(
      #"""
      { @MainActor (a: Int) async -> Int in print("hi") }
      """#
    )

    AssertParse(
      """
      { [weak self, weak weakB = b] foo in
        return 0
      }
      """
    )
  }

  func testTrailingClosures() {
    AssertParse(
      """
      var button =  View.Button[5, 4, 3
      ] {
        // comment #0
        Text("ABC")
      }
      """
    )

    AssertParse("compactMap { (parserDiag) in }")
  }

  func testSequenceExpressions() {
    AssertParse("await a()")
    AssertParse(
      """
      async let child = testNestedTaskPriority(basePri: basePri, curPri: curPri)
      await child
      """)
  }

  func testNestedTypeSpecialization() {
    AssertParse("Swift.Array<Array<Foo>>()")
  }

  func testObjectLiterals() {
    AssertParse(
      """
      #colorLiteral()
      #colorLiteral(red: 1.0)
      #colorLiteral(red: 1.0, green: 1.0)
      #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
      """
    )

    AssertParse(
      """
      #imageLiteral()
      #imageLiteral(resourceName: "foo.png")
      #imageLiteral(resourceName: "foo/bar/baz/qux.png")
      #imageLiteral(resourceName: "foo/bar/baz/quux.png")
      """
    )
  }

  func testKeypathExpression() {
    AssertParse(
      #"""
      children.filter(\.type.defaultInitialization.isEmpty)
      """#
    )

    AssertParse(
      #"""
      \a
      cℹ️[1️⃣
      """#,
      diagnostics: [
        DiagnosticSpec(message: "expected value in subscript"),
        DiagnosticSpec(message: "expected ']' to end subscript", notes: [
          NoteSpec(message: "to match this opening '['")
        ]),
      ]
    )

    AssertParse(
      #"""
      _ = \Lens<[Int]>.[0]
      """#)

    AssertParse(
      #"""
      \(UnsafeRawPointer?, String).1
      """#
    )

    AssertParse(
      #"""
      \a.b.c
      """#
    )

    AssertParse(
      #"""
      \ABCProtocol[100]
      """#
    )

    AssertParse(
      #"""
      \S<T>.x
      """#
    )

    AssertParse(
      #"""
      \TupleProperties.self
      """#
    )

    AssertParse(
      #"""
      \Tuple<Int, Int>.self
      """#
    )

    AssertParse(
      #"""
      \T.extension
      """#
    )

    AssertParse(
      #"""
      \T.12[14]
      """#
    )

    AssertParse(
      #"""
      \String?.!.count.?
      """#
    )

    AssertParse(
      #"""
      \Optional.?!?!?!?
      """#
    )

    AssertParse(
      #"""
      \Optional.?!?!?!?.??!
      """#
    )
  }

  func testBasicLiterals() {
    AssertParse(
      """
      #file
      #fileID
      (#line)
      #column
      #function
      #dsohandle
      __FILE__
      __LINE__
      __COLUMN__
      __FUNCTION__
      __DSO_HANDLE__
      """
    )
  }

  func testRegexLiteral() {
    AssertParse(
      #"""
      /(?<identifier>[[:alpha:]]\w*) = (?<hex>[0-9A-F]+)/
      """#
    )
  }

  func testInitializerExpression() {
    AssertParse("Lexer.Cursor(input: input, previous: 0)")
  }

  func testCollectionLiterals() {
    AssertParse("[Dictionary<String, Int>: Int]()")
    AssertParse("[(Int, Double) -> Bool]()")
    AssertParse("[(Int, Double) -> Bool]()")
    AssertParse("_ = [@convention(block) ()  -> Int]().count")
    AssertParse("A<@convention(c) () -> Int32>.c()")
    AssertParse("A<(@autoclosure @escaping () -> Int, Int) -> Void>.c()")
    AssertParse("_ = [String: (@escaping (A<B>) -> Int) -> Void]().keys")

    AssertParse(
      """
      [
        condition ? firstOption : secondOption,
        bar(),
      ]
      """
    )

    AssertParse(
      """
      [1️⃣
        ,2️⃣
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected value in array element"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected ']' to end array"),
      ]
    )

    AssertParse(
      """
      ([1:1️⃣)
      """,
      diagnostics: [
        DiagnosticSpec(message: "expected value in dictionary element"),
        DiagnosticSpec(message: "expected ']' to end dictionary"),
      ]
    )

    AssertParse(
      """
      [
        #line : Calendar(identifier: .gregorian),
        1️⃣#line : Calendar(identifier: .buddhist),
      ]
      """,
      substructure: Syntax(DictionaryElementSyntax.init(
        keyExpression: ExprSyntax(PoundLineExprSyntax(poundLine: .poundLineKeyword())),
        colon: .colonToken(),
        valueExpression: ExprSyntax(FunctionCallExprSyntax(
          calledExpression: ExprSyntax(IdentifierExprSyntax(identifier: .identifier("Calendar"), declNameArguments: nil)),
          leftParen: .leftParenToken(),
          argumentList: TupleExprElementListSyntax([
            TupleExprElementSyntax(
              label: .identifier("identifier"),
              colon: .colonToken(),
              expression: ExprSyntax(MemberAccessExprSyntax(
                base: nil,
                dot: .prefixPeriodToken(),
                name: .identifier("buddhist"),
                declNameArguments: nil)),
              trailingComma: nil)
          ]),
          rightParen: .rightParenToken(),
          trailingClosure: nil,
          additionalTrailingClosures: nil)),
        trailingComma: .commaToken())),
    substructureAfterMarker: "1️⃣")
  }

  func testInterpolatedStringLiterals() {
    AssertParse(
      #"""
      return "Fixit: \(range.debugDescription) Text: \"\(text)\""
      """#
    )

    AssertParse(
      #"""
      "text \(array.map({ "\($0)" }).joined(separator: ",")) text"
      """#
    )

    AssertParse(
      #"""
      """
      \(gen(xx) { (x) in
          return """
          case
      """
      })
      """
      """#
    )

    AssertParse(
      #"""
      1️⃣"\(()
      """#,
      diagnostics: [
        DiagnosticSpec(message: #"extraneous '"\(()' at top level"#)
      ]
    )
  }

  func testStringLiterals() {
    AssertParse(
      #"""
      ""
      """#
    )

    AssertParse(
      #"""
      """
      """
      """#
    )

    AssertParse(
      #"""
      " >> \( abc 1️⃣} ) << "
      """#,
      diagnostics: [
        DiagnosticSpec(message: "unexpected text '}' in string literal")
      ]
    )

    AssertParse(
      ##"""


      #"Hello World"#

      "Hello World"


      """##
    )

    AssertParse(
      #"""
      ℹ️"\",1️⃣
      """#,
      diagnostics: [
        DiagnosticSpec(message: #"expected '"' to end string literal"#, notes: [
          NoteSpec(message: #"to match this opening '"'"#)
        ])
      ]
    )

    AssertParse(
      #"""
      "(?i)\\b((?:[a-z][\\w-]+:(?:/{1,3}|[a-z0-9%])|www\\d{0,3}[.]|[a-z0-9.\\-]+[.][a-z]{2,4}/)" +
      "(?:[^\\s()<>]+|\\(([^\\s()<>]+|(\\([^\\s()<>]+\\)))*\\))+(?:\\(([^\\s()<>]+|(\\([^\\s()<>]+\\)))*" +
      "\\)|[^\\s`!()\\[\\]{};:'\".,<>?«»“”‘’]))"
      """#
    )

    AssertParse(
      #"""
      """
          Custom(custom: \(interval),\
          Expr: \(pause?.debugDescription ?? "–"), \
          PlainWithContinuation: \(countdown), \
          Plain: \(units))"
      """
      """#
    )

    AssertParse(
      #"""
      "Founded: \(Date.appleFounding, format: 📆)"
      """#
    )

    AssertParse(
        """

        ""
        """
    )

    AssertParse(
      ##"""
      #"""#
      """##
    )

    AssertParse(
      ##"""
      #"""""#
      """##
    )

    AssertParse(
      ##"""
      #"""
      multiline raw
      """#
      """##
    )

    AssertParse(
      #"""
      "\(x)"
      """#
    )

    AssertParse(
       ##"""
       ℹ️""""1️⃣
       """##,
       diagnostics: [
         DiagnosticSpec(message: #"expected '"""' to end string literal"#, notes: [
          NoteSpec(message: #"to match this opening '"""'"#)
         ])
       ]
     )

    AssertParse(
       ##"""
       """""1️⃣
       """##,
       diagnostics: [
         DiagnosticSpec(message: #"expected '"""' to end string literal"#)
       ]
     )

    // FIXME: We currently don't enforce that multiline string literal
    // contents must start on a new line
    AssertParse(
       ##"""
       """"""1️⃣
       """##
     )

    AssertParse(
      ##"""
      #"1️⃣
      """##,
      diagnostics: [
        DiagnosticSpec(message: ##"expected '"#' to end string literal"##, notes: []),
      ]
    )

    AssertParse(
      ##"""
      #"""1️⃣
      """##,
      diagnostics: [
        DiagnosticSpec(message: ##"expected '"""#' to end string literal"##),
      ]
    )

    AssertParse(
      ##"""
      #"""a1️⃣
      """##,
      diagnostics: [
        DiagnosticSpec(message: ##"expected '"""#' to end string literal"##),
      ]
    )

    AssertParse(
      ###"1️⃣"\"###,
      diagnostics: [
        DiagnosticSpec(message: "extraneous '\"\\' at top level")
      ]
    )
  }

  func testSingleQuoteStringLiteral() {
    AssertParse(
      #"""
      'red'
      """#
    )
  }

  func testStringBogusClosingDelimiters() {
    AssertParse(
      ##"""
      \1️⃣\(2️⃣
      """##,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected root in key path"),
        DiagnosticSpec(locationMarker: "1️⃣", message: "consecutive statements on a line must be separated by ';'"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected ')' to end tuple type"),
      ]
    )

    AssertParse(
      ##"""
      #"\\("#
      """##
    )

    AssertParse(
      #"""
      "1️⃣
      """#,
      diagnostics: [
        DiagnosticSpec(message: #"expected '"' to end string literal"#)
      ]
    )

    AssertParse(
      #"""
      "'1️⃣
      """#,
      diagnostics: [
        DiagnosticSpec(message: #"expected '"' to end string literal"#)
      ]
    )
  }

  func testSubscript() {
    AssertParse(
      """
      array[]
      """
    )

    AssertParse(
      """
      text[...]
      """
    )
  }

  func testMissingColonInTernary() {
    AssertParse(
      "foo ? 11️⃣",
      diagnostics: [
        DiagnosticSpec(message: "expected ':' after '? ...' in ternary expression"),
        DiagnosticSpec(message: "expected expression"),
      ]
    )
  }

  func testBogusKeypathBaseRecovery() {
    AssertParse(
      #"""
      func nestThoseIfs() {
        \n
        if false != true {
          \n
          print1️⃣ "\(i)\"\n2️⃣
      """#,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "consecutive statements on a line must be separated by ';'"),
        DiagnosticSpec(locationMarker: "2️⃣", message: #"expected '"' to end string literal"#),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected '}' to end 'if' statement"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected '}' to end function"),
      ]
    )

    AssertParse("#keyPath(1️⃣(b:2️⃣)",
                diagnostics: [
                  DiagnosticSpec(locationMarker: "1️⃣", message: "expected identifier in '#keyPath' expression"),
                  DiagnosticSpec(locationMarker: "1️⃣", message: "expected ')' to end '#keyPath' expression"),
                  DiagnosticSpec(locationMarker: "2️⃣", message: "expected value in function call"),
                ])
  }

  func testMissingArrowInArrowExpr() {
    AssertParse(
      "[(Int) -> 1️⃣throws Int]()",
      diagnostics: [
        DiagnosticSpec(message: "'throws' may only occur before '->'", fixIts: ["move 'throws' in front of '->'"]),
      ],
      fixedSource: "[(Int) throws -> Int]()"
    )

    AssertParse(
      "[(Int) -> 1️⃣async throws Int]()",
      diagnostics: [
        DiagnosticSpec(message: "'async throws' may only occur before '->'", fixIts: ["move 'async throws' in front of '->'"]),
      ],
      fixedSource: "[(Int) async throws -> Int]()"
    )

    AssertParse(
      "let _ = [Int throws 1️⃣Int]()",
      diagnostics: [
        DiagnosticSpec(message: "expected '->' in array element")
      ]
    )
  }

  func testBogusThrowingTernary() {
    AssertParse(
      """
      do {
        true ? () :1️⃣ 2️⃣throw opaque_error()
      } catch _ {
      }
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "consecutive statements on a line must be separated by ';'"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected expression in 'do' statement"),
      ]
    )
  }

  func testClosureExpression() {
    AssertParse(
      """
      let 1️⃣:(2️⃣..)->3️⃣
      """,
      diagnostics: [
        DiagnosticSpec(locationMarker: "1️⃣", message: "expected pattern in variable"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected type in function type"),
        DiagnosticSpec(locationMarker: "2️⃣", message: "unexpected text '..' in function type"),
        DiagnosticSpec(locationMarker: "3️⃣", message: "expected type in function type"),
      ]
    )
  }

  func testParseArrowExpr() {
    AssertParse(
      "Foo 1️⃣async ->2️⃣",
      { $0.parseSequenceExpression(.basic, forDirective: false) },
      substructure: Syntax(TokenSyntax.contextualKeyword("async")),
      substructureAfterMarker: "1️⃣",
      diagnostics: [
        DiagnosticSpec(locationMarker: "2️⃣", message: "expected expression")
      ]
    )
  }

  func testTypeExpression() {
    AssertParse("_ = (any Sequence<Int>).self")
  }

  func testMoveExpression() {
    AssertParse("_move msg")
    AssertParse("use(_move msg)")
    AssertParse("_move msg")
    AssertParse("let b = (_move self).buffer")
  }

  func testCodeCompletionExpressions() {
    AssertParse("if !<#b1#> && !<#b2#> {}")
    AssertParse("if <#test#> {}")
    AssertParse("if <#b1#>, <#b2#> {}")
  }

  func testKeywordApplyExpression() {
    AssertParse(
      """
      optional(x: .some(23))
      optional(x: .none)
      var pair : (Int, Double) = makePair(a: 1, b: 2.5)
      """)
  }

  // N.B. This test includes zero-width characters that may not render in most
  // text editors. Be very careful editing these strings.
  //
  // See https://github.com/apple/swift/issues/51192 for more context here.
  func testFalseMultilineDelimiters() {
    AssertParse(
      ###"""
      _ = #"​"​"#

      _ = #""""#

      _ = #"""""#

      _ = #""""""#

      _ = ##""" foo # "# "##
      """###)
  }

  func testOperatorReference() {
    AssertParse(
      "reduce(0, 1️⃣+)",
      substructure: Syntax(TokenSyntax.unspacedBinaryOperator("+")),
      substructureAfterMarker: "1️⃣"
    )
  }

  func testBogusCaptureLists() {
    // N.B. This test ensures that capture list lookahead doesn't try to pair
    // the opening square bracket from the array literal with the closing
    // square bracket from the capture list.
    AssertParse(
      """
      {
          [
              AboutItem(title: TextContent.legalAndMore, accessoryType: .disclosureIndicator, action: { [weak self] context in
                  self?.tracker.buttonPressed(.legal)
                  context.showSubmenu(title: TextContent.legalAndMore, configuration: LegalAndMoreSubmenuConfiguration())
              }),
          ]
      }()
      """)
  }
}
