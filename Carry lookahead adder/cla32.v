module CarryLookAheadAdder (
    input [31:0] A,         // Input A (32 bits)
    input [31:0] B,         // Input B (32 bits)
    input Cin,              // Carry-in
    input clk,              // Clock
    input reset,            // Synchronous reset
    output reg [31:0] Sum,  // Sum (32 bits)
    output reg Cout         // Carry-out
);

    reg [31:0] A_reg, B_reg;
    reg Cin_reg;
    reg [31:0] C;           // Carry signals
    wire [31:0] P, G;       // Propagate, Generate

    // Input flip-flops
    always @(posedge clk) begin
        if (reset) begin
            A_reg <= 32'b0;
            B_reg <= 32'b0;
            Cin_reg <= 1'b0;
        end else begin
            A_reg <= A;
            B_reg <= B;
            Cin_reg <= Cin;
        end
    end

    // Generate Propagate and Generate signals
    assign P = A_reg ^ B_reg;
    assign G = A_reg & B_reg;

    // Compute Carry signals explicitly
    always @(*) begin
        C[0] = Cin_reg;
        C[1] = G[0] | (P[0] & C[0]);
        C[2] = G[1] | (P[1] & C[1]);
        C[3] = G[2] | (P[2] & C[2]);
        C[4] = G[3] | (P[3] & C[3]);
        C[5] = G[4] | (P[4] & C[4]);
        C[6] = G[5] | (P[5] & C[5]);
        C[7] = G[6] | (P[6] & C[6]);
        C[8] = G[7] | (P[7] & C[7]);
        C[9] = G[8] | (P[8] & C[8]);
        C[10] = G[9] | (P[9] & C[9]);
        C[11] = G[10] | (P[10] & C[10]);
        C[12] = G[11] | (P[11] & C[11]);
        C[13] = G[12] | (P[12] & C[12]);
        C[14] = G[13] | (P[13] & C[13]);
        C[15] = G[14] | (P[14] & C[14]);
        C[16] = G[15] | (P[15] & C[15]);
        C[17] = G[16] | (P[16] & C[16]);
        C[18] = G[17] | (P[17] & C[17]);
        C[19] = G[18] | (P[18] & C[18]);
        C[20] = G[19] | (P[19] & C[19]);
        C[21] = G[20] | (P[20] & C[20]);
        C[22] = G[21] | (P[21] & C[21]);
        C[23] = G[22] | (P[22] & C[22]);
        C[24] = G[23] | (P[23] & C[23]);
        C[25] = G[24] | (P[24] & C[24]);
        C[26] = G[25] | (P[25] & C[25]);
        C[27] = G[26] | (P[26] & C[26]);
        C[28] = G[27] | (P[27] & C[27]);
        C[29] = G[28] | (P[28] & C[28]);
        C[30] = G[29] | (P[29] & C[29]);
        C[31] = G[30] | (P[30] & C[30]);
    end

    // Output flip-flops
    always @(posedge clk) begin
        if (reset) begin
            Sum <= 32'b0;
            Cout <= 1'b0;
        end else begin
            Sum <= P ^ C;
            Cout <= G[31] | (P[31] & C[31]);
        end
    end

endmodule