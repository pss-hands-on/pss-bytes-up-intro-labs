`include "zsp_sv_macros.svh"
package pss_types;
    import zsp_sv::*;
    
    typedef class pss_import_api;
    // TODO: define model-specific executor class
    typedef executor_base executor_base_c;
    typedef executor_base executor_t;
    class executor_pkg__executor_trait_s extends object;
        function new();
        endfunction
        function void do_pre_solve();
            pre_solve();
        endfunction
        function void do_post_solve(executor_base exec_b);
            post_solve(exec_b);
        endfunction
    endclass
    
    class executor_pkg__empty_executor_trait_s extends object;
        function new();
        endfunction
        function void do_pre_solve();
            pre_solve();
        endfunction
        function void do_post_solve(executor_base exec_b);
            post_solve(exec_b);
        endfunction
    endclass
    
    class executor_pkg__executor_base_c extends component;
        
        function new(string name, component_ctor_ctxt ctxt, component parent=null);
            super.new(name, ctxt, parent);
            executor_m = new[ctxt.executor_m.size()](ctxt.executor_m);
        endfunction
        
        function void init(executor_base exec_b);
            init_down(exec_b);
            init_up(exec_b);
        endfunction
        
        virtual function bit check();
            bit ret = 1;
            return ret;
        endfunction
    endclass
    
    class addr_reg_pkg__addr_space_base_c extends component;
        
        function new(string name, component_ctor_ctxt ctxt, component parent=null);
            super.new(name, ctxt, parent);
            executor_m = new[ctxt.executor_m.size()](ctxt.executor_m);
        endfunction
        
        function void init(executor_base exec_b);
            init_down(exec_b);
            init_up(exec_b);
        endfunction
        
        virtual function bit check();
            bit ret = 1;
            return ret;
        endfunction
    endclass
    
    class addr_reg_pkg__addr_trait_s extends object;
        function new();
        endfunction
        function void do_pre_solve();
            pre_solve();
        endfunction
        function void do_post_solve(executor_base exec_b);
            post_solve(exec_b);
        endfunction
    endclass
    
    class addr_reg_pkg__empty_addr_trait_s extends object;
        function new();
        endfunction
        function void do_pre_solve();
            pre_solve();
        endfunction
        function void do_post_solve(executor_base exec_b);
            post_solve(exec_b);
        endfunction
    endclass
    
    
    class addr_reg_pkg__addr_region_base_s extends addr_region_base_s;
        function new();
        endfunction
        function void do_pre_solve();
            pre_solve();
        endfunction
        function void do_post_solve(executor_base exec_b);
            post_solve(exec_b);
        endfunction
    endclass
    
    class addr_reg_pkg__addr_claim_base_s extends object;
        rand bit[63:0] size;
        rand bit permanent;
        function new();
        endfunction
        constraint c_0x12aeb80 {
        }
        function void do_pre_solve();
            pre_solve();
        endfunction
        function void do_post_solve(executor_base exec_b);
            post_solve(exec_b);
        endfunction
    endclass
    
    class addr_reg_pkg__reg_group_c extends reg_group_c;
        static addr_reg_pkg__reg_group_c prv_inst;
        
        function new(executor_base exec_b);
            super.new();
            
            map_registers(exec_b);
        endfunction
        
        virtual function longint unsigned get_offset_of_instance(
                input executor_base exec_b,
                input string name);
        endfunction
        
        virtual function longint unsigned get_offset_of_instance_array(
                input executor_base exec_b,
                input string name,
                input int index);
        endfunction
        
        virtual function void set_handle(
                input executor_base exec_b,
                input addr_handle_t addr);
        endfunction
        
        static function addr_reg_pkg__reg_group_c inst(executor_base exec_b);
            if (prv_inst == null) begin
                prv_inst = new(exec_b);
            end
            return prv_inst;
        endfunction
    endclass
    
    
    
    
    class addr_reg_pkg__reg_c__reg_c extends component;
        
        function new(string name, component_ctor_ctxt ctxt, component parent=null);
            super.new(name, ctxt, parent);
            executor_m = new[ctxt.executor_m.size()](ctxt.executor_m);
        endfunction
        
        function void init(executor_base exec_b);
            init_down(exec_b);
            init_up(exec_b);
        endfunction
        
        virtual function bit check();
            bit ret = 1;
            return ret;
        endfunction
    endclass
    
    class addr_reg_pkg__transparent_addr_space_c__transparent_addr_space_c extends addr_space_c;
        function new(string name, component_ctor_ctxt ctxt, component parent);
            super.new(name, ctxt, parent);
        endfunction
    endclass
    
    class addr_reg_pkg__contiguous_addr_space_c__contiguous_addr_space_c extends component;
        bit byte_addressable;
        
        function new(string name, component_ctor_ctxt ctxt, component parent=null);
            super.new(name, ctxt, parent);
            executor_m = new[ctxt.executor_m.size()](ctxt.executor_m);
        endfunction
        
        function void init(executor_base exec_b);
            init_down(exec_b);
            init_up(exec_b);
        endfunction
        
        virtual function bit check();
            bit ret = 1;
            return ret;
        endfunction
    endclass
    
    typedef class pss_top;
    class pss_top__Entry extends action;
        pss_top comp;
        function new();
        endfunction
        function void do_pre_solve();
            pre_solve();
        endfunction
        function void do_post_solve(executor_base exec_b);
            post_solve(exec_b);
        endfunction
        task body(executor_base exec_b);
            executor_t executor;
            $cast(executor, exec_b);
            begin
                this.comp.regs->csr.write_val(32'h0);
            end
        endtask
        
    endclass
    
    class addr_reg_pkg__addr_region_s__addr_region_s extends addr_region_base_s;
        addr_reg_pkg__empty_addr_trait_s trait;
        function new();
            trait = new();
        endfunction
        function void do_pre_solve();
            pre_solve();
            trait.do_pre_solve();
        endfunction
        function void do_post_solve(executor_base exec_b);
            post_solve(exec_b);
            trait.do_post_solve(exec_b);
        endfunction
    endclass
    
    class dma_regs extends reg_group_c;
        static dma_regs prv_inst;
        reg_field_c         csr;
        reg_field_c         int_msk_a;
        reg_field_c         int_msk_b;
        reg_field_c         int_src_a;
        reg_field_c         int_src_b;
        
        function new(executor_base exec_b);
            super.new();
            csr = new("csr");
            fields.push_back(csr);
            int_msk_a = new("int_msk_a");
            fields.push_back(int_msk_a);
            int_msk_b = new("int_msk_b");
            fields.push_back(int_msk_b);
            int_src_a = new("int_src_a");
            fields.push_back(int_src_a);
            int_src_b = new("int_src_b");
            fields.push_back(int_src_b);
            
            map_registers(exec_b);
        endfunction
        
        static function dma_regs inst(executor_base exec_b);
            if (prv_inst == null) begin
                prv_inst = new(exec_b);
            end
            return prv_inst;
        endfunction
    endclass
    
    class dma_channel_regs extends reg_group_c;
        static dma_channel_regs prv_inst;
        reg_field_c         csr;
        
        function new(executor_base exec_b);
            super.new();
            csr = new("csr");
            fields.push_back(csr);
            
            map_registers(exec_b);
        endfunction
        
        static function dma_channel_regs inst(executor_base exec_b);
            if (prv_inst == null) begin
                prv_inst = new(exec_b);
            end
            return prv_inst;
        endfunction
    endclass
    
    class pss_top extends component;
        addr_reg_pkg__transparent_addr_space_c__transparent_addr_space_c aspace;
        reg_group_field_c #(dma_regs) regs;
        
        function new(string name, component_ctor_ctxt ctxt, component parent=null);
            super.new(name, ctxt, parent);
            aspace = new("aspace", ctxt, this);
            regs = new("regs", ctxt.get_default_executor());
            executor_m = new[ctxt.executor_m.size()](ctxt.executor_m);
        endfunction
        
        function void init(executor_base exec_b);
            init_down(exec_b);
            init_up(exec_b);
        endfunction
        
        virtual function bit check();
            bit ret = 1;
            if (regs == null) begin
                $display("Error: register handle not set for regs");
                ret = 0;
            end
            return ret;
        endfunction
    endclass
    
    class pss_import_api #(type BaseT=zsp_sv::empty_t) extends backend_api #(BaseT);
    endclass
    
endpackage
`include "zsp_sv_macros.svh"
package pss_top__Entry_prv;
    import zsp_sv::*;
    import pss_types::*;
    
    typedef class pss_top__Entry_actor;
    typedef pss_top__Entry_actor actor_t;
    typedef class activity_0x11926f0;
    
    class activity_0x11926f0 extends activity_c;
        actor_t actor;
        function new(actor_t actor);
            this.actor = actor;
        endfunction
        
        virtual task run();
            pss_top__Entry pss_top__Entry_0x107fba0;

            // Traverse action pss_top::Entry
            begin
                executor_t executor;
                pss_top__Entry_0x107fba0 = new();
                pss_top__Entry_0x107fba0.do_pre_solve();
                if (!pss_top__Entry_0x107fba0.randomize() with {
                    parent_comp_id == 0;
                    (parent_comp_id == 0) -> comp_id == 0;
                }) begin
                end
                if (!$cast(pss_top__Entry_0x107fba0.comp, actor.comp_l[pss_top__Entry_0x107fba0.comp_id])) begin
                    $display("Failed to cast component");
                end
                $cast(executor, pss_top__Entry_0x107fba0.comp.get_default_executor());
                pss_top__Entry_0x107fba0.do_post_solve(executor);
                
                foreach (actor.listeners[i]) begin
                    actor.listeners[i].enter_traverse(pss_top__Entry_0x107fba0);
                end
                pss_top__Entry_0x107fba0.body(executor);
                
                foreach (actor.listeners[i]) begin
                    actor.listeners[i].leave_traverse(pss_top__Entry_0x107fba0);
                end
                
                pss_top__Entry_0x107fba0.dtor();
            end

        endtask
        
    endclass
    class pss_top__Entry_actor extends actor_c;
        pss_top comp_tree;
        pss_import_api api;
        executor_base_c default_executor;
        
        function new(pss_import_api api=null);
            component_ctor_ctxt ctxt = new(this, 0);
            super.new("<actor>", null, null);
            this.api = api;
            this.default_executor = new("default_executor", this);
            comp_tree = new("pss_top", ctxt, this);
        endfunction
        
        virtual task run();
            activity_0x11926f0 root_activity = new(this);
            
            comp_tree.init(this.default_executor);
            
            if (comp_tree.check()) begin
                if (api == null) begin
                    api = new();
                end
                
                foreach(listeners[i]) begin
                    listeners[i].enter_actor(this);
                end
                
                root_activity.run();
                
                foreach(listeners[i]) begin
                    listeners[i].leave_actor(this);
                end
            end else begin
                $display("Error: initialization check failed");
            end
            
        endtask
        
        virtual function pss_import_api get_api();
            return api;
        endfunction
        
        virtual function executor_base get_default_executor();
            return default_executor;
        endfunction
        
        virtual function backend_api get_backend();
            return api;
        endfunction
    endclass
endpackage
package pss_top__Entry_pkg;
    import zsp_sv::*;
    import pss_top__Entry_prv::*;
    typedef pss_top__Entry_prv::pss_top__Entry_actor pss_top__Entry;
endpackage
