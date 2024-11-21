// SPDX-FileCopyrightText: 2024 Eric Joldasov
//
// SPDX-License-Identifier: 0BSD

const std = @import("std");

const c = @cImport({
    @cInclude("stdio.h");
});

pub fn main() u8 {
    _ = c.printf("printf from C standard library works fine!\n");
    return 0;
}
