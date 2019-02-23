//
// Vivado(TM)
// rundef.js: a Vivado-generated Runs Script for WSH 5.1/5.6
// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//

var WshShell = new ActiveXObject( "WScript.Shell" );
var ProcEnv = WshShell.Environment( "Process" );
var PathVal = ProcEnv("PATH");
if ( PathVal.length == 0 ) {
  PathVal = "E:/Xilinx2015.4/Vivado/2015.4/ids_lite/ISE/bin/nt64;E:/Xilinx2015.4/Vivado/2015.4/ids_lite/ISE/lib/nt64;E:/Xilinx2015.4/Vivado/2015.4/bin;";
} else {
  PathVal = "E:/Xilinx2015.4/Vivado/2015.4/ids_lite/ISE/bin/nt64;E:/Xilinx2015.4/Vivado/2015.4/ids_lite/ISE/lib/nt64;E:/Xilinx2015.4/Vivado/2015.4/bin;" + PathVal;
}

ProcEnv("PATH") = PathVal;

var RDScrFP = WScript.ScriptFullName;
var RDScrN = WScript.ScriptName;
var RDScrDir = RDScrFP.substr( 0, RDScrFP.length - RDScrN.length - 1 );
var ISEJScriptLib = RDScrDir + "/ISEWrap.js";
eval( EAInclude(ISEJScriptLib) );


// pre-commands:
ISETouchFile( "write_bitstream", "begin" );
ISEStep( "vivado",
         "-log SingleCPU.vdi -applog -m64 -messageDb vivado.pb -mode batch -source SingleCPU.tcl -notrace" );





function EAInclude( EAInclFilename ) {
  var EAFso = new ActiveXObject( "Scripting.FileSystemObject" );
  var EAInclFile = EAFso.OpenTextFile( EAInclFilename );
  var EAIFContents = EAInclFile.ReadAll();
  EAInclFile.Close();
  return EAIFContents;
}
