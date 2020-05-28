Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 560651E5E3A
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 13:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388340AbgE1L3U (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 07:29:20 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44522 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388271AbgE1L3U (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 28 May 2020 07:29:20 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxpumIoM9eZzM6AA--.1350S2;
        Thu, 28 May 2020 19:29:12 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] MIPS: Loongson64: Remove not used pci.c
Date:   Thu, 28 May 2020 19:29:11 +0800
Message-Id: <1590665351-2956-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxpumIoM9eZzM6AA--.1350S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr4rZFy5JF13ZF1xKw4DJwb_yoW8Cw1Dpa
        yfZa17Wrs5JF47AFn3CryUJF9xAa90yrZFyF42gw10gasFv34jqryrJFy8tFWUA3y29ryU
        Xry8Wr48JF4DGaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4k
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUvdgXUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

After commit 6423e59a64e7 ("MIPS: Loongson64: Switch to generic PCI
driver"), arch/mips/loongson64/pci.c is not used any more, remove it.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/loongson64/pci.c | 49 ----------------------------------------------
 1 file changed, 49 deletions(-)
 delete mode 100644 arch/mips/loongson64/pci.c

diff --git a/arch/mips/loongson64/pci.c b/arch/mips/loongson64/pci.c
deleted file mode 100644
index a440a27..0000000
--- a/arch/mips/loongson64/pci.c
+++ /dev/null
@@ -1,49 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2007 Lemote, Inc. & Institute of Computing Technology
- * Author: Fuxin Zhang, zhangfx@lemote.com
- */
-#include <linux/pci.h>
-
-#include <pci.h>
-#include <loongson.h>
-#include <boot_param.h>
-
-static struct resource loongson_pci_mem_resource = {
-	.name	= "pci memory space",
-	.start	= LOONGSON_PCI_MEM_START,
-	.end	= LOONGSON_PCI_MEM_END,
-	.flags	= IORESOURCE_MEM,
-};
-
-static struct resource loongson_pci_io_resource = {
-	.name	= "pci io space",
-	.start	= LOONGSON_PCI_IO_START,
-	.end	= IO_SPACE_LIMIT,
-	.flags	= IORESOURCE_IO,
-};
-
-static struct pci_controller  loongson_pci_controller = {
-	.pci_ops	= &loongson_pci_ops,
-	.io_resource	= &loongson_pci_io_resource,
-	.mem_resource	= &loongson_pci_mem_resource,
-	.mem_offset	= 0x00000000UL,
-	.io_offset	= 0x00000000UL,
-};
-
-
-extern int sbx00_acpi_init(void);
-
-static int __init pcibios_init(void)
-{
-
-	loongson_pci_controller.io_map_base = mips_io_port_base;
-	loongson_pci_mem_resource.start = loongson_sysconf.pci_mem_start_addr;
-	loongson_pci_mem_resource.end = loongson_sysconf.pci_mem_end_addr;
-
-	register_pci_controller(&loongson_pci_controller);
-
-	return 0;
-}
-
-arch_initcall(pcibios_init);
-- 
2.1.0

