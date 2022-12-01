module test_AND;
reg a, b,clock;
wire out;
initial begin // Dados de teste
a = 0; b = 0; clock =0;
#1 clock =1;
#1 a = 1; clock =0;
#1 b = 1; clock =1;
#1 a = 0; clock =0;
#1 clock =1;
end

initial begin 
 $display("-------------- AND TEST --------------");
$monitor("CLOCK: %d, a=%b b=%b  AND=%b",clock,a, b, out);
end

AND teste(a, b, out, clock);
endmodule

module AND(In1,In2, out, clock);
input  In1,In2,clock;
output reg out;

always@(posedge clock) begin
assign out = (In1 & In2);
end 
  
endmodule
