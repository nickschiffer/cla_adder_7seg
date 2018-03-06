`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2018 01:31:11 PM
// Design Name: 
// Module Name: cla_adder_7seg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module cla_adder_7seg(
input clk100MHz, rst,
input [3:0] A, B,
input c_in,
output [3:0] A_out, B_out,
output c_in_LED, c_out_LED,
output [7:0] LEDSEL, LEDOUT
);

supply1 [7:0] vcc;
wire    DONT_USE, clk_5KHz;
wire [7:0] LED0;
wire [7:0] LED1;
wire [7:0] LEDCarryIN;
wire [7:0] LEDCarryOUT;

wire [3:0] SUM0;
wire [3:0] SUM1;

wire [3:0] c_in_BCD;

wire [3:0] SUM;

CLA_top      CLA1       (A, B, c_in, SUM, c_out_LED);
clk_gen      CLK        (clk100MHz, rst, DONT_USE, clk_5KHz);
bcd_to_7seg  DIGIT0     (SUM0, LED0);
bcd_to_7seg  DIGIT1     (SUM1, LED1);
bcd_to_7seg  CARRYIN    ({3'b0,c_in}, LEDCarryIN);
bcd_to_7seg  CARRYOUT   ({3'b0,c_out_LED}, LEDCarryOUT);

led_mux      LED        (clk_5KHz, rst, vcc, vcc, LEDCarryOUT, vcc, LEDCarryIN, vcc, LED1, LED0, LEDSEL, LEDOUT);
sum_to_2_bcd SPLT       (SUM, SUM0, SUM1);

assign c_in_LED = c_in;
assign A_out = A;
assign B_out = B;

endmodule
