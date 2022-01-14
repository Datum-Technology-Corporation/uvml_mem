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


`ifndef __UVME_MEM_ST_COV_MODEL_SV__
`define __UVME_MEM_ST_COV_MODEL_SV__


/**
 * Component encapsulating Memory Modeling Self-Test Environment functional coverage model.
 */
class uvme_mem_st_cov_model_c extends uvma_mem_cov_model_c;
   
   
   `uvm_component_utils(uvme_mem_st_cov_model_c)
   
   
   covergroup mem_st_cfg_cg;
      // TODO Implement mem_st_cfg_cg
      //      Ex: abc_cpt : coverpoint cfg.abc;
      //          xyz_cpt : coverpoint cfg.xyz;
   endgroup : mem_st_cfg_cg
   
   covergroup mem_st_cntxt_cg;
      // TODO Implement mem_st_cntxt_cg
      //      Ex: abc_cpt : coverpoint cntxt.abc;
      //          xyz_cpt : coverpoint cntxt.xyz;
   endgroup : mem_st_cntxt_cg
   
   covergroup mem_st_seq_item_cg;
      // TODO Implement mem_st_seq_item_cg
      //      Ex: abc_cpt : coverpoint seq_item.abc;
      //          xyz_cpt : coverpoint seq_item.xyz;
   endgroup : mem_st_seq_item_cg
   
   covergroup mem_st_mon_trn_cg;
      // TODO Implement mem_st_mon_trn_cg
      //      Ex: abc_cpt : coverpoint mon_trn.abc;
      //          xyz_cpt : coverpoint mon_trn.xyz;
   endgroup : mem_st_mon_trn_cg
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_mem_st_cov_model", uvm_component parent=null);
   
   /**
    * TODO Describe uvme_mem_st_cov_model_c::sample_cfg()
    */
   extern virtual function void sample_cfg();
   
   /**
    * TODO Describe uvme_mem_st_cov_model_c::sample_cntxt()
    */
   extern virtual function void sample_cntxt();
   
   /**
    * TODO Describe uvme_mem_st_cov_model_c::sample_mem_seq_item()
    */
   extern virtual function void sample_mem_seq_item();
   
   /**
    * TODO Describe uvme_mem_st_cov_model_c::sample_mem_mon_trn()
    */
   extern virtual function void sample_mem_mon_trn();
   
endclass : uvme_mem_st_cov_model_c


function uvme_mem_st_cov_model_c::new(string name="uvme_mem_st_cov_model", uvm_component parent=null);
   
   super.new(name, parent);
   mem_st_cfg_cg      = new();
   mem_st_cntxt_cg    = new();
   mem_st_seq_item_cg = new();
   mem_st_mon_trn_cg  = new();
   
endfunction : new


function void uvme_mem_st_cov_model_c::sample_cfg();
   
  mem_st_cfg_cg.sample();
   
endfunction : sample_cfg


function void uvme_mem_st_cov_model_c::sample_cntxt();
   
   mem_st_cntxt_cg.sample();
   
endfunction : sample_cntxt


function void uvme_mem_st_cov_model_c::sample_mem_seq_item();
   
   mem_st_seq_item_cg.sample();
   
endfunction : sample_mem_seq_item


function void uvme_mem_st_cov_model_c::sample_mem_mon_trn();
   
   mem_st_mon_trn_cg.sample();
   
endfunction : sample_mem_mon_trn


`endif // __UVME_MEM_ST_COV_MODEL_SV__
