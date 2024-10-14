module integral  (
         ADC_data,
         clk,
         reset,
         duration, 
         interval,
         integral
    );
  
  input clk; 
  input reset;
  input [15:0] ADC_veri;
  input [7:0] duration;
  input [7:0] interval;
  output reg [63:0] integral;

    reg [15:0] memory [31:0];
    reg [7:0] i;

    always @ (posedge clk) begin
        if (reset) begin

            integral    <= 64'd0;
            memory[0]   <= 16'd0;
            memory[1]   <= 16'd0;
            memory[2]   <= 16'd0;
            memory[3]   <= 16'd0;
            memory[4]   <= 16'd0;
            memory[5]   <= 16'd0;
            memory[6]   <= 16'd0;
            memory[7]   <= 16'd0;
            memory[8]   <= 16'd0;
            memory[9]   <= 16'd0;
            memory[10]  <= 16'd0;
            memory[11]  <= 16'd0;
            memory[12]  <= 16'd0;
            memory[13]  <= 16'd0;
            memory[14]  <= 16'd0;
            memory[15]  <= 16'd0;
            memory[16]  <= 16'd0;
            memory[17]  <= 16'd0;
            memory[18]  <= 16'd0;
            memory[19]  <= 16'd0;
            memory[20]  <= 16'd0;
            memory[21]  <= 16'd0;
            memory[22]  <= 16'd0;
            memory[23]  <= 16'd0;
            memory[24]  <= 16'd0;
            memory[25]  <= 16'd0;
            memory[26]  <= 16'd0;
            memory[27]  <= 16'd0;
            memory[28]  <= 16'd0;
            memory[29]  <= 16'd0;
            memory[30]  <= 16'd0;
            memory[31]  <= 16'd0;

        end

        else begin

          memory[0]   <= ADC_data;
            memory[1]   <= memory[0];
            memory[2]   <= memory[1];
            memory[3]   <= memory[2];
            memory[4]   <= memory[3];
            memory[5]   <= memory[4];
            memory[6]   <= memory[5];
            memory[7]   <= memory[6];
            memory[8]   <= memory[7];
            memory[9]   <= memory[8];
            memory[10]  <= memory[9];
            memory[11]  <= memory[10];
            memory[12]  <= memory[11];
            memory[13]  <= memory[12];
            memory[14]  <= memory[13];
            memory[15]  <= memory[14];
            memory[16]  <= memory[15];
            memory[17]  <= memory[16];
            memory[18]  <= memory[17];
            memory[19]  <= memory[18];
            memory[20]  <= memory[19];
            memory[21]  <= memory[20];
            memory[22]  <= memory[21];
            memory[23]  <= memory[22];
            memory[24]  <= memory[23];
            memory[25]  <= memory[24];
            memory[26]  <= memory[25];
            memory[27]  <= memory[26];
            memory[28]  <= memory[27];
            memory[29]  <= memory[28];
            memory[30]  <= memory[29];
            memory[31]  <= memory[30];

            for (i=0; i < duration; i = i+1) begin
                integral <= integral + memory[i];
            end
            integral <= integral * interval;
        end
    end
endmodule
