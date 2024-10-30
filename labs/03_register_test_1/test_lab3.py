#****************************************************************************
#* lab2.py
#*
#* Copyright 2024 Matthew Ballance and Contributors
#*
#* Licensed under the Apache License, Version 2.0 (the "License"); you may 
#* not use this file except in compliance with the License.  
#* You may obtain a copy of the License at:
#*
#*   http://www.apache.org/licenses/LICENSE-2.0
#*
#* Unless required by applicable law or agreed to in writing, software 
#* distributed under the License is distributed on an "AS IS" BASIS, 
#* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  
#* See the License for the specific language governing permissions and 
#* limitations under the License.
#*
#* Created on:
#*     Author: 
#*
#****************************************************************************
import os
import pytest
import subprocess
from pytest_fv.fixtures import *
import pytest_fv as pfv

def test_lab3(dirconfig : pfv.DirConfig):
    flow = pfv.FlowSim(dirconfig)

    # Get the zuspec-sv share directory
    result = subprocess.run(
        ["zuspec", "synth.sv.share"],
        stderr=subprocess.STDOUT,
        stdout=subprocess.PIPE
    ) 
    zsp_sv_share = result.stdout.decode().strip()

    if result.returncode != 0:
        raise Exception("zuspec synth.sv.share command failed")
    
    # Add as a FuseSoC library path
    flow.fs.add_library(zsp_sv_share)

    # Invoke the 'zuspec' tool to generate a SystemVerilog implementation
    # of the PSS model
    flow.addTaskToPhase("generate.main", 
                        pfv.TaskCmd("Create PSS model implementation", cmd=[
                            "zuspec", "synth.sv.actor", "-action", "pss_top::Entry",
                            os.path.join(dirconfig.test_srcdir(), "lab3.pss")],
                            cwd=dirconfig.builddir()))

    # Compile 'top.sv' using the active HDL simulator
    flow.addFileset("sim", pfv.FSVlnv("zuspec::sv"))
    flow.addFileset("sim", pfv.FSVlnv("pss-bytes-up::fwperiph-dma-tb"))
    flow.addFileset("sim", pfv.FSPaths(
                dirconfig.builddir(), ["pss_top_sv.sv"], "systemVerilogSource"))
    flow.addFileset("sim", pfv.FSPaths(
                dirconfig.test_srcdir(), [
                    "memory_rw_pkg.sv", "memory_rw_tb.sv"], "systemVerilogSource"))
    flow.sim.top.add("memory_rw_tb")
    flow.sim.debug = True

    # Run the compiled simulation
    run_args = flow.sim.mkRunArgs(dirconfig.rundir())
    run_args.plusargs.append("SVT_TESTNAME=smoke_test")
    flow.addTaskToPhase("run.main", flow.sim.mkRunTask(run_args))
    
    flow.run_all()
