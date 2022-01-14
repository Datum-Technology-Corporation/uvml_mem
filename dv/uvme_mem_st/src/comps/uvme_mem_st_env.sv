// Copyright 2022 Datum Technology Corporation
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


`ifndef __UVME_MEM_ST_ENV_SV__
`define __UVME_MEM_ST_ENV_SV__


/**
 * Top-level component that encapsulates, builds and connects all other Memory Modeling environment components.
 */
class uvme_mem_st_env_c extends uvm_env;
   
   // Objects
   uvme_mem_st_cfg_c    cfg  ;
   uvme_mem_st_cntxt_c  cntxt;
   
   // Agents
   uvma_mem_agent_c  abc_agent;
   uvma_mem_agent_c  xyz_agent;
   
   // Components
   uvme_mem_st_prd_c         predictor ;
   uvme_mem_st_sb_simplex_c  sb        ;
   uvme_mem_st_vsqr_c        vsequencer;
   
   
   `uvm_component_utils_begin(uvme_mem_st_env_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_mem_st_env", uvm_component parent=null);
   
   /**
    * 1. Ensures cfg & cntxt handles are not null
    * 2. Retrieves cntxt.clk_vif from UVM configuration database via retrieve_clk_vif()
    * 3. Assigns cfg and cntxt handles via assign_cfg() & assign_cntxt()
    * 4. Builds all components via create_<x>()
    */
   extern virtual function void build_phase(uvm_phase phase);
   
   /**
    * 1. Connects agents to predictor via connect_predictor()
    * 2. Connects predictor & agents to scoreboard via connect_scoreboard()
    * 3. Assembles virtual sequencer handles via assemble_vsequencer()
    * 4. Connects agents to coverage model via connect_coverage_model()
    */
   extern virtual function void connect_phase(uvm_phase phase);
   
   /**
    * Assigns configuration handles to components using UVM Configuration Database.
    */
   extern function void assign_cfg();
   
   /**
    * Assigns context handles to components using UVM Configuration Database.
    */
   extern function void assign_cntxt();
   
   /**
    * Creates agent components.
    */
   extern function void create_agents();
   
   /**
    * Creates additional (non-agent) environment components (and objects).
    */
   extern function void create_env_components();
   
   /**
    * Creates environment's virtual sequencer.
    */
   extern function void create_vsequencer();
   
   /**
    * Connects agents to predictor.
    */
   extern function void connect_predictor();
   
   /**
    * Connects scoreboards components to agents/predictor.
    */
   extern function void connect_scoreboard();
   
   /**
    * Assembles virtual sequencer from agent sequencers.
    */
   extern function void assemble_vsequencer();
   
endclass : uvme_mem_st_env_c


function uvme_mem_st_env_c::new(string name="uvme_mem_st_env", uvm_component parent=null);
   
   super.new(name, parent);
   
   set_type_override_by_type(
      uvma_mem_cov_model_c   ::get_type(),
      uvme_mem_st_cov_model_c::get_type(),
   );
   
endfunction : new


function void uvme_mem_st_env_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvme_mem_st_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   else begin
      `uvm_info("CFG", $sformatf("Found configuration handle:\n%s", cfg.sprint()), UVM_DEBUG)
   end
   
   if (cfg.enabled) begin
      void'(uvm_config_db#(uvme_mem_st_cntxt_c)::get(this, "", "cntxt", cntxt));
      if (!cntxt) begin
         `uvm_info("CNTXT", "Context handle is null; creating.", UVM_DEBUG)
         cntxt = uvme_mem_st_cntxt_c::type_id::create("cntxt");
      end
      
      assign_cfg           ();
      assign_cntxt         ();
      create_agents        ();
      create_env_components();
      
      if (cfg.is_active) begin
         create_vsequencer();
      end
   end
   
endfunction : build_phase


function void uvme_mem_st_env_c::connect_phase(uvm_phase phase);
   
   super.connect_phase(phase);
   
   if (cfg.enabled) begin
      if (cfg.scoreboarding_enabled) begin
         connect_predictor ();
         connect_scoreboard();
      end
      
      if (cfg.is_active) begin
         assemble_vsequencer();
      end
   end
   
endfunction: connect_phase


function void uvme_mem_st_env_c::assign_cfg();
   
   uvm_config_db#(uvme_mem_st_cfg_c)::set(this, "*", "cfg", cfg);
   uvm_config_db#(uvma_mem_cfg_c   )::set(this, "abc_agent", "cfg", cfg.abc_cfg);
   uvm_config_db#(uvma_mem_cfg_c   )::set(this, "xyz_agent", "cfg", cfg.xyz_cfg);
   uvm_config_db#(uvml_sb_simplex_cfg_c)::set(this, "sb", "cfg", cfg.sb_cfg);
   
endfunction: assign_cfg


function void uvme_mem_st_env_c::assign_cntxt();
   
   uvm_config_db#(uvme_mem_st_cntxt_c)::set(this, "*", "cntxt", cntxt);
   uvm_config_db#(uvma_mem_cntxt_c   )::set(this, "abc_agent", "cntxt", cntxt.abc_cntxt);
   uvm_config_db#(uvma_mem_cntxt_c   )::set(this, "xyz_agent", "cntxt", cntxt.xyz_cntxt);
   uvm_config_db#(uvml_sb_simplex_cntxt_c)::set(this, "sb", "cntxt", cntxt.sb_cntxt);
   
endfunction: assign_cntxt


function void uvme_mem_st_env_c::create_agents();
   
   abc_agent = uvma_mem_agent_c::type_id::create("abc_agent", this);
   xyz_agent = uvma_mem_agent_c::type_id::create("xyz_agent", this);
   
endfunction: create_agents


function void uvme_mem_st_env_c::create_env_components();
   
   if (cfg.scoreboarding_enabled) begin
      predictor = uvme_mem_st_prd_c       ::type_id::create("predictor", this);
      sb        = uvme_mem_st_sb_simplex_c::type_id::create("sb"       , this);
   end
   
endfunction: create_env_components


function void uvme_mem_st_env_c::create_vsequencer();
   
   vsequencer = uvme_mem_st_vsqr_c::type_id::create("vsequencer", this);
   
endfunction: create_vsequencer


function void uvme_mem_st_env_c::connect_predictor();
   
   // Connect agent -> predictor
   abc_agent.mon_ap.connect(predictor.in_export);
   
endfunction: connect_predictor


function void uvme_mem_st_env_c::connect_scoreboard();
   
   // Connect agent -> scoreboard
   xyz_agent.mon_ap.connect(sb.act_export);
   
   // Connect predictor -> scoreboard
   predictor.out_ap.connect(sb.exp_export);
   
endfunction: connect_scoreboard


function void uvme_mem_st_env_c::assemble_vsequencer();
   
   vsequencer.abc_sequencer = abc_agent.sequencer;
   vsequencer.xyz_sequencer = xyz_agent.sequencer;
   
endfunction: assemble_vsequencer


`endif // __UVME_MEM_ST_ENV_SV__
