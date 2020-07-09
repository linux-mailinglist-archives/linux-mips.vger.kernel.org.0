Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE04219F1C
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2020 13:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgGILcu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jul 2020 07:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbgGILcu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jul 2020 07:32:50 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1402FC061A0B
        for <linux-mips@vger.kernel.org>; Thu,  9 Jul 2020 04:32:50 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id u18so893961pfk.10
        for <linux-mips@vger.kernel.org>; Thu, 09 Jul 2020 04:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ke7Zf1ZW7Et4WlTRV0TbV4rRL7sgSa1K1bqneGMxfVA=;
        b=TzzlZK+u/PbUiUpd8GRCvg4RCkEM0xYqvJZEwI/NhcALcY96sjcmfClJpiycaWlD4z
         p2TRlFBaPHmsNC3o2ylRYPpzUwMVKgOib4HdjTfj2CE7Q8sZxKgT/4ihT4POdPdOeezd
         zPM1gUrH4hoEmKGOmzs7WD91TUDBKc00cd5cZd1bt112KVjSS1f7cJGpB4gChnbSJpBN
         +4i9zRjTMxJe9Gahp+LggCOvR1RSG1iWpJGt2Tf9fkgasNwsc9JplZm9V9X41j4FIBt3
         eEVBOZBJG3pR4qBOg/RUssIzLSK1D37X7unn9WMvayIT+/nspcj//cIvZ4N2TXtfoQU6
         UXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=ke7Zf1ZW7Et4WlTRV0TbV4rRL7sgSa1K1bqneGMxfVA=;
        b=aVz4mivrmcTIz/FVQLaPtXcBFmIBY63tO+sx5D1v4MQJq/JN+R7AKESdYp0jemlXha
         91kAShpK6Up64Sx3UEihuaON+Z3snBBCuWiPpf/CX7eiqI+CE4w7pBQpaQX4bKiji39e
         0a1y8AXfCSocoUlL7vLNfQrGLWU7cwWeJct+7+sNtLcCeD6HaMXWRMB7UL46QAoM9Zbg
         aWMGLiqMDy0kKreaRo07dmD5iBKVM3ABA4d22e1IAy/M3PJjYmHOAoM68xXypkEp6hHx
         /ImZWXzUOb+22wQhtZ/6qdmQZ2nDrajJRtN5HhPn/ucJN18Zs146t/4+98GRwFFqDsRB
         Xbaw==
X-Gm-Message-State: AOAM532tFjgpKOHHopnYTWiNRfsbFio/Sj2ASu2CpashZvBXo/ZDe8vc
        Re0uT0ZsNTSvu/7iHr//1vA=
X-Google-Smtp-Source: ABdhPJz/65LbroD0A596G2XIqAQTCcT05RRYex7UBWfxcvRGlIzI2qL76B13SehUS80WB7lzWGXoTg==
X-Received: by 2002:a63:405:: with SMTP id 5mr51813400pge.449.1594294369645;
        Thu, 09 Jul 2020 04:32:49 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id w4sm2612507pfd.39.2020.07.09.04.32.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Jul 2020 04:32:49 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 4/4] MIPS: Loongson64: Reserve legacy MMIO space according to bridge type
Date:   Thu,  9 Jul 2020 19:33:44 +0800
Message-Id: <1594294424-26218-4-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1594294424-26218-1-git-send-email-chenhc@lemote.com>
References: <1594294424-26218-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Define MMIO_LOWER_RESERVED as a constant is incorrect, because different
PCHs (bridge types) have different legacy MMIO space size. According to
the datasheets, the legacy MMIO space size of LS7A is 0x20000, and which
of other PCHs is 0x4000. So it is necessary to reserve legacy MMIO space
according to the bridge type.

Currently IO_SPACE_LIMIT is defined as 0xffff which is too small for the
LS7A bridge, so increase it to 0xfffff for LOONGSON64.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/include/asm/io.h                     |  4 ++++
 arch/mips/include/asm/mach-loongson64/spaces.h |  3 ---
 arch/mips/loongson64/init.c                    | 18 ++++++++++++++----
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 346fffd..7358372 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -51,7 +51,11 @@
 
 /* ioswab[bwlq], __mem_ioswab[bwlq] are defined in mangle-port.h */
 
+#ifndef CONFIG_CPU_LOONGSON64
 #define IO_SPACE_LIMIT 0xffff
+#else
+#define IO_SPACE_LIMIT 0xfffff
+#endif
 
 /*
  * On MIPS I/O ports are memory mapped, so we access them using normal
diff --git a/arch/mips/include/asm/mach-loongson64/spaces.h b/arch/mips/include/asm/mach-loongson64/spaces.h
index 3de0ac9..93bdd9e 100644
--- a/arch/mips/include/asm/mach-loongson64/spaces.h
+++ b/arch/mips/include/asm/mach-loongson64/spaces.h
@@ -11,8 +11,5 @@
 #define PCI_IOSIZE	SZ_16M
 #define MAP_BASE	(PCI_IOBASE + PCI_IOSIZE)
 
-/* Reserved at the start of PCI_IOBASE for legacy drivers */
-#define MMIO_LOWER_RESERVED	0x10000
-
 #include <asm/mach-generic/spaces.h>
 #endif
diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index 59ddada..606cdc4 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -65,14 +65,25 @@ void __init prom_free_prom_memory(void)
 
 static __init void reserve_pio_range(void)
 {
+	/* Reserved at the start of PCI_IOBASE for legacy drivers */
+	int mmio_lower_reserved;
 	struct logic_pio_hwaddr *range;
 
 	range = kzalloc(sizeof(*range), GFP_ATOMIC);
 	if (!range)
 		return;
 
+	switch (loongson_sysconf.bridgetype) {
+	case LS7A:
+		mmio_lower_reserved = 0x20000;
+		break;
+	default:
+		mmio_lower_reserved = 0x4000;
+		break;
+	}
+
 	range->fwnode = &of_root->fwnode;
-	range->size = MMIO_LOWER_RESERVED;
+	range->size = mmio_lower_reserved;
 	range->hw_start = LOONGSON_PCIIO_BASE;
 	range->flags = LOGIC_PIO_CPU_MMIO;
 
@@ -89,9 +100,8 @@ static __init void reserve_pio_range(void)
 	 * i8259 would access I/O space, so mapping must be done here.
 	 * Please remove it when all drivers can be managed by logic_pio.
 	 */
-	ioremap_page_range(PCI_IOBASE, PCI_IOBASE + MMIO_LOWER_RESERVED,
-				LOONGSON_PCIIO_BASE,
-				pgprot_device(PAGE_KERNEL));
+	ioremap_page_range(PCI_IOBASE, PCI_IOBASE + mmio_lower_reserved,
+			LOONGSON_PCIIO_BASE, pgprot_device(PAGE_KERNEL));
 
 	return;
 unregister:
-- 
2.7.0

