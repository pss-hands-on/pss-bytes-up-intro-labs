
`include "svt_macros.svh"
package memory_rw_pkg;
    import svt_pkg::*;
    import pss_types::*;
    import fwperiph_dma_tb_pkg::*;
    import fwvip_wb_pkg::*;
    import pss_top__Entry_pkg::*;
    import pss_top__Entry_prv::*;

    class bfm_mem_access_impl extends pss_types::pss_import_api;
        fwvip_wb_initiator_api bfm;

        function new(fwvip_wb_initiator_api bfm);
            this.bfm = bfm;
        endfunction

        virtual task read32(output bit[31:0] data, input bit[63:0] addr);
            bfm.read32(data, addr);
        endtask

        virtual task write32(bit[63:0] addr, bit[31:0] data);
            bfm.write32(data, addr);
        endtask

    endclass

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
            bfm_mem_access_impl api;
            pss_top__Entry_actor actor;
//            pss_top__Entry actor;

            api = new(reg_bfm);
            actor = new(api);

            barrier.raise_objection();
            reg_bfm.wait_reset();

            actor.run();

            #100us;
            barrier.drop_objection();
        endtask

    endclass


endpackage
