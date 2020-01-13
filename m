Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10A20139329
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 15:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgAMOIG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 09:08:06 -0500
Received: from forward102o.mail.yandex.net ([37.140.190.182]:44326 "EHLO
        forward102o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727331AbgAMOIF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Jan 2020 09:08:05 -0500
Received: from mxback10j.mail.yandex.net (mxback10j.mail.yandex.net [IPv6:2a02:6b8:0:1619::113])
        by forward102o.mail.yandex.net (Yandex) with ESMTP id EE0DF66816C5;
        Mon, 13 Jan 2020 17:08:01 +0300 (MSK)
Received: from myt2-ea6a2e0cbf34.qloud-c.yandex.net (myt2-ea6a2e0cbf34.qloud-c.yandex.net [2a02:6b8:c00:2e8e:0:640:ea6a:2e0c])
        by mxback10j.mail.yandex.net (mxback/Yandex) with ESMTP id BrUeFl0CRC-81tWxxKR;
        Mon, 13 Jan 2020 17:08:01 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578924481;
        bh=jn8kO6Zo5FK80mQbvcSVlvwdlwIvCB39JSX6YNLW/M8=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=Isuc29UkGeRRoYHM7UwmOyn9olVu70/NRKpLrAfixWNnLSZs4cPF3qYqfedEhrb1t
         osHjgu1J6aBq5eXqBAw7EwJZKf4/6LzCL/w5yj+DFx+c4d+ooBc7vEhhDe3ux1o9WN
         GJfOHtQ0kOJm68HBcAkNq8QaExrZpgL5EdxmGrFA=
Authentication-Results: mxback10j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by myt2-ea6a2e0cbf34.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id pGFN2nLtP9-7oV4cj99;
        Mon, 13 Jan 2020 17:07:59 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com,
        linux-kernel@vger.kernel.org, hch@lst.de,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/2] MIPS: Loongson64: Add dma iocoherency detection support
Date:   Mon, 13 Jan 2020 22:07:05 +0800
Message-Id: <20200113140705.74605-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200113140705.74605-1-jiaxun.yang@flygoat.com>
References: <20200113140705.74605-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Set hw_iocoherency according to parameter passed from firmware.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig                                  | 1 +
 arch/mips/include/asm/mach-loongson64/boot_param.h | 5 +++--
 arch/mips/loongson64/env.c                         | 4 ++++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d0b727daddb3..8b0cd692a43f 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -474,6 +474,7 @@ config MACH_LOONGSON64
 	select CSRC_R4K
 	select CEVT_R4K
 	select CPU_HAS_WB
+	select DMA_MAYBE_COHERENT
 	select FORCE_PCI
 	select ISA
 	select I8259
diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
index 8c286bedff3e..2da2be40ad81 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -115,7 +115,8 @@ struct irq_source_routing_table {
 	u64 pci_io_start_addr;
 	u64 pci_io_end_addr;
 	u64 pci_config_addr;
-	u32 dma_mask_bits;
+	u16 dma_mask_bits;
+	u16 dma_noncoherent;
 } __packed;
 
 struct interface_info {
@@ -206,7 +207,7 @@ struct loongson_system_configuration {
 	u64 poweroff_addr;
 	u64 suspend_addr;
 	u64 vgabios_addr;
-	u32 dma_mask_bits;
+	u16 dma_mask_bits;
 	char ecname[32];
 	u32 nr_uarts;
 	struct uart_device uarts[MAX_UARTS];
diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
index 0daeb7bcf023..61e3d4874fe9 100644
--- a/arch/mips/loongson64/env.c
+++ b/arch/mips/loongson64/env.c
@@ -15,6 +15,7 @@
  */
 #include <linux/export.h>
 #include <asm/bootinfo.h>
+#include <asm/dma-coherence.h>
 #include <loongson.h>
 #include <boot_param.h>
 #include <workarounds.h>
@@ -128,6 +129,9 @@ void __init prom_init_env(void)
 		loongson_sysconf.dma_mask_bits > 64)
 		loongson_sysconf.dma_mask_bits = 32;
 
+	hw_coherentio = !eirq_source->dma_noncoherent;
+	pr_info("Firmware I/O coherency: %s\n", hw_coherentio?"ON":"OFF");
+
 	loongson_sysconf.restart_addr = boot_p->reset_system.ResetWarm;
 	loongson_sysconf.poweroff_addr = boot_p->reset_system.Shutdown;
 	loongson_sysconf.suspend_addr = boot_p->reset_system.DoSuspend;
-- 
2.24.1

