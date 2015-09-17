`timescale 1ns / 1ps
//LOLOL
module BCD(
    input wire [5:0] num_bin,
    output reg [3:0] unid, dec
    );
	 
	 reg [5:0] nodo;
	 
	 always @ *
	 
	 begin
		
		if(num_bin < 4'b1010)								//num_bin menor que 10
			begin
				dec = 4'b0;
				nodo = num_bin;
				unid = nodo[3:0];
			end
		else if (num_bin < 6'b010100)						//num_bin entre 10 y 19
			begin
				dec = 4'b0001;
				nodo = num_bin - 6'b001010;
				unid = nodo[3:0];
			end
		else if(num_bin < 6'b011110)						//num_bim entre 20 y 29
			begin
				dec = 4'b0010;
				nodo = num_bin - 6'b010100;
				unid = nodo[3:0];
			end
		else if(num_bin < 6'b101000)						//num_bim entre 30 y 39
			begin
				dec = 4'b0011;
				nodo = num_bin - 6'b011110;
				unid = nodo[3:0];
			end
		else if(num_bin < 6'b110010)						//num_bim entre 40 y 49
			begin
				dec = 4'b0100;
				nodo = num_bin - 6'b101000;
				unid = nodo[3:0];
			end
		else if(num_bin < 6'b111100)						//num_bim entre 50 y 59
			begin
				dec = 4'b0101;
				nodo = num_bin - 6'b110010;
				unid = nodo[3:0];
			end
		else														//num_bin mayor de 60
			begin
				dec = 4'b0110;
				nodo = num_bin - 6'b111100;
				unid = nodo[3:0];
			end
	 
	 end

endmodule
