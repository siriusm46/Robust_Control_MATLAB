`timescale 1ns / 1ps
module min_max
  (clk,
   reset,
   PID_Done,
   i_data,
   o_data);
    
    input clk; 
    input reset_b; 
    input PID_Done; 
  input signed [15:0] i_data; 
  output reg [15:0] o_data;



localparam umax = 16'h0FFF; //4.095 12 bit- 3.3Volt 
localparam umin = 16'd0; // 0V 



  
  reg [15:0] r_data; 
    
    
    
  always @(posedge clk or negedge reset) begin 
      if (~reset) begin
                r_data <= 0; 
      end else begin 
        if (pi_done == 1'b1) begin
          if ((i_data >= umin) && (i_data <= umax)) begin
                            r_data <= i_data; 
          end else if (i_data > umax ) begin
                            r_data <=  umax; 
                      end else begin 
                            r_data <= umin; 
                      end
        end else begin
                      r_data <= r_data;  
        end
     end 
  end 
        
  always @ (posedge clk) begin
        o_data <= r_data; 
  end
endmodule
