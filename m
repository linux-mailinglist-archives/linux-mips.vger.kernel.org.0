Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 773E6330869
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 07:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbhCHGsw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 01:48:52 -0500
Received: from mail.loongson.cn ([114.242.206.163]:49886 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229551AbhCHGsX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Mar 2021 01:48:23 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf9eyyEVgtMcWAA--.11836S2;
        Mon, 08 Mar 2021 14:48:18 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] MIPS: Enable some missed configs in loongson3_defconfig to support bpftrace
Date:   Mon,  8 Mar 2021 14:48:18 +0800
Message-Id: <1615186098-2643-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxf9eyyEVgtMcWAA--.11836S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr13GFW7JFy7AF4xXFy5urg_yoW5Gr1Upr
        18Jr4kXay8Jr1rArWfCryDGrZ5tFs5JrW7Gr1UAr15A3s5Aw47Xr48tr1UJrsrX39rtrWr
        ZF93Cr13AFW7C37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GF1l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUU38nUUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

bpftrace is a high-level tracing language for Linux enhanced Berkeley
Packet Filter (eBPF) available in recent Linux kernels (4.x). bpftrace
uses LLVM as a backend to compile scripts to BPF-bytecode and makes use
of BCC for interacting with the Linux BPF system, as well as existing
Linux tracing capabilities: kernel dynamic tracing (kprobes), user-level
dynamic tracing (uprobes), and tracepoints.

According to Linux Kernel Requirements in bpftrace/INSTALL.md [1], the
kernel needs to be built with the following options:

CONFIG_BPF=y
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_JIT=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_BPF_EVENTS=y
CONFIG_FTRACE_SYSCALLS=y
CONFIG_FUNCTION_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE=y
CONFIG_HAVE_KPROBES=y
CONFIG_KPROBES=y
CONFIG_KPROBE_EVENTS=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_UPROBES=y
CONFIG_UPROBE_EVENTS=y
CONFIG_DEBUG_FS=y

So enable some missed configs in loongson3_defconfig to make sure
the above configs are set after make loongson3_defconfig.

[1] https://github.com/iovisor/bpftrace/blob/master/INSTALL.md

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/configs/loongson3_defconfig | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 0e79f81..1b8f693 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -26,6 +26,7 @@ CONFIG_SCHED_AUTOGROUP=y
 CONFIG_SYSFS_DEPRECATED=y
 CONFIG_RELAY=y
 CONFIG_BLK_DEV_INITRD=y
+CONFIG_BPF_SYSCALL=y
 CONFIG_EMBEDDED=y
 CONFIG_PERF_EVENTS=y
 CONFIG_MACH_LOONGSON64=y
@@ -40,6 +41,7 @@ CONFIG_MIPS32_N32=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM=m
 CONFIG_KVM_MIPS_VZ=y
+CONFIG_KPROBES=y
 CONFIG_MODULES=y
 CONFIG_MODULE_FORCE_LOAD=y
 CONFIG_MODULE_UNLOAD=y
@@ -129,6 +131,7 @@ CONFIG_L2TP=m
 CONFIG_BRIDGE=m
 CONFIG_VSOCKETS=m
 CONFIG_VIRTIO_VSOCKETS=m
+CONFIG_BPF_JIT=y
 CONFIG_CFG80211=m
 CONFIG_CFG80211_WEXT=y
 CONFIG_MAC80211=m
@@ -405,8 +408,10 @@ CONFIG_CRYPTO_DEFLATE=m
 CONFIG_PRINTK_TIME=y
 CONFIG_STRIP_ASM_SYMS=y
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
-# CONFIG_FTRACE is not set
+CONFIG_FUNCTION_TRACER=y
+CONFIG_FTRACE_SYSCALLS=y
 CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="ieee754=relaxed"
-- 
2.1.0

