module fulladder(
    input x,
    input y,
    input z,
    output reg sum,
    output reg carry
);

always @(x or y or z) begin
    sum = x ^ y ^ z; 
    carry = (x & y) | ((x ^ y) & z);
end

endmodule

module RCA(
    input clk,
    input reset,
    input [7:0] A_in,  // 8-bit input
    input [7:0] B_in,  // 8-bit input
    input Cin_in,
    output reg [7:0] SUM_out,  // 8-bit output
    output reg Cout_out
);

// Registers to store inputs and outputs
reg [7:0] A;  // 8-bit register for A
reg [7:0] B;  // 8-bit register for B
reg Cin;
reg [7:0] SUM;
reg Cout;

// Internal wires for the RCA outputs
wire [7:0] SUM_internal;  // 8-bit wire for sum
wire Cout_internal;

// Wire for carry propagation
wire C1, C2, C3, C4, C5, C6, C7;  // Intermediate carry bits (7 total)


// Instantiate the full adder logic for each bit
fulladder adder0 (
    .x(A[0]),
    .y(B[0]),
    .z(Cin),
    .sum(SUM_internal[0]),
    .carry(C1)
);

fulladder adder1 (
    .x(A[1]),
    .y(B[1]),
    .z(C1),
    .sum(SUM_internal[1]),
    .carry(C2)
);

fulladder adder2 (
    .x(A[2]),
    .y(B[2]),
    .z(C2),
    .sum(SUM_internal[2]),
    .carry(C3)
);

fulladder adder3 (
    .x(A[3]),
    .y(B[3]),
    .z(C3),
    .sum(SUM_internal[3]),
    .carry(C4)
);

fulladder adder4 (
    .x(A[4]),
    .y(B[4]),
    .z(C4),
    .sum(SUM_internal[4]),
    .carry(C5)
);

fulladder adder5 (
    .x(A[5]),
    .y(B[5]),
    .z(C5),
    .sum(SUM_internal[5]),
    .carry(C6)
);

fulladder adder6 (
    .x(A[6]),
    .y(B[6]),
    .z(C6),
    .sum(SUM_internal[6]),
    .carry(C7)
);

fulladder adder7 (
    .x(A[7]),
    .y(B[7]),
    .z(C7),
    .sum(SUM_internal[7]),
    .carry(Cout_internal)
);

// Sequential logic to register inputs and outputs
always @(posedge clk or posedge reset) begin
    if (reset) begin
        A <= 0;
        B <= 0;
        Cin <= 0;
        SUM_out <= 0;
        Cout_out <= 0;
    end else begin
        A <= A_in;
        B <= B_in;
        Cin <= Cin_in;
        SUM_out <= SUM_internal;
        Cout_out <= Cout_internal;
    end
end

endmodule