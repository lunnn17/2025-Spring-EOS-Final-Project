module register(clk,rst,a,b,cout);

input clk,rst;
input [7:0] a,b;
output reg [7:0] cout;
reg start;

always @(posedge clk) begin
	if(rst) begin
	   start <= 1'b0;
	   cout  <= 8'd0;
	end
	else begin
	   if(start == 1'b0) begin
	      start <= 1'b1;
              cout <= a;
           end
	   else begin
	      cout <= b;
	   end
	end
end
endmodule