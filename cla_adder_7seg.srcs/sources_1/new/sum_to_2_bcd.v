`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Nickolas Schiffer
// 
// Create Date: 03/04/2018 02:18:11 PM
// Design Name: 
// Module Name: sum_to_2_bcd
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sum_to_2_bcd(
input [3:0] sum,
output reg [3:0] bcd0, bcd1
    );
    
    always@(sum)
    begin
            if (sum <= 9)
                begin
                    bcd0 <= sum;
                    bcd1 <= 4'b0;
                end
            else
            begin
            
                casez(sum)
                4'b1010:       //10
                    begin
                        bcd0 <= 4'b0;
                        bcd1 <= 4'b1;
                    end
                4'b1011:       //11
                    begin
                        bcd0 <= 4'b1;
                        bcd1 <= 4'b1;
                    end
                4'b1100:       //12
                    begin
                        bcd0 <= 4'b0010;
                        bcd1 <= 4'b1;
                    end
                4'b1101:       //13
                    begin
                        bcd0 <= 4'b0011;
                        bcd1 <= 4'b1;
                    end
                4'b1110:       //14
                    begin
                        bcd0 <= 4'b0100;
                        bcd1 <= 4'b1;
                    end
                4'b1111:       //15
                    begin
                        bcd0 <= 4'b0101;
                        bcd1 <= 4'b1;
                    end
                default:
                    begin
                        bcd0 <= 4'b0;
                        bcd1 <= 4'b0;
                    end
                endcase
             end
        
    end

endmodule
