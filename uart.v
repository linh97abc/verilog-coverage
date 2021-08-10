module uart #(parameter CLKS_PER_BIT)
             (input i_Clock,
              input i_Rx_Serial,
              input i_Tx_DV,
              input [7:0] i_Tx_Byte,
              output o_Rx_DV,
              output [7:0] o_Rx_Byte,
              output o_Tx_Active,
              output o_Tx_Serial,
              output o_Tx_Done);
    
    uart_rx #(.CLKS_PER_BIT(CLKS_PER_BIT)) UART_RX_INST
    (.i_Clock(i_Clock),
    .i_Rx_Serial(i_Rx_Serial),
    .o_Rx_DV(o_Rx_DV),
    .o_Rx_Byte(o_Rx_Byte)
    );
    
    uart_tx #(.CLKS_PER_BIT(CLKS_PER_BIT)) UART_TX_INST
    (.i_Clock(i_Clock),
    .i_Tx_DV(i_Tx_DV),
    .i_Tx_Byte(i_Tx_Byte),
    .o_Tx_Active(o_Tx_Active),
    .o_Tx_Serial(o_Tx_Serial),
    .o_Tx_Done(o_Tx_Done)
    );
    
endmodule
