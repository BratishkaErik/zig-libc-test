// SPDX-FileCopyrightText: 2024 Eric Joldasov
//
// SPDX-License-Identifier: 0BSD

const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "zig-libc-test",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });
    b.installArtifact(exe);

    const stderr = std.io.getStdErr();
    stderr.writer().print(
        "abi = {s}\ndynamic_linker = {s}\n",
        .{ @tagName(target.result.abi), target.result.dynamic_linker.get() orelse "(none)" },
    ) catch {};
}
