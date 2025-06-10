module output_mux(clk,rst,a,cmd,cout);


input clk,rst;
input [1:0] cmd;
input [7:0] a;
output reg[7:0] cout;

always @(posedge clk) begin
	
	if(rst) begin
	   cout <= 8'd0;
	end
	else begin
	   if(cmd==2'b10) begin
		cout <= a;
	   end
	   else begin
	        cout <=8'd0;	
	   end

	end
end
endmodule