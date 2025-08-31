`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
wire OR_in1;
    wire OR_in2;
    wire NOT_in1;
    
    assign OR_in1 = a && b;
    assign OR_in2 = c && d;
    assign out = (a && b) || (c && d);
    assign out_n = !((a && b) || (c && d));
    
endmodule
