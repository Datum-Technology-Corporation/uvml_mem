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


`ifndef __UVME_MEM_ST_CFG_SV__
`define __UVME_MEM_ST_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running Memory Modeling Self-Testing Environment (uvme_mem_st_env_c) components.
 */
class uvme_mem_st_cfg_c extends uvm_object;
   
   // Integrals
   rand bit                      enabled              ;
   rand uvm_active_passive_enum  is_active            ;
   rand bit                      scoreboarding_enabled;
   rand bit                      cov_model_enabled    ;
   rand bit                      trn_log_enabled      ;
   
   // Objects
   rand uvma_mem_cfg_c  abc_cfg;
   rand uvma_mem_cfg_c  xyz_cfg;
   rand uvml_sb_simplex_cfg_c  sb_cfg;
   
   
   `uvm_object_utils_begin(uvme_mem_st_cfg_c)
      `uvm_field_int (                         enabled              , UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active            , UVM_DEFAULT)
      `uvm_field_int (                         scoreboarding_enabled, UVM_DEFAULT)
      `uvm_field_int (                         cov_model_enabled    , UVM_DEFAULT)
      `uvm_field_int (                         trn_log_enabled      , UVM_DEFAULT)
      
      `uvm_field_object(abc_cfg, UVM_DEFAULT)
      `uvm_field_object(xyz_cfg, UVM_DEFAULT)
      `uvm_field_object(sb_cfg       , UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   constraint defaults_cons {
      soft enabled                == 0;
      soft is_active              == UVM_PASSIVE;
      soft scoreboarding_enabled  == 1;
      soft cov_model_enabled      == 0;
      soft trn_log_enabled        == 1;
   }
   
   constraint agent_cfg_cons {
      if (enabled) {
         abc_cfg.enabled == 1;
         xyz_cfg.enabled == 1;
      }
      else {
         abc_cfg.enabled == 0;
         xyz_cfg.enabled == 0;
      }
      
      if (is_active == UVM_ACTIVE) {
         abc_cfg.is_active == UVM_ACTIVE;
         xyz_cfg.is_active == UVM_ACTIVE;
      }
      else {
         abc_cfg.is_active == UVM_PASSIVE;
         xyz_cfg.is_active == UVM_PASSIVE;
      }
      
      if (trn_log_enabled) {
         abc_cfg.trn_log_enabled == 1;
         xyz_cfg.trn_log_enabled == 1;
      }
      else {
         abc_cfg.trn_log_enabled == 0;
         xyz_cfg.trn_log_enabled == 0;
      }
      
      if (cov_model_enabled) {
         abc_cfg.cov_model_enabled == 1;
         xyz_cfg.cov_model_enabled == 1;
      }
      else {
         abc_cfg.cov_model_enabled == 0;
         xyz_cfg.cov_model_enabled == 0;
      }
   }
   
   constraint sb_cfg_cons {
      sb_cfg.mode == UVML_SB_MODE_IN_ORDER;
      if (scoreboarding_enabled) {
         sb_cfg.enabled == 1;
      }
      else {
         sb_cfg.enabled == 0;
      }
   }
   
   
   /**
    * Creates sub-configuration objects.
    */
   extern function new(string name="uvme_mem_st_cfg");
   
endclass : uvme_mem_st_cfg_c


function uvme_mem_st_cfg_c::new(string name="uvme_mem_st_cfg");
   
   super.new(name);
   
   abc_cfg  = uvma_mem_cfg_c::type_id::create("abc_cfg");
   xyz_cfg  = uvma_mem_cfg_c::type_id::create("xyz_cfg");
   sb_cfg = uvml_sb_simplex_cfg_c::type_id::create("sb_cfg");
   
endfunction : new


`endif // __UVME_MEM_ST_CFG_SV__
