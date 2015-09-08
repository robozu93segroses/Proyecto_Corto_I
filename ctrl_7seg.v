`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date:    15:57:59 08/04/2015 
// Design Name: 
// Module Name:    control_7seg 
// Project Name: 
//////////////////////////////////////////////////////////////////////////////////
module ctrl_7seg(
    input wire [3:0] unit, dec,
	 input wire [1:0] est_maq,
    input wire EN, clk,
    output reg [6:0] seg,
	 output reg [3:0] an
    );
							
	 localparam [2:0] estado_0 = 3'b000, 
							estado_1 = 3'b001,
							estado_2 = 3'b010,
							estado_3 = 3'b011,
							estado_4 = 3'b100;
	 
	 reg [2:0] est, est_sig;
	 
	 //----------------------------
	 always @(posedge clk)
		if (EN)
			est <= est_sig;
		else
			est <= estado_4;
	 //----------------------------
	 	 
	 always @ * 
	 begin
		est_sig = estado_0;
		an = 4'b1111;
		seg = 7'b1111111;
		case(est)
			estado_0:begin
							an = 4'b1110;
							case(unit)						//unidades, en el primer 7segmentos
								4'h0:	seg = 7'b1000000;
								4'h1:	seg = 7'b1111001;
								4'h2:	seg = 7'b0100100;
								4'h3:	seg = 7'b0110000;
								4'h4:	seg = 7'b0011001;
								4'h5:	seg = 7'b0010010;
								4'h6:	seg = 7'b0000010;
								4'h7:	seg = 7'b1111000;
								4'h8:	seg = 7'b0000000;
								4'h9:	seg = 7'b0010000;
								default: seg = 7'b0001001;	//pinta una "X" si le llega codigo no deseado
							endcase
							est_sig = estado_1;
						end
			estado_1:begin	
							an = 4'b1101;
							case(dec)							//decenas, en el segundo 7segmentos
								4'h0:	seg = 7'b1000000;
								4'h1:	seg = 7'b1111001;
								4'h2:	seg = 7'b0100100;
								4'h3:	seg = 7'b0110000;
								4'h4:	seg = 7'b0011001;
								4'h5:	seg = 7'b0010010;
								4'h6:	seg = 7'b0000010;
								default: seg = 7'b0001001;	//pinta una "X" si le llega codigo no deseado
							endcase
							est_sig = estado_2;
						end
			estado_2:begin
							an = 4'b1111;				//en el tercer 7segmentos no se pinta nada, solo pasa de estado
							est_sig = estado_3;
						end
			estado_3:begin
							an = 4'b0111;
							case(est_maq)						//en el cuarto 7segmentos pinta el estado en el que se encuentra el control
								2'h1:	seg = 7'b1111001;		//la maquina del control solo tiene 3 estado (1, 2 y 3)
								2'h2:	seg = 7'b0100100;
								2'h3:	seg = 7'b0110000;
								default: seg = 7'b0001001;	//pinta una "X" si le llega codigo no deseado
							endcase
							est_sig = estado_0;
						end
			estado_4:begin									//estado de apagado, para apagar los 7segmentos
							an = 4'b1111;
							seg = 7'b1111111;
						end
			default:begin
							an = 4'b1111;
							seg = 7'b1111111;
							if(EN)
									est_sig = estado_0;
						end
		endcase
	 end	 
endmodule
