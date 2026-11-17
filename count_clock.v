module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss
);

    // Internal enables
    wire ena_min = ena && (ss == 8'h59);
    wire ena_hr  = ena_min && (mm == 8'h59);

    // --- SECONDS (00 to 59) ---
    always @(posedge clk) begin
        if (reset)
            ss <= 8'h00;
        else if (ena) begin
            if (ss == 8'h59)
                ss <= 8'h00;
            else if (ss[3:0] == 4'd9) begin
                ss[3:0] <= 4'd0;
                ss[7:4] <= ss[7:4] + 4'd1;
            end else begin
                ss[3:0] <= ss[3:0] + 4'd1;
            end
        end
    end

    // --- MINUTES (00 to 59) ---
    always @(posedge clk) begin
        if (reset)
            mm <= 8'h00;
        else if (ena_min) begin
            if (mm == 8'h59)
                mm <= 8'h00;
            else if (mm[3:0] == 4'd9) begin
                mm[3:0] <= 4'd0;
                mm[7:4] <= mm[7:4] + 4'd1;
            end else begin
                mm[3:0] <= mm[3:0] + 4'd1;
            end
        end
    end

    // --- HOURS (01 to 12) ---
    always @(posedge clk) begin
        if (reset)
            hh <= 8'h12; // Reset to 12:00 AM
        else if (ena_hr) begin
            if (hh == 8'h12)
                hh <= 8'h01; // Roll over from 12 to 1
            else if (hh[3:0] == 4'd9) begin
                hh[3:0] <= 4'd0;
                hh[7:4] <= hh[7:4] + 4'd1;
            end else begin
                hh[3:0] <= hh[3:0] + 4'd1;
            end
        end
    end

    // --- AM / PM TOGGLE ---
    always @(posedge clk) begin
        if (reset)
            pm <= 1'b0; // 0 for AM
        else if (ena_hr && (hh == 8'h11))
            pm <= ~pm;  // Toggle when going from 11 to 12
    end

endmodule
