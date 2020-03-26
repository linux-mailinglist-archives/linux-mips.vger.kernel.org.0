Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA6911939B9
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2020 08:43:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727661AbgCZHnd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Mar 2020 03:43:33 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41582 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726138AbgCZHnd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 26 Mar 2020 03:43:33 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_973XHxe+TMgAA--.30S2;
        Thu, 26 Mar 2020 15:42:47 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
        Allison Randal <allison@lohutok.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: xilfpga: Removed unused header files
Date:   Thu, 26 Mar 2020 03:42:47 -0400
Message-Id: <1585208567-17979-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Dx_973XHxe+TMgAA--.30S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GrW8Wr4rCFyUJF13ArWUurg_yoWDXwcEka
        sFva1fur1fWr4xXrW7Jws3GFyUG397ur93Gr95Jrn0vw4Yqr4qvay8GFW7XrW7u398Zr4r
        ZFyFvr1Ykay3KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb7kYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE-syl42xK82IY
        c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
        026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF
        0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
        vE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
        aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7eOJUUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Header in directory asm/mach-xilfpga is not used any more.
Remove it here, and it passes to compile with xilfpga_defconfig

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/include/asm/mach-xilfpga/irq.h | 14 --------------
 1 file changed, 14 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-xilfpga/irq.h

diff --git a/arch/mips/include/asm/mach-xilfpga/irq.h b/arch/mips/include/asm/mach-xilfpga/irq.h
deleted file mode 100644
index 15ad29e..0000000
--- a/arch/mips/include/asm/mach-xilfpga/irq.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (C) 2015 Imagination Technologies
- * Author: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
- */
-
-#ifndef __MIPS_ASM_MACH_XILFPGA_IRQ_H__
-#define __MIPS_ASM_MACH_XILFPGA_IRQ_H__
-
-#define NR_IRQS 32
-
-#include <asm/mach-generic/irq.h>
-
-#endif /* __MIPS_ASM_MACH_XILFPGA_IRQ_H__ */
-- 
1.8.3.1

