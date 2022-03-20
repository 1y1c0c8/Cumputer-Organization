`timescale 1ns/10ps
module CS(Y, X, reset, clk);

  input clk, reset; 
  input 	[7:0] X;
  output reg	[9:0] Y;


  reg [10:0] index = 11'd0 ;
  reg [3:0] waitNine ;
  reg [7:0] pop ;
  reg [7:0] x1 ;
  reg [7:0] x2 ;
  reg [7:0] x3 ;
  reg [7:0] x4 ;
  reg [7:0] x5 ;
  reg [7:0] x6 ;
  reg [7:0] x7 ;
  reg [7:0] x8 ;
  reg [7:0] x9 ;
  reg [7:0] temp = 8'd0 ;
  reg [7:0] appr ;
  
  reg [10:0] sumX ;
  reg [7:0] avg ;
  
  //Update "index" (Behavior)
  always@(negedge clk) begin    
    //if(waitNine >= 4'd9) begin
      index <= index + 11'd1 ;
    //end
  end


    
  //Update "waitNine" (Behavior)
  
    

  //Update "sumX" & "avg" (Behavior)
  always@(posedge clk) begin
    if(index == 11'd11) begin
      sumX = (x1+x2+x3+x4+x5+x6+x7+x8+X) ;
      avg = sumX/9 ;
    end
    else if(index > 11'd11) begin
      sumX = (x2+x3+x4+x5+x6+x7+x8+x9+X) ;
      avg = sumX/9 ;
    end
  end
    
    

  //Update "x1~x9" & "pop"
  always@(posedge clk) begin
    if(index < 11'd3) begin
      x1 <= 8'd0 ;
      x2 <= 8'd0 ;
      x3 <= 8'd0 ;
      x4 <= 8'd0 ;
      x5 <= 8'd0 ;
      x6 <= 8'd0 ;
      x7 <= 8'd0 ;
      x8 <= 8'd0 ;
      x9 <= 8'd0 ;
    end
    case(index) 
      4'd0: begin
      end
      4'd1: begin
      end
      4'd2: begin
      end
      4'd3: x1 <= X ;
      4'd4: x2 <= X ;
      4'd5: x3 <= X ;
      4'd6: x4 <= X ;
      4'd7: x5 <= X ;
      4'd8: x6 <= X ;
      4'd9: x7 <= X ;
      4'd10: x8 <= X ;
      4'd11: x9 <= X ;
      default: begin
        pop <= x1 ;
        x1 <= x2 ;
        x2 <= x3 ;
        x3 <= x4 ;
        x4 <= x5 ;
        x5 <= x6 ;
        x6 <= x7 ;
        x7 <= x8 ;
        x8 <= x9 ;
        x9 <=  X ;
      end 
    endcase
  end
  
  

  //Update "temp" & "appr" (Behavior)
  always@(posedge clk) begin
    if(index == 11'd11) begin
      temp <= 8'd0 ;
      if((x1 < avg) && (x1 > temp)) begin
        temp = x1 ;
      end
      if((x2 < avg) && (x2 > temp)) begin
        temp = x2 ;
      end
      if((x3 < avg) && (x3 > temp)) begin
        temp = x3 ;
      end
      if((x4 < avg) && (x4 > temp)) begin
        temp = x4 ;
      end
      if((x5 < avg) && (x5 > temp)) begin
        temp = x5 ;
      end
      if((x6 < avg) && (x6 > temp)) begin
        temp = x6 ;
      end
      if((x7 < avg) && (x7 > temp)) begin
        temp = x7 ;
      end
      if((x8 < avg) && (x8 > temp)) begin
        temp = x8 ;
      end
      if((x9 < avg) && (x9 > temp)) begin
        temp = x9 ;
      end
      appr <= temp ;
    end
    else if(index > 11'd11) begin
      temp <= 8'd0 ;
      if((x2 <= avg) && (x2 > temp)) begin
        temp = x2 ;
      end
      if((x3 <= avg) && (x3 > temp)) begin
        temp = x3 ;
      end
      if((x4 <= avg) && (x4 > temp)) begin
        temp = x4 ;
      end
      if((x5 <= avg) && (x5 > temp)) begin
        temp = x5 ;
      end
      if((x6 <= avg) && (x6 > temp)) begin
        temp = x6 ;
      end
      if((x7 <= avg) && (x7 > temp)) begin
        temp = x7 ;
      end
      if((x8 <= avg) && (x8 > temp)) begin
        temp = x8 ;
      end
      if((x9 <= avg) && (x9 > temp)) begin
        temp = x9 ;
      end
      if((X <= avg) && (X > temp)) begin
        temp = X ;
      end
      appr <= temp ;
    end
  end
  

    
  //Update "Y"  (Behavoir)  
  always@(negedge clk) begin
    if(index >= 11'd11) begin
      Y <= ( (sumX + appr*9) / 8 ) ;
    end
  end
  
  
endmodule
