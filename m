Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 024A328876B
	for <lists+linux-mips@lfdr.de>; Fri,  9 Oct 2020 12:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732409AbgJIK5h (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Oct 2020 06:57:37 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38262 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732317AbgJIK5h (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 9 Oct 2020 06:57:37 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx2MUaQoBf2pcbAA--.2238S3;
        Fri, 09 Oct 2020 18:57:31 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH 1/3] MIPS: Loongson64: Select SMP in Kconfig to avoid build error
Date:   Fri,  9 Oct 2020 18:57:28 +0800
Message-Id: <1602241050-24051-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1602241050-24051-1-git-send-email-yangtiezhu@loongson.cn>
References: <1602241050-24051-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dx2MUaQoBf2pcbAA--.2238S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uFyxAF1UWr4UGw43GF47twb_yoW8Zr13pa
        1vyws7GF48WF15ArZ5C3sYgrW3X3s8JrW7ZFWjyw1Uu3sava4UZwsYqr17Ary2grWDta18
        WF9agFW7AF42y37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBa14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8twCF04k20x
        vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
        3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIx
        AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
        cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
        IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU3sqtUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In the current code, CONFIG_SMP can be set as N by user on the Loongson
platform, then there exists the following build error under !CONFIG_SMP:

  CC      arch/mips/kernel/asm-offsets.s
In file included from ./include/linux/gfp.h:9:0,
                 from ./include/linux/xarray.h:14,
                 from ./include/linux/radix-tree.h:18,
                 from ./include/linux/fs.h:15,
                 from ./include/linux/compat.h:17,
                 from arch/mips/kernel/asm-offsets.c:12:
./include/linux/topology.h: In function 'numa_node_id':
./include/linux/topology.h:119:2: error: implicit declaration of function 'cpu_logical_map' [-Werror=implicit-function-declaration]
  return cpu_to_node(raw_smp_processor_id());
  ^
cc1: some warnings being treated as errors
scripts/Makefile.build:117: recipe for target 'arch/mips/kernel/asm-offsets.s' failed
make[1]: *** [arch/mips/kernel/asm-offsets.s] Error 1

Select SMP in Kconfig to avoid the above build error and then remove
CONFIG_SMP=y in loongson3_defconfig.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/Kconfig                     | 1 +
 arch/mips/configs/loongson3_defconfig | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index b557fa5..75f26d1 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -488,6 +488,7 @@ config MACH_LOONGSON64
 	select SYS_SUPPORTS_ZBOOT
 	select ZONE_DMA32
 	select NUMA
+	select SMP
 	select COMMON_CLK
 	select USE_OF
 	select BUILTIN_DTB
diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index a5005c8..38a817e 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -30,7 +30,6 @@ CONFIG_EMBEDDED=y
 CONFIG_PERF_EVENTS=y
 CONFIG_MACH_LOONGSON64=y
 CONFIG_CPU_HAS_MSA=y
-CONFIG_SMP=y
 CONFIG_NR_CPUS=16
 CONFIG_HZ_256=y
 CONFIG_KEXEC=y
-- 
2.1.0

