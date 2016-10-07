`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:31:31 10/07/2016
// Design Name:  Pujan Prajapati
// Module Name:    LA 5x5 matrix
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
//d_in11,d_in12,d_in13,d_in14,d_in15,d_in21,d_in22,d_in23,d_in24,d_in25,d_in31,d_in32,d_in33,d_in34,d_in35,d_in41,d_in42,d_in43,d_in44,d_in45,d_in51,d_in52,d_in53,d_in54,d_in55
//////////////////////////////////////////////////////////////////////////////////
module LA5(clk, reset, data_out, address, i11,i12,i13,i14,i15,i21,i22,i23,i24,i25,i31,i32,i33,i34,i35,i41,i42,i43,i44,i45,i51,i52,i53,i54,i55,i11d,i12d,i13d,i14d,i15d,i21d,i22d,i23d,i24d,i25d,i31d,i32d,i33d,i34d,i35d,i41d,i42d,i43d,i44d,i45d,i51d,i52d,i53d,i54d,i55d);

output reg [31:0] i11,i12,i13,i14,i15;
output reg [31:0] i21,i22,i23,i24,i25;
output reg [31:0] i31,i32,i33,i34,i35;
output reg [31:0] i41,i42,i43,i44,i45;
output reg [31:0] i51,i52,i53,i54,i55;

output [31:0] i11d,i12d,i13d,i14d,i15d;
output [31:0] i21d,i22d,i23d,i24d,i25d;
output [31:0] i31d,i32d,i33d,i34d,i35d;
output [31:0] i41d,i42d,i43d,i44d,i45d;
output [31:0] i51d,i52d,i53d,i54d,i55d;

reg [31:0] matrix[0:25];
reg [31:0] inverse[0:24];

output [31:0] data_out;

input reset;
input [4:0] address;

reg [31:0] d_in11,d_in12,d_in13,d_in14,d_in15;
reg [31:0] d_in21,d_in22,d_in23,d_in24,d_in25;
reg [31:0] d_in31,d_in32,d_in33,d_in34,d_in35;
reg [31:0] d_in41,d_in42,d_in43,d_in44,d_in45;
reg [31:0] d_in51,d_in52,d_in53,d_in54,d_in55;
input clk;


reg [31:0] i11t = 32'd1;
reg [31:0] i12t = 32'd0;
reg [31:0] i13t = 32'd0;
reg [31:0] i14t = 32'd0;
reg [31:0] i15t = 32'd0;

reg [31:0] i21t = 32'd0;
reg [31:0] i22t = 32'd1;
reg [31:0] i23t = 32'd0;
reg [31:0] i24t = 32'd0;
reg [31:0] i25t = 32'd0;

reg [31:0] i31t = 32'd0;
reg [31:0] i32t = 32'd0;
reg [31:0] i33t = 32'd1;
reg [31:0] i34t = 32'd0;
reg [31:0] i35t = 32'd0;

reg [31:0] i41t = 32'd0;
reg [31:0] i42t = 32'd0;
reg [31:0] i43t = 32'd0;
reg [31:0] i44t = 32'd1;
reg [31:0] i45t = 32'd0;

reg [31:0] i51t = 32'd0;
reg [31:0] i52t = 32'd0;
reg [31:0] i53t = 32'd0;
reg [31:0] i54t = 32'd0;
reg [31:0] i55t = 32'd1;

reg [31:0] ans_temp11,ans_temp12,ans_temp13,ans_temp14,ans_temp15,ans_temp21,ans_temp22,ans_temp23,ans_temp24,ans_temp25,ans_temp31,ans_temp32,ans_temp33,ans_temp34,ans_temp35,ans_temp41,ans_temp42,ans_temp43,ans_temp44,ans_temp45,ans_temp51,ans_temp52,ans_temp53t,ans_temp54t,ans_temp55t;

reg [31:0] x;
reg [31:0] y;


always@(posedge clk)
begin

if(reset==1'b0)
begin
	matrix[address] <= data_out;
end

else
begin

d_in11 = matrix[1];
d_in12 = matrix[2];
d_in13 = matrix[3];
d_in14 = matrix[4];
d_in15 = matrix[5];

d_in21 = matrix[6];
d_in22 = matrix[7];
d_in23 = matrix[8];
d_in24 = matrix[9];
d_in25 = matrix[10];

d_in31 = matrix[11];
d_in32= matrix[12];
d_in33= matrix[13];
d_in34 = matrix[14];
d_in35 = matrix[15];

d_in41 = matrix[16];
d_in42 =  matrix[17];
d_in43 = matrix[18];
d_in44 = matrix[19];
d_in45 = matrix[20];

d_in51 = matrix[21];
d_in52 = matrix[22];
d_in53 = matrix[23];
d_in54 = matrix[24];
d_in55 = matrix[25];

ans_temp11 = (d_in11 > 0 ? d_in11 : (~d_in11+32'd1));
ans_temp12 = (d_in12 > 0 ? d_in12 : (~d_in12+32'd1));
ans_temp13 = (d_in13 > 0 ? d_in13 : (~d_in13+32'd1));
ans_temp14 = (d_in14 > 0 ? d_in14 : (~d_in14+32'd1));
ans_temp15 = (d_in15 > 0 ? d_in15 : (~d_in15+32'd1));

ans_temp21 = (d_in21 > 0 ? d_in21 : (~d_in21 + 32'd1));
ans_temp22 = (d_in22 > 0 ? d_in22 : (~d_in22 + 32'd1));
ans_temp23 = (d_in23 > 0 ? d_in23 : (~d_in23 + 32'd1));
ans_temp24 = (d_in24 > 0 ? d_in24 : (~d_in24 + 32'd1));
ans_temp25 = (d_in25 > 0 ? d_in25 : (~d_in25 + 32'd1));

ans_temp31 = (d_in31 > 0 ? d_in31 : (~d_in31 + 32'd1));
ans_temp32 = (d_in32 > 0 ? d_in32 : (~d_in32 + 32'd1));
ans_temp33 = (d_in33 > 0 ? d_in33 : (~d_in33 + 32'd1));
ans_temp34 = (d_in34 > 0 ? d_in34 : (~d_in34 + 32'd1));
ans_temp35 = (d_in35 > 0 ? d_in35 : (~d_in35 + 32'd1));

ans_temp41 = (d_in41 > 0 ? d_in41 : (~d_in41+32'd1));
ans_temp42 = (d_in42 > 0 ? d_in42 : (~d_in42+32'd1));
ans_temp43 = (d_in43 > 0 ? d_in43 : (~d_in43+32'd1));
ans_temp44 = (d_in44 > 0 ? d_in44 : (~d_in44+32'd1));
ans_temp45 = (d_in45 > 0 ? d_in45 : (~d_in45+32'd1));

ans_temp51 = (d_in51 > 0 ? d_in51 : (~d_in51+32'd1));
ans_temp52 = (d_in52 > 0 ? d_in52 : (~d_in52+32'd1));
ans_temp53t = (d_in53 > 0 ? d_in53 : (~d_in53+32'd1));
ans_temp54t = (d_in54 > 0 ? d_in54 : (~d_in54+32'd1));
ans_temp55t = (d_in55 > 0 ? d_in55 : (~d_in55+32'd1));



x = ans_temp11;
y = ans_temp21;

ans_temp21 = x*ans_temp21 - y*ans_temp11;
ans_temp22 = x*ans_temp22 - y*ans_temp12;
ans_temp23 = x*ans_temp23 - y*ans_temp13;
ans_temp24 = x*ans_temp24 - y*ans_temp14;
ans_temp25 = x*ans_temp25 - y*ans_temp15;
i21t = x*i21t - y*i11t;
i22t = x*i22t - y*i12t;
i23t = x*i23t - y*i13t;
i24t = x*i24t - y*i14t;
i25t = x*i25t - y*i15t;

x = ans_temp11;
y = ans_temp31;

ans_temp31 = x*ans_temp31 - y*ans_temp11;
ans_temp32 = x*ans_temp32 - y*ans_temp12;
ans_temp33 = x*ans_temp33 - y*ans_temp13;
ans_temp34 = x*ans_temp34 - y*ans_temp14;
ans_temp35 = x*ans_temp35 - y*ans_temp15;
i31t = x*i31t - y*i11t;
i32t = x*i32t - y*i12t;
i33t = x*i33t - y*i13t;
i34t = x*i34t - y*i14t;
i35t = x*i35t - y*i15t;

x = ans_temp11;
y = ans_temp41;

ans_temp41 = x*ans_temp41 - y*ans_temp11;
ans_temp42 = x*ans_temp42 - y*ans_temp12;
ans_temp43 = x*ans_temp43 - y*ans_temp13;
ans_temp44 = x*ans_temp44 - y*ans_temp14;
ans_temp45 = x*ans_temp45 - y*ans_temp15;
i41t = x*i41t - y*i11t;
i42t = x*i42t - y*i12t;
i43t = x*i43t - y*i13t;
i44t = x*i44t - y*i14t;
i45t = x*i45t - y*i15t;

x = ans_temp11;
y = ans_temp51;

ans_temp51 = x*ans_temp51 - y*ans_temp11;
ans_temp52 = x*ans_temp52 - y*ans_temp12;
ans_temp53t = x*ans_temp53t - y*ans_temp13;
ans_temp54t = x*ans_temp54t - y*ans_temp14;
ans_temp55t = x*ans_temp55t - y*ans_temp15;
i51t = x*i51t - y*i11t;
i52t = x*i52t - y*i12t;
i53t = x*i53t - y*i13t;
i54t = x*i54t - y*i14t;
i55t = x*i55t - y*i15t;

x = ans_temp22;
y = ans_temp12;

ans_temp11 = x*ans_temp11 - y*ans_temp21;
ans_temp12 = x*ans_temp12 - y*ans_temp22;
ans_temp13 = x*ans_temp13 - y*ans_temp23;
ans_temp14 = x*ans_temp14 - y*ans_temp24;
ans_temp15 = x*ans_temp15 - y*ans_temp25;
i11t = x*i11t - y*i21t;
i12t = x*i12t - y*i22t;
i13t = x*i13t - y*i23t;
i14t = x*i14t - y*i24t;
i15t = x*i15t - y*i25t;

x = ans_temp22;
y = ans_temp32;

ans_temp31 = x*ans_temp31 - y*ans_temp21;
ans_temp32 = x*ans_temp32 - y*ans_temp22;
ans_temp33 = x*ans_temp33 - y*ans_temp23;
ans_temp34 = x*ans_temp34 - y*ans_temp24;
ans_temp35 = x*ans_temp35 - y*ans_temp25;
i31t = x*i31t - y*i21t;
i32t = x*i32t - y*i22t;
i33t = x*i33t - y*i23t;
i34t = x*i34t - y*i24t;
i35t = x*i35t - y*i25t;

x = ans_temp22;
y = ans_temp42;

ans_temp41 = x*ans_temp41 - y*ans_temp21;
ans_temp42 = x*ans_temp42 - y*ans_temp22;
ans_temp43 = x*ans_temp43 - y*ans_temp23;
ans_temp44 = x*ans_temp44 - y*ans_temp24;
ans_temp45 = x*ans_temp45 - y*ans_temp25;
i41t = x*i41t - y*i21t;
i42t = x*i42t - y*i22t;
i43t = x*i43t - y*i23t;
i44t = x*i44t - y*i24t;
i45t = x*i45t - y*i25t;

x = ans_temp22;
y = ans_temp52;

ans_temp51 = x*ans_temp51 - y*ans_temp21;
ans_temp52 = x*ans_temp52 - y*ans_temp22;
ans_temp53t = x*ans_temp53t - y*ans_temp23;
ans_temp54t = x*ans_temp54t - y*ans_temp24;
ans_temp55t = x*ans_temp55t - y*ans_temp25;
i51t = x*i51t - y*i21t;
i52t = x*i52t - y*i22t;
i53t = x*i53t - y*i23t;
i54t = x*i54t - y*i24t;
i55t = x*i55t - y*i25t;


/*         */


x = ans_temp33;
y = ans_temp13;

ans_temp11 = x*ans_temp11 - y*ans_temp31;
ans_temp12 = x*ans_temp12 - y*ans_temp32;
ans_temp13 = x*ans_temp13 - y*ans_temp33;
ans_temp14 = x*ans_temp14 - y*ans_temp34;
ans_temp15 = x*ans_temp15 - y*ans_temp35;
i11t = x*i11t - y*i31t;
i12t = x*i12t - y*i32t;
i13t = x*i13t - y*i33t;
i14t = x*i14t - y*i34t;
i15t = x*i15t - y*i35t;

x = ans_temp33;
y = ans_temp23;

ans_temp21 = x*ans_temp21 - y*ans_temp31;
ans_temp22 = x*ans_temp22 - y*ans_temp32;
ans_temp23 = x*ans_temp23 - y*ans_temp33;
ans_temp24 = x*ans_temp24 - y*ans_temp34;
ans_temp25 = x*ans_temp25 - y*ans_temp35;
i21t = x*i21t - y*i31t;
i22t = x*i22t - y*i32t;
i23t = x*i23t - y*i33t;
i24t = x*i24t - y*i34t;
i25t = x*i25t - y*i35t;

x = ans_temp33;
y = ans_temp43;

ans_temp41 = x*ans_temp41 - y*ans_temp31;
ans_temp42 = x*ans_temp42 - y*ans_temp32;
ans_temp43 = x*ans_temp43 - y*ans_temp33;
ans_temp44 = x*ans_temp44 - y*ans_temp34;
ans_temp45 = x*ans_temp45 - y*ans_temp35;
i41t = x*i41t - y*i31t;
i42t = x*i42t - y*i32t;
i43t = x*i43t - y*i33t;
i44t = x*i44t - y*i34t;
i45t = x*i45t - y*i35t;

x = ans_temp33;
y = ans_temp53t;

ans_temp51 = x*ans_temp51 - y*ans_temp31;
ans_temp52 = x*ans_temp52 - y*ans_temp32;
ans_temp53t = x*ans_temp53t - y*ans_temp33;
ans_temp54t = x*ans_temp54t - y*ans_temp34;
ans_temp55t = x*ans_temp55t - y*ans_temp35;
i51t = x*i51t - y*i31t;
i52t = x*i52t - y*i32t;
i53t = x*i53t - y*i33t;
i54t = x*i54t - y*i34t;
i55t = x*i55t - y*i35t;

x = ans_temp44;
y = ans_temp14;

ans_temp11 = x*ans_temp11 - y*ans_temp41;
ans_temp12 = x*ans_temp12 - y*ans_temp42;
ans_temp13 = x*ans_temp13 - y*ans_temp43;
ans_temp14 = x*ans_temp14 - y*ans_temp44;
ans_temp15 = x*ans_temp15 - y*ans_temp45;
i11t = x*i11t - y*i41t;
i12t = x*i12t - y*i42t;
i13t = x*i13t - y*i43t;
i14t = x*i14t - y*i44t;
i15t = x*i15t - y*i45t;

x = ans_temp44;
y = ans_temp24;

ans_temp21 = x*ans_temp21 - y*ans_temp41;
ans_temp22 = x*ans_temp22 - y*ans_temp42;
ans_temp23 = x*ans_temp23 - y*ans_temp43;
ans_temp24 = x*ans_temp24 - y*ans_temp44;
ans_temp25 = x*ans_temp25 - y*ans_temp45;
i21t = x*i21t - y*i41t;
i22t = x*i22t - y*i42t;
i23t = x*i23t - y*i43t;
i24t = x*i24t - y*i44t;
i25t = x*i25t - y*i45t;

x = ans_temp44;
y = ans_temp34;

ans_temp31 = x*ans_temp31 - y*ans_temp41;
ans_temp32 = x*ans_temp32 - y*ans_temp42;
ans_temp33 = x*ans_temp33 - y*ans_temp43;
ans_temp34 = x*ans_temp34 - y*ans_temp44;
ans_temp35 = x*ans_temp35 - y*ans_temp45;
i31t = x*i31t - y*i41t;
i32t = x*i32t - y*i42t;
i33t = x*i33t - y*i43t;
i34t = x*i34t - y*i44t;
i35t = x*i35t - y*i45t;

x = ans_temp44;
y = ans_temp54t;

ans_temp51 = x*ans_temp51 - y*ans_temp41;
ans_temp52 = x*ans_temp52 - y*ans_temp42;
ans_temp53t = x*ans_temp53t - y*ans_temp43;
ans_temp54t = x*ans_temp54t - y*ans_temp44;
ans_temp55t = x*ans_temp55t - y*ans_temp45;
i51t = x*i51t - y*i41t;
i52t = x*i52t - y*i42t;
i53t = x*i53t - y*i43t;
i54t = x*i54t - y*i44t;
i55t = x*i55t - y*i45t;

x = ans_temp55t;
y = ans_temp15;

ans_temp11 = x*ans_temp11 - y*ans_temp51;
ans_temp12 = x*ans_temp12 - y*ans_temp52;
ans_temp13 = x*ans_temp13 - y*ans_temp53t;
ans_temp14 = x*ans_temp14 - y*ans_temp54t;
ans_temp15 = x*ans_temp15 - y*ans_temp55t;
i11t = x*i11t - y*i51t;
i12t = x*i12t - y*i52t;
i13t = x*i13t - y*i53t;
i14t = x*i14t - y*i54t;
i15t = x*i15t - y*i55t;

x = ans_temp55t;
y = ans_temp25;

ans_temp21 = x*ans_temp21 - y*ans_temp51;
ans_temp22 = x*ans_temp22 - y*ans_temp52;
ans_temp23 = x*ans_temp23 - y*ans_temp53t;
ans_temp24 = x*ans_temp24 - y*ans_temp54t;
ans_temp25 = x*ans_temp25 - y*ans_temp55t;
i21t = x*i21t - y*i51t;
i22t = x*i22t - y*i52t;
i23t = x*i23t - y*i53t;
i24t = x*i24t - y*i54t;
i25t = x*i25t - y*i55t;

x = ans_temp55t;
y = ans_temp35;

ans_temp31 = x*ans_temp31 - y*ans_temp51;
ans_temp32 = x*ans_temp32 - y*ans_temp52;
ans_temp33 = x*ans_temp33 - y*ans_temp53t;
ans_temp34 = x*ans_temp34 - y*ans_temp54t;
ans_temp35 = x*ans_temp35 - y*ans_temp55t;
i31t = x*i31t - y*i51t;
i32t = x*i32t - y*i52t;
i33t = x*i33t - y*i53t;
i34t = x*i34t - y*i54t;
i35t = x*i35t - y*i55t;

x = ans_temp55t;
y = ans_temp45;

ans_temp41 = x*ans_temp41 - y*ans_temp51;
ans_temp42 = x*ans_temp42 - y*ans_temp52;
ans_temp43 = x*ans_temp43 - y*ans_temp53t;
ans_temp44 = x*ans_temp44 - y*ans_temp54t;
ans_temp45 = x*ans_temp45 - y*ans_temp55t;
i41t = x*i41t - y*i51t;
i42t = x*i42t - y*i52t;
i43t = x*i43t - y*i53t;
i44t = x*i44t - y*i54t;
i45t = x*i45t - y*i55t;



/*         */
	



if(ans_temp11==32'd0 || ans_temp22 == 32'd0 || ans_temp33 == 32'd0 || ans_temp44==32'd0 || ans_temp55t==32'd0)
begin
	i11=32'dx;
	i22=32'dx;
	i33=32'dx;
	i44=32'dx;
	i55=32'dx;
end

else
begin
	i11 = i11t;
	i12 = i12t;
	i13 = i13t;
	i14 = i14t;
	i15 = i15t;

	i21 = i21t;
	i22 = i22t;
	i23 = i23t;
	i24 = i24t;
	i25 = i25t;

	i31 = i31t;
	i32 = i32t;
	i33 = i33t;
	i34 = i34t;
	i35 = i35t;

	i41 = i41t;
	i42 = i42t;
	i43 = i43t;
	i44 = i44t;
	i45 = i45t;

	i51 = i51t;
	i52 = i52t;
	i53 = i53t;
	i54 = i54t;
	i55 = i55t;
end


inverse[0] = i11;
inverse[1] = i12;
inverse[2] = i13;
inverse[3] = i14;
inverse[4] = i15;

inverse[5] = i21;
inverse[6] = i22;
inverse[7] = i23;
inverse[8] = i24;
inverse[9] = i25;

inverse[10] = i31;
inverse[11] = i32;
inverse[12] = i33;
inverse[13] = i34;
inverse[14] = i35;

inverse[15] = i41;
inverse[16] = i42;
inverse[17] = i43;
inverse[18] = i44;
inverse[19] = i45;

inverse[20] = i51;
inverse[21] = i52;
inverse[22] = i53;
inverse[23] = i54;
inverse[24] = i55;

end

end

wire [31:0] i11dt,i12dt,i13dt,i14dt,i15dt;
wire [31:0] i21dt,i22dt,i23dt,i24dt,i25dt;
wire [31:0] i31dt,i32dt,i33dt,i34dt,i35dt;
wire [31:0] i41dt,i42dt,i43dt,i44dt,i45dt;
wire [31:0] i51dt,i52dt,i53dt,i54dt,i55dt;

assign i11d = i11;
assign i12d = i12;
assign i13d = i13;
assign i14d = i14;
assign i15d = i15;

assign i21d = i21;
assign i22d = i22;
assign i23d = i23;
assign i24d = i24;
assign i25d = i25;

assign i31d = i31;
assign i32d = i32;
assign i33d = i33;
assign i34d = i34;
assign i35d = i35;

assign i41d = i41;
assign i42d = i42;
assign i43d = i43;
assign i44d = i44;
assign i45d = i45;

assign i51d = i51;
assign i52d = i52;
assign i53d = i53;
assign i54d = i54;
assign i55d = i55;

wire [31:0] a,b,c,d,e;

assign a = ans_temp11;
assign b = ans_temp22;
assign c = ans_temp33;
assign d = ans_temp44;
assign e = ans_temp55t;


assign i11d = i11dt;
assign i12d = i12dt;
assign i13d = i13dt;
assign i14d = i14dt;
assign i15d = i15dt;

assign i21d = i21dt;
assign i22d = i22dt;
assign i23d = i23dt;
assign i24d = i24dt;
assign i25d = i25dt;

assign i31d = i31dt;
assign i32d = i32dt;
assign i33d = i33dt;
assign i34d = i34dt;
assign i35d = i35dt;

assign i41d = i41dt;
assign i42d = i42dt;
assign i43d = i43dt;
assign i44d = i44dt;
assign i45d = i45dt;

assign i51d = i51dt;
assign i52d = i52dt;
assign i53d = i53dt;
assign i54d = i54dt;
assign i55d = i55dt;

endmodule