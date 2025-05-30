module CarryLookAheadAdder (
    input [15:0] A,        // Input A (16 bits)
    input [15:0] B,        // Input B (16 bits)
    input Cin,             // Carry-in
    input clk,             // Clock
    input reset,           // Asynchronous reset
    output reg [15:0] Sum, // Sum (16 bits)
    output reg Cout        // Carry-out
);

    // Internal registers for inputs and intermediate values
    reg [15:0] A_reg, B_reg;
    reg Cin_reg;
    reg [15:0] P, G;      // Propagate and Generate signals
    reg [15:0] C;         // Carry signals
    reg [15:0] Sum_internal;
    reg Cout_internal;

    // Input flip-flops
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            A_reg <= 16'b0;
            B_reg <= 16'b0;
            Cin_reg <= 1'b0;
        end else begin
            A_reg <= A;
            B_reg <= B;
            Cin_reg <= Cin;
        end
    end

    // Carry Look-Ahead Logic
    always @(*) begin
        // Compute propagate (P) and generate (G) signals
        P = A_reg ^ B_reg;  // Propagate: P[i] = A[i] ^ B[i]
        G = A_reg & B_reg;  // Generate: G[i] = A[i] & B[i]

        // Compute carry signals
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
        Cout_internal = G[15] | (P[15] & C[15]);

        // Compute sum
        Sum_internal = P ^ C;
    end

    // Output flip-flops
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            Sum <= 16'b0;
            Cout <= 1'b0;
        end else begin
            Sum <= Sum_internal;
            Cout <= Cout_internal;
        end
    end

endmodule
