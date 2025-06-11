module CarryLookAheadAdder (
    input [7:0] A,        // Input A (8 bits)
    input [7:0] B,        // Input B (8 bits)
    input Cin,            // Carry-in
    input clk,            // Clock
    input reset,          // Asynchronous reset
    output reg [7:0] Sum, // Sum (8 bits)
    output reg Cout       // Carry-out
);

    // Internal registers for inputs and intermediate values
    reg [7:0] A_reg, B_reg;
    reg Cin_reg;
    reg [7:0] P, G;      // Propagate and Generate signals
    reg [7:0] C;         // Carry signals
    reg [7:0] Sum_internal;
    reg Cout_internal;

    // Input flip-flops
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            A_reg <= 8'b0;
            B_reg <= 8'b0;
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
        Cout_internal = G[7] | (P[7] & C[7]);

        // Compute sum
        Sum_internal = P ^ C;
    end

    // Output flip-flops
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            Sum <= 8'b0;
            Cout <= 1'b0;
        end else begin
            Sum <= Sum_internal;
            Cout <= Cout_internal;
        end
    end

endmodule
