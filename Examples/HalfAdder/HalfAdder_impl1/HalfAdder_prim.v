// Verilog netlist produced by program LSE :  version Diamond (64-bit) 3.12.0.240.2
// Netlist written on Thu Sep 21 20:18:09 2023
//
// Verilog Description of module HalfAdder
//

module HalfAdder (A, B, Cout, Sum);   // c:/lscc/diamond/3.12/examples/halfadder/halfadder.vhd(4[8:17])
    input A;   // c:/lscc/diamond/3.12/examples/halfadder/halfadder.vhd(5[8:9])
    input B;   // c:/lscc/diamond/3.12/examples/halfadder/halfadder.vhd(5[11:12])
    output Cout;   // c:/lscc/diamond/3.12/examples/halfadder/halfadder.vhd(6[4:8])
    output Sum;   // c:/lscc/diamond/3.12/examples/halfadder/halfadder.vhd(6[10:13])
    
    
    wire A_c, B_c, Cout_c, Sum_c, GND_net, VCC_net;
    
    LUT4 i45_2_lut (.A(B_c), .B(A_c), .Z(Sum_c)) /* synthesis lut_function=(!(A (B)+!A !(B))) */ ;
    defparam i45_2_lut.init = 16'h6666;
    LUT4 i26_2_lut (.A(A_c), .B(B_c), .Z(Cout_c)) /* synthesis lut_function=(A (B)) */ ;   // c:/lscc/diamond/3.12/examples/halfadder/halfadder.vhd(14[12:20])
    defparam i26_2_lut.init = 16'h8888;
    VLO i48 (.Z(GND_net));
    OB Cout_pad (.I(Cout_c), .O(Cout));   // c:/lscc/diamond/3.12/examples/halfadder/halfadder.vhd(6[4:8])
    OB Sum_pad (.I(Sum_c), .O(Sum));   // c:/lscc/diamond/3.12/examples/halfadder/halfadder.vhd(6[10:13])
    IB A_pad (.I(A), .O(A_c));   // c:/lscc/diamond/3.12/examples/halfadder/halfadder.vhd(5[8:9])
    IB B_pad (.I(B), .O(B_c));   // c:/lscc/diamond/3.12/examples/halfadder/halfadder.vhd(5[11:12])
    PUR PUR_INST (.PUR(VCC_net));
    defparam PUR_INST.RST_PULSE = 1;
    TSALL TSALL_INST (.TSALL(GND_net));
    GSR GSR_INST (.GSR(VCC_net));
    VHI i49 (.Z(VCC_net));
    
endmodule
//
// Verilog Description of module PUR
// module not written out since it is a black-box. 
//

//
// Verilog Description of module TSALL
// module not written out since it is a black-box. 
//

