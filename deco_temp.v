`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:28:27 08/03/2015 
// Design Name: 
// Module Name:    deco_temp 
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
module deco_temp(
    input wire [5:0] temp,
    output reg temp_alta
    );
	 
always @ *

	 if(temp<=6'd27)
		temp_alta=1'b0;
	 else 
		temp_alta=1'b1;
	
endmodule
