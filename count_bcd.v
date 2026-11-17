module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    
    //enable signals 
    assign ena[1] = (q[3:0] == 4'd9);
    assign ena[2] = ena[1] && (q[7:4] == 4'd9);
    assign ena[3] = ena[2] && (q[11:8] == 4'd9);
    
    // ones digit
    always@(posedge clk)begin
        if(reset)
            q[3:0] <= 4'd0;
        else if (q[3:0] == 4'd9)
            q[3:0] <= 4'd0;
        else 
            q[3:0] <= q[3:0] + 4'd1;
    end
    
    // tens digit
    always@(posedge clk)begin
        if(reset)
            q[7:4] <= 4'd0;
        else if (ena[1])begin
          if  (q[7:4] == 4'd9)
            q[7:4] <= 4'd0;
        else 
            q[7:4] <= q[7:4] + 4'd1;
    end
    end
    
    
    //hundreds digit
   
    always@(posedge clk)begin
        if(reset)
            q[11:8] <= 4'd0;
        else if (ena[2]) begin
           if (q[11:8] == 4'd9)
            q[11:8] <= 4'd0;
        else 
            q[11:8] <= q[11:8] + 4'd1;
    end
    end
    
    //thousands digit
    
    // tens digit
    always@(posedge clk)begin
        if(reset)
            q[15:12] <= 4'd0;
        else if (ena[3])begin
            if(q[15:12] == 4'd9)
            q[15:12] <= 4'd0;
        else 
            q[15:12] <= q[15:12] + 4'd1;
    end
    end
    
endmodule
