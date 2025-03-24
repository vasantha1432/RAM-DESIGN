module ram_design(input [3:0]data_in, 
input clk,
input write_enable,
input [3:0]address,
output reg [3:0]data_out );
reg [3:0]ram_block[0:15];
always@(posedge clk)
begin
if(write_enable)
 ram_block[address]<=data_in;
else
data_out<=ram_block[address];
end
endmodule

//testbench for the ram
module test_ram();
reg clk,write_enable;
reg [3:0]data_in,address;
wire [3:0]data_out;
ram_design dut(.clk(clk),.write_enable(write_enable),.data_in(data_in),.address(address),.data_out(data_out));
initial
begin
clk=0;
forever #5 clk=~clk;
end
initial
begin
write_enable=1;#10
address=4'b0000;
data_in=4'b1000;#10
address=4'b0001;
data_in=4'b1010;#10
address=4'b0010;
data_in=4'b1100;#10
address=4'b1010;
data_in=4'b1100;#10
write_enable=0;#10
address=4'b0000;#10
address=4'b0001;#10
address=4'b0010;#10
address=4'b1010;#10
$finish;
end

endmodule
