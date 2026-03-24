Return-Path: <linux-mips+bounces-13917-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBdiFT3GwmmIlgQAu9opvQ
	(envelope-from <linux-mips+bounces-13917-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:13:33 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 51266319D44
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E9678306ADD3
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 17:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096D638911B;
	Tue, 24 Mar 2026 17:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PDOHWd0E"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CE01EDA0F;
	Tue, 24 Mar 2026 17:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774371648; cv=none; b=p+B9qUp1jPndyUHtnLcbKz31urNSJrCtPnAw+bJKeYf6o1KKyeqWAC53g8m6iMHpb1ybKy4MECVv11hSF/dWTRpavP5kfx5uwL63/KsBwO4sxqeDyF39qIZz+VWIbNZLQxYA2gq5beA6QTtt6jXnO5DZAXkp5LEPD68s94PbH44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774371648; c=relaxed/simple;
	bh=vNoPxtdd4BxfeIP2GD5+Lm5ztZ/3WHvkEpVD97Kr7m4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t2XYQbxlFjXCuh9ejitTZJiQCkNfEViZzRXPdXWP7LmAucq39jhQIg7Sndqd0LTU8OFj3BJeIIdi4MbE3EyYl6gQokKb6yLYXPq3f8n05Tl4N/rkImHYx9qzm22WvQkooi971k1vVZTtrjk2C3LA4mV0BguH/r0B2hYPrtBfIlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PDOHWd0E; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774371648; x=1805907648;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vNoPxtdd4BxfeIP2GD5+Lm5ztZ/3WHvkEpVD97Kr7m4=;
  b=PDOHWd0EgL0oFptiRK/XV8jZkc8TAiQaOZH1S8jTPufKxamvqoT6QrM5
   9+NNFB+xT7WQPB5lNQ7jtMK1PCeGFy5fRgAbXeAB5DTT0ytgvBomxv9DK
   /VDoISB/PgT2FHxDb9RMRjGI89RIJKK8HoouI95behp1KjphtqhHMHZKs
   NR5p+xulHPNEBVI3PEkdzodFY6VOU8Gx6Bm5rEMpuU+YeddSKAVgmFiIS
   1BJg81q0YWIMB0iYZESF3K4vmHV3SdGnT4RSfdLXm1Lw7YImEO4PiTwKH
   ZonUQLRV6Ixjkkse2/Pxc9VdwS9Cu6NMlJ/eRhjdEpUAeVPQzYF7kpyKe
   A==;
X-CSE-ConnectionGUID: Di+zoJbJRfKnDeeVvvMpOA==
X-CSE-MsgGUID: 3J/avPsXRuux0gWRx3Qihg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="78991782"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="78991782"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:00:46 -0700
X-CSE-ConnectionGUID: ApYT6ADHR4inoKAd9O076A==
X-CSE-MsgGUID: yzqK2g13S9m6CJEqxk0sPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="254911560"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:00:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 09/10] PCI: Align head space better
Date: Tue, 24 Mar 2026 18:56:32 +0200
Message-Id: <20260324165633.4583-10-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13917-lists,linux-mips=lfdr.de];
	FREEMAIL_TO(0.00)[vger.kernel.org,google.com,roeck-us.net,lists.infradead.org,lists.linux-m68k.org,lists.ozlabs.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,HansenPartnership.com,gmx.de,ellerman.id.au,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,zankel.net,gmail.com,linux.ibm.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 51266319D44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When a bridge window contains big and small resource(s), the small
resource(s) may not amount to the half of the size of the big resource
which would allow calculate_head_align() to shrink the head alignment.
This results in always placing the small resource(s) after the big
resource.

In general, it would be good to be able to place the small resource(s)
before the big resource to achieve better utilization of the address
space. In the cases where the large resource can only fit at the end
of the window, it is even required.

However, carrying the information over from pbus_size_mem() and
calculate_head_align() to __pci_assign_resource() and
pcibios_align_resource() is not easy with the current data structures.

A somewhat hacky way to move the non-aligning tail part to the head is
possible within pcibios_align_resource(). The free space between the
start of the free space span and the aligned start address can be
compared with the non-aligning remainder of the size. If the free space
is larger than the remainder, placing the remainder before the start
address is possible. This relocation should generally work, because PCI
resources consist only power-of-2 atoms.

Various arch requirements may still need to override the relocation, so
the relocation is only applied selectively in such cases.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221205
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 arch/arm/kernel/bios32.c         |  3 +++
 arch/m68k/kernel/pcibios.c       |  4 ++++
 arch/mips/pci/pci-generic.c      |  3 +++
 arch/mips/pci/pci-legacy.c       |  2 ++
 arch/parisc/kernel/pci.c         |  3 +++
 arch/powerpc/kernel/pci-common.c |  2 ++
 arch/sh/drivers/pci/pci.c        |  2 ++
 arch/x86/pci/i386.c              |  2 ++
 arch/xtensa/kernel/pci.c         |  2 ++
 drivers/pci/setup-res.c          | 39 +++++++++++++++++++++++++++++++-
 include/linux/pci.h              |  5 ++++
 kernel/resource.c                |  2 +-
 12 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/arch/arm/kernel/bios32.c b/arch/arm/kernel/bios32.c
index cedb83a85dd9..ac0e890510da 100644
--- a/arch/arm/kernel/bios32.c
+++ b/arch/arm/kernel/bios32.c
@@ -577,6 +577,9 @@ resource_size_t pcibios_align_resource(void *data, const struct resource *res,
 		return host_bridge->align_resource(dev, res,
 				start, size, align);
 
+	if (res->flags & IORESOURCE_MEM)
+		return pci_align_resource(dev, res, empty_res, size, align);
+
 	return start;
 }
 
diff --git a/arch/m68k/kernel/pcibios.c b/arch/m68k/kernel/pcibios.c
index 7e286ee1976b..7a9e60df79c5 100644
--- a/arch/m68k/kernel/pcibios.c
+++ b/arch/m68k/kernel/pcibios.c
@@ -31,11 +31,15 @@ resource_size_t pcibios_align_resource(void *data, const struct resource *res,
 				       resource_size_t size,
 				       resource_size_t align)
 {
+	struct pci_dev *dev = data;
 	resource_size_t start = res->start;
 
 	if ((res->flags & IORESOURCE_IO) && (start & 0x300))
 		start = (start + 0x3ff) & ~0x3ff;
 
+	if (res->flags & IORESOURCE_MEM)
+		return pci_align_resource(dev, res, empty_res, size, align);
+
 	return start;
 }
 
diff --git a/arch/mips/pci/pci-generic.c b/arch/mips/pci/pci-generic.c
index aaa1d6de8bef..c2e23d0c1d77 100644
--- a/arch/mips/pci/pci-generic.c
+++ b/arch/mips/pci/pci-generic.c
@@ -38,6 +38,9 @@ resource_size_t pcibios_align_resource(void *data, const struct resource *res,
 		return host_bridge->align_resource(dev, res,
 				start, size, align);
 
+	if (res->flags & IORESOURCE_MEM)
+		return pci_align_resource(dev, res, empty_res, size, align);
+
 	return start;
 }
 
diff --git a/arch/mips/pci/pci-legacy.c b/arch/mips/pci/pci-legacy.c
index 817e97402afe..dae6dafdd6e0 100644
--- a/arch/mips/pci/pci-legacy.c
+++ b/arch/mips/pci/pci-legacy.c
@@ -70,6 +70,8 @@ pcibios_align_resource(void *data, const struct resource *res,
 		if (start & 0x300)
 			start = (start + 0x3ff) & ~0x3ff;
 	} else if (res->flags & IORESOURCE_MEM) {
+		start = pci_align_resource(dev, res, empty_res, size, align);
+
 		/* Make sure we start at our min on all hoses */
 		if (start < PCIBIOS_MIN_MEM + hose->mem_resource->start)
 			start = PCIBIOS_MIN_MEM + hose->mem_resource->start;
diff --git a/arch/parisc/kernel/pci.c b/arch/parisc/kernel/pci.c
index f50be1a63c4c..b8007c7400d4 100644
--- a/arch/parisc/kernel/pci.c
+++ b/arch/parisc/kernel/pci.c
@@ -201,6 +201,7 @@ resource_size_t pcibios_align_resource(void *data, const struct resource *res,
 				       resource_size_t size,
 				       resource_size_t alignment)
 {
+	struct pci_dev *dev = data;
 	resource_size_t align, start = res->start;
 
 	DBG_RES("pcibios_align_resource(%s, (%p) [%lx,%lx]/%x, 0x%lx, 0x%lx)\n",
@@ -212,6 +213,8 @@ resource_size_t pcibios_align_resource(void *data, const struct resource *res,
 	align = (res->flags & IORESOURCE_IO) ? PCIBIOS_MIN_IO : PCIBIOS_MIN_MEM;
 	if (align > alignment)
 		start = ALIGN(start, align);
+	else
+		start = pci_align_resource(dev, res, empty_res, size, alignment);
 
 	return start;
 }
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index e7bfa15da043..8efe95a0c4ff 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -1144,6 +1144,8 @@ resource_size_t pcibios_align_resource(void *data, const struct resource *res,
 			return start;
 		if (start & 0x300)
 			start = (start + 0x3ff) & ~0x3ff;
+	} else if (res->flags & IORESOURCE_MEM) {
+		start = pci_align_resource(dev, res, empty_res, size, align);
 	}
 
 	return start;
diff --git a/arch/sh/drivers/pci/pci.c b/arch/sh/drivers/pci/pci.c
index 7a0522316ee3..994c3bd36ef2 100644
--- a/arch/sh/drivers/pci/pci.c
+++ b/arch/sh/drivers/pci/pci.c
@@ -185,6 +185,8 @@ resource_size_t pcibios_align_resource(void *data, const struct resource *res,
 		 */
 		if (start & 0x300)
 			start = (start + 0x3ff) & ~0x3ff;
+	} else (res->flags & IORESOURCE_MEM) {
+		start = pci_align_resource(dev, res, empty_res, size, align);
 	}
 
 	return start;
diff --git a/arch/x86/pci/i386.c b/arch/x86/pci/i386.c
index 6fbd4b34c3f7..e2de26b82940 100644
--- a/arch/x86/pci/i386.c
+++ b/arch/x86/pci/i386.c
@@ -165,6 +165,8 @@ pcibios_align_resource(void *data, const struct resource *res,
 		if (start & 0x300)
 			start = (start + 0x3ff) & ~0x3ff;
 	} else if (res->flags & IORESOURCE_MEM) {
+		start = pci_align_resource(dev, res, empty_res, size, align);
+
 		/* The low 1MB range is reserved for ISA cards */
 		if (start < BIOS_END)
 			start = BIOS_END;
diff --git a/arch/xtensa/kernel/pci.c b/arch/xtensa/kernel/pci.c
index 64ccb7e0d92f..305031551136 100644
--- a/arch/xtensa/kernel/pci.c
+++ b/arch/xtensa/kernel/pci.c
@@ -54,6 +54,8 @@ pcibios_align_resource(void *data, const struct resource *res,
 
 		if (start & 0x300)
 			start = (start + 0x3ff) & ~0x3ff;
+	} else if (res->flags & IORESOURCE_MEM) {
+		start = pci_align_resource(dev, res, empty_res, size, align);
 	}
 
 	return start;
diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index c375e255c509..fbc05cda96ee 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -244,6 +244,41 @@ static int pci_revert_fw_address(struct resource *res, struct pci_dev *dev,
 	return 0;
 }
 
+/*
+ * For mem bridge windows, try to relocate tail remainder space to space
+ * before res->start if there's enough free space there. This enables
+ * tighter packing for resources.
+ */
+resource_size_t pci_align_resource(struct pci_dev *dev,
+				   const struct resource *res,
+				   const struct resource *empty_res,
+				   resource_size_t size,
+				   resource_size_t align)
+{
+	resource_size_t remainder, start_addr;
+
+	if (!(res->flags & IORESOURCE_MEM))
+		return res->start;
+
+	if (IS_ALIGNED(size, align))
+		return res->start;
+
+	remainder = size - ALIGN_DOWN(size, align);
+	/* Don't mess with size that doesn't align with window size granularity */
+	if (!IS_ALIGNED(remainder, pci_min_window_alignment(dev->bus, res->flags)))
+		return res->start;
+	/* Try to place remainder that doesn't fill align before */
+	if (res->start < remainder)
+		return res->start;
+	start_addr = res->start - remainder;
+	if (empty_res->start > start_addr)
+		return res->start;
+
+	pci_dbg(dev, "%pR: moving candidate start address below align to %llx\n",
+		res, (unsigned long long)start_addr);
+	return start_addr;
+}
+
 /*
  * We don't have to worry about legacy ISA devices, so nothing to do here.
  * This is marked as __weak because multiple architectures define it; it should
@@ -255,7 +290,9 @@ resource_size_t __weak pcibios_align_resource(void *data,
 					      resource_size_t size,
 					      resource_size_t align)
 {
-	return res->start;
+	struct pci_dev *dev = data;
+
+	return pci_align_resource(dev, res, empty_res, size, align);
 }
 
 static int __pci_assign_resource(struct pci_bus *bus, struct pci_dev *dev,
diff --git a/include/linux/pci.h b/include/linux/pci.h
index ac332ff9da9f..cedf948dc614 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1210,6 +1210,11 @@ resource_size_t pcibios_align_resource(void *data, const struct resource *res,
 				       const struct resource *empty_res,
 				       resource_size_t size,
 				       resource_size_t align);
+resource_size_t pci_align_resource(struct pci_dev *dev,
+				   const struct resource *res,
+				   const struct resource *empty_res,
+				   resource_size_t size,
+				   resource_size_t align);
 
 /* Generic PCI functions used internally */
 
diff --git a/kernel/resource.c b/kernel/resource.c
index 8c5fcb30fc33..d02a53fb95d8 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -766,7 +766,7 @@ static int __find_resource_space(struct resource *root, struct resource *old,
 			}
 			alloc.end = alloc.start + size - 1;
 			if (alloc.start <= alloc.end &&
-			    __resource_contains_unbound(&avail, &alloc)) {
+			    __resource_contains_unbound(&full_avail, &alloc)) {
 				new->start = alloc.start;
 				new->end = alloc.end;
 				return 0;
-- 
2.39.5


