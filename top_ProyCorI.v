`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:43:21 08/28/2015 
// Design Name: 
// Module Name:    top_ProyCorI 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top_ProyCorI(
	input wire [5:0] t,
	input wire clk, rst, m, p, EN,
	output wire l_EN, l_pel, 
	output wire [6:0] seg7,
	output wire [3:0] an7
    );

wire dvd, t_a, EN7;
wire [3:0] uni, dec;
wire [1:0] est_m;

BCD bcd (
    .num_bin(t), 
    .unid(uni), 
    .dec(dec)
    );
	 
ctrl_7seg cntrl7 (
    .unit(uni), 
    .dec(dec), 
    .est_maq(est_m), 
    .EN(EN7), 
    .clk(dvd), 
    .seg(seg7), 
    .an(an7)
    );
	 
deco_temp decoT (
    .temp(t), 
    .temp_alta(t_a)
    );
	 
maquina_estados maq_princ (
    .clk(dvd), 
    .temp_alta(t_a), 
    .mov(m), 
    .pres(p), 
    .EN(EN), 
    .led_EN(l_EN), 
    .led_pelig(l_pel), 
    .EN_7(EN7), 
    .estado(est_m)
    );
	 
div_frec clk_dvd (
    .clk(clk), 
    .reset(rst), 
    .s_clk(dvd)
    );

endmodule
