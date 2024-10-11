`include "zsp_sv_macros.svh"
package pss_types;
    import zsp_sv::*;
    
    typedef class pss_import_api;
    // TODO: define model-specific executor class
    typedef executor_base executor_base_c;
    typedef executor_base executor_t;
    typedef class executor_pkg__executor_trait_s;
    typedef class executor_pkg__empty_executor_trait_s;
    typedef class executor_pkg__executor_base_c;
    typedef class addr_reg_pkg__addr_space_base_c;
    typedef class addr_reg_pkg__addr_trait_s;
    typedef class addr_reg_pkg__empty_addr_trait_s;
    typedef class addr_handle_t;
    typedef class addr_reg_pkg__addr_region_base_s;
    typedef class addr_reg_pkg__addr_claim_base_s;
    typedef class addr_reg_pkg__reg_group_c;
    typedef class addr_reg_pkg__transparent_addr_space_c;
    typedef class addr_reg_pkg__contiguous_addr_space_c;
    typedef class pss_top__Exp;
    typedef class pss_top__Entry;
    typedef class addr_reg_pkg__transparent_addr_region_s;
    typedef class addr_reg_pkg__addr_region_s;
    typedef class pss_top;
    
    class executor_pkg__executor_trait_s extends object;
        
        function new();
        endfunction
        
        virtual function void dtor();
        endfunction
        
        virtual function void init(executor_base exec_b);
        endfunction
        virtual function void __assign__(executor_pkg__executor_trait_s rhs);
        endfunction
        
        static function executor_pkg__executor_trait_s create_default();
            executor_pkg__executor_trait_s ret = new();
            return ret;
        endfunction
        
        static function executor_pkg__executor_trait_s create_init();
            executor_pkg__executor_trait_s ret = new();
            return ret;
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
        
        virtual function void dtor();
        endfunction
        
        virtual function void init(executor_base exec_b);
        endfunction
        virtual function void __assign__(executor_pkg__empty_executor_trait_s rhs);
        endfunction
        
        static function executor_pkg__empty_executor_trait_s create_default();
            executor_pkg__empty_executor_trait_s ret = new();
            return ret;
        endfunction
        
        static function executor_pkg__empty_executor_trait_s create_init();
            executor_pkg__empty_executor_trait_s ret = new();
            return ret;
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
        
        
        
        function void do_init(executor_base exec_b);
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
        
        
        
        function void do_init(executor_base exec_b);
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
        
        virtual function void dtor();
        endfunction
        
        virtual function void init(executor_base exec_b);
        endfunction
        virtual function void __assign__(addr_reg_pkg__addr_trait_s rhs);
        endfunction
        
        static function addr_reg_pkg__addr_trait_s create_default();
            addr_reg_pkg__addr_trait_s ret = new();
            return ret;
        endfunction
        
        static function addr_reg_pkg__addr_trait_s create_init();
            addr_reg_pkg__addr_trait_s ret = new();
            return ret;
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
        
        virtual function void dtor();
        endfunction
        
        virtual function void init(executor_base exec_b);
        endfunction
        virtual function void __assign__(addr_reg_pkg__empty_addr_trait_s rhs);
        endfunction
        
        static function addr_reg_pkg__empty_addr_trait_s create_default();
            addr_reg_pkg__empty_addr_trait_s ret = new();
            return ret;
        endfunction
        
        static function addr_reg_pkg__empty_addr_trait_s create_init();
            addr_reg_pkg__empty_addr_trait_s ret = new();
            return ret;
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
        
        virtual function void dtor();
        endfunction
        
        virtual function void init(executor_base exec_b);
        endfunction
        virtual function void __assign__(addr_reg_pkg__addr_region_base_s rhs);
            size = rhs.size;
        endfunction
        
        static function addr_reg_pkg__addr_region_base_s create_default();
            addr_reg_pkg__addr_region_base_s ret = new();
            return ret;
        endfunction
        
        static function addr_reg_pkg__addr_region_base_s create_init(
                longint unsigned size);
            addr_reg_pkg__addr_region_base_s ret = new();
            ret.size = size;
            return ret;
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
        
        virtual function void dtor();
        endfunction
        
        virtual function void init(executor_base exec_b);
        endfunction
        virtual function void __assign__(addr_reg_pkg__addr_claim_base_s rhs);
            size = rhs.size;
            permanent = rhs.permanent;
        endfunction
        
        static function addr_reg_pkg__addr_claim_base_s create_default();
            addr_reg_pkg__addr_claim_base_s ret = new();
            return ret;
        endfunction
        
        static function addr_reg_pkg__addr_claim_base_s create_init(
                longint unsigned size,
                bit permanent);
            addr_reg_pkg__addr_claim_base_s ret = new();
            ret.size = size;
            ret.permanent = permanent;
            return ret;
        endfunction
        constraint c_0x11e7b10 {
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
    
    class addr_reg_pkg__transparent_addr_space_c extends addr_space_c;
        function new(string name, component_ctor_ctxt ctxt, component parent);
            super.new(name, ctxt, parent);
        endfunction
    endclass
    
    class addr_reg_pkg__contiguous_addr_space_c extends component;
        bit byte_addressable;
        
        function new(string name, component_ctor_ctxt ctxt, component parent=null);
            super.new(name, ctxt, parent);
            executor_m = new[ctxt.executor_m.size()](ctxt.executor_m);
        endfunction
        
        
        
        function void do_init(executor_base exec_b);
            init_down(exec_b);
            init_up(exec_b);
        endfunction
        
        
        
        virtual function bit check();
            bit ret = 1;
            return ret;
        endfunction
    endclass
    
    class pss_top__Exp extends object;
        bit[31:0] mask;
        bit[31:0] value;
        
        function new();
        endfunction
        
        virtual function void dtor();
        endfunction
        
        virtual function void init(executor_base exec_b);
        endfunction
        virtual function void __assign__(pss_top__Exp rhs);
            mask = rhs.mask;
            value = rhs.value;
        endfunction
        
        static function pss_top__Exp create_default();
            pss_top__Exp ret = new();
            return ret;
        endfunction
        
        static function pss_top__Exp create_init(
                int unsigned mask,
                int unsigned value);
            pss_top__Exp ret = new();
            ret.mask = mask;
            ret.value = value;
            return ret;
        endfunction
        function void do_pre_solve();
            pre_solve();
        endfunction
        function void do_post_solve(executor_base exec_b);
            post_solve(exec_b);
        endfunction
    endclass
    
    typedef class pss_top;
    class pss_top__Entry extends action;
        pss_top comp;
        
        function new();
        endfunction
        
        
        virtual function void init(executor_base exec_b);
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
                int unsigned data;
                for (int i=0; i<32'h4; i+=1) begin
                    int unsigned targ_t0;
                    executor.read32(targ_t0, make_handle_from_handle(exec_b, this.comp.addr_h, 32'h4 * i));
                    data = targ_t0;
                end
            end
        endtask
        
    endclass
    
    class addr_reg_pkg__transparent_addr_region_s extends addr_region_base_s;
        addr_reg_pkg__empty_addr_trait_s trait;
        
        function new();
            trait = new();
        endfunction
        
        virtual function void dtor();
        endfunction
        
        virtual function void init(executor_base exec_b);
        trait = addr_reg_pkg__empty_addr_trait_s::create_default();
        endfunction
        virtual function void __assign__(addr_reg_pkg__transparent_addr_region_s rhs);
            size = rhs.size;
            trait.__assign__(rhs.trait);
            addr = rhs.addr;
        endfunction
        
        static function addr_reg_pkg__transparent_addr_region_s create_default();
            addr_reg_pkg__transparent_addr_region_s ret = new();
            return ret;
        endfunction
        
        static function addr_reg_pkg__transparent_addr_region_s create_init(
                longint unsigned size,
                addr_reg_pkg__empty_addr_trait_s trait,
                longint unsigned addr);
            addr_reg_pkg__transparent_addr_region_s ret = new();
            ret.size = size;
            ret.trait = trait;
            ret.addr = addr;
            return ret;
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
    
    class addr_reg_pkg__addr_region_s extends addr_region_base_s;
        addr_reg_pkg__empty_addr_trait_s trait;
        
        function new();
            trait = new();
        endfunction
        
        virtual function void dtor();
        endfunction
        
        virtual function void init(executor_base exec_b);
        trait = addr_reg_pkg__empty_addr_trait_s::create_default();
        endfunction
        virtual function void __assign__(addr_reg_pkg__addr_region_s rhs);
            size = rhs.size;
            trait.__assign__(rhs.trait);
        endfunction
        
        static function addr_reg_pkg__addr_region_s create_default();
            addr_reg_pkg__addr_region_s ret = new();
            return ret;
        endfunction
        
        static function addr_reg_pkg__addr_region_s create_init(
                longint unsigned size,
                addr_reg_pkg__empty_addr_trait_s trait);
            addr_reg_pkg__addr_region_s ret = new();
            ret.size = size;
            ret.trait = trait;
            return ret;
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
    
    class pss_top extends component;
        addr_reg_pkg__transparent_addr_space_c aspace;
        addr_handle_t addr_h;
        
        function new(string name, component_ctor_ctxt ctxt, component parent=null);
            super.new(name, ctxt, parent);
            aspace = new("aspace", ctxt, this);
            executor_m = new[ctxt.executor_m.size()](ctxt.executor_m);
        endfunction
        
        
        
        function void do_init(executor_base exec_b);
            init_down(exec_b);
            init_up(exec_b);
        endfunction
        
        
        
        function void init_down(executor_base exec_b);
            executor_t executor;
            $cast(executor, exec_b);
            begin
                addr_reg_pkg__transparent_addr_region_s region;

                region = addr_reg_pkg__transparent_addr_region_s::create_default();

                region.addr = 32'h0;
                region.size = 32'h0;
                this.addr_h = this.aspace.add_nonallocatable_region(region);
            end
        endfunction
        
        virtual function bit check();
            bit ret = 1;
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
    typedef class activity_0xc443f0;
    
    class activity_0xc443f0 extends activity_c;
        actor_t actor;
        function new(actor_t actor);
            this.actor = actor;
        endfunction
        
        virtual task run();
            pss_top__Entry pss_top__Entry_0x12c9110;

            // Traverse action pss_top::Entry
            begin
                executor_t executor;
                pss_top__Entry_0x12c9110 = new();
                pss_top__Entry_0x12c9110.do_pre_solve();
                if (!pss_top__Entry_0x12c9110.randomize() with {
                    parent_comp_id == 0;
                    (parent_comp_id == 0) -> comp_id == 0;
                }) begin
                    $display("Error: failed to randomize action");
                    $finish;
                end
                if (!$cast(pss_top__Entry_0x12c9110.comp, actor.comp_l[pss_top__Entry_0x12c9110.comp_id])) begin
                    $display("Failed to cast component");
                end
                if (pss_top__Entry_0x12c9110.comp == null) begin
                    $display("Component @ %0d is null", pss_top__Entry_0x12c9110.comp_id);
                end
                $cast(executor, pss_top__Entry_0x12c9110.comp.get_default_executor());
                pss_top__Entry_0x12c9110.do_post_solve(executor);
                
                foreach (actor.listeners[i]) begin
                    actor.listeners[i].enter_traverse(pss_top__Entry_0x12c9110);
                end
                pss_top__Entry_0x12c9110.body(executor);
                
                foreach (actor.listeners[i]) begin
                    actor.listeners[i].leave_traverse(pss_top__Entry_0x12c9110);
                end
                
                pss_top__Entry_0x12c9110.dtor();
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
            activity_0xc443f0 root_activity = new(this);
            
            comp_tree.init(this.default_executor);
            comp_tree.do_init(this.default_executor);
            
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
