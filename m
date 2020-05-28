Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 104681E538A
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 03:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbgE1B7O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 21:59:14 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50136 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725896AbgE1B7O (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 May 2020 21:59:14 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD2rmGs9ed+05AA--.979S2;
        Thu, 28 May 2020 09:59:03 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        kbuild test robot <lkp@intel.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] MIPS: DTS: Fix build errors used with various configs
Date:   Thu, 28 May 2020 09:59:01 +0800
Message-Id: <1590631141-23904-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxD2rmGs9ed+05AA--.979S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF43Zw17Wr15ZF4UJw18Xwb_yoW8Cw17pa
        95Arsrt34xXryUJrWxAF1DWr90yan8CFWDuF4kCw4UGrZ5X3yUZrn3trsxtF18Ww18Ja1x
        KFs7KrZxArn8taUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkj14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0E
        wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
        80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
        I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
        k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIE
        c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUywZ7UUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

If CONFIG_MIPS_MALTA is not set but CONFIG_LEGACY_BOARD_SEAD3 is set,
the subdir arch/mips/boot/dts/mti will not be built, so the sead3.dts
which depends on CONFIG_LEGACY_BOARD_SEAD3 in this subdir is also not
built, and then there exists the following build error, fix it.

  LD      .tmp_vmlinux.kallsyms1
arch/mips/generic/board-sead3.o:(.mips.machines.init+0x4): undefined reference to `__dtb_sead3_begin'
Makefile:1106: recipe for target 'vmlinux' failed
make: *** [vmlinux] Error 1

Additionally, add CONFIG_FIT_IMAGE_FDT_BOSTON check for subdir img to
fix the following build error when CONFIG_MACH_PISTACHIO is not set but
CONFIG_FIT_IMAGE_FDT_BOSTON is set.

FATAL ERROR: Couldn't open "boot/dts/img/boston.dtb": No such file or directory

Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Guenter Roeck <linux@roeck-us.net>
Fixes: 41528ba6afe6 ("MIPS: DTS: Only build subdir of current platform")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/boot/dts/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index dce32d1..1902712 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -2,11 +2,13 @@
 subdir-$(CONFIG_BMIPS_GENERIC)		+= brcm
 subdir-$(CONFIG_CAVIUM_OCTEON_SOC)	+= cavium-octeon
 subdir-$(CONFIG_MACH_PISTACHIO)		+= img
+subdir-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+= img
 subdir-$(CONFIG_MACH_INGENIC)		+= ingenic
 subdir-$(CONFIG_LANTIQ)			+= lantiq
 subdir-$(CONFIG_MACH_LOONGSON64)	+= loongson
 subdir-$(CONFIG_MSCC_OCELOT)		+= mscc
 subdir-$(CONFIG_MIPS_MALTA)		+= mti
+subdir-$(CONFIG_LEGACY_BOARD_SEAD3)	+= mti
 subdir-$(CONFIG_NLM_XLP_BOARD)		+= netlogic
 subdir-$(CONFIG_FIT_IMAGE_FDT_NI169445)	+= ni
 subdir-$(CONFIG_MACH_PIC32)		+= pic32
-- 
2.1.0

