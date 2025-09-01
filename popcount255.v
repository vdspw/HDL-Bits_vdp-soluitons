/*  "population count" circuit counts the number of '1's in an input vector. Build a population count circuit for a 255-bit input vector.*/

module top_module( 
    input [254:0] in,
    output [7:0] out );
    always @(*) begin
        integer i;
        out = 0; // Initialize out to 0
        for (i = 0; i < 255; i = i + 1) begin
            if(in[i] == 1)
                out++;   
        end
    end
    
endmodule

// soultion2 -- no if condition -- in the always block 
// out = out + in[i];
