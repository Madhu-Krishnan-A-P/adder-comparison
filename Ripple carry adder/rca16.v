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
    input [15:0] A_in,  // 16-bit input
    input [15:0] B_in,  // 16-bit input
    input Cin_in,
    output reg [15:0] SUM_out,  // 16-bit output
    output reg Cout_out
);

// Registers to store inputs and outputs
reg [15:0] A;  // 16-bit register for A
reg [15:0] B;  // 16-bit register for B
reg Cin;
reg [15:0] SUM;
reg Cout;

// Internal wires for the RCA outputs
wire [15:0] SUM_internal;  // 16-bit wire for sum
wire Cout_internal;

// Wire for carry propagation
wire [14:0] C;  // Carry wires for 15 intermediate carries


// Instantiate the full adder logic for each bit
fulladder adder0 (
    .x(A[0]),
    .y(B[0]),
    .z(Cin),
    .sum(SUM_internal[0]),
    .carry(C[0])
);

fulladder adder1 (
    .x(A[1]),
    .y(B[1]),
    .z(C[0]),
    .sum(SUM_internal[1]),
    .carry(C[1])
);

fulladder adder2 (
    .x(A[2]),
    .y(B[2]),
    .z(C[1]),
    .sum(SUM_internal[2]),
    .carry(C[2])
);

fulladder adder3 (
    .x(A[3]),
    .y(B[3]),
    .z(C[2]),
    .sum(SUM_internal[3]),
    .carry(C[3])
);

fulladder adder4 (
    .x(A[4]),
    .y(B[4]),
    .z(C[3]),
    .sum(SUM_internal[4]),
    .carry(C[4])
);

fulladder adder5 (
    .x(A[5]),
    .y(B[5]),
    .z(C[4]),
    .sum(SUM_internal[5]),
    .carry(C[5])
);

fulladder adder6 (
    .x(A[6]),
    .y(B[6]),
    .z(C[5]),
    .sum(SUM_internal[6]),
    .carry(C[6])
);

fulladder adder7 (
    .x(A[7]),
    .y(B[7]),
    .z(C[6]),
    .sum(SUM_internal[7]),
    .carry(C[7])
);

fulladder adder8 (
    .x(A[8]),
    .y(B[8]),
    .z(C[7]),
    .sum(SUM_internal[8]),
    .carry(C[8])
);

fulladder adder9 (
    .x(A[9]),
    .y(B[9]),
    .z(C[8]),
    .sum(SUM_internal[9]),
    .carry(C[9])
);

fulladder adder10 (
    .x(A[10]),
    .y(B[10]),
    .z(C[9]),
    .sum(SUM_internal[10]),
    .carry(C[10])
);

fulladder adder11 (
    .x(A[11]),
    .y(B[11]),
    .z(C[10]),
    .sum(SUM_internal[11]),
    .carry(C[11])
);

fulladder adder12 (
    .x(A[12]),
    .y(B[12]),
    .z(C[11]),
    .sum(SUM_internal[12]),
    .carry(C[12])
);

fulladder adder13 (
    .x(A[13]),
    .y(B[13]),
    .z(C[12]),
    .sum(SUM_internal[13]),
    .carry(C[13])
);

fulladder adder14 (
    .x(A[14]),
    .y(B[14]),
    .z(C[13]),
    .sum(SUM_internal[14]),
    .carry(C[14])
);

fulladder adder15 (
    .x(A[15]),
    .y(B[15]),
    .z(C[14]),
    .sum(SUM_internal[15]),
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
