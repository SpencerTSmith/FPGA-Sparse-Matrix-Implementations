# 2025-03-03T22:34:24.270373
import vitis

client = vitis.create_client()
client.set_workspace(path="csr_vmul")

comp = client.create_hls_component(name = "csr_vmul",cfg_file = ["hls_config.cfg"],template = "empty_hls_component")

comp = client.get_component(name="csr_vmul")
comp.run(operation="C_SIMULATION")

comp.run(operation="C_SIMULATION")

comp.run(operation="SYNTHESIS")

comp.run(operation="C_SIMULATION_DEBUG")

vitis.dispose()

