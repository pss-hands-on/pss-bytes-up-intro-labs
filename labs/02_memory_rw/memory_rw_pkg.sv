
`include "svt_macros.svh"
package memory_rw_pkg;
    import svt_pkg::*;
    import fwperiph_dma_tb_pkg::*;
    import fwvip_wb_pkg::*;


    class smoke_test extends fwperiph_dma_test_base;
        `svt_test_decl(smoke_test)

        fwvip_wb_initiator_api reg_bfm;

        function new(string name);
            super.new(name);
        endfunction

        virtual function void connect();
            reg_bfm = fwvip_wb_initiator_rgy.get(".wb_initiator", 1);
        endfunction

        task run(svt_barrier barrier);
            bit[31:0] data;

            barrier.raise_objection();
            reg_bfm.wait_reset();

            for (int i=0; i<10; i++) begin
                $display("%0t: --> read %0d", $time, i);
                reg_bfm.read32(data, 32'h0000_0000+4*i);
                $display("%0t: <-- read %0d", $time, i);
            end
            #100us;
            barrier.drop_objection();
        endtask

    endclass


endpackage
