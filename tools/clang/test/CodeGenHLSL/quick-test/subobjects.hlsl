// RUN: %dxc -T lib_6_4 -Vd %s | FileCheck %s

// CHECK: ; GlobalRootSignature grs = { <48 bytes> };
// CHECK: ; StateObjectConfig soc = { STATE_OBJECT_FLAG_ALLOW_LOCAL_DEPENDENCIES_ON_EXTERNAL_DEFINITIONS };
// CHECK: ; LocalRootSignature lrs = { <48 bytes> };
// CHECK: ; SubobjectToExportsAssociation sea = { "grs", { "a", "b", "foo", "c" }  };
// CHECK: ; SubobjectToExportsAssociation sea2 = { "grs", { }  };
// CHECK: ; RaytracingShaderConfig rsc = { MaxPayloadSizeInBytes = 128, MaxAttributeSizeInBytes = 64 };
// CHECK: ; RaytracingPipelineConfig rpc = { MaxTraceRecursionDepth = 512 };
// CHECK: ; HitGroup hitGt = { anyhit = "a", closesthit = "b", intersection = "c" };

GlobalRootSignature grs = {"CBV(b0)"};
StateObjectConfig soc = { STATE_OBJECT_FLAGS_ALLOW_LOCAL_DEPENDENCIES_ON_EXTERNAL_DEFINITONS };
LocalRootSignature lrs = {"UAV(u0, visibility = SHADER_VISIBILITY_GEOMETRY), RootFlags(LOCAL_ROOT_SIGNATURE)"};
SubobjectToExportsAssociation sea = { "grs", "a;b;foo;c" };
SubobjectToExportsAssociation sea2 = { "grs", ";" };
RaytracingShaderConfig rsc = { 128, 64 };
RaytracingPipelineConfig rpc = { 512 };
HitGroup hitGt = { "a", "b", "c"};

int main(int i : INDEX) : SV_Target {
  return 1;
}