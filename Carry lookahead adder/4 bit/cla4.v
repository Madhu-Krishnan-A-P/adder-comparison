module CarryLookAheadAdder (
    input [3:0] A,        // Input A
    input [3:0] B,        // Input B
    input Cin,            // Carry-in
    input clk,            // Clock
    input reset,          // Asynchronous reset
    output reg [3:0] Sum, // Sum
    output reg Cout       // Carry-out
);

    // Internal registers for inputs and intermediate values
    reg [3:0] A_reg, B_reg;
    reg Cin_reg;
    reg [3:0] P, G;      // Propagate and Generate signals
    reg [3:0] C;         // Carry signals
    reg [3:0] Sum_internal;
    reg Cout_internal;

    // Input flip-flops
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            A_reg <= 4'b0;
            B_reg <= 4'b0;
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
        Cout_internal = G[3] | (P[3] & C[3]);

        // Compute sum
        Sum_internal = P ^ C;
    end

    // Output flip-flops
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            Sum <= 4'b0;
            Cout <= 1'b0;
        end else begin
            Sum <= Sum_internal;
            Cout <= Cout_internal;
        end
    end

endmodule
