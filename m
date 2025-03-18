Return-Path: <linux-mips+bounces-8218-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57591A67F04
	for <lists+linux-mips@lfdr.de>; Tue, 18 Mar 2025 22:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BB4216B02F
	for <lists+linux-mips@lfdr.de>; Tue, 18 Mar 2025 21:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297CA2063C0;
	Tue, 18 Mar 2025 21:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NyOZVXNv"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CFC205E36;
	Tue, 18 Mar 2025 21:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742334252; cv=none; b=o2UxVf90PQO1+9Mti5Rn0UeMMKH/zdbiCghS75fv1CATbPiqS2MOMz2eSxpKtVodYl/9oLU3UkQL7Bg/5nwsFO6828lGnsntFWzavDzci77fXQITCCE4db4TVLO2DPa5j6xylMzHEAbKHxCBhDeceiJ1SuvviUyV8/tSq/weZ2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742334252; c=relaxed/simple;
	bh=bv6s88Bkp0DZ32hkN0ynJBF2j1COTVuFqZh7ys88D9w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Mp3305lTgWRhcvBOlwxsGnbiUZz0vAvg1fcol712ztYa8HixE4gL5Wf+Iu/e72Q+nUFejg6fF2XF5k/BdcqeV2DJDnQiAYqwqns1GW0FW5WlNwuF1oiCITO9NfujEDzvi2KBCEjffXCMdIYtzhNkOM1FoWdqgoLt7zxKi3us1Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NyOZVXNv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A6D6C4CEDD;
	Tue, 18 Mar 2025 21:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742334250;
	bh=bv6s88Bkp0DZ32hkN0ynJBF2j1COTVuFqZh7ys88D9w=;
	h=From:To:Cc:Subject:Date:From;
	b=NyOZVXNvJLjMCQhn0QPioRGG2XppkCNfwp9QSCVxWN/8SmnRqMCRh8EMihmqjob58
	 gS44WCFEzDiiOOloZ2eWJTX13uTcWNn6R7LlW/hr5ahm8idylk5TrCNmVAgGk3zRZ6
	 8b+vwWd/9VwThP0O61O1zHcg27HBat9eCjHRfbv455uUB/MAcljwuioajIY7K0tt55
	 Ff6AEG/483Dh0X4XRx6/ZkUAP1a/zipfal+s1vCdLfriUtPbWupEX4WmOmDkUBHDwQ
	 LnhURLYBf0GHBpqSDSdhHnBmMWQWREAHlEecjEUrbPmfVhptCa3hlKOWxNhJm2Hbxi
	 5xUyEZo0xPz9w==
From: Arnd Bergmann <arnd@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mips: fix PCI_IOBASE definition
Date: Tue, 18 Mar 2025 22:43:59 +0100
Message-Id: <20250318214406.874733-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

After my previous patch, the ioport_map() function changed from
the lib/iomap.c version to the asm-generic/io.h version, which
requires a correct PCI_IOBASE definition.

Unfortunately the types are also different, so add the correct
definition for ioport_map() in asm/io.h and change the machine
specific ones to have the correct type.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
This is not pretty, but it seems to address the remaining problems.
I've applied it on top of my cross-architecture io.h cleanup that
has the other mips patch.

Let me know if there are still any other concerns.


 arch/mips/include/asm/io.h                     | 6 +++++-
 arch/mips/include/asm/mach-loongson64/spaces.h | 5 +++--
 arch/mips/include/asm/mach-ralink/spaces.h     | 2 +-
 arch/mips/loongson64/init.c                    | 4 ++--
 4 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
index 1fe56d1870a6..78c6573f91f2 100644
--- a/arch/mips/include/asm/io.h
+++ b/arch/mips/include/asm/io.h
@@ -544,12 +544,16 @@ extern void (*_dma_cache_inv)(unsigned long start, unsigned long size);
 
 void __ioread64_copy(void *to, const void __iomem *from, size_t count);
 
-#ifdef CONFIG_PCI_DRIVERS_LEGACY
+#if defined(CONFIG_PCI) && defined(CONFIG_PCI_DRIVERS_LEGACY)
 struct pci_dev;
 void pci_iounmap(struct pci_dev *dev, void __iomem *addr);
 #define pci_iounmap pci_iounmap
 #endif
 
+#ifndef PCI_IOBASE
+#define PCI_IOBASE ((void __iomem *)mips_io_port_base)
+#endif
+
 #include <asm-generic/io.h>
 
 static inline void *isa_bus_to_virt(unsigned long address)
diff --git a/arch/mips/include/asm/mach-loongson64/spaces.h b/arch/mips/include/asm/mach-loongson64/spaces.h
index ce04e998a37b..dbd26db5f2c5 100644
--- a/arch/mips/include/asm/mach-loongson64/spaces.h
+++ b/arch/mips/include/asm/mach-loongson64/spaces.h
@@ -7,9 +7,10 @@
 #endif /* CONFIG_64BIT */
 
 /* Skip 128k to trap NULL pointer dereferences */
-#define PCI_IOBASE	_AC(0xc000000000000000 + SZ_128K, UL)
+#define PCI_PORT_BASE	_AC(0xc000000000000000 + SZ_128K, UL)
+#define PCI_IOBASE	(void __iomem *)PCI_PORT_BASE
 #define PCI_IOSIZE	SZ_16M
-#define MAP_BASE	(PCI_IOBASE + PCI_IOSIZE)
+#define MAP_BASE	(PCI_PORT_BASE + PCI_IOSIZE)
 
 #define IO_SPACE_LIMIT  (PCI_IOSIZE - 1)
 
diff --git a/arch/mips/include/asm/mach-ralink/spaces.h b/arch/mips/include/asm/mach-ralink/spaces.h
index a9f0570d0f04..a63d106c89c6 100644
--- a/arch/mips/include/asm/mach-ralink/spaces.h
+++ b/arch/mips/include/asm/mach-ralink/spaces.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_MACH_RALINK_SPACES_H_
 #define __ASM_MACH_RALINK_SPACES_H_
 
-#define PCI_IOBASE	mips_io_port_base
+#define PCI_IOBASE	(void __iomem *)mips_io_port_base
 #define PCI_IOSIZE	SZ_64K
 #define IO_SPACE_LIMIT	(PCI_IOSIZE - 1)
 
diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index a35dd7311795..b9f90f33fc9a 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -128,7 +128,7 @@ void __init prom_init(void)
 	}
 
 	/* init base address of io space */
-	set_io_port_base(PCI_IOBASE);
+	set_io_port_base((unsigned long)PCI_IOBASE);
 
 	if (loongson_sysconf.early_config)
 		loongson_sysconf.early_config();
@@ -178,7 +178,7 @@ static int __init add_legacy_isa_io(struct fwnode_handle *fwnode, resource_size_
 		return -EINVAL;
 	}
 
-	vaddr = PCI_IOBASE + range->io_start;
+	vaddr = (unsigned long)PCI_IOBASE + range->io_start;
 
 	vmap_page_range(vaddr, vaddr + size, hw_start, pgprot_device(PAGE_KERNEL));
 
-- 
2.39.5


