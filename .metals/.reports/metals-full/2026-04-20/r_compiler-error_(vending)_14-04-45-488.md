error id: B28AFB9EB48895666E3F1A033CEF49F9
file:///C:/vendingmachineproject/02139-vending-machine/vending/src/main/scala/VendingMachine.scala
### scala.ScalaReflectionException: value blinkDuringAlarm is not a method

occurred in the presentation compiler.



action parameters:
uri: file:///C:/vendingmachineproject/02139-vending-machine/vending/src/main/scala/VendingMachine.scala
text:
```scala
import chisel3._
import chisel3.util._

class VendingMachine(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val price = Input(UInt(5.W))
    val coin2 = Input(Bool())
    val coin5 = Input(Bool())
    val buy = Input(Bool())
    val releaseCan = Output(Bool())
    val alarm = Output(Bool())
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))
  })

  /////# DATAPATH LOGIC #/////
  //  REGISTERS & LOGIC //
  val totalMoney = RegInit(0.U(8.W)) // 8 bits, 0 to 99
  val onesDigit = totalMoney % 10.U // right digit
  val tensDigit = (totalMoney / 10.U) % 10.U // left digit
  

  val priceOnes = io.price % 10.U
  val priceTens = (io.price / 10.U) % 10.U
  

  // Timing Registers //
  val blinkFreq = 25000000.U
  val blinkCounter = RegInit(0.U(32.W))
  val blinkReg = RegInit(false.B)

  val cntMAX = (100000000 / 1000 - 1).U
  val cntReg = RegInit(0.U(32.W))
  val selReg = RegInit(0.U(2.W))

  // EDGE DETECTORS //
  val coin2Edge = io.coin2 && !RegNext(io.coin2)
  val coin5Edge = io.coin5 && !RegNext(io.coin5)
  val buyEdge   = io.buy   && !RegNext(io.buy)

  // SEVEN SEGMENT DECODER //
  val sevSegDecoder = Module(new SevenSegDec())
  val activeDigit = WireDefault("b1111".U)
  sevSegDecoder.io.in := 0.U


 /////# FSM LOGIC #/////

  // STATE DEFINITIONS //
  val idle :: busy :: alarm :: Nil = Enum(3)
  val stateReg = RegInit(idle)
  
  val signalCoin2 = WireDefault(false.B)
  val signalCoin5 = WireDefault(false.B)
  val signalSub  = WireDefault(false.B)

  // ALARM TOGGLE LOGIC //

  blinkCounter := blinkCounter + 1.U
  when(blinkCounter === blinkFreq) {
    blinkCounter := 0.U
    blinkReg := !blinkReg
  }

  switch(stateReg) {
    is(idle) {
      when(coin2Edge) {
        signalCoin2 := true.B
      } .elsewhen(coin5Edge) {
        signalCoin5 := true.B
      }

      when(buyEdge) {
        when(totalMoney >= io.price) {
          signalSub := true.B
          stateReg := busy
        } .otherwise {
          stateReg := alarm
        }
      }
    }
    is(busy) {
      when(io.buy) {
        stateReg := busy
      } .otherwise {
        stateReg := idle
      }
    }
    is(alarm) {
        when(!io.buy) {
          stateReg := idle
        }
    }
  }
  
  // MONEY UPDATE LOGIC //
  when(signalCoin2) {
    totalMoney := totalMoney + 2.U
  } .elsewhen(signalCoin5) {
    totalMoney := totalMoney + 5.U
  } .elsewhen(signalSub) {
    totalMoney := totalMoney - io.price
  }

  // SEVEN SEGMENT DISPLAY LOGIC //
  cntReg := cntReg + 1.U
  when(cntReg === cntMAX) {
    cntReg := 0.U
    selReg := selReg + 1.U
  }
 
  val blinkDuringAlarm = (stateReg ===)

  switch(selReg) {
    is(0.U) {
      activeDigit := "b0111".U
      sevSegDecoder.io.in := tensDigit
    }
    is(1.U) {
      activeDigit := "b1011".U
      sevSegDecoder.io.in := onesDigit
    }
    is(2.U) {
      activeDigit := "b1101".U
      sevSegDecoder.io.in := priceTens
    }
    is (3.U) {
      activeDigit := "b1110".U
      sevSegDecoder.io.in := priceOnes
    }
  }



  /////# OUTPUT ASSIGNMENTS #/////
  io.seg := ~sevSegDecoder.io.out      
  io.an  := activeDigit     
  io.releaseCan := (stateReg === busy)
  io.alarm := (stateReg === alarm) && blinkReg

}

// generate Verilog
object VendingMachine extends App {
  emitVerilog(new VendingMachine(100000))
  println("******************************************")
  println("Successfully generated VendingMachine.v!")
  println("******************************************")
}



```


presentation compiler configuration:
Scala version: 2.13.14
Classpath:
<WORKSPACE>\vending\.bloop\vending\bloop-bsp-clients-classes\classes-Metals-1rKaWTmpRdmjlbwRH8fhhg== [exists ], <HOME>\AppData\Local\bloop\cache\semanticdb\com.sourcegraph.semanticdb-javac.0.11.2\semanticdb-javac-0.11.2.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scala-lang\scala-library\2.13.14\scala-library-2.13.14.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\edu\berkeley\cs\chisel3_2.13\3.6.1\chisel3_2.13-3.6.1.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\edu\berkeley\cs\chiseltest_2.13\0.6.2\chiseltest_2.13-0.6.2.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scala-lang\modules\scala-swing_2.13\3.0.0\scala-swing_2.13-3.0.0.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scala-lang\scala-reflect\2.13.10\scala-reflect-2.13.10.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\edu\berkeley\cs\firrtl_2.13\1.6.0\firrtl_2.13-1.6.0.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\com\lihaoyi\upickle_2.13\2.0.0\upickle_2.13-2.0.0.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\com\lihaoyi\os-lib_2.13\0.8.1\os-lib_2.13-0.8.1.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\edu\berkeley\cs\treadle_2.13\1.6.0\treadle_2.13-1.6.0.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scalatest\scalatest_2.13\3.2.15\scalatest_2.13-3.2.15.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\com\lihaoyi\utest_2.13\0.8.1\utest_2.13-0.8.1.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\net\java\dev\jna\jna\5.13.0\jna-5.13.0.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\antlr\antlr4-runtime\4.9.3\antlr4-runtime-4.9.3.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\com\google\protobuf\protobuf-java\3.18.3\protobuf-java-3.18.3.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\com\github\scopt\scopt_2.13\3.7.1\scopt_2.13-3.7.1.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\net\jcazevedo\moultingyaml_2.13\0.4.2\moultingyaml_2.13-0.4.2.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\json4s\json4s-native_2.13\4.0.6\json4s-native_2.13-4.0.6.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\apache\commons\commons-text\1.10.0\commons-text-1.10.0.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\io\github\alexarchambault\data-class_2.13\0.2.5\data-class_2.13-0.2.5.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scala-lang\modules\scala-parallel-collections_2.13\1.0.4\scala-parallel-collections_2.13-1.0.4.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\com\lihaoyi\ujson_2.13\2.0.0\ujson_2.13-2.0.0.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\com\lihaoyi\upack_2.13\2.0.0\upack_2.13-2.0.0.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\com\lihaoyi\upickle-implicits_2.13\2.0.0\upickle-implicits_2.13-2.0.0.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\com\lihaoyi\geny_2.13\0.7.1\geny_2.13-0.7.1.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scala-lang\modules\scala-jline\2.12.1\scala-jline-2.12.1.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scalatest\scalatest-core_2.13\3.2.15\scalatest-core_2.13-3.2.15.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scalatest\scalatest-featurespec_2.13\3.2.15\scalatest-featurespec_2.13-3.2.15.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scalatest\scalatest-flatspec_2.13\3.2.15\scalatest-flatspec_2.13-3.2.15.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scalatest\scalatest-freespec_2.13\3.2.15\scalatest-freespec_2.13-3.2.15.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scalatest\scalatest-funsuite_2.13\3.2.15\scalatest-funsuite_2.13-3.2.15.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scalatest\scalatest-funspec_2.13\3.2.15\scalatest-funspec_2.13-3.2.15.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scalatest\scalatest-propspec_2.13\3.2.15\scalatest-propspec_2.13-3.2.15.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scalatest\scalatest-refspec_2.13\3.2.15\scalatest-refspec_2.13-3.2.15.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scalatest\scalatest-wordspec_2.13\3.2.15\scalatest-wordspec_2.13-3.2.15.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scalatest\scalatest-diagrams_2.13\3.2.15\scalatest-diagrams_2.13-3.2.15.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scalatest\scalatest-matchers-core_2.13\3.2.15\scalatest-matchers-core_2.13-3.2.15.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scalatest\scalatest-shouldmatchers_2.13\3.2.15\scalatest-shouldmatchers_2.13-3.2.15.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scalatest\scalatest-mustmatchers_2.13\3.2.15\scalatest-mustmatchers_2.13-3.2.15.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scala-sbt\test-interface\1.0\test-interface-1.0.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\portable-scala\portable-scala-reflect_2.13\1.1.2\portable-scala-reflect_2.13-1.1.2.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\com\github\nscala-time\nscala-time_2.13\2.22.0\nscala-time_2.13-2.22.0.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\yaml\snakeyaml\1.26\snakeyaml-1.26.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\json4s\json4s-core_2.13\4.0.6\json4s-core_2.13-4.0.6.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\json4s\json4s-native-core_2.13\4.0.6\json4s-native-core_2.13-4.0.6.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\apache\commons\commons-lang3\3.12.0\commons-lang3-3.12.0.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\com\lihaoyi\upickle-core_2.13\2.0.0\upickle-core_2.13-2.0.0.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\fusesource\jansi\jansi\1.11\jansi-1.11.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scalatest\scalatest-compatible\3.2.15\scalatest-compatible-3.2.15.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scalactic\scalactic_2.13\3.2.15\scalactic_2.13-3.2.15.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\scala-lang\modules\scala-xml_2.13\2.1.0\scala-xml_2.13-2.1.0.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\joda-time\joda-time\2.10.1\joda-time-2.10.1.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\joda\joda-convert\2.2.0\joda-convert-2.2.0.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\json4s\json4s-ast_2.13\4.0.6\json4s-ast_2.13-4.0.6.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\org\json4s\json4s-scalap_2.13\4.0.6\json4s-scalap_2.13-4.0.6.jar [exists ], <HOME>\AppData\Local\Coursier\cache\v1\https\repo1.maven.org\maven2\com\thoughtworks\paranamer\paranamer\2.8\paranamer-2.8.jar [exists ]
Options:
-deprecation -feature -unchecked -language:reflectiveCalls -Yrangepos -Xplugin-require:semanticdb




#### Error stacktrace:

```
scala.reflect.api.Symbols$SymbolApi.asMethod(Symbols.scala:240)
	scala.reflect.api.Symbols$SymbolApi.asMethod$(Symbols.scala:234)
	scala.reflect.internal.Symbols$SymbolContextApiImpl.asMethod(Symbols.scala:99)
	scala.tools.nsc.typechecker.ContextErrors$TyperContextErrors$TyperErrorGen$.MissingArgsForMethodTpeError(ContextErrors.scala:810)
	scala.tools.nsc.typechecker.Typers$Typer.adaptMethodTypeToExpr$1(Typers.scala:999)
	scala.tools.nsc.typechecker.Typers$Typer.adapt(Typers.scala:1353)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6276)
	scala.tools.nsc.typechecker.Typers$Typer.typedDefDef(Typers.scala:6525)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:6167)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6261)
	scala.tools.nsc.typechecker.Typers$Typer.typedStat$1(Typers.scala:6339)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$typedStats$4(Typers.scala:3488)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$typedStats$4$adapted(Typers.scala:3483)
	scala.reflect.internal.Scopes$Scope.foreach(Scopes.scala:455)
	scala.tools.nsc.typechecker.Typers$Typer.addSynthetics$1(Typers.scala:3483)
	scala.tools.nsc.typechecker.Typers$Typer.typedStats(Typers.scala:3551)
	scala.tools.nsc.typechecker.Typers$Typer.typedTemplate(Typers.scala:2144)
	scala.tools.nsc.typechecker.Typers$Typer.typedClassDef(Typers.scala:1982)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:6168)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6261)
	scala.tools.nsc.typechecker.Typers$Typer.typedStat$1(Typers.scala:6339)
	scala.tools.nsc.typechecker.Typers$Typer.$anonfun$typedStats$9(Typers.scala:3539)
	scala.tools.nsc.typechecker.Typers$Typer.typedStats(Typers.scala:3539)
	scala.tools.nsc.typechecker.Typers$Typer.typedPackageDef$1(Typers.scala:5844)
	scala.tools.nsc.typechecker.Typers$Typer.typed1(Typers.scala:6171)
	scala.tools.nsc.typechecker.Typers$Typer.typed(Typers.scala:6261)
	scala.tools.nsc.typechecker.Analyzer$typerFactory$TyperPhase.apply(Analyzer.scala:125)
	scala.tools.nsc.Global$GlobalPhase.applyPhase(Global.scala:481)
	scala.tools.nsc.interactive.Global$TyperRun.applyPhase(Global.scala:1369)
	scala.tools.nsc.interactive.Global$TyperRun.typeCheck(Global.scala:1362)
	scala.tools.nsc.interactive.Global.typeCheck(Global.scala:680)
	scala.meta.internal.pc.WithCompilationUnit.<init>(WithCompilationUnit.scala:24)
	scala.meta.internal.pc.SimpleCollector.<init>(PcCollector.scala:348)
	scala.meta.internal.pc.PcSemanticTokensProvider$Collector$.<init>(PcSemanticTokensProvider.scala:19)
	scala.meta.internal.pc.PcSemanticTokensProvider.Collector$lzycompute$1(PcSemanticTokensProvider.scala:19)
	scala.meta.internal.pc.PcSemanticTokensProvider.Collector(PcSemanticTokensProvider.scala:19)
	scala.meta.internal.pc.PcSemanticTokensProvider.provide(PcSemanticTokensProvider.scala:73)
	scala.meta.internal.pc.ScalaPresentationCompiler.$anonfun$semanticTokens$1(ScalaPresentationCompiler.scala:207)
	scala.meta.internal.pc.CompilerAccess.retryWithCleanCompiler(CompilerAccess.scala:182)
	scala.meta.internal.pc.CompilerAccess.$anonfun$withSharedCompiler$1(CompilerAccess.scala:155)
	scala.Option.map(Option.scala:242)
	scala.meta.internal.pc.CompilerAccess.withSharedCompiler(CompilerAccess.scala:154)
	scala.meta.internal.pc.CompilerAccess.$anonfun$withInterruptableCompiler$1(CompilerAccess.scala:92)
	scala.meta.internal.pc.CompilerAccess.$anonfun$onCompilerJobQueue$1(CompilerAccess.scala:209)
	scala.meta.internal.pc.CompilerJobQueue$Job.run(CompilerJobQueue.scala:152)
	java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1144)
	java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:642)
	java.base/java.lang.Thread.run(Thread.java:1583)
```
#### Short summary: 

scala.ScalaReflectionException: value blinkDuringAlarm is not a method