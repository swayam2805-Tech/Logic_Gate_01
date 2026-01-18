module AND_GATE_TB;
    // Declare signals as 'reg' for inputs (they store values)
    reg A, B;
    // Declare signals as 'wire' for outputs (they are driven by the DUT)
    wire Y;

    // Instantiate the Design Under Test (DUT)
    AND_GATE DUT (.A(A), .B(B), .Y(Y));

    // Generate test patterns
    initial begin
        // At time 0
        A = 0; B = 0;
        #10 A = 0; B = 1; // After 10 time units
        #10 A = 1; B = 0; // After another 10 time units
        #10 A = 1; B = 1; // After another 10 time units
        #10 $finish;     // Stop the simulation
    end

    // Monitor and display changes
    initial begin
        $monitor("Time=%0t | Input A=%0b, Input B=%0b | Output Y=%0b", $time, A, B, Y);
    end

endmodule
