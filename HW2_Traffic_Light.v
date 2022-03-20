module traffic_light (
    input  clk,
    input  rst,
    input  pass,
    output wire R,
    output wire G,
    output wire Y
);

reg [9:0] ctr ;
reg [2:0] mode ;
//mode 2'd0 = Green_1
//mode 2'd1 = None_1
//mode 2'd2 = Green_2
//mode 2'd3 = None_2
//mode 2'd4 = Green_3
//mode 2'd5 = Yellow
//mode 2'd6 = Red
reg [11:0] index ;

//initialize 
always @(rst) begin
    ctr <= 10'd0 ;
    mode <= 3'd0 ;
    index <= 12'd0 ;
end

always @(posedge clk) begin
    index <= index + 12'd1 ;

    if(pass && mode != 3'd0) begin
        ctr <= 10'd0 ;
        mode <= 3'd0 ;
    end 
    
    else begin
        case (mode)
        3'd0: begin
            if(ctr == 10'd511) begin
                mode <= mode + 3'd1 ;
                ctr <= 10'd0 ;
            end
            else begin
                ctr <= ctr + 10'd1 ;
            end
        end
        3'd1: begin
            if(ctr == 10'd63) begin
                mode <= mode + 3'd1 ;
                ctr <= 10'd0 ;
            end
            else begin
                ctr <= ctr+ 10'd1 ;
            end
        end
        3'd2: begin
            if(ctr == 10'd63) begin
                mode <= mode + 3'd1 ;
                ctr <= 10'd0 ;
            end
            else begin
                ctr <= ctr + 10'd1 ;
            end
        end
        3'd3: begin
            if(ctr == 10'd63) begin
                mode <= mode + 3'd1 ;
                ctr <= 10'd0 ;
            end
            else begin
                ctr <= ctr + 10'd1 ;
            end
        end
        3'd4: begin
            if(ctr == 10'd63) begin
                mode <= mode + 3'd1 ;
                ctr <= 10'd0 ;
            end
            else begin
                ctr <= ctr + 10'd1 ;
            end
        end
        3'd5: begin
            if(ctr == 10'd255) begin
                mode <= mode + 3'd1 ;
                ctr <= 10'd0 ;
            end
            else begin
                ctr <= ctr + 10'd1 ;
            end
        end
        3'd6: begin
            if(ctr == 10'd511) begin
                mode <= 3'd0 ;
                ctr <= 10'd0 ;
            end
            else begin
                ctr <= ctr + 10'd1 ;
            end
        end
        endcase    
    end
    
end

assign G = (mode == 3'd0 || mode == 3'd2 || mode == 3'd4) ? 1 : 0 ;
assign Y = (mode == 3'd5) ? 1 : 0 ;
assign R = (mode == 3'd6) ? 1 : 0 ;

endmodule
