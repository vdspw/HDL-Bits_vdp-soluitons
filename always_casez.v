/* Build a priority encoder for 8-bit inputs. Given an 8-bit vector, the output should report the first (least significant) bit in the vector that is 1.
Report zero if the input vector has no bits that are high. For example, the input 8'b10010000 should output 3'd4, because bit[4] is first bit that is high. */

module top_module (
    input [7:0] in,
    output reg [2:0] pos
);
    always @(*) begin
        casez (in[7:0])
            8'b???????1: pos = 3'd0;  // First 1 at position 0 (LSB)
            8'b??????10: pos = 3'd1;  // First 1 at position 1
            8'b?????100: pos = 3'd2;  // First 1 at position 2
            8'b????1000: pos = 3'd3;  // First 1 at position 3
            8'b???10000: pos = 3'd4;  // First 1 at position 4
            8'b??100000: pos = 3'd5;  // First 1 at position 5
            8'b?1000000: pos = 3'd6;  // First 1 at position 6
            8'b10000000: pos = 3'd7;  // First 1 at position 7
            8'b00000000: pos = 3'd0;  // No 1s
            default:     pos = 3'd0;  // Safety default
                                                                
            
        endcase
    end
endmodule
