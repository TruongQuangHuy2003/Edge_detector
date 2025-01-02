module edge_detector (
	input wire clk,
	input wire rst_n,
	input wire sign_in,
	output reg pulse_out_p,
	output reg pulse_out_n
);

reg sign_in_prev;

always @(posedge clk or rst_n) begin
	if(!rst_n) begin
		sign_in_prev <= 0;
		pulse_out_p <= 0;
		pulse_out_n <= 0;
	end else begin
		pulse_out_p <= sign_in & ~sign_in_prev;
		pulse_out_n <= ~sign_in & sign_in_prev;
		sign_in_prev <= sign_in;
	end
end
endmodule

