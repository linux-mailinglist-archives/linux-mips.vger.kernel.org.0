Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05E6A2237CF
	for <lists+linux-mips@lfdr.de>; Fri, 17 Jul 2020 11:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725950AbgGQJIU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Jul 2020 05:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgGQJIT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 17 Jul 2020 05:08:19 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03113C061755
        for <linux-mips@vger.kernel.org>; Fri, 17 Jul 2020 02:08:19 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k71so6229630pje.0
        for <linux-mips@vger.kernel.org>; Fri, 17 Jul 2020 02:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=RCy0XEL8jpuB8CPSyrz2T78fcK4SPfVaQdmwR6Q7Vpc=;
        b=pSdNDQCnJOh5hU9Wapi50NUO/azq5ZarsLQIRE5/GE+t/DFLwIrtPAe5i6T3d/FMpx
         1hJXITF758eLD5p7Z/voLd5+jyMq/v1Vh69TBBiiW2eTBWYgbHLpsOrItlelE0PFRGfe
         nbDX9Kx2Q7viSaAfhdfVkSFulXB2WWiyRsADMMUDkWgcYYth3TyimH0ESQIPa985x+KZ
         ELTD2BVxexHTlp0JU+LNVUOJdCpljsJgorne3QEI32WOg5XI+zrgVVqxwjz2dt+kYCKA
         0xD0GxxrJ31iUKHqjlIo3XCNlD77H2JCLgUCt3d2mbJ2lAS1feyNCkQAoFGzfC4fZhPP
         GzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=RCy0XEL8jpuB8CPSyrz2T78fcK4SPfVaQdmwR6Q7Vpc=;
        b=jX9DPjFhw5xO5TuAUfq5U52j5XbPgDSenhoWvA9hnaofQu0yJ5uFNgL4WtHms7AIl6
         oU7o0RBDPJb0HazLf1EMHpc4qYSuocd8c1TeRBGjNpuFKoTMRPOTOqGpuH06h28tCf8x
         S9jAStFvI4pNYA0JBPgq7QJDv18b15FmQoWBj4pa7Ik29ARaK58rfL9fddBXvELrnAlQ
         qo5sloJbuq3nMu1WRYnB7NWfDuxZGTA9SNVVYsjkrKwPBsyP+jilqu5KGnDw4fjPVM4D
         /McRjGaAHNLnkKZBiCAzFt8L/MTdhymbv0FfjHe+Z395xMaCegpQf1I7orLY/isu4KLN
         6UPA==
X-Gm-Message-State: AOAM5321o62J4Z//m3KAP9+7eg20zRULyUCSeBJcR4h+IdQqayEEfjX/
        nu1WXMozdFt6q+EJOn3EsQGydzfh4sh3pA==
X-Google-Smtp-Source: ABdhPJz2oQYoQTGAe7T3d0zReUPC/EtnLcF0Ua1vxN8i+v2pNzZM0xNCqGDB4JigvcZ7z/HSDFCfeA==
X-Received: by 2002:a17:90a:6c97:: with SMTP id y23mr9060346pjj.28.1594976898402;
        Fri, 17 Jul 2020 02:08:18 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id u14sm7775054pfk.211.2020.07.17.02.08.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jul 2020 02:08:18 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V2] MIPS: Loongson64: Reserve legacy MMIO space according to bridge type
Date:   Fri, 17 Jul 2020 17:10:35 +0800
Message-Id: <1594977035-27899-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
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
 arch/mips/include/asm/io.h                     |  2 --
 arch/mips/include/asm/mach-generic/spaces.h    |  4 ++++
 arch/mips/include/asm/mach-loongson64/spaces.h |  3 +--
 arch/mips/loongson64/init.c                    | 18 ++++++++++++++----
 4 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 346fffd..8ca53f1 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -51,8 +51,6 @@
 
 /* ioswab[bwlq], __mem_ioswab[bwlq] are defined in mangle-port.h */
 
-#define IO_SPACE_LIMIT 0xffff
-
 /*
  * On MIPS I/O ports are memory mapped, so we access them using normal
  * load/store instructions. mips_io_port_base is the virtual address to
diff --git a/arch/mips/include/asm/mach-generic/spaces.h b/arch/mips/include/asm/mach-generic/spaces.h
index ee5ebe9..aa84b85 100644
--- a/arch/mips/include/asm/mach-generic/spaces.h
+++ b/arch/mips/include/asm/mach-generic/spaces.h
@@ -103,4 +103,8 @@
 #endif
 #endif
 
+#ifndef IO_SPACE_LIMIT
+#define IO_SPACE_LIMIT 0xffff
+#endif
+
 #endif /* __ASM_MACH_GENERIC_SPACES_H */
diff --git a/arch/mips/include/asm/mach-loongson64/spaces.h b/arch/mips/include/asm/mach-loongson64/spaces.h
index 3de0ac9..0ad02c8 100644
--- a/arch/mips/include/asm/mach-loongson64/spaces.h
+++ b/arch/mips/include/asm/mach-loongson64/spaces.h
@@ -11,8 +11,7 @@
 #define PCI_IOSIZE	SZ_16M
 #define MAP_BASE	(PCI_IOBASE + PCI_IOSIZE)
 
-/* Reserved at the start of PCI_IOBASE for legacy drivers */
-#define MMIO_LOWER_RESERVED	0x10000
+#define IO_SPACE_LIMIT 0xfffff
 
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

