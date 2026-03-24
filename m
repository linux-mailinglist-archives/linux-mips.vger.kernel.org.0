Return-Path: <linux-mips+bounces-13910-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GD0mJZXFwmmIlgQAu9opvQ
	(envelope-from <linux-mips+bounces-13910-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:10:45 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC393319C26
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2B3C23022B2E
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 16:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 550BA39D6F4;
	Tue, 24 Mar 2026 16:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQQGzlch"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44F7364044;
	Tue, 24 Mar 2026 16:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774371548; cv=none; b=ZbwBLLmbm9ZQf/7/O/NzPIpSpxvJFgiLPIMBk5PbQmTdi62jX/+ooOL8ABxC3zPd8aREM+pFOjangQhPjINxvhWtBOES8H3mVAEm4N0UBQXbAXxiTF79O8jSGWxR4I/PfzvOrILkpXCbWwfxhIsQV2DXNAX3zqm1Psphf4J1/Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774371548; c=relaxed/simple;
	bh=WCR3Q80GUH+QkmAMmzfR2ddGucv9DgzL69WXspRX/jg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ty+Lsgk8bDfe38Ijm0DCW59i87eReDJ/tD+y6Kfja8J1gK/+I92si/EXEhQCkjjji6q4y/Y+3jdBai69+zDRnwIk90rh2xSbNhi+JDwsKdYbaQH8NnW54NM7lk3n+gqVF2ai0mNyaJSW1qAu+yHNdD+uL+vHlUkj/SYJ0SdURnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQQGzlch; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774371547; x=1805907547;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WCR3Q80GUH+QkmAMmzfR2ddGucv9DgzL69WXspRX/jg=;
  b=HQQGzlchPcReU4bpAPfEAG9HmWlOrv2ed3s2F3drHqt7R4ux8WQjalJH
   7g+a2DvovYg7NIxq+6lfeQDVit61w1J2cG1xh1e7JU1w18xSbgB/6s6oT
   vBMq2z5hhCeB6zkqVeABaBoegJ8Mnb0nKbADZEGVyp6EMdS3EkvX6wJCP
   lSFjD9Ez/C+VC1zvabqLanVpZYud9rmG2o0i2NfcN7Cw2zXUGJ0L/SxIM
   hqsuY6qsUPXfheqcQGA1iv1YZAI8cFrajGeU76hMaxMy7rgV51/65CPFI
   dyUJh0/msTAXfK6dGoVdbV5YQWvhselEAnGSxczmzNnqOpo6HPoiT7Gxt
   g==;
X-CSE-ConnectionGUID: PtaXiS0PSIynHKh3BPkKNw==
X-CSE-MsgGUID: uxU80DllS261HL+9njNKVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86471700"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86471700"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 09:59:06 -0700
X-CSE-ConnectionGUID: WtnV/loaRsCO4KMKean0ww==
X-CSE-MsgGUID: ZxEF/K58SR25QVPpKDYMzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="224666153"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 09:58:46 -0700
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
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	x86@kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 02/10] resource: Pass full extent of empty space to resource_alignf CB
Date: Tue, 24 Mar 2026 18:56:25 +0200
Message-Id: <20260324165633.4583-3-ilpo.jarvinen@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13910-lists,linux-mips=lfdr.de];
	FREEMAIL_TO(0.00)[vger.kernel.org,google.com,roeck-us.net,lists.infradead.org,lists.linux-m68k.org,lists.ozlabs.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,HansenPartnership.com,gmx.de,ellerman.id.au,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,zankel.net,gmail.com,linux.ibm.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,linaro.org,dominikbrodowski.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: AC393319C26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

__find_resource_space() calculates the full extent of empty space but
only passes the aligned space to resource_alignf callback. In some
situations, the callback may choose take advantage of the free space
before the requested alignment.

Pass the full extent of the calculated empty space to resource_alignf
callback as an additional parameter.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 arch/alpha/kernel/pci.c          | 1 +
 arch/arm/kernel/bios32.c         | 4 +++-
 arch/m68k/kernel/pcibios.c       | 4 +++-
 arch/mips/pci/pci-generic.c      | 3 ++-
 arch/mips/pci/pci-legacy.c       | 1 +
 arch/parisc/kernel/pci.c         | 4 +++-
 arch/powerpc/kernel/pci-common.c | 4 +++-
 arch/s390/pci/pci.c              | 1 +
 arch/sh/drivers/pci/pci.c        | 4 +++-
 arch/x86/pci/i386.c              | 3 ++-
 arch/xtensa/kernel/pci.c         | 1 +
 drivers/pci/setup-res.c          | 3 ++-
 drivers/pcmcia/rsrc_nonstatic.c  | 3 ++-
 include/linux/ioport.h           | 2 ++
 include/linux/pci.h              | 7 ++++---
 kernel/resource.c                | 3 ++-
 16 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/arch/alpha/kernel/pci.c b/arch/alpha/kernel/pci.c
index 51a8a4c4572a..11df411b1d18 100644
--- a/arch/alpha/kernel/pci.c
+++ b/arch/alpha/kernel/pci.c
@@ -125,6 +125,7 @@ DECLARE_PCI_FIXUP_FINAL(PCI_ANY_ID, PCI_ANY_ID, pcibios_fixup_final);
 
 resource_size_t
 pcibios_align_resource(void *data, const struct resource *res,
+		       const struct resource *empty_res,
 		       resource_size_t size, resource_size_t align)
 {
 	struct pci_dev *dev = data;
diff --git a/arch/arm/kernel/bios32.c b/arch/arm/kernel/bios32.c
index b5793e8fbdc1..5b9b4fcd0e54 100644
--- a/arch/arm/kernel/bios32.c
+++ b/arch/arm/kernel/bios32.c
@@ -560,7 +560,9 @@ char * __init pcibios_setup(char *str)
  * which might be mirrored at 0x0100-0x03ff..
  */
 resource_size_t pcibios_align_resource(void *data, const struct resource *res,
-				resource_size_t size, resource_size_t align)
+				       const struct resource *empty_res,
+				       resource_size_t size,
+				       resource_size_t align)
 {
 	struct pci_dev *dev = data;
 	resource_size_t start = res->start;
diff --git a/arch/m68k/kernel/pcibios.c b/arch/m68k/kernel/pcibios.c
index e6ab3f9ff5d8..1415f6e4e5ce 100644
--- a/arch/m68k/kernel/pcibios.c
+++ b/arch/m68k/kernel/pcibios.c
@@ -27,7 +27,9 @@
  * which might be mirrored at 0x0100-0x03ff..
  */
 resource_size_t pcibios_align_resource(void *data, const struct resource *res,
-	resource_size_t size, resource_size_t align)
+				       const struct resource *empty_res,
+				       resource_size_t size,
+				       resource_size_t align)
 {
 	resource_size_t start = res->start;
 
diff --git a/arch/mips/pci/pci-generic.c b/arch/mips/pci/pci-generic.c
index d2d68bac3d25..f4957c26efc7 100644
--- a/arch/mips/pci/pci-generic.c
+++ b/arch/mips/pci/pci-generic.c
@@ -22,7 +22,8 @@
  * which might have be mirrored at 0x0100-0x03ff..
  */
 resource_size_t pcibios_align_resource(void *data, const struct resource *res,
-				resource_size_t size, resource_size_t align)
+				       const struct resource *empty_res,
+				       resource_size_t size, resource_size_t align)
 {
 	struct pci_dev *dev = data;
 	resource_size_t start = res->start;
diff --git a/arch/mips/pci/pci-legacy.c b/arch/mips/pci/pci-legacy.c
index d04b7c1294b6..817e97402afe 100644
--- a/arch/mips/pci/pci-legacy.c
+++ b/arch/mips/pci/pci-legacy.c
@@ -52,6 +52,7 @@ unsigned long pci_address_to_pio(phys_addr_t address)
  */
 resource_size_t
 pcibios_align_resource(void *data, const struct resource *res,
+		       const struct resource *empty_res,
 		       resource_size_t size, resource_size_t align)
 {
 	struct pci_dev *dev = data;
diff --git a/arch/parisc/kernel/pci.c b/arch/parisc/kernel/pci.c
index cf285b17a5ae..f99b20795d5a 100644
--- a/arch/parisc/kernel/pci.c
+++ b/arch/parisc/kernel/pci.c
@@ -196,7 +196,9 @@ void __ref pcibios_init_bridge(struct pci_dev *dev)
  * than res->start.
  */
 resource_size_t pcibios_align_resource(void *data, const struct resource *res,
-				resource_size_t size, resource_size_t alignment)
+				       const struct resource *empty_res,
+				       resource_size_t size,
+				       resource_size_t alignment)
 {
 	resource_size_t mask, align, start = res->start;
 
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index a7a2fb605971..e7bfa15da043 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -1132,7 +1132,9 @@ static int skip_isa_ioresource_align(struct pci_dev *dev)
  * which might have be mirrored at 0x0100-0x03ff..
  */
 resource_size_t pcibios_align_resource(void *data, const struct resource *res,
-				resource_size_t size, resource_size_t align)
+				       const struct resource *empty_res,
+				       resource_size_t size,
+				       resource_size_t align)
 {
 	struct pci_dev *dev = data;
 	resource_size_t start = res->start;
diff --git a/arch/s390/pci/pci.c b/arch/s390/pci/pci.c
index 2a430722cbe4..39bd2adfc240 100644
--- a/arch/s390/pci/pci.c
+++ b/arch/s390/pci/pci.c
@@ -266,6 +266,7 @@ static int zpci_cfg_store(struct zpci_dev *zdev, int offset, u32 val, u8 len)
 }
 
 resource_size_t pcibios_align_resource(void *data, const struct resource *res,
+				       const struct resource *empty_res,
 				       resource_size_t size,
 				       resource_size_t align)
 {
diff --git a/arch/sh/drivers/pci/pci.c b/arch/sh/drivers/pci/pci.c
index a3903304f33f..7a0522316ee3 100644
--- a/arch/sh/drivers/pci/pci.c
+++ b/arch/sh/drivers/pci/pci.c
@@ -168,7 +168,9 @@ subsys_initcall(pcibios_init);
  * modulo 0x400.
  */
 resource_size_t pcibios_align_resource(void *data, const struct resource *res,
-				resource_size_t size, resource_size_t align)
+				       const struct resource *empty_res,
+				       resource_size_t size,
+				       resource_size_t align)
 {
 	struct pci_dev *dev = data;
 	struct pci_channel *hose = dev->sysdata;
diff --git a/arch/x86/pci/i386.c b/arch/x86/pci/i386.c
index c4ec39ad276b..6fbd4b34c3f7 100644
--- a/arch/x86/pci/i386.c
+++ b/arch/x86/pci/i386.c
@@ -153,7 +153,8 @@ skip_isa_ioresource_align(struct pci_dev *dev) {
  */
 resource_size_t
 pcibios_align_resource(void *data, const struct resource *res,
-			resource_size_t size, resource_size_t align)
+		       const struct resource *empty_res,
+		       resource_size_t size, resource_size_t align)
 {
 	struct pci_dev *dev = data;
 	resource_size_t start = res->start;
diff --git a/arch/xtensa/kernel/pci.c b/arch/xtensa/kernel/pci.c
index 62c900e400d6..64ccb7e0d92f 100644
--- a/arch/xtensa/kernel/pci.c
+++ b/arch/xtensa/kernel/pci.c
@@ -39,6 +39,7 @@
  */
 resource_size_t
 pcibios_align_resource(void *data, const struct resource *res,
+		       const struct resource *empty_res,
 		       resource_size_t size, resource_size_t align)
 {
 	struct pci_dev *dev = data;
diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
index bb2aef373d6f..c375e255c509 100644
--- a/drivers/pci/setup-res.c
+++ b/drivers/pci/setup-res.c
@@ -251,10 +251,11 @@ static int pci_revert_fw_address(struct resource *res, struct pci_dev *dev,
  */
 resource_size_t __weak pcibios_align_resource(void *data,
 					      const struct resource *res,
+					      const struct resource *empty_res,
 					      resource_size_t size,
 					      resource_size_t align)
 {
-       return res->start;
+	return res->start;
 }
 
 static int __pci_assign_resource(struct pci_bus *bus, struct pci_dev *dev,
diff --git a/drivers/pcmcia/rsrc_nonstatic.c b/drivers/pcmcia/rsrc_nonstatic.c
index 0679dd434719..949e69921fe9 100644
--- a/drivers/pcmcia/rsrc_nonstatic.c
+++ b/drivers/pcmcia/rsrc_nonstatic.c
@@ -602,7 +602,8 @@ static resource_size_t pcmcia_common_align(struct pcmcia_align_data *align_data,
 
 static resource_size_t
 pcmcia_align(void *align_data, const struct resource *res,
-	resource_size_t size, resource_size_t align)
+	     const struct resource *empty_res,
+	     resource_size_t size, resource_size_t align)
 {
 	struct pcmcia_align_data *data = align_data;
 	struct resource_map *m;
diff --git a/include/linux/ioport.h b/include/linux/ioport.h
index 19d5e04564d9..3c73c9c0d4f7 100644
--- a/include/linux/ioport.h
+++ b/include/linux/ioport.h
@@ -202,6 +202,7 @@ enum {
  * typedef resource_alignf - Resource alignment callback
  * @data:	Private data used by the callback
  * @res:	Resource candidate range (an empty resource space)
+ * @empty_res:	Empty resource range without alignment applied
  * @size:	The minimum size of the empty space
  * @align:	Alignment from the constraints
  *
@@ -212,6 +213,7 @@ enum {
  */
 typedef resource_size_t (*resource_alignf)(void *data,
 					   const struct resource *res,
+					   const struct resource *empty_res,
 					   resource_size_t size,
 					   resource_size_t align);
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 1c270f1d5123..ac332ff9da9f 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1206,9 +1206,10 @@ int __must_check pcibios_enable_device(struct pci_dev *, int mask);
 char *pcibios_setup(char *str);
 
 /* Used only when drivers/pci/setup.c is used */
-resource_size_t pcibios_align_resource(void *, const struct resource *,
-				resource_size_t,
-				resource_size_t);
+resource_size_t pcibios_align_resource(void *data, const struct resource *res,
+				       const struct resource *empty_res,
+				       resource_size_t size,
+				       resource_size_t align);
 
 /* Generic PCI functions used internally */
 
diff --git a/kernel/resource.c b/kernel/resource.c
index 1e2f1dfc0edd..1b8d3101bdc6 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -759,7 +759,8 @@ static int __find_resource_space(struct resource *root, struct resource *old,
 			alloc.flags = avail.flags;
 			if (alignf) {
 				alloc.start = alignf(constraint->alignf_data,
-						     &avail, size, constraint->align);
+						     &avail, &tmp,
+						     size, constraint->align);
 			} else {
 				alloc.start = avail.start;
 			}
-- 
2.39.5


