Return-Path: <linux-mips+bounces-14017-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD0CL9C1zmmApgYAu9opvQ
	(envelope-from <linux-mips+bounces-14017-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 02 Apr 2026 20:30:40 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3806F38D1FC
	for <lists+linux-mips@lfdr.de>; Thu, 02 Apr 2026 20:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C676302B1BF
	for <lists+linux-mips@lfdr.de>; Thu,  2 Apr 2026 18:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3A3371056;
	Thu,  2 Apr 2026 18:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sW1NCvh+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E223054C7;
	Thu,  2 Apr 2026 18:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775154635; cv=none; b=DLVzQ9zJAIeD0agFjUSw7+C7pKxB+VuaY2O8nkg9evQgLk6ZbjAZC/pWpja8wAl0KrS+2kiOdVO+fqrCypk7jMAFjHVoJeq5hu7ybolizxa9t/JVYLy8lVCDTkAncdZjRDmnfWQME2qskpJsaMpyATrJAuKkjDjRPKD2HjThq98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775154635; c=relaxed/simple;
	bh=CZCyN7PMllkgbZDo13mTvPY9NlIzNFdCUnJpXsPYFho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RErW1YTciwRS+8HQM1xRhEfGAAusWDbmCfUquvtv+b5RpBvbFBVreHUE4Gx+I9P92JTNgJImz6ow4dFfVFdLAs8BbLdg1a+iZW5uiciYO4Z5fZflkCjuM80cROZc/iBxl1v6AgRfO4AVDmfJ3yhpux6UHdvskngvBxK22yfYEss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sW1NCvh+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68AAC116C6;
	Thu,  2 Apr 2026 18:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775154635;
	bh=CZCyN7PMllkgbZDo13mTvPY9NlIzNFdCUnJpXsPYFho=;
	h=From:To:Cc:Subject:Date:From;
	b=sW1NCvh+UM/kxiITkcOHyMme20/d4lde/qwaq7ICmODKaMeVhhclMKrkOpBJASfr3
	 t0CHsSF7SrVoly01ZUDz+a6nsPzhx3CLh0jfsxLZArmQL3AWaTYogkc7SMYMI7Fit7
	 cVPJGLzKwI8QW+zUcpYBVAFVgz+GGLxQv3l7AsyVFTLF9X+zjcTNQpc8e1PRgMsDPb
	 dvAOipI6BouT01N9u/M0/kzTOEvtSOb9BZOQZbMU53b5E343YglgyR3VB6w2acgvHW
	 zn2NZopYkDsSTLq8RuYZ7OrsqTc6DKcF/Vj5jeI1rtmR4WnQ2QNzRw6Rfsh0YvRh8W
	 oNnudSO44YCqg==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	jes@trained-monkey.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tsbogend@alpha.franken.de,
	James.Bottomley@HansenPartnership.com,
	deller@gmx.de,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	bhelgaas@google.com,
	dakr@kernel.org,
	kwilczynski@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	ebiggers@google.com,
	ardb@kernel.org,
	tiwai@suse.de,
	tytso@mit.edu,
	enelsonmoore@gmail.com,
	martin.petersen@oracle.com,
	jirislaby@kernel.org,
	gregkh@linuxfoundation.org,
	geert@linux-m68k.org,
	herbert@gondor.apana.org.au,
	vineethr@linux.ibm.com,
	lirongqing@baidu.com,
	kshk@linux.ibm.com,
	vadim.fedorenko@linux.dev,
	dong100@mucse.com,
	wangruikang@iscas.ac.cn,
	hkallweit1@gmail.com,
	kees@kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-pci@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH net-next] eth: remove the driver for acenic / tigon1&2
Date: Thu,  2 Apr 2026 11:30:29 -0700
Message-ID: <20260402183029.1236713-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,redhat.com,lunn.ch,kernel.org,trained-monkey.org,xen0n.name,alpha.franken.de,HansenPartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,gmail.com,garyguo.net,protonmail.com,umich.edu,suse.de,mit.edu,oracle.com,linuxfoundation.org,linux-m68k.org,gondor.apana.org.au,baidu.com,linux.dev,mucse.com,iscas.ac.cn,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14017-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[58];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3806F38D1FC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The entire git history for this driver looks like tree-wide
and automated cleanups. There's even more coming now with
AI, so let's try to delete it instead.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: jes@trained-monkey.org
CC: chenhuacai@kernel.org
CC: kernel@xen0n.name
CC: tsbogend@alpha.franken.de
CC: James.Bottomley@HansenPartnership.com
CC: deller@gmx.de
CC: maddy@linux.ibm.com
CC: mpe@ellerman.id.au
CC: npiggin@gmail.com
CC: chleroy@kernel.org
CC: hca@linux.ibm.com
CC: gor@linux.ibm.com
CC: agordeev@linux.ibm.com
CC: borntraeger@linux.ibm.com
CC: svens@linux.ibm.com
CC: bhelgaas@google.com
CC: dakr@kernel.org
CC: kwilczynski@kernel.org
CC: ojeda@kernel.org
CC: boqun@kernel.org
CC: gary@garyguo.net
CC: bjorn3_gh@protonmail.com
CC: lossin@kernel.org
CC: a.hindborg@kernel.org
CC: aliceryhl@google.com
CC: tmgross@umich.edu
CC: ebiggers@google.com
CC: ardb@kernel.org
CC: tiwai@suse.de
CC: tytso@mit.edu
CC: enelsonmoore@gmail.com
CC: martin.petersen@oracle.com
CC: jirislaby@kernel.org
CC: gregkh@linuxfoundation.org
CC: geert@linux-m68k.org
CC: herbert@gondor.apana.org.au
CC: vineethr@linux.ibm.com
CC: lirongqing@baidu.com
CC: kshk@linux.ibm.com
CC: vadim.fedorenko@linux.dev
CC: dong100@mucse.com
CC: wangruikang@iscas.ac.cn
CC: hkallweit1@gmail.com
CC: kees@kernel.org
CC: loongarch@lists.linux.dev
CC: linux-mips@vger.kernel.org
CC: linux-parisc@vger.kernel.org
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-s390@vger.kernel.org
CC: linux-pci@vger.kernel.org
CC: rust-for-linux@vger.kernel.org
---
 MAINTAINERS                                 |    6 -
 drivers/net/ethernet/Kconfig                |    1 -
 drivers/net/ethernet/alteon/Kconfig         |   47 -
 drivers/net/ethernet/Makefile               |    1 -
 drivers/net/ethernet/alteon/Makefile        |    6 -
 drivers/net/ethernet/alteon/acenic.h        |  791 -----
 include/linux/pci_ids.h                     |    2 -
 drivers/net/ethernet/alteon/acenic.c        | 3178 -------------------
 arch/loongarch/configs/loongson32_defconfig |    1 -
 arch/loongarch/configs/loongson64_defconfig |    1 -
 arch/mips/configs/cavium_octeon_defconfig   |    1 -
 arch/mips/configs/loongson2k_defconfig      |    1 -
 arch/mips/configs/loongson3_defconfig       |    1 -
 arch/mips/configs/malta_qemu_32r6_defconfig |    1 -
 arch/mips/configs/maltaaprp_defconfig       |    1 -
 arch/mips/configs/maltasmvp_defconfig       |    1 -
 arch/mips/configs/maltasmvp_eva_defconfig   |    1 -
 arch/mips/configs/maltaup_defconfig         |    1 -
 arch/mips/configs/mtx1_defconfig            |    1 -
 arch/parisc/configs/generic-32bit_defconfig |    1 -
 arch/parisc/configs/generic-64bit_defconfig |    1 -
 arch/powerpc/configs/44x/akebono_defconfig  |    1 -
 arch/powerpc/configs/g5_defconfig           |    2 -
 arch/powerpc/configs/powernv_defconfig      |    2 -
 arch/powerpc/configs/ppc64_defconfig        |    2 -
 arch/powerpc/configs/ppc64e_defconfig       |    2 -
 arch/powerpc/configs/ppc6xx_defconfig       |    1 -
 arch/powerpc/configs/skiroot_defconfig      |    2 -
 arch/s390/configs/debug_defconfig           |    1 -
 arch/s390/configs/defconfig                 |    1 -
 rust/kernel/pci/id.rs                       |    1 -
 31 files changed, 4060 deletions(-)
 delete mode 100644 drivers/net/ethernet/alteon/Kconfig
 delete mode 100644 drivers/net/ethernet/alteon/Makefile
 delete mode 100644 drivers/net/ethernet/alteon/acenic.h
 delete mode 100644 drivers/net/ethernet/alteon/acenic.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a2ffd9d37d5..8158e4471bb7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -261,12 +261,6 @@ L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	drivers/gpio/gpio-pcie-idio-24.c
 
-ACENIC DRIVER
-M:	Jes Sorensen <jes@trained-monkey.org>
-L:	linux-acenic@sunsite.dk
-S:	Maintained
-F:	drivers/net/ethernet/alteon/acenic*
-
 ACER ASPIRE ONE TEMPERATURE AND FAN DRIVER
 M:	Peter Kaestle <peter@piie.net>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/drivers/net/ethernet/Kconfig b/drivers/net/ethernet/Kconfig
index aa7103e7f47f..bdc29d143160 100644
--- a/drivers/net/ethernet/Kconfig
+++ b/drivers/net/ethernet/Kconfig
@@ -23,7 +23,6 @@ source "drivers/net/ethernet/agere/Kconfig"
 source "drivers/net/ethernet/airoha/Kconfig"
 source "drivers/net/ethernet/alacritech/Kconfig"
 source "drivers/net/ethernet/allwinner/Kconfig"
-source "drivers/net/ethernet/alteon/Kconfig"
 source "drivers/net/ethernet/altera/Kconfig"
 source "drivers/net/ethernet/amazon/Kconfig"
 source "drivers/net/ethernet/amd/Kconfig"
diff --git a/drivers/net/ethernet/alteon/Kconfig b/drivers/net/ethernet/alteon/Kconfig
deleted file mode 100644
index cfe1f3159d61..000000000000
--- a/drivers/net/ethernet/alteon/Kconfig
+++ /dev/null
@@ -1,47 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-#
-# Alteon network device configuration
-#
-
-config NET_VENDOR_ALTEON
-	bool "Alteon devices"
-	default y
-	depends on PCI
-	help
-	  If you have a network (Ethernet) card belonging to this class, say Y.
-
-	  Note that the answer to this question doesn't directly affect the
-	  kernel: saying N will just cause the configurator to skip all
-	  the questions about Alteon cards. If you say Y, you will be asked for
-	  your specific card in the following questions.
-
-if NET_VENDOR_ALTEON
-
-config ACENIC
-	tristate "Alteon AceNIC/3Com 3C985/NetGear GA620 Gigabit support"
-	depends on PCI
-	help
-	  Say Y here if you have an Alteon AceNIC, 3Com 3C985(B), NetGear
-	  GA620, SGI Gigabit or Farallon PN9000-SX PCI Gigabit Ethernet
-	  adapter. The driver allows for using the Jumbo Frame option (9000
-	  bytes/frame) however it requires that your switches can handle this
-	  as well. To enable Jumbo Frames, add `mtu 9000' to your ifconfig
-	  line.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called acenic.
-
-config ACENIC_OMIT_TIGON_I
-	bool "Omit support for old Tigon I based AceNICs"
-	depends on ACENIC
-	help
-	  Say Y here if you only have Tigon II based AceNICs and want to leave
-	  out support for the older Tigon I based cards which are no longer
-	  being sold (ie. the original Alteon AceNIC and 3Com 3C985 (non B
-	  version)).  This will reduce the size of the driver object by
-	  app. 100KB.  If you are not sure whether your card is a Tigon I or a
-	  Tigon II, say N here.
-
-	  The safe and default value for this is N.
-
-endif # NET_VENDOR_ALTEON
diff --git a/drivers/net/ethernet/Makefile b/drivers/net/ethernet/Makefile
index 6615a67a63d5..6bffb60ba644 100644
--- a/drivers/net/ethernet/Makefile
+++ b/drivers/net/ethernet/Makefile
@@ -13,7 +13,6 @@ obj-$(CONFIG_NET_VENDOR_AGERE) += agere/
 obj-$(CONFIG_NET_VENDOR_AIROHA) += airoha/
 obj-$(CONFIG_NET_VENDOR_ALACRITECH) += alacritech/
 obj-$(CONFIG_NET_VENDOR_ALLWINNER) += allwinner/
-obj-$(CONFIG_NET_VENDOR_ALTEON) += alteon/
 obj-$(CONFIG_ALTERA_TSE) += altera/
 obj-$(CONFIG_NET_VENDOR_AMAZON) += amazon/
 obj-$(CONFIG_NET_VENDOR_AMD) += amd/
diff --git a/drivers/net/ethernet/alteon/Makefile b/drivers/net/ethernet/alteon/Makefile
deleted file mode 100644
index be5225559b6d..000000000000
--- a/drivers/net/ethernet/alteon/Makefile
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-#
-# Makefile for the Alteon network device drivers.
-#
-
-obj-$(CONFIG_ACENIC) += acenic.o
diff --git a/drivers/net/ethernet/alteon/acenic.h b/drivers/net/ethernet/alteon/acenic.h
deleted file mode 100644
index 0e45a97b9c9b..000000000000
--- a/drivers/net/ethernet/alteon/acenic.h
+++ /dev/null
@@ -1,791 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ACENIC_H_
-#define _ACENIC_H_
-#include <linux/interrupt.h>
-#include <linux/workqueue.h>
-
-/*
- * Generate TX index update each time, when TX ring is closed.
- * Normally, this is not useful, because results in more dma (and irqs
- * without TX_COAL_INTS_ONLY).
- */
-#define USE_TX_COAL_NOW	 0
-
-/*
- * Addressing:
- *
- * The Tigon uses 64-bit host addresses, regardless of their actual
- * length, and it expects a big-endian format. For 32 bit systems the
- * upper 32 bits of the address are simply ignored (zero), however for
- * little endian 64 bit systems (Alpha) this looks strange with the
- * two parts of the address word being swapped.
- *
- * The addresses are split in two 32 bit words for all architectures
- * as some of them are in PCI shared memory and it is necessary to use
- * readl/writel to access them.
- *
- * The addressing code is derived from Pete Wyckoff's work, but
- * modified to deal properly with readl/writel usage.
- */
-
-struct ace_regs {
-	u32	pad0[16];	/* PCI control registers */
-
-	u32	HostCtrl;	/* 0x40 */
-	u32	LocalCtrl;
-
-	u32	pad1[2];
-
-	u32	MiscCfg;	/* 0x50 */
-
-	u32	pad2[2];
-
-	u32	PciState;
-
-	u32	pad3[2];	/* 0x60 */
-
-	u32	WinBase;
-	u32	WinData;
-
-	u32	pad4[12];	/* 0x70 */
-
-	u32	DmaWriteState;	/* 0xa0 */
-	u32	pad5[3];
-	u32	DmaReadState;	/* 0xb0 */
-
-	u32	pad6[26];
-
-	u32	AssistState;
-
-	u32	pad7[8];	/* 0x120 */
-
-	u32	CpuCtrl;	/* 0x140 */
-	u32	Pc;
-
-	u32	pad8[3];
-
-	u32	SramAddr;	/* 0x154 */
-	u32	SramData;
-
-	u32	pad9[49];
-
-	u32	MacRxState;	/* 0x220 */
-
-	u32	pad10[7];
-
-	u32	CpuBCtrl;	/* 0x240 */
-	u32	PcB;
-
-	u32	pad11[3];
-
-	u32	SramBAddr;	/* 0x254 */
-	u32	SramBData;
-
-	u32	pad12[105];
-
-	u32	pad13[32];	/* 0x400 */
-	u32	Stats[32];
-
-	u32	Mb0Hi;		/* 0x500 */
-	u32	Mb0Lo;
-	u32	Mb1Hi;
-	u32	CmdPrd;
-	u32	Mb2Hi;
-	u32	TxPrd;
-	u32	Mb3Hi;
-	u32	RxStdPrd;
-	u32	Mb4Hi;
-	u32	RxJumboPrd;
-	u32	Mb5Hi;
-	u32	RxMiniPrd;
-	u32	Mb6Hi;
-	u32	Mb6Lo;
-	u32	Mb7Hi;
-	u32	Mb7Lo;
-	u32	Mb8Hi;
-	u32	Mb8Lo;
-	u32	Mb9Hi;
-	u32	Mb9Lo;
-	u32	MbAHi;
-	u32	MbALo;
-	u32	MbBHi;
-	u32	MbBLo;
-	u32	MbCHi;
-	u32	MbCLo;
-	u32	MbDHi;
-	u32	MbDLo;
-	u32	MbEHi;
-	u32	MbELo;
-	u32	MbFHi;
-	u32	MbFLo;
-
-	u32	pad14[32];
-
-	u32	MacAddrHi;	/* 0x600 */
-	u32	MacAddrLo;
-	u32	InfoPtrHi;
-	u32	InfoPtrLo;
-	u32	MultiCastHi;	/* 0x610 */
-	u32	MultiCastLo;
-	u32	ModeStat;
-	u32	DmaReadCfg;
-	u32	DmaWriteCfg;	/* 0x620 */
-	u32	TxBufRat;
-	u32	EvtCsm;
-	u32	CmdCsm;
-	u32	TuneRxCoalTicks;/* 0x630 */
-	u32	TuneTxCoalTicks;
-	u32	TuneStatTicks;
-	u32	TuneMaxTxDesc;
-	u32	TuneMaxRxDesc;	/* 0x640 */
-	u32	TuneTrace;
-	u32	TuneLink;
-	u32	TuneFastLink;
-	u32	TracePtr;	/* 0x650 */
-	u32	TraceStrt;
-	u32	TraceLen;
-	u32	IfIdx;
-	u32	IfMtu;		/* 0x660 */
-	u32	MaskInt;
-	u32	GigLnkState;
-	u32	FastLnkState;
-	u32	pad16[4];	/* 0x670 */
-	u32	RxRetCsm;	/* 0x680 */
-
-	u32	pad17[31];
-
-	u32	CmdRng[64];	/* 0x700 */
-	u32	Window[0x200];
-};
-
-
-typedef struct {
-	u32 addrhi;
-	u32 addrlo;
-} aceaddr;
-
-
-#define ACE_WINDOW_SIZE	0x800
-
-#define ACE_JUMBO_MTU 9000
-#define ACE_STD_MTU 1500
-
-#define ACE_TRACE_SIZE 0x8000
-
-/*
- * Host control register bits.
- */
-
-#define IN_INT		0x01
-#define CLR_INT		0x02
-#define HW_RESET	0x08
-#define BYTE_SWAP	0x10
-#define WORD_SWAP	0x20
-#define MASK_INTS	0x40
-
-/*
- * Local control register bits.
- */
-
-#define EEPROM_DATA_IN		0x800000
-#define EEPROM_DATA_OUT		0x400000
-#define EEPROM_WRITE_ENABLE	0x200000
-#define EEPROM_CLK_OUT		0x100000
-
-#define EEPROM_BASE		0xa0000000
-
-#define EEPROM_WRITE_SELECT	0xa0
-#define EEPROM_READ_SELECT	0xa1
-
-#define SRAM_BANK_512K		0x200
-
-
-/*
- * udelay() values for when clocking the eeprom
- */
-#define ACE_SHORT_DELAY		2
-#define ACE_LONG_DELAY		4
-
-
-/*
- * Misc Config bits
- */
-
-#define SYNC_SRAM_TIMING	0x100000
-
-
-/*
- * CPU state bits.
- */
-
-#define CPU_RESET		0x01
-#define CPU_TRACE		0x02
-#define CPU_PROM_FAILED		0x10
-#define CPU_HALT		0x00010000
-#define CPU_HALTED		0xffff0000
-
-
-/*
- * PCI State bits.
- */
-
-#define DMA_READ_MAX_4		0x04
-#define DMA_READ_MAX_16		0x08
-#define DMA_READ_MAX_32		0x0c
-#define DMA_READ_MAX_64		0x10
-#define DMA_READ_MAX_128	0x14
-#define DMA_READ_MAX_256	0x18
-#define DMA_READ_MAX_1K		0x1c
-#define DMA_WRITE_MAX_4		0x20
-#define DMA_WRITE_MAX_16	0x40
-#define DMA_WRITE_MAX_32	0x60
-#define DMA_WRITE_MAX_64	0x80
-#define DMA_WRITE_MAX_128	0xa0
-#define DMA_WRITE_MAX_256	0xc0
-#define DMA_WRITE_MAX_1K	0xe0
-#define DMA_READ_WRITE_MASK	0xfc
-#define MEM_READ_MULTIPLE	0x00020000
-#define PCI_66MHZ		0x00080000
-#define PCI_32BIT		0x00100000
-#define DMA_WRITE_ALL_ALIGN	0x00800000
-#define READ_CMD_MEM		0x06000000
-#define WRITE_CMD_MEM		0x70000000
-
-
-/*
- * Mode status
- */
-
-#define ACE_BYTE_SWAP_BD	0x02
-#define ACE_WORD_SWAP_BD	0x04		/* not actually used */
-#define ACE_WARN		0x08
-#define ACE_BYTE_SWAP_DMA	0x10
-#define ACE_NO_JUMBO_FRAG	0x200
-#define ACE_FATAL		0x40000000
-
-
-/*
- * DMA config
- */
-
-#define DMA_THRESH_1W		0x10
-#define DMA_THRESH_2W		0x20
-#define DMA_THRESH_4W		0x40
-#define DMA_THRESH_8W		0x80
-#define DMA_THRESH_16W		0x100
-#define DMA_THRESH_32W		0x0	/* not described in doc, but exists. */
-
-
-/*
- * Tuning parameters
- */
-
-#define TICKS_PER_SEC		1000000
-
-
-/*
- * Link bits
- */
-
-#define LNK_PREF		0x00008000
-#define LNK_10MB		0x00010000
-#define LNK_100MB		0x00020000
-#define LNK_1000MB		0x00040000
-#define LNK_FULL_DUPLEX		0x00080000
-#define LNK_HALF_DUPLEX		0x00100000
-#define LNK_TX_FLOW_CTL_Y	0x00200000
-#define LNK_NEG_ADVANCED	0x00400000
-#define LNK_RX_FLOW_CTL_Y	0x00800000
-#define LNK_NIC			0x01000000
-#define LNK_JAM			0x02000000
-#define LNK_JUMBO		0x04000000
-#define LNK_ALTEON		0x08000000
-#define LNK_NEG_FCTL		0x10000000
-#define LNK_NEGOTIATE		0x20000000
-#define LNK_ENABLE		0x40000000
-#define LNK_UP			0x80000000
-
-
-/*
- * Event definitions
- */
-
-#define EVT_RING_ENTRIES	256
-#define EVT_RING_SIZE	(EVT_RING_ENTRIES * sizeof(struct event))
-
-struct event {
-#ifdef __LITTLE_ENDIAN_BITFIELD
-	u32	idx:12;
-	u32	code:12;
-	u32	evt:8;
-#else
-	u32	evt:8;
-	u32	code:12;
-	u32	idx:12;
-#endif
-	u32     pad;
-};
-
-
-/*
- * Events
- */
-
-#define E_FW_RUNNING		0x01
-#define E_STATS_UPDATED		0x04
-
-#define E_STATS_UPDATE		0x04
-
-#define E_LNK_STATE		0x06
-#define E_C_LINK_UP		0x01
-#define E_C_LINK_DOWN		0x02
-#define E_C_LINK_10_100		0x03
-
-#define E_ERROR			0x07
-#define E_C_ERR_INVAL_CMD	0x01
-#define E_C_ERR_UNIMP_CMD	0x02
-#define E_C_ERR_BAD_CFG		0x03
-
-#define E_MCAST_LIST		0x08
-#define E_C_MCAST_ADDR_ADD	0x01
-#define E_C_MCAST_ADDR_DEL	0x02
-
-#define E_RESET_JUMBO_RNG	0x09
-
-
-/*
- * Commands
- */
-
-#define CMD_RING_ENTRIES	64
-
-struct cmd {
-#ifdef __LITTLE_ENDIAN_BITFIELD
-	u32	idx:12;
-	u32	code:12;
-	u32	evt:8;
-#else
-	u32	evt:8;
-	u32	code:12;
-	u32	idx:12;
-#endif
-};
-
-
-#define C_HOST_STATE		0x01
-#define C_C_STACK_UP		0x01
-#define C_C_STACK_DOWN		0x02
-
-#define C_FDR_FILTERING		0x02
-#define C_C_FDR_FILT_ENABLE	0x01
-#define C_C_FDR_FILT_DISABLE	0x02
-
-#define C_SET_RX_PRD_IDX	0x03
-#define C_UPDATE_STATS		0x04
-#define C_RESET_JUMBO_RNG	0x05
-#define C_ADD_MULTICAST_ADDR	0x08
-#define C_DEL_MULTICAST_ADDR	0x09
-
-#define C_SET_PROMISC_MODE	0x0a
-#define C_C_PROMISC_ENABLE	0x01
-#define C_C_PROMISC_DISABLE	0x02
-
-#define C_LNK_NEGOTIATION	0x0b
-#define C_C_NEGOTIATE_BOTH	0x00
-#define C_C_NEGOTIATE_GIG	0x01
-#define C_C_NEGOTIATE_10_100	0x02
-
-#define C_SET_MAC_ADDR		0x0c
-#define C_CLEAR_PROFILE		0x0d
-
-#define C_SET_MULTICAST_MODE	0x0e
-#define C_C_MCAST_ENABLE	0x01
-#define C_C_MCAST_DISABLE	0x02
-
-#define C_CLEAR_STATS		0x0f
-#define C_SET_RX_JUMBO_PRD_IDX	0x10
-#define C_REFRESH_STATS		0x11
-
-
-/*
- * Descriptor flags
- */
-#define BD_FLG_TCP_UDP_SUM	0x01
-#define BD_FLG_IP_SUM		0x02
-#define BD_FLG_END		0x04
-#define BD_FLG_MORE		0x08
-#define BD_FLG_JUMBO		0x10
-#define BD_FLG_UCAST		0x20
-#define BD_FLG_MCAST		0x40
-#define BD_FLG_BCAST		0x60
-#define BD_FLG_TYP_MASK		0x60
-#define BD_FLG_IP_FRAG		0x80
-#define BD_FLG_IP_FRAG_END	0x100
-#define BD_FLG_VLAN_TAG		0x200
-#define BD_FLG_FRAME_ERROR	0x400
-#define BD_FLG_COAL_NOW		0x800
-#define BD_FLG_MINI		0x1000
-
-
-/*
- * Ring Control block flags
- */
-#define RCB_FLG_TCP_UDP_SUM	0x01
-#define RCB_FLG_IP_SUM		0x02
-#define RCB_FLG_NO_PSEUDO_HDR	0x08
-#define RCB_FLG_VLAN_ASSIST	0x10
-#define RCB_FLG_COAL_INT_ONLY	0x20
-#define RCB_FLG_TX_HOST_RING	0x40
-#define RCB_FLG_IEEE_SNAP_SUM	0x80
-#define RCB_FLG_EXT_RX_BD	0x100
-#define RCB_FLG_RNG_DISABLE	0x200
-
-
-/*
- * TX ring - maximum TX ring entries for Tigon I's is 128
- */
-#define MAX_TX_RING_ENTRIES	256
-#define TIGON_I_TX_RING_ENTRIES	128
-#define TX_RING_SIZE		(MAX_TX_RING_ENTRIES * sizeof(struct tx_desc))
-#define TX_RING_BASE		0x3800
-
-struct tx_desc{
-        aceaddr	addr;
-	u32	flagsize;
-#if 0
-/*
- * This is in PCI shared mem and must be accessed with readl/writel
- * real layout is:
- */
-#if __LITTLE_ENDIAN
-	u16	flags;
-	u16	size;
-	u16	vlan;
-	u16	reserved;
-#else
-	u16	size;
-	u16	flags;
-	u16	reserved;
-	u16	vlan;
-#endif
-#endif
-	u32	vlanres;
-};
-
-
-#define RX_STD_RING_ENTRIES	512
-#define RX_STD_RING_SIZE	(RX_STD_RING_ENTRIES * sizeof(struct rx_desc))
-
-#define RX_JUMBO_RING_ENTRIES	256
-#define RX_JUMBO_RING_SIZE	(RX_JUMBO_RING_ENTRIES *sizeof(struct rx_desc))
-
-#define RX_MINI_RING_ENTRIES	1024
-#define RX_MINI_RING_SIZE	(RX_MINI_RING_ENTRIES *sizeof(struct rx_desc))
-
-#define RX_RETURN_RING_ENTRIES	2048
-#define RX_RETURN_RING_SIZE	(RX_MAX_RETURN_RING_ENTRIES * \
-				 sizeof(struct rx_desc))
-
-struct rx_desc{
-	aceaddr	addr;
-#ifdef __LITTLE_ENDIAN
-	u16	size;
-	u16	idx;
-#else
-	u16	idx;
-	u16	size;
-#endif
-#ifdef __LITTLE_ENDIAN
-	u16	flags;
-	u16	type;
-#else
-	u16	type;
-	u16	flags;
-#endif
-#ifdef __LITTLE_ENDIAN
-	u16	tcp_udp_csum;
-	u16	ip_csum;
-#else
-	u16	ip_csum;
-	u16	tcp_udp_csum;
-#endif
-#ifdef __LITTLE_ENDIAN
-	u16	vlan;
-	u16	err_flags;
-#else
-	u16	err_flags;
-	u16	vlan;
-#endif
-	u32	reserved;
-	u32	opague;
-};
-
-
-/*
- * This struct is shared with the NIC firmware.
- */
-struct ring_ctrl {
-	aceaddr	rngptr;
-#ifdef __LITTLE_ENDIAN
-	u16	flags;
-	u16	max_len;
-#else
-	u16	max_len;
-	u16	flags;
-#endif
-	u32	pad;
-};
-
-
-struct ace_mac_stats {
-	u32 excess_colls;
-	u32 coll_1;
-	u32 coll_2;
-	u32 coll_3;
-	u32 coll_4;
-	u32 coll_5;
-	u32 coll_6;
-	u32 coll_7;
-	u32 coll_8;
-	u32 coll_9;
-	u32 coll_10;
-	u32 coll_11;
-	u32 coll_12;
-	u32 coll_13;
-	u32 coll_14;
-	u32 coll_15;
-	u32 late_coll;
-	u32 defers;
-	u32 crc_err;
-	u32 underrun;
-	u32 crs_err;
-	u32 pad[3];
-	u32 drop_ula;
-	u32 drop_mc;
-	u32 drop_fc;
-	u32 drop_space;
-	u32 coll;
-	u32 kept_bc;
-	u32 kept_mc;
-	u32 kept_uc;
-};
-
-
-struct ace_info {
-	union {
-		u32 stats[256];
-	} s;
-	struct ring_ctrl	evt_ctrl;
-	struct ring_ctrl	cmd_ctrl;
-	struct ring_ctrl	tx_ctrl;
-	struct ring_ctrl	rx_std_ctrl;
-	struct ring_ctrl	rx_jumbo_ctrl;
-	struct ring_ctrl	rx_mini_ctrl;
-	struct ring_ctrl	rx_return_ctrl;
-	aceaddr	evt_prd_ptr;
-	aceaddr	rx_ret_prd_ptr;
-	aceaddr	tx_csm_ptr;
-	aceaddr	stats2_ptr;
-};
-
-
-struct ring_info {
-	struct sk_buff		*skb;
-	DEFINE_DMA_UNMAP_ADDR(mapping);
-};
-
-
-/*
- * Funny... As soon as we add maplen on alpha, it starts to work
- * much slower. Hmm... is it because struct does not fit to one cacheline?
- * So, split tx_ring_info.
- */
-struct tx_ring_info {
-	struct sk_buff		*skb;
-	DEFINE_DMA_UNMAP_ADDR(mapping);
-	DEFINE_DMA_UNMAP_LEN(maplen);
-};
-
-
-/*
- * struct ace_skb holding the rings of skb's. This is an awful lot of
- * pointers, but I don't see any other smart mode to do this in an
- * efficient manner ;-(
- */
-struct ace_skb
-{
-	struct tx_ring_info	tx_skbuff[MAX_TX_RING_ENTRIES];
-	struct ring_info	rx_std_skbuff[RX_STD_RING_ENTRIES];
-	struct ring_info	rx_mini_skbuff[RX_MINI_RING_ENTRIES];
-	struct ring_info	rx_jumbo_skbuff[RX_JUMBO_RING_ENTRIES];
-};
-
-
-/*
- * Struct private for the AceNIC.
- *
- * Elements are grouped so variables used by the tx handling goes
- * together, and will go into the same cache lines etc. in order to
- * avoid cache line contention between the rx and tx handling on SMP.
- *
- * Frequently accessed variables are put at the beginning of the
- * struct to help the compiler generate better/shorter code.
- */
-struct ace_private
-{
-	struct net_device	*ndev;		/* backpointer */
-	struct ace_info		*info;
-	struct ace_regs	__iomem	*regs;		/* register base */
-	struct ace_skb		*skb;
-	dma_addr_t		info_dma;	/* 32/64 bit */
-
-	int			version, link;
-	int			promisc, mcast_all;
-
-	/*
-	 * TX elements
-	 */
-	struct tx_desc		*tx_ring;
-	u32			tx_prd;
-	volatile u32		tx_ret_csm;
-	int			tx_ring_entries;
-
-	/*
-	 * RX elements
-	 */
-	unsigned long		std_refill_busy
-				__attribute__ ((aligned (SMP_CACHE_BYTES)));
-	unsigned long		mini_refill_busy, jumbo_refill_busy;
-	atomic_t		cur_rx_bufs;
-	atomic_t		cur_mini_bufs;
-	atomic_t		cur_jumbo_bufs;
-	u32			rx_std_skbprd, rx_mini_skbprd, rx_jumbo_skbprd;
-	u32			cur_rx;
-
-	struct rx_desc		*rx_std_ring;
-	struct rx_desc		*rx_jumbo_ring;
-	struct rx_desc		*rx_mini_ring;
-	struct rx_desc		*rx_return_ring;
-
-	int			bh_work_pending, jumbo;
-	struct work_struct	ace_bh_work;
-
-	struct event		*evt_ring;
-
-	volatile u32		*evt_prd, *rx_ret_prd, *tx_csm;
-
-	dma_addr_t		tx_ring_dma;	/* 32/64 bit */
-	dma_addr_t		rx_ring_base_dma;
-	dma_addr_t		evt_ring_dma;
-	dma_addr_t		evt_prd_dma, rx_ret_prd_dma, tx_csm_dma;
-
-	unsigned char		*trace_buf;
-	struct pci_dev		*pdev;
-	struct net_device	*next;
-	volatile int		fw_running;
-	int			board_idx;
-	u16			pci_command;
-	u8			pci_latency;
-	const char		*name;
-#ifdef INDEX_DEBUG
-	spinlock_t		debug_lock
-				__attribute__ ((aligned (SMP_CACHE_BYTES)));
-	u32			last_tx, last_std_rx, last_mini_rx;
-#endif
-	u8			firmware_major;
-	u8			firmware_minor;
-	u8			firmware_fix;
-	u32			firmware_start;
-};
-
-
-#define TX_RESERVED	MAX_SKB_FRAGS
-
-static inline int tx_space (struct ace_private *ap, u32 csm, u32 prd)
-{
-	return (csm - prd - 1) & (ACE_TX_RING_ENTRIES(ap) - 1);
-}
-
-#define tx_free(ap) 		tx_space((ap)->tx_ret_csm, (ap)->tx_prd, ap)
-#define tx_ring_full(ap, csm, prd)	(tx_space(ap, csm, prd) <= TX_RESERVED)
-
-static inline void set_aceaddr(aceaddr *aa, dma_addr_t addr)
-{
-	u64 baddr = (u64) addr;
-	aa->addrlo = baddr & 0xffffffff;
-	aa->addrhi = baddr >> 32;
-	wmb();
-}
-
-
-static inline void ace_set_txprd(struct ace_regs __iomem *regs,
-				 struct ace_private *ap, u32 value)
-{
-#ifdef INDEX_DEBUG
-	unsigned long flags;
-	spin_lock_irqsave(&ap->debug_lock, flags);
-	writel(value, &regs->TxPrd);
-	if (value == ap->last_tx)
-		printk(KERN_ERR "AceNIC RACE ALERT! writing identical value "
-		       "to tx producer (%i)\n", value);
-	ap->last_tx = value;
-	spin_unlock_irqrestore(&ap->debug_lock, flags);
-#else
-	writel(value, &regs->TxPrd);
-#endif
-	wmb();
-}
-
-
-static inline void ace_mask_irq(struct net_device *dev)
-{
-	struct ace_private *ap = netdev_priv(dev);
-	struct ace_regs __iomem *regs = ap->regs;
-
-	if (ACE_IS_TIGON_I(ap))
-		writel(1, &regs->MaskInt);
-	else
-		writel(readl(&regs->HostCtrl) | MASK_INTS, &regs->HostCtrl);
-
-	ace_sync_irq(dev->irq);
-}
-
-
-static inline void ace_unmask_irq(struct net_device *dev)
-{
-	struct ace_private *ap = netdev_priv(dev);
-	struct ace_regs __iomem *regs = ap->regs;
-
-	if (ACE_IS_TIGON_I(ap))
-		writel(0, &regs->MaskInt);
-	else
-		writel(readl(&regs->HostCtrl) & ~MASK_INTS, &regs->HostCtrl);
-}
-
-
-/*
- * Prototypes
- */
-static int ace_init(struct net_device *dev);
-static void ace_load_std_rx_ring(struct net_device *dev, int nr_bufs);
-static void ace_load_mini_rx_ring(struct net_device *dev, int nr_bufs);
-static void ace_load_jumbo_rx_ring(struct net_device *dev, int nr_bufs);
-static irqreturn_t ace_interrupt(int irq, void *dev_id);
-static int ace_load_firmware(struct net_device *dev);
-static int ace_open(struct net_device *dev);
-static netdev_tx_t ace_start_xmit(struct sk_buff *skb,
-				  struct net_device *dev);
-static int ace_close(struct net_device *dev);
-static void ace_bh_work(struct work_struct *work);
-static void ace_dump_trace(struct ace_private *ap);
-static void ace_set_multicast_list(struct net_device *dev);
-static int ace_change_mtu(struct net_device *dev, int new_mtu);
-static int ace_set_mac_addr(struct net_device *dev, void *p);
-static void ace_set_rxtx_parms(struct net_device *dev, int jumbo);
-static int ace_allocate_descriptors(struct net_device *dev);
-static void ace_free_descriptors(struct net_device *dev);
-static void ace_init_cleanup(struct net_device *dev);
-static struct net_device_stats *ace_get_stats(struct net_device *dev);
-static int read_eeprom_byte(struct net_device *dev, unsigned long offset);
-
-#endif /* _ACENIC_H_ */
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 406abf629be2..8608361fac95 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -1809,8 +1809,6 @@
 /* formerly Platform Tech */
 #define PCI_DEVICE_ID_ESS_ESS0100	0x0100
 
-#define PCI_VENDOR_ID_ALTEON		0x12ae
-
 #define PCI_SUBVENDOR_ID_CONNECT_TECH			0x12c4
 #define PCI_SUBDEVICE_ID_CONNECT_TECH_BH8_232		0x0001
 #define PCI_SUBDEVICE_ID_CONNECT_TECH_BH4_232		0x0002
diff --git a/drivers/net/ethernet/alteon/acenic.c b/drivers/net/ethernet/alteon/acenic.c
deleted file mode 100644
index 455ee8930824..000000000000
--- a/drivers/net/ethernet/alteon/acenic.c
+++ /dev/null
@@ -1,3178 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * acenic.c: Linux driver for the Alteon AceNIC Gigabit Ethernet card
- *           and other Tigon based cards.
- *
- * Copyright 1998-2002 by Jes Sorensen, <jes@trained-monkey.org>.
- *
- * Thanks to Alteon and 3Com for providing hardware and documentation
- * enabling me to write this driver.
- *
- * A mailing list for discussing the use of this driver has been
- * setup, please subscribe to the lists if you have any questions
- * about the driver. Send mail to linux-acenic-help@sunsite.auc.dk to
- * see how to subscribe.
- *
- * Additional credits:
- *   Pete Wyckoff <wyckoff@ca.sandia.gov>: Initial Linux/Alpha and trace
- *       dump support. The trace dump support has not been
- *       integrated yet however.
- *   Troy Benjegerdes: Big Endian (PPC) patches.
- *   Nate Stahl: Better out of memory handling and stats support.
- *   Aman Singla: Nasty race between interrupt handler and tx code dealing
- *                with 'testing the tx_ret_csm and setting tx_full'
- *   David S. Miller <davem@redhat.com>: conversion to new PCI dma mapping
- *                                       infrastructure and Sparc support
- *   Pierrick Pinasseau (CERN): For lending me an Ultra 5 to test the
- *                              driver under Linux/Sparc64
- *   Matt Domsch <Matt_Domsch@dell.com>: Detect Alteon 1000baseT cards
- *                                       ETHTOOL_GDRVINFO support
- *   Chip Salzenberg <chip@valinux.com>: Fix race condition between tx
- *                                       handler and close() cleanup.
- *   Ken Aaker <kdaaker@rchland.vnet.ibm.com>: Correct check for whether
- *                                       memory mapped IO is enabled to
- *                                       make the driver work on RS/6000.
- *   Takayoshi Kouchi <kouchi@hpc.bs1.fc.nec.co.jp>: Identifying problem
- *                                       where the driver would disable
- *                                       bus master mode if it had to disable
- *                                       write and invalidate.
- *   Stephen Hack <stephen_hack@hp.com>: Fixed ace_set_mac_addr for little
- *                                       endian systems.
- *   Val Henson <vhenson@esscom.com>:    Reset Jumbo skb producer and
- *                                       rx producer index when
- *                                       flushing the Jumbo ring.
- *   Hans Grobler <grobh@sun.ac.za>:     Memory leak fixes in the
- *                                       driver init path.
- *   Grant Grundler <grundler@cup.hp.com>: PCI write posting fixes.
- */
-
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/types.h>
-#include <linux/errno.h>
-#include <linux/ioport.h>
-#include <linux/pci.h>
-#include <linux/dma-mapping.h>
-#include <linux/kernel.h>
-#include <linux/netdevice.h>
-#include <linux/etherdevice.h>
-#include <linux/skbuff.h>
-#include <linux/delay.h>
-#include <linux/mm.h>
-#include <linux/highmem.h>
-#include <linux/sockios.h>
-#include <linux/firmware.h>
-#include <linux/slab.h>
-#include <linux/prefetch.h>
-#include <linux/if_vlan.h>
-
-#ifdef SIOCETHTOOL
-#include <linux/ethtool.h>
-#endif
-
-#include <net/sock.h>
-#include <net/ip.h>
-
-#include <asm/io.h>
-#include <asm/irq.h>
-#include <asm/byteorder.h>
-#include <linux/uaccess.h>
-
-
-#define DRV_NAME "acenic"
-
-#undef INDEX_DEBUG
-
-#ifdef CONFIG_ACENIC_OMIT_TIGON_I
-#define ACE_IS_TIGON_I(ap)	0
-#define ACE_TX_RING_ENTRIES(ap)	MAX_TX_RING_ENTRIES
-#else
-#define ACE_IS_TIGON_I(ap)	(ap->version == 1)
-#define ACE_TX_RING_ENTRIES(ap)	ap->tx_ring_entries
-#endif
-
-#ifndef PCI_VENDOR_ID_ALTEON
-#define PCI_VENDOR_ID_ALTEON		0x12ae
-#endif
-#ifndef PCI_DEVICE_ID_ALTEON_ACENIC_FIBRE
-#define PCI_DEVICE_ID_ALTEON_ACENIC_FIBRE  0x0001
-#define PCI_DEVICE_ID_ALTEON_ACENIC_COPPER 0x0002
-#endif
-#ifndef PCI_DEVICE_ID_3COM_3C985
-#define PCI_DEVICE_ID_3COM_3C985	0x0001
-#endif
-#ifndef PCI_VENDOR_ID_NETGEAR
-#define PCI_VENDOR_ID_NETGEAR		0x1385
-#define PCI_DEVICE_ID_NETGEAR_GA620	0x620a
-#endif
-#ifndef PCI_DEVICE_ID_NETGEAR_GA620T
-#define PCI_DEVICE_ID_NETGEAR_GA620T	0x630a
-#endif
-
-
-/*
- * Farallon used the DEC vendor ID by mistake and they seem not
- * to care - stinky!
- */
-#ifndef PCI_DEVICE_ID_FARALLON_PN9000SX
-#define PCI_DEVICE_ID_FARALLON_PN9000SX	0x1a
-#endif
-#ifndef PCI_DEVICE_ID_FARALLON_PN9100T
-#define PCI_DEVICE_ID_FARALLON_PN9100T  0xfa
-#endif
-#ifndef PCI_VENDOR_ID_SGI
-#define PCI_VENDOR_ID_SGI		0x10a9
-#endif
-#ifndef PCI_DEVICE_ID_SGI_ACENIC
-#define PCI_DEVICE_ID_SGI_ACENIC	0x0009
-#endif
-
-static const struct pci_device_id acenic_pci_tbl[] = {
-	{ PCI_VENDOR_ID_ALTEON, PCI_DEVICE_ID_ALTEON_ACENIC_FIBRE,
-	  PCI_ANY_ID, PCI_ANY_ID, PCI_CLASS_NETWORK_ETHERNET << 8, 0xffff00, },
-	{ PCI_VENDOR_ID_ALTEON, PCI_DEVICE_ID_ALTEON_ACENIC_COPPER,
-	  PCI_ANY_ID, PCI_ANY_ID, PCI_CLASS_NETWORK_ETHERNET << 8, 0xffff00, },
-	{ PCI_VENDOR_ID_3COM, PCI_DEVICE_ID_3COM_3C985,
-	  PCI_ANY_ID, PCI_ANY_ID, PCI_CLASS_NETWORK_ETHERNET << 8, 0xffff00, },
-	{ PCI_VENDOR_ID_NETGEAR, PCI_DEVICE_ID_NETGEAR_GA620,
-	  PCI_ANY_ID, PCI_ANY_ID, PCI_CLASS_NETWORK_ETHERNET << 8, 0xffff00, },
-	{ PCI_VENDOR_ID_NETGEAR, PCI_DEVICE_ID_NETGEAR_GA620T,
-	  PCI_ANY_ID, PCI_ANY_ID, PCI_CLASS_NETWORK_ETHERNET << 8, 0xffff00, },
-	/*
-	 * Farallon used the DEC vendor ID on their cards incorrectly,
-	 * then later Alteon's ID.
-	 */
-	{ PCI_VENDOR_ID_DEC, PCI_DEVICE_ID_FARALLON_PN9000SX,
-	  PCI_ANY_ID, PCI_ANY_ID, PCI_CLASS_NETWORK_ETHERNET << 8, 0xffff00, },
-	{ PCI_VENDOR_ID_ALTEON, PCI_DEVICE_ID_FARALLON_PN9100T,
-	  PCI_ANY_ID, PCI_ANY_ID, PCI_CLASS_NETWORK_ETHERNET << 8, 0xffff00, },
-	{ PCI_VENDOR_ID_SGI, PCI_DEVICE_ID_SGI_ACENIC,
-	  PCI_ANY_ID, PCI_ANY_ID, PCI_CLASS_NETWORK_ETHERNET << 8, 0xffff00, },
-	{ }
-};
-MODULE_DEVICE_TABLE(pci, acenic_pci_tbl);
-
-#define ace_sync_irq(irq)	synchronize_irq(irq)
-
-#ifndef offset_in_page
-#define offset_in_page(ptr)	((unsigned long)(ptr) & ~PAGE_MASK)
-#endif
-
-#define ACE_MAX_MOD_PARMS	8
-#define BOARD_IDX_STATIC	0
-#define BOARD_IDX_OVERFLOW	-1
-
-#include "acenic.h"
-
-/*
- * These must be defined before the firmware is included.
- */
-#define MAX_TEXT_LEN	96*1024
-#define MAX_RODATA_LEN	8*1024
-#define MAX_DATA_LEN	2*1024
-
-#ifndef tigon2FwReleaseLocal
-#define tigon2FwReleaseLocal 0
-#endif
-
-/*
- * This driver currently supports Tigon I and Tigon II based cards
- * including the Alteon AceNIC, the 3Com 3C985[B] and NetGear
- * GA620. The driver should also work on the SGI, DEC and Farallon
- * versions of the card, however I have not been able to test that
- * myself.
- *
- * This card is really neat, it supports receive hardware checksumming
- * and jumbo frames (up to 9000 bytes) and does a lot of work in the
- * firmware. Also the programming interface is quite neat, except for
- * the parts dealing with the i2c eeprom on the card ;-)
- *
- * Using jumbo frames:
- *
- * To enable jumbo frames, simply specify an mtu between 1500 and 9000
- * bytes to ifconfig. Jumbo frames can be enabled or disabled at any time
- * by running `ifconfig eth<X> mtu <MTU>' with <X> being the Ethernet
- * interface number and <MTU> being the MTU value.
- *
- * Module parameters:
- *
- * When compiled as a loadable module, the driver allows for a number
- * of module parameters to be specified. The driver supports the
- * following module parameters:
- *
- *  trace=<val> - Firmware trace level. This requires special traced
- *                firmware to replace the firmware supplied with
- *                the driver - for debugging purposes only.
- *
- *  link=<val>  - Link state. Normally you want to use the default link
- *                parameters set by the driver. This can be used to
- *                override these in case your switch doesn't negotiate
- *                the link properly. Valid values are:
- *         0x0001 - Force half duplex link.
- *         0x0002 - Do not negotiate line speed with the other end.
- *         0x0010 - 10Mbit/sec link.
- *         0x0020 - 100Mbit/sec link.
- *         0x0040 - 1000Mbit/sec link.
- *         0x0100 - Do not negotiate flow control.
- *         0x0200 - Enable RX flow control Y
- *         0x0400 - Enable TX flow control Y (Tigon II NICs only).
- *                Default value is 0x0270, ie. enable link+flow
- *                control negotiation. Negotiating the highest
- *                possible link speed with RX flow control enabled.
- *
- *                When disabling link speed negotiation, only one link
- *                speed is allowed to be specified!
- *
- *  tx_coal_tick=<val> - number of coalescing clock ticks (us) allowed
- *                to wait for more packets to arive before
- *                interrupting the host, from the time the first
- *                packet arrives.
- *
- *  rx_coal_tick=<val> - number of coalescing clock ticks (us) allowed
- *                to wait for more packets to arive in the transmit ring,
- *                before interrupting the host, after transmitting the
- *                first packet in the ring.
- *
- *  max_tx_desc=<val> - maximum number of transmit descriptors
- *                (packets) transmitted before interrupting the host.
- *
- *  max_rx_desc=<val> - maximum number of receive descriptors
- *                (packets) received before interrupting the host.
- *
- *  tx_ratio=<val> - 7 bit value (0 - 63) specifying the split in 64th
- *                increments of the NIC's on board memory to be used for
- *                transmit and receive buffers. For the 1MB NIC app. 800KB
- *                is available, on the 1/2MB NIC app. 300KB is available.
- *                68KB will always be available as a minimum for both
- *                directions. The default value is a 50/50 split.
- *  dis_pci_mem_inval=<val> - disable PCI memory write and invalidate
- *                operations, default (1) is to always disable this as
- *                that is what Alteon does on NT. I have not been able
- *                to measure any real performance differences with
- *                this on my systems. Set <val>=0 if you want to
- *                enable these operations.
- *
- * If you use more than one NIC, specify the parameters for the
- * individual NICs with a comma, ie. trace=0,0x00001fff,0 you want to
- * run tracing on NIC #2 but not on NIC #1 and #3.
- *
- * TODO:
- *
- * - Proper multicast support.
- * - NIC dump support.
- * - More tuning parameters.
- *
- * The mini ring is not used under Linux and I am not sure it makes sense
- * to actually use it.
- *
- * New interrupt handler strategy:
- *
- * The old interrupt handler worked using the traditional method of
- * replacing an skbuff with a new one when a packet arrives. However
- * the rx rings do not need to contain a static number of buffer
- * descriptors, thus it makes sense to move the memory allocation out
- * of the main interrupt handler and do it in a bottom half handler
- * and only allocate new buffers when the number of buffers in the
- * ring is below a certain threshold. In order to avoid starving the
- * NIC under heavy load it is however necessary to force allocation
- * when hitting a minimum threshold. The strategy for alloction is as
- * follows:
- *
- *     RX_LOW_BUF_THRES    - allocate buffers in the bottom half
- *     RX_PANIC_LOW_THRES  - we are very low on buffers, allocate
- *                           the buffers in the interrupt handler
- *     RX_RING_THRES       - maximum number of buffers in the rx ring
- *     RX_MINI_THRES       - maximum number of buffers in the mini ring
- *     RX_JUMBO_THRES      - maximum number of buffers in the jumbo ring
- *
- * One advantagous side effect of this allocation approach is that the
- * entire rx processing can be done without holding any spin lock
- * since the rx rings and registers are totally independent of the tx
- * ring and its registers.  This of course includes the kmalloc's of
- * new skb's. Thus start_xmit can run in parallel with rx processing
- * and the memory allocation on SMP systems.
- *
- * Note that running the skb reallocation in a bottom half opens up
- * another can of races which needs to be handled properly. In
- * particular it can happen that the interrupt handler tries to run
- * the reallocation while the bottom half is either running on another
- * CPU or was interrupted on the same CPU. To get around this the
- * driver uses bitops to prevent the reallocation routines from being
- * reentered.
- *
- * TX handling can also be done without holding any spin lock, wheee
- * this is fun! since tx_ret_csm is only written to by the interrupt
- * handler. The case to be aware of is when shutting down the device
- * and cleaning up where it is necessary to make sure that
- * start_xmit() is not running while this is happening. Well DaveM
- * informs me that this case is already protected against ... bye bye
- * Mr. Spin Lock, it was nice to know you.
- *
- * TX interrupts are now partly disabled so the NIC will only generate
- * TX interrupts for the number of coal ticks, not for the number of
- * TX packets in the queue. This should reduce the number of TX only,
- * ie. when no RX processing is done, interrupts seen.
- */
-
-/*
- * Threshold values for RX buffer allocation - the low water marks for
- * when to start refilling the rings are set to 75% of the ring
- * sizes. It seems to make sense to refill the rings entirely from the
- * intrrupt handler once it gets below the panic threshold, that way
- * we don't risk that the refilling is moved to another CPU when the
- * one running the interrupt handler just got the slab code hot in its
- * cache.
- */
-#define RX_RING_SIZE		72
-#define RX_MINI_SIZE		64
-#define RX_JUMBO_SIZE		48
-
-#define RX_PANIC_STD_THRES	16
-#define RX_PANIC_STD_REFILL	(3*RX_PANIC_STD_THRES)/2
-#define RX_LOW_STD_THRES	(3*RX_RING_SIZE)/4
-#define RX_PANIC_MINI_THRES	12
-#define RX_PANIC_MINI_REFILL	(3*RX_PANIC_MINI_THRES)/2
-#define RX_LOW_MINI_THRES	(3*RX_MINI_SIZE)/4
-#define RX_PANIC_JUMBO_THRES	6
-#define RX_PANIC_JUMBO_REFILL	(3*RX_PANIC_JUMBO_THRES)/2
-#define RX_LOW_JUMBO_THRES	(3*RX_JUMBO_SIZE)/4
-
-
-/*
- * Size of the mini ring entries, basically these just should be big
- * enough to take TCP ACKs
- */
-#define ACE_MINI_SIZE		100
-
-#define ACE_MINI_BUFSIZE	ACE_MINI_SIZE
-#define ACE_STD_BUFSIZE		(ACE_STD_MTU + ETH_HLEN + 4)
-#define ACE_JUMBO_BUFSIZE	(ACE_JUMBO_MTU + ETH_HLEN + 4)
-
-/*
- * There seems to be a magic difference in the effect between 995 and 996
- * but little difference between 900 and 995 ... no idea why.
- *
- * There is now a default set of tuning parameters which is set, depending
- * on whether or not the user enables Jumbo frames. It's assumed that if
- * Jumbo frames are enabled, the user wants optimal tuning for that case.
- */
-#define DEF_TX_COAL		400 /* 996 */
-#define DEF_TX_MAX_DESC		60  /* was 40 */
-#define DEF_RX_COAL		120 /* 1000 */
-#define DEF_RX_MAX_DESC		25
-#define DEF_TX_RATIO		21 /* 24 */
-
-#define DEF_JUMBO_TX_COAL	20
-#define DEF_JUMBO_TX_MAX_DESC	60
-#define DEF_JUMBO_RX_COAL	30
-#define DEF_JUMBO_RX_MAX_DESC	6
-#define DEF_JUMBO_TX_RATIO	21
-
-#if tigon2FwReleaseLocal < 20001118
-/*
- * Standard firmware and early modifications duplicate
- * IRQ load without this flag (coal timer is never reset).
- * Note that with this flag tx_coal should be less than
- * time to xmit full tx ring.
- * 400usec is not so bad for tx ring size of 128.
- */
-#define TX_COAL_INTS_ONLY	1	/* worth it */
-#else
-/*
- * With modified firmware, this is not necessary, but still useful.
- */
-#define TX_COAL_INTS_ONLY	1
-#endif
-
-#define DEF_TRACE		0
-#define DEF_STAT		(2 * TICKS_PER_SEC)
-
-
-static int link_state[ACE_MAX_MOD_PARMS];
-static int trace[ACE_MAX_MOD_PARMS];
-static int tx_coal_tick[ACE_MAX_MOD_PARMS];
-static int rx_coal_tick[ACE_MAX_MOD_PARMS];
-static int max_tx_desc[ACE_MAX_MOD_PARMS];
-static int max_rx_desc[ACE_MAX_MOD_PARMS];
-static int tx_ratio[ACE_MAX_MOD_PARMS];
-static int dis_pci_mem_inval[ACE_MAX_MOD_PARMS] = {1, 1, 1, 1, 1, 1, 1, 1};
-
-MODULE_AUTHOR("Jes Sorensen <jes@trained-monkey.org>");
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("AceNIC/3C985/GA620 Gigabit Ethernet driver");
-#ifndef CONFIG_ACENIC_OMIT_TIGON_I
-MODULE_FIRMWARE("acenic/tg1.bin");
-#endif
-MODULE_FIRMWARE("acenic/tg2.bin");
-
-module_param_array_named(link, link_state, int, NULL, 0);
-module_param_array(trace, int, NULL, 0);
-module_param_array(tx_coal_tick, int, NULL, 0);
-module_param_array(max_tx_desc, int, NULL, 0);
-module_param_array(rx_coal_tick, int, NULL, 0);
-module_param_array(max_rx_desc, int, NULL, 0);
-module_param_array(tx_ratio, int, NULL, 0);
-MODULE_PARM_DESC(link, "AceNIC/3C985/NetGear link state");
-MODULE_PARM_DESC(trace, "AceNIC/3C985/NetGear firmware trace level");
-MODULE_PARM_DESC(tx_coal_tick, "AceNIC/3C985/GA620 max clock ticks to wait from first tx descriptor arrives");
-MODULE_PARM_DESC(max_tx_desc, "AceNIC/3C985/GA620 max number of transmit descriptors to wait");
-MODULE_PARM_DESC(rx_coal_tick, "AceNIC/3C985/GA620 max clock ticks to wait from first rx descriptor arrives");
-MODULE_PARM_DESC(max_rx_desc, "AceNIC/3C985/GA620 max number of receive descriptors to wait");
-MODULE_PARM_DESC(tx_ratio, "AceNIC/3C985/GA620 ratio of NIC memory used for TX/RX descriptors (range 0-63)");
-
-
-static const char version[] =
-  "acenic.c: v0.92 08/05/2002  Jes Sorensen, linux-acenic@SunSITE.dk\n"
-  "                            http://home.cern.ch/~jes/gige/acenic.html\n";
-
-static int ace_get_link_ksettings(struct net_device *,
-				  struct ethtool_link_ksettings *);
-static int ace_set_link_ksettings(struct net_device *,
-				  const struct ethtool_link_ksettings *);
-static void ace_get_drvinfo(struct net_device *, struct ethtool_drvinfo *);
-
-static const struct ethtool_ops ace_ethtool_ops = {
-	.get_drvinfo = ace_get_drvinfo,
-	.get_link_ksettings = ace_get_link_ksettings,
-	.set_link_ksettings = ace_set_link_ksettings,
-};
-
-static void ace_watchdog(struct net_device *dev, unsigned int txqueue);
-
-static const struct net_device_ops ace_netdev_ops = {
-	.ndo_open		= ace_open,
-	.ndo_stop		= ace_close,
-	.ndo_tx_timeout		= ace_watchdog,
-	.ndo_get_stats		= ace_get_stats,
-	.ndo_start_xmit		= ace_start_xmit,
-	.ndo_set_rx_mode	= ace_set_multicast_list,
-	.ndo_validate_addr	= eth_validate_addr,
-	.ndo_set_mac_address	= ace_set_mac_addr,
-	.ndo_change_mtu		= ace_change_mtu,
-};
-
-static int acenic_probe_one(struct pci_dev *pdev,
-			    const struct pci_device_id *id)
-{
-	struct net_device *dev;
-	struct ace_private *ap;
-	static int boards_found;
-
-	dev = alloc_etherdev(sizeof(struct ace_private));
-	if (dev == NULL)
-		return -ENOMEM;
-
-	SET_NETDEV_DEV(dev, &pdev->dev);
-
-	ap = netdev_priv(dev);
-	ap->ndev = dev;
-	ap->pdev = pdev;
-	ap->name = pci_name(pdev);
-
-	dev->features |= NETIF_F_SG | NETIF_F_IP_CSUM;
-	dev->features |= NETIF_F_HW_VLAN_CTAG_TX | NETIF_F_HW_VLAN_CTAG_RX;
-
-	dev->watchdog_timeo = 5*HZ;
-	dev->min_mtu = 0;
-	dev->max_mtu = ACE_JUMBO_MTU;
-
-	dev->netdev_ops = &ace_netdev_ops;
-	dev->ethtool_ops = &ace_ethtool_ops;
-
-	/* we only display this string ONCE */
-	if (!boards_found)
-		printk(version);
-
-	if (pci_enable_device(pdev))
-		goto fail_free_netdev;
-
-	/*
-	 * Enable master mode before we start playing with the
-	 * pci_command word since pci_set_master() will modify
-	 * it.
-	 */
-	pci_set_master(pdev);
-
-	pci_read_config_word(pdev, PCI_COMMAND, &ap->pci_command);
-
-	/* OpenFirmware on Mac's does not set this - DOH.. */
-	if (!(ap->pci_command & PCI_COMMAND_MEMORY)) {
-		printk(KERN_INFO "%s: Enabling PCI Memory Mapped "
-		       "access - was not enabled by BIOS/Firmware\n",
-		       ap->name);
-		ap->pci_command = ap->pci_command | PCI_COMMAND_MEMORY;
-		pci_write_config_word(ap->pdev, PCI_COMMAND,
-				      ap->pci_command);
-		wmb();
-	}
-
-	pci_read_config_byte(pdev, PCI_LATENCY_TIMER, &ap->pci_latency);
-	if (ap->pci_latency <= 0x40) {
-		ap->pci_latency = 0x40;
-		pci_write_config_byte(pdev, PCI_LATENCY_TIMER, ap->pci_latency);
-	}
-
-	/*
-	 * Remap the regs into kernel space - this is abuse of
-	 * dev->base_addr since it was means for I/O port
-	 * addresses but who gives a damn.
-	 */
-	dev->base_addr = pci_resource_start(pdev, 0);
-	ap->regs = ioremap(dev->base_addr, 0x4000);
-	if (!ap->regs) {
-		printk(KERN_ERR "%s:  Unable to map I/O register, "
-		       "AceNIC %i will be disabled.\n",
-		       ap->name, boards_found);
-		goto fail_free_netdev;
-	}
-
-	switch(pdev->vendor) {
-	case PCI_VENDOR_ID_ALTEON:
-		if (pdev->device == PCI_DEVICE_ID_FARALLON_PN9100T) {
-			printk(KERN_INFO "%s: Farallon PN9100-T ",
-			       ap->name);
-		} else {
-			printk(KERN_INFO "%s: Alteon AceNIC ",
-			       ap->name);
-		}
-		break;
-	case PCI_VENDOR_ID_3COM:
-		printk(KERN_INFO "%s: 3Com 3C985 ", ap->name);
-		break;
-	case PCI_VENDOR_ID_NETGEAR:
-		printk(KERN_INFO "%s: NetGear GA620 ", ap->name);
-		break;
-	case PCI_VENDOR_ID_DEC:
-		if (pdev->device == PCI_DEVICE_ID_FARALLON_PN9000SX) {
-			printk(KERN_INFO "%s: Farallon PN9000-SX ",
-			       ap->name);
-			break;
-		}
-		fallthrough;
-	case PCI_VENDOR_ID_SGI:
-		printk(KERN_INFO "%s: SGI AceNIC ", ap->name);
-		break;
-	default:
-		printk(KERN_INFO "%s: Unknown AceNIC ", ap->name);
-		break;
-	}
-
-	printk("Gigabit Ethernet at 0x%08lx, ", dev->base_addr);
-	printk("irq %d\n", pdev->irq);
-
-#ifdef CONFIG_ACENIC_OMIT_TIGON_I
-	if ((readl(&ap->regs->HostCtrl) >> 28) == 4) {
-		printk(KERN_ERR "%s: Driver compiled without Tigon I"
-		       " support - NIC disabled\n", dev->name);
-		goto fail_uninit;
-	}
-#endif
-
-	if (ace_allocate_descriptors(dev))
-		goto fail_free_netdev;
-
-#ifdef MODULE
-	if (boards_found >= ACE_MAX_MOD_PARMS)
-		ap->board_idx = BOARD_IDX_OVERFLOW;
-	else
-		ap->board_idx = boards_found;
-#else
-	ap->board_idx = BOARD_IDX_STATIC;
-#endif
-
-	if (ace_init(dev))
-		goto fail_free_netdev;
-
-	if (register_netdev(dev)) {
-		printk(KERN_ERR "acenic: device registration failed\n");
-		goto fail_uninit;
-	}
-	ap->name = dev->name;
-
-	dev->features |= NETIF_F_HIGHDMA;
-
-	pci_set_drvdata(pdev, dev);
-
-	boards_found++;
-	return 0;
-
- fail_uninit:
-	ace_init_cleanup(dev);
- fail_free_netdev:
-	free_netdev(dev);
-	return -ENODEV;
-}
-
-static void acenic_remove_one(struct pci_dev *pdev)
-{
-	struct net_device *dev = pci_get_drvdata(pdev);
-	struct ace_private *ap = netdev_priv(dev);
-	struct ace_regs __iomem *regs = ap->regs;
-	short i;
-
-	unregister_netdev(dev);
-
-	writel(readl(&regs->CpuCtrl) | CPU_HALT, &regs->CpuCtrl);
-	if (ap->version >= 2)
-		writel(readl(&regs->CpuBCtrl) | CPU_HALT, &regs->CpuBCtrl);
-
-	/*
-	 * This clears any pending interrupts
-	 */
-	writel(1, &regs->Mb0Lo);
-	readl(&regs->CpuCtrl);	/* flush */
-
-	/*
-	 * Make sure no other CPUs are processing interrupts
-	 * on the card before the buffers are being released.
-	 * Otherwise one might experience some `interesting'
-	 * effects.
-	 *
-	 * Then release the RX buffers - jumbo buffers were
-	 * already released in ace_close().
-	 */
-	ace_sync_irq(dev->irq);
-
-	for (i = 0; i < RX_STD_RING_ENTRIES; i++) {
-		struct sk_buff *skb = ap->skb->rx_std_skbuff[i].skb;
-
-		if (skb) {
-			struct ring_info *ringp;
-			dma_addr_t mapping;
-
-			ringp = &ap->skb->rx_std_skbuff[i];
-			mapping = dma_unmap_addr(ringp, mapping);
-			dma_unmap_page(&ap->pdev->dev, mapping,
-				       ACE_STD_BUFSIZE, DMA_FROM_DEVICE);
-
-			ap->rx_std_ring[i].size = 0;
-			ap->skb->rx_std_skbuff[i].skb = NULL;
-			dev_kfree_skb(skb);
-		}
-	}
-
-	if (ap->version >= 2) {
-		for (i = 0; i < RX_MINI_RING_ENTRIES; i++) {
-			struct sk_buff *skb = ap->skb->rx_mini_skbuff[i].skb;
-
-			if (skb) {
-				struct ring_info *ringp;
-				dma_addr_t mapping;
-
-				ringp = &ap->skb->rx_mini_skbuff[i];
-				mapping = dma_unmap_addr(ringp,mapping);
-				dma_unmap_page(&ap->pdev->dev, mapping,
-					       ACE_MINI_BUFSIZE,
-					       DMA_FROM_DEVICE);
-
-				ap->rx_mini_ring[i].size = 0;
-				ap->skb->rx_mini_skbuff[i].skb = NULL;
-				dev_kfree_skb(skb);
-			}
-		}
-	}
-
-	for (i = 0; i < RX_JUMBO_RING_ENTRIES; i++) {
-		struct sk_buff *skb = ap->skb->rx_jumbo_skbuff[i].skb;
-		if (skb) {
-			struct ring_info *ringp;
-			dma_addr_t mapping;
-
-			ringp = &ap->skb->rx_jumbo_skbuff[i];
-			mapping = dma_unmap_addr(ringp, mapping);
-			dma_unmap_page(&ap->pdev->dev, mapping,
-				       ACE_JUMBO_BUFSIZE, DMA_FROM_DEVICE);
-
-			ap->rx_jumbo_ring[i].size = 0;
-			ap->skb->rx_jumbo_skbuff[i].skb = NULL;
-			dev_kfree_skb(skb);
-		}
-	}
-
-	ace_init_cleanup(dev);
-	free_netdev(dev);
-}
-
-static struct pci_driver acenic_pci_driver = {
-	.name		= "acenic",
-	.id_table	= acenic_pci_tbl,
-	.probe		= acenic_probe_one,
-	.remove		= acenic_remove_one,
-};
-
-static void ace_free_descriptors(struct net_device *dev)
-{
-	struct ace_private *ap = netdev_priv(dev);
-	int size;
-
-	if (ap->rx_std_ring != NULL) {
-		size = (sizeof(struct rx_desc) *
-			(RX_STD_RING_ENTRIES +
-			 RX_JUMBO_RING_ENTRIES +
-			 RX_MINI_RING_ENTRIES +
-			 RX_RETURN_RING_ENTRIES));
-		dma_free_coherent(&ap->pdev->dev, size, ap->rx_std_ring,
-				  ap->rx_ring_base_dma);
-		ap->rx_std_ring = NULL;
-		ap->rx_jumbo_ring = NULL;
-		ap->rx_mini_ring = NULL;
-		ap->rx_return_ring = NULL;
-	}
-	if (ap->evt_ring != NULL) {
-		size = (sizeof(struct event) * EVT_RING_ENTRIES);
-		dma_free_coherent(&ap->pdev->dev, size, ap->evt_ring,
-				  ap->evt_ring_dma);
-		ap->evt_ring = NULL;
-	}
-	if (ap->tx_ring != NULL && !ACE_IS_TIGON_I(ap)) {
-		size = (sizeof(struct tx_desc) * MAX_TX_RING_ENTRIES);
-		dma_free_coherent(&ap->pdev->dev, size, ap->tx_ring,
-				  ap->tx_ring_dma);
-	}
-	ap->tx_ring = NULL;
-
-	if (ap->evt_prd != NULL) {
-		dma_free_coherent(&ap->pdev->dev, sizeof(u32),
-				  (void *)ap->evt_prd, ap->evt_prd_dma);
-		ap->evt_prd = NULL;
-	}
-	if (ap->rx_ret_prd != NULL) {
-		dma_free_coherent(&ap->pdev->dev, sizeof(u32),
-				  (void *)ap->rx_ret_prd, ap->rx_ret_prd_dma);
-		ap->rx_ret_prd = NULL;
-	}
-	if (ap->tx_csm != NULL) {
-		dma_free_coherent(&ap->pdev->dev, sizeof(u32),
-				  (void *)ap->tx_csm, ap->tx_csm_dma);
-		ap->tx_csm = NULL;
-	}
-}
-
-
-static int ace_allocate_descriptors(struct net_device *dev)
-{
-	struct ace_private *ap = netdev_priv(dev);
-	int size;
-
-	size = (sizeof(struct rx_desc) *
-		(RX_STD_RING_ENTRIES +
-		 RX_JUMBO_RING_ENTRIES +
-		 RX_MINI_RING_ENTRIES +
-		 RX_RETURN_RING_ENTRIES));
-
-	ap->rx_std_ring = dma_alloc_coherent(&ap->pdev->dev, size,
-					     &ap->rx_ring_base_dma, GFP_KERNEL);
-	if (ap->rx_std_ring == NULL)
-		goto fail;
-
-	ap->rx_jumbo_ring = ap->rx_std_ring + RX_STD_RING_ENTRIES;
-	ap->rx_mini_ring = ap->rx_jumbo_ring + RX_JUMBO_RING_ENTRIES;
-	ap->rx_return_ring = ap->rx_mini_ring + RX_MINI_RING_ENTRIES;
-
-	size = (sizeof(struct event) * EVT_RING_ENTRIES);
-
-	ap->evt_ring = dma_alloc_coherent(&ap->pdev->dev, size,
-					  &ap->evt_ring_dma, GFP_KERNEL);
-
-	if (ap->evt_ring == NULL)
-		goto fail;
-
-	/*
-	 * Only allocate a host TX ring for the Tigon II, the Tigon I
-	 * has to use PCI registers for this ;-(
-	 */
-	if (!ACE_IS_TIGON_I(ap)) {
-		size = (sizeof(struct tx_desc) * MAX_TX_RING_ENTRIES);
-
-		ap->tx_ring = dma_alloc_coherent(&ap->pdev->dev, size,
-						 &ap->tx_ring_dma, GFP_KERNEL);
-
-		if (ap->tx_ring == NULL)
-			goto fail;
-	}
-
-	ap->evt_prd = dma_alloc_coherent(&ap->pdev->dev, sizeof(u32),
-					 &ap->evt_prd_dma, GFP_KERNEL);
-	if (ap->evt_prd == NULL)
-		goto fail;
-
-	ap->rx_ret_prd = dma_alloc_coherent(&ap->pdev->dev, sizeof(u32),
-					    &ap->rx_ret_prd_dma, GFP_KERNEL);
-	if (ap->rx_ret_prd == NULL)
-		goto fail;
-
-	ap->tx_csm = dma_alloc_coherent(&ap->pdev->dev, sizeof(u32),
-					&ap->tx_csm_dma, GFP_KERNEL);
-	if (ap->tx_csm == NULL)
-		goto fail;
-
-	return 0;
-
-fail:
-	/* Clean up. */
-	ace_init_cleanup(dev);
-	return 1;
-}
-
-
-/*
- * Generic cleanup handling data allocated during init. Used when the
- * module is unloaded or if an error occurs during initialization
- */
-static void ace_init_cleanup(struct net_device *dev)
-{
-	struct ace_private *ap;
-
-	ap = netdev_priv(dev);
-
-	ace_free_descriptors(dev);
-
-	if (ap->info)
-		dma_free_coherent(&ap->pdev->dev, sizeof(struct ace_info),
-				  ap->info, ap->info_dma);
-	kfree(ap->skb);
-	kfree(ap->trace_buf);
-
-	if (dev->irq)
-		free_irq(dev->irq, dev);
-
-	iounmap(ap->regs);
-}
-
-
-/*
- * Commands are considered to be slow.
- */
-static inline void ace_issue_cmd(struct ace_regs __iomem *regs, struct cmd *cmd)
-{
-	u32 idx;
-
-	idx = readl(&regs->CmdPrd);
-
-	writel(*(u32 *)(cmd), &regs->CmdRng[idx]);
-	idx = (idx + 1) % CMD_RING_ENTRIES;
-
-	writel(idx, &regs->CmdPrd);
-}
-
-
-static int ace_init(struct net_device *dev)
-{
-	struct ace_private *ap;
-	struct ace_regs __iomem *regs;
-	struct ace_info *info = NULL;
-	struct pci_dev *pdev;
-	unsigned long myjif;
-	u64 tmp_ptr;
-	u32 tig_ver, mac1, mac2, tmp, pci_state;
-	int board_idx, ecode = 0;
-	short i;
-	unsigned char cache_size;
-	u8 addr[ETH_ALEN];
-
-	ap = netdev_priv(dev);
-	regs = ap->regs;
-
-	board_idx = ap->board_idx;
-
-	/*
-	 * aman@sgi.com - its useful to do a NIC reset here to
-	 * address the `Firmware not running' problem subsequent
-	 * to any crashes involving the NIC
-	 */
-	writel(HW_RESET | (HW_RESET << 24), &regs->HostCtrl);
-	readl(&regs->HostCtrl);		/* PCI write posting */
-	udelay(5);
-
-	/*
-	 * Don't access any other registers before this point!
-	 */
-#ifdef __BIG_ENDIAN
-	/*
-	 * This will most likely need BYTE_SWAP once we switch
-	 * to using __raw_writel()
-	 */
-	writel((WORD_SWAP | CLR_INT | ((WORD_SWAP | CLR_INT) << 24)),
-	       &regs->HostCtrl);
-#else
-	writel((CLR_INT | WORD_SWAP | ((CLR_INT | WORD_SWAP) << 24)),
-	       &regs->HostCtrl);
-#endif
-	readl(&regs->HostCtrl);		/* PCI write posting */
-
-	/*
-	 * Stop the NIC CPU and clear pending interrupts
-	 */
-	writel(readl(&regs->CpuCtrl) | CPU_HALT, &regs->CpuCtrl);
-	readl(&regs->CpuCtrl);		/* PCI write posting */
-	writel(0, &regs->Mb0Lo);
-
-	tig_ver = readl(&regs->HostCtrl) >> 28;
-
-	switch(tig_ver){
-#ifndef CONFIG_ACENIC_OMIT_TIGON_I
-	case 4:
-	case 5:
-		printk(KERN_INFO "  Tigon I  (Rev. %i), Firmware: %i.%i.%i, ",
-		       tig_ver, ap->firmware_major, ap->firmware_minor,
-		       ap->firmware_fix);
-		writel(0, &regs->LocalCtrl);
-		ap->version = 1;
-		ap->tx_ring_entries = TIGON_I_TX_RING_ENTRIES;
-		break;
-#endif
-	case 6:
-		printk(KERN_INFO "  Tigon II (Rev. %i), Firmware: %i.%i.%i, ",
-		       tig_ver, ap->firmware_major, ap->firmware_minor,
-		       ap->firmware_fix);
-		writel(readl(&regs->CpuBCtrl) | CPU_HALT, &regs->CpuBCtrl);
-		readl(&regs->CpuBCtrl);		/* PCI write posting */
-		/*
-		 * The SRAM bank size does _not_ indicate the amount
-		 * of memory on the card, it controls the _bank_ size!
-		 * Ie. a 1MB AceNIC will have two banks of 512KB.
-		 */
-		writel(SRAM_BANK_512K, &regs->LocalCtrl);
-		writel(SYNC_SRAM_TIMING, &regs->MiscCfg);
-		ap->version = 2;
-		ap->tx_ring_entries = MAX_TX_RING_ENTRIES;
-		break;
-	default:
-		printk(KERN_WARNING "  Unsupported Tigon version detected "
-		       "(%i)\n", tig_ver);
-		ecode = -ENODEV;
-		goto init_error;
-	}
-
-	/*
-	 * ModeStat _must_ be set after the SRAM settings as this change
-	 * seems to corrupt the ModeStat and possible other registers.
-	 * The SRAM settings survive resets and setting it to the same
-	 * value a second time works as well. This is what caused the
-	 * `Firmware not running' problem on the Tigon II.
-	 */
-#ifdef __BIG_ENDIAN
-	writel(ACE_BYTE_SWAP_DMA | ACE_WARN | ACE_FATAL | ACE_BYTE_SWAP_BD |
-	       ACE_WORD_SWAP_BD | ACE_NO_JUMBO_FRAG, &regs->ModeStat);
-#else
-	writel(ACE_BYTE_SWAP_DMA | ACE_WARN | ACE_FATAL |
-	       ACE_WORD_SWAP_BD | ACE_NO_JUMBO_FRAG, &regs->ModeStat);
-#endif
-	readl(&regs->ModeStat);		/* PCI write posting */
-
-	mac1 = 0;
-	for(i = 0; i < 4; i++) {
-		int t;
-
-		mac1 = mac1 << 8;
-		t = read_eeprom_byte(dev, 0x8c+i);
-		if (t < 0) {
-			ecode = -EIO;
-			goto init_error;
-		} else
-			mac1 |= (t & 0xff);
-	}
-	mac2 = 0;
-	for(i = 4; i < 8; i++) {
-		int t;
-
-		mac2 = mac2 << 8;
-		t = read_eeprom_byte(dev, 0x8c+i);
-		if (t < 0) {
-			ecode = -EIO;
-			goto init_error;
-		} else
-			mac2 |= (t & 0xff);
-	}
-
-	writel(mac1, &regs->MacAddrHi);
-	writel(mac2, &regs->MacAddrLo);
-
-	addr[0] = (mac1 >> 8) & 0xff;
-	addr[1] = mac1 & 0xff;
-	addr[2] = (mac2 >> 24) & 0xff;
-	addr[3] = (mac2 >> 16) & 0xff;
-	addr[4] = (mac2 >> 8) & 0xff;
-	addr[5] = mac2 & 0xff;
-	eth_hw_addr_set(dev, addr);
-
-	printk("MAC: %pM\n", dev->dev_addr);
-
-	/*
-	 * Looks like this is necessary to deal with on all architectures,
-	 * even this %$#%$# N440BX Intel based thing doesn't get it right.
-	 * Ie. having two NICs in the machine, one will have the cache
-	 * line set at boot time, the other will not.
-	 */
-	pdev = ap->pdev;
-	pci_read_config_byte(pdev, PCI_CACHE_LINE_SIZE, &cache_size);
-	cache_size <<= 2;
-	if (cache_size != SMP_CACHE_BYTES) {
-		printk(KERN_INFO "  PCI cache line size set incorrectly "
-		       "(%i bytes) by BIOS/FW, ", cache_size);
-		if (cache_size > SMP_CACHE_BYTES)
-			printk("expecting %i\n", SMP_CACHE_BYTES);
-		else {
-			printk("correcting to %i\n", SMP_CACHE_BYTES);
-			pci_write_config_byte(pdev, PCI_CACHE_LINE_SIZE,
-					      SMP_CACHE_BYTES >> 2);
-		}
-	}
-
-	pci_state = readl(&regs->PciState);
-	printk(KERN_INFO "  PCI bus width: %i bits, speed: %iMHz, "
-	       "latency: %i clks\n",
-	       	(pci_state & PCI_32BIT) ? 32 : 64,
-		(pci_state & PCI_66MHZ) ? 66 : 33,
-		ap->pci_latency);
-
-	/*
-	 * Set the max DMA transfer size. Seems that for most systems
-	 * the performance is better when no MAX parameter is
-	 * set. However for systems enabling PCI write and invalidate,
-	 * DMA writes must be set to the L1 cache line size to get
-	 * optimal performance.
-	 *
-	 * The default is now to turn the PCI write and invalidate off
-	 * - that is what Alteon does for NT.
-	 */
-	tmp = READ_CMD_MEM | WRITE_CMD_MEM;
-	if (ap->version >= 2) {
-		tmp |= (MEM_READ_MULTIPLE | (pci_state & PCI_66MHZ));
-		/*
-		 * Tuning parameters only supported for 8 cards
-		 */
-		if (board_idx == BOARD_IDX_OVERFLOW ||
-		    dis_pci_mem_inval[board_idx]) {
-			if (ap->pci_command & PCI_COMMAND_INVALIDATE) {
-				ap->pci_command &= ~PCI_COMMAND_INVALIDATE;
-				pci_write_config_word(pdev, PCI_COMMAND,
-						      ap->pci_command);
-				printk(KERN_INFO "  Disabling PCI memory "
-				       "write and invalidate\n");
-			}
-		} else if (ap->pci_command & PCI_COMMAND_INVALIDATE) {
-			printk(KERN_INFO "  PCI memory write & invalidate "
-			       "enabled by BIOS, enabling counter measures\n");
-
-			switch(SMP_CACHE_BYTES) {
-			case 16:
-				tmp |= DMA_WRITE_MAX_16;
-				break;
-			case 32:
-				tmp |= DMA_WRITE_MAX_32;
-				break;
-			case 64:
-				tmp |= DMA_WRITE_MAX_64;
-				break;
-			case 128:
-				tmp |= DMA_WRITE_MAX_128;
-				break;
-			default:
-				printk(KERN_INFO "  Cache line size %i not "
-				       "supported, PCI write and invalidate "
-				       "disabled\n", SMP_CACHE_BYTES);
-				ap->pci_command &= ~PCI_COMMAND_INVALIDATE;
-				pci_write_config_word(pdev, PCI_COMMAND,
-						      ap->pci_command);
-			}
-		}
-	}
-
-#ifdef __sparc__
-	/*
-	 * On this platform, we know what the best dma settings
-	 * are.  We use 64-byte maximum bursts, because if we
-	 * burst larger than the cache line size (or even cross
-	 * a 64byte boundary in a single burst) the UltraSparc
-	 * PCI controller will disconnect at 64-byte multiples.
-	 *
-	 * Read-multiple will be properly enabled above, and when
-	 * set will give the PCI controller proper hints about
-	 * prefetching.
-	 */
-	tmp &= ~DMA_READ_WRITE_MASK;
-	tmp |= DMA_READ_MAX_64;
-	tmp |= DMA_WRITE_MAX_64;
-#endif
-#ifdef __alpha__
-	tmp &= ~DMA_READ_WRITE_MASK;
-	tmp |= DMA_READ_MAX_128;
-	/*
-	 * All the docs say MUST NOT. Well, I did.
-	 * Nothing terrible happens, if we load wrong size.
-	 * Bit w&i still works better!
-	 */
-	tmp |= DMA_WRITE_MAX_128;
-#endif
-	writel(tmp, &regs->PciState);
-
-#if 0
-	/*
-	 * The Host PCI bus controller driver has to set FBB.
-	 * If all devices on that PCI bus support FBB, then the controller
-	 * can enable FBB support in the Host PCI Bus controller (or on
-	 * the PCI-PCI bridge if that applies).
-	 * -ggg
-	 */
-	/*
-	 * I have received reports from people having problems when this
-	 * bit is enabled.
-	 */
-	if (!(ap->pci_command & PCI_COMMAND_FAST_BACK)) {
-		printk(KERN_INFO "  Enabling PCI Fast Back to Back\n");
-		ap->pci_command |= PCI_COMMAND_FAST_BACK;
-		pci_write_config_word(pdev, PCI_COMMAND, ap->pci_command);
-	}
-#endif
-
-	/*
-	 * Configure DMA attributes.
-	 */
-	if (dma_set_mask(&pdev->dev, DMA_BIT_MASK(64))) {
-		ecode = -ENODEV;
-		goto init_error;
-	}
-
-	/*
-	 * Initialize the generic info block and the command+event rings
-	 * and the control blocks for the transmit and receive rings
-	 * as they need to be setup once and for all.
-	 */
-	if (!(info = dma_alloc_coherent(&ap->pdev->dev, sizeof(struct ace_info),
-					&ap->info_dma, GFP_KERNEL))) {
-		ecode = -EAGAIN;
-		goto init_error;
-	}
-	ap->info = info;
-
-	/*
-	 * Get the memory for the skb rings.
-	 */
-	if (!(ap->skb = kzalloc_obj(struct ace_skb))) {
-		ecode = -EAGAIN;
-		goto init_error;
-	}
-
-	ecode = request_irq(pdev->irq, ace_interrupt, IRQF_SHARED,
-			    DRV_NAME, dev);
-	if (ecode) {
-		printk(KERN_WARNING "%s: Requested IRQ %d is busy\n",
-		       DRV_NAME, pdev->irq);
-		goto init_error;
-	} else
-		dev->irq = pdev->irq;
-
-#ifdef INDEX_DEBUG
-	spin_lock_init(&ap->debug_lock);
-	ap->last_tx = ACE_TX_RING_ENTRIES(ap) - 1;
-	ap->last_std_rx = 0;
-	ap->last_mini_rx = 0;
-#endif
-
-	ecode = ace_load_firmware(dev);
-	if (ecode)
-		goto init_error;
-
-	ap->fw_running = 0;
-
-	tmp_ptr = ap->info_dma;
-	writel(tmp_ptr >> 32, &regs->InfoPtrHi);
-	writel(tmp_ptr & 0xffffffff, &regs->InfoPtrLo);
-
-	memset(ap->evt_ring, 0, EVT_RING_ENTRIES * sizeof(struct event));
-
-	set_aceaddr(&info->evt_ctrl.rngptr, ap->evt_ring_dma);
-	info->evt_ctrl.flags = 0;
-
-	*(ap->evt_prd) = 0;
-	wmb();
-	set_aceaddr(&info->evt_prd_ptr, ap->evt_prd_dma);
-	writel(0, &regs->EvtCsm);
-
-	set_aceaddr(&info->cmd_ctrl.rngptr, 0x100);
-	info->cmd_ctrl.flags = 0;
-	info->cmd_ctrl.max_len = 0;
-
-	for (i = 0; i < CMD_RING_ENTRIES; i++)
-		writel(0, &regs->CmdRng[i]);
-
-	writel(0, &regs->CmdPrd);
-	writel(0, &regs->CmdCsm);
-
-	tmp_ptr = ap->info_dma;
-	tmp_ptr += (unsigned long) &(((struct ace_info *)0)->s.stats);
-	set_aceaddr(&info->stats2_ptr, (dma_addr_t) tmp_ptr);
-
-	set_aceaddr(&info->rx_std_ctrl.rngptr, ap->rx_ring_base_dma);
-	info->rx_std_ctrl.max_len = ACE_STD_BUFSIZE;
-	info->rx_std_ctrl.flags =
-	  RCB_FLG_TCP_UDP_SUM | RCB_FLG_NO_PSEUDO_HDR | RCB_FLG_VLAN_ASSIST;
-
-	memset(ap->rx_std_ring, 0,
-	       RX_STD_RING_ENTRIES * sizeof(struct rx_desc));
-
-	for (i = 0; i < RX_STD_RING_ENTRIES; i++)
-		ap->rx_std_ring[i].flags = BD_FLG_TCP_UDP_SUM;
-
-	ap->rx_std_skbprd = 0;
-	atomic_set(&ap->cur_rx_bufs, 0);
-
-	set_aceaddr(&info->rx_jumbo_ctrl.rngptr,
-		    (ap->rx_ring_base_dma +
-		     (sizeof(struct rx_desc) * RX_STD_RING_ENTRIES)));
-	info->rx_jumbo_ctrl.max_len = 0;
-	info->rx_jumbo_ctrl.flags =
-	  RCB_FLG_TCP_UDP_SUM | RCB_FLG_NO_PSEUDO_HDR | RCB_FLG_VLAN_ASSIST;
-
-	memset(ap->rx_jumbo_ring, 0,
-	       RX_JUMBO_RING_ENTRIES * sizeof(struct rx_desc));
-
-	for (i = 0; i < RX_JUMBO_RING_ENTRIES; i++)
-		ap->rx_jumbo_ring[i].flags = BD_FLG_TCP_UDP_SUM | BD_FLG_JUMBO;
-
-	ap->rx_jumbo_skbprd = 0;
-	atomic_set(&ap->cur_jumbo_bufs, 0);
-
-	memset(ap->rx_mini_ring, 0,
-	       RX_MINI_RING_ENTRIES * sizeof(struct rx_desc));
-
-	if (ap->version >= 2) {
-		set_aceaddr(&info->rx_mini_ctrl.rngptr,
-			    (ap->rx_ring_base_dma +
-			     (sizeof(struct rx_desc) *
-			      (RX_STD_RING_ENTRIES +
-			       RX_JUMBO_RING_ENTRIES))));
-		info->rx_mini_ctrl.max_len = ACE_MINI_SIZE;
-		info->rx_mini_ctrl.flags =
-		  RCB_FLG_TCP_UDP_SUM|RCB_FLG_NO_PSEUDO_HDR|RCB_FLG_VLAN_ASSIST;
-
-		for (i = 0; i < RX_MINI_RING_ENTRIES; i++)
-			ap->rx_mini_ring[i].flags =
-				BD_FLG_TCP_UDP_SUM | BD_FLG_MINI;
-	} else {
-		set_aceaddr(&info->rx_mini_ctrl.rngptr, 0);
-		info->rx_mini_ctrl.flags = RCB_FLG_RNG_DISABLE;
-		info->rx_mini_ctrl.max_len = 0;
-	}
-
-	ap->rx_mini_skbprd = 0;
-	atomic_set(&ap->cur_mini_bufs, 0);
-
-	set_aceaddr(&info->rx_return_ctrl.rngptr,
-		    (ap->rx_ring_base_dma +
-		     (sizeof(struct rx_desc) *
-		      (RX_STD_RING_ENTRIES +
-		       RX_JUMBO_RING_ENTRIES +
-		       RX_MINI_RING_ENTRIES))));
-	info->rx_return_ctrl.flags = 0;
-	info->rx_return_ctrl.max_len = RX_RETURN_RING_ENTRIES;
-
-	memset(ap->rx_return_ring, 0,
-	       RX_RETURN_RING_ENTRIES * sizeof(struct rx_desc));
-
-	set_aceaddr(&info->rx_ret_prd_ptr, ap->rx_ret_prd_dma);
-	*(ap->rx_ret_prd) = 0;
-
-	writel(TX_RING_BASE, &regs->WinBase);
-
-	if (ACE_IS_TIGON_I(ap)) {
-		ap->tx_ring = (__force struct tx_desc *) regs->Window;
-		for (i = 0; i < (TIGON_I_TX_RING_ENTRIES
-				 * sizeof(struct tx_desc)) / sizeof(u32); i++)
-			writel(0, (__force void __iomem *)ap->tx_ring  + i * 4);
-
-		set_aceaddr(&info->tx_ctrl.rngptr, TX_RING_BASE);
-	} else {
-		memset(ap->tx_ring, 0,
-		       MAX_TX_RING_ENTRIES * sizeof(struct tx_desc));
-
-		set_aceaddr(&info->tx_ctrl.rngptr, ap->tx_ring_dma);
-	}
-
-	info->tx_ctrl.max_len = ACE_TX_RING_ENTRIES(ap);
-	tmp = RCB_FLG_TCP_UDP_SUM | RCB_FLG_NO_PSEUDO_HDR | RCB_FLG_VLAN_ASSIST;
-
-	/*
-	 * The Tigon I does not like having the TX ring in host memory ;-(
-	 */
-	if (!ACE_IS_TIGON_I(ap))
-		tmp |= RCB_FLG_TX_HOST_RING;
-#if TX_COAL_INTS_ONLY
-	tmp |= RCB_FLG_COAL_INT_ONLY;
-#endif
-	info->tx_ctrl.flags = tmp;
-
-	set_aceaddr(&info->tx_csm_ptr, ap->tx_csm_dma);
-
-	/*
-	 * Potential item for tuning parameter
-	 */
-#if 0 /* NO */
-	writel(DMA_THRESH_16W, &regs->DmaReadCfg);
-	writel(DMA_THRESH_16W, &regs->DmaWriteCfg);
-#else
-	writel(DMA_THRESH_8W, &regs->DmaReadCfg);
-	writel(DMA_THRESH_8W, &regs->DmaWriteCfg);
-#endif
-
-	writel(0, &regs->MaskInt);
-	writel(1, &regs->IfIdx);
-#if 0
-	/*
-	 * McKinley boxes do not like us fiddling with AssistState
-	 * this early
-	 */
-	writel(1, &regs->AssistState);
-#endif
-
-	writel(DEF_STAT, &regs->TuneStatTicks);
-	writel(DEF_TRACE, &regs->TuneTrace);
-
-	ace_set_rxtx_parms(dev, 0);
-
-	if (board_idx == BOARD_IDX_OVERFLOW) {
-		printk(KERN_WARNING "%s: more than %i NICs detected, "
-		       "ignoring module parameters!\n",
-		       ap->name, ACE_MAX_MOD_PARMS);
-	} else if (board_idx >= 0) {
-		if (tx_coal_tick[board_idx])
-			writel(tx_coal_tick[board_idx],
-			       &regs->TuneTxCoalTicks);
-		if (max_tx_desc[board_idx])
-			writel(max_tx_desc[board_idx], &regs->TuneMaxTxDesc);
-
-		if (rx_coal_tick[board_idx])
-			writel(rx_coal_tick[board_idx],
-			       &regs->TuneRxCoalTicks);
-		if (max_rx_desc[board_idx])
-			writel(max_rx_desc[board_idx], &regs->TuneMaxRxDesc);
-
-		if (trace[board_idx])
-			writel(trace[board_idx], &regs->TuneTrace);
-
-		if ((tx_ratio[board_idx] > 0) && (tx_ratio[board_idx] < 64))
-			writel(tx_ratio[board_idx], &regs->TxBufRat);
-	}
-
-	/*
-	 * Default link parameters
-	 */
-	tmp = LNK_ENABLE | LNK_FULL_DUPLEX | LNK_1000MB | LNK_100MB |
-		LNK_10MB | LNK_RX_FLOW_CTL_Y | LNK_NEG_FCTL | LNK_NEGOTIATE;
-	if(ap->version >= 2)
-		tmp |= LNK_TX_FLOW_CTL_Y;
-
-	/*
-	 * Override link default parameters
-	 */
-	if ((board_idx >= 0) && link_state[board_idx]) {
-		int option = link_state[board_idx];
-
-		tmp = LNK_ENABLE;
-
-		if (option & 0x01) {
-			printk(KERN_INFO "%s: Setting half duplex link\n",
-			       ap->name);
-			tmp &= ~LNK_FULL_DUPLEX;
-		}
-		if (option & 0x02)
-			tmp &= ~LNK_NEGOTIATE;
-		if (option & 0x10)
-			tmp |= LNK_10MB;
-		if (option & 0x20)
-			tmp |= LNK_100MB;
-		if (option & 0x40)
-			tmp |= LNK_1000MB;
-		if ((option & 0x70) == 0) {
-			printk(KERN_WARNING "%s: No media speed specified, "
-			       "forcing auto negotiation\n", ap->name);
-			tmp |= LNK_NEGOTIATE | LNK_1000MB |
-				LNK_100MB | LNK_10MB;
-		}
-		if ((option & 0x100) == 0)
-			tmp |= LNK_NEG_FCTL;
-		else
-			printk(KERN_INFO "%s: Disabling flow control "
-			       "negotiation\n", ap->name);
-		if (option & 0x200)
-			tmp |= LNK_RX_FLOW_CTL_Y;
-		if ((option & 0x400) && (ap->version >= 2)) {
-			printk(KERN_INFO "%s: Enabling TX flow control\n",
-			       ap->name);
-			tmp |= LNK_TX_FLOW_CTL_Y;
-		}
-	}
-
-	ap->link = tmp;
-	writel(tmp, &regs->TuneLink);
-	if (ap->version >= 2)
-		writel(tmp, &regs->TuneFastLink);
-
-	writel(ap->firmware_start, &regs->Pc);
-
-	writel(0, &regs->Mb0Lo);
-
-	/*
-	 * Set tx_csm before we start receiving interrupts, otherwise
-	 * the interrupt handler might think it is supposed to process
-	 * tx ints before we are up and running, which may cause a null
-	 * pointer access in the int handler.
-	 */
-	ap->cur_rx = 0;
-	ap->tx_prd = *(ap->tx_csm) = ap->tx_ret_csm = 0;
-
-	wmb();
-	ace_set_txprd(regs, ap, 0);
-	writel(0, &regs->RxRetCsm);
-
-	/*
-	 * Enable DMA engine now.
-	 * If we do this sooner, Mckinley box pukes.
-	 * I assume it's because Tigon II DMA engine wants to check
-	 * *something* even before the CPU is started.
-	 */
-	writel(1, &regs->AssistState);  /* enable DMA */
-
-	/*
-	 * Start the NIC CPU
-	 */
-	writel(readl(&regs->CpuCtrl) & ~(CPU_HALT|CPU_TRACE), &regs->CpuCtrl);
-	readl(&regs->CpuCtrl);
-
-	/*
-	 * Wait for the firmware to spin up - max 3 seconds.
-	 */
-	myjif = jiffies + 3 * HZ;
-	while (time_before(jiffies, myjif) && !ap->fw_running)
-		cpu_relax();
-
-	if (!ap->fw_running) {
-		printk(KERN_ERR "%s: Firmware NOT running!\n", ap->name);
-
-		ace_dump_trace(ap);
-		writel(readl(&regs->CpuCtrl) | CPU_HALT, &regs->CpuCtrl);
-		readl(&regs->CpuCtrl);
-
-		/* aman@sgi.com - account for badly behaving firmware/NIC:
-		 * - have observed that the NIC may continue to generate
-		 *   interrupts for some reason; attempt to stop it - halt
-		 *   second CPU for Tigon II cards, and also clear Mb0
-		 * - if we're a module, we'll fail to load if this was
-		 *   the only GbE card in the system => if the kernel does
-		 *   see an interrupt from the NIC, code to handle it is
-		 *   gone and OOps! - so free_irq also
-		 */
-		if (ap->version >= 2)
-			writel(readl(&regs->CpuBCtrl) | CPU_HALT,
-			       &regs->CpuBCtrl);
-		writel(0, &regs->Mb0Lo);
-		readl(&regs->Mb0Lo);
-
-		ecode = -EBUSY;
-		goto init_error;
-	}
-
-	/*
-	 * We load the ring here as there seem to be no way to tell the
-	 * firmware to wipe the ring without re-initializing it.
-	 */
-	if (!test_and_set_bit(0, &ap->std_refill_busy))
-		ace_load_std_rx_ring(dev, RX_RING_SIZE);
-	else
-		printk(KERN_ERR "%s: Someone is busy refilling the RX ring\n",
-		       ap->name);
-	if (ap->version >= 2) {
-		if (!test_and_set_bit(0, &ap->mini_refill_busy))
-			ace_load_mini_rx_ring(dev, RX_MINI_SIZE);
-		else
-			printk(KERN_ERR "%s: Someone is busy refilling "
-			       "the RX mini ring\n", ap->name);
-	}
-	return 0;
-
- init_error:
-	ace_init_cleanup(dev);
-	return ecode;
-}
-
-
-static void ace_set_rxtx_parms(struct net_device *dev, int jumbo)
-{
-	struct ace_private *ap = netdev_priv(dev);
-	struct ace_regs __iomem *regs = ap->regs;
-	int board_idx = ap->board_idx;
-
-	if (board_idx >= 0) {
-		if (!jumbo) {
-			if (!tx_coal_tick[board_idx])
-				writel(DEF_TX_COAL, &regs->TuneTxCoalTicks);
-			if (!max_tx_desc[board_idx])
-				writel(DEF_TX_MAX_DESC, &regs->TuneMaxTxDesc);
-			if (!rx_coal_tick[board_idx])
-				writel(DEF_RX_COAL, &regs->TuneRxCoalTicks);
-			if (!max_rx_desc[board_idx])
-				writel(DEF_RX_MAX_DESC, &regs->TuneMaxRxDesc);
-			if (!tx_ratio[board_idx])
-				writel(DEF_TX_RATIO, &regs->TxBufRat);
-		} else {
-			if (!tx_coal_tick[board_idx])
-				writel(DEF_JUMBO_TX_COAL,
-				       &regs->TuneTxCoalTicks);
-			if (!max_tx_desc[board_idx])
-				writel(DEF_JUMBO_TX_MAX_DESC,
-				       &regs->TuneMaxTxDesc);
-			if (!rx_coal_tick[board_idx])
-				writel(DEF_JUMBO_RX_COAL,
-				       &regs->TuneRxCoalTicks);
-			if (!max_rx_desc[board_idx])
-				writel(DEF_JUMBO_RX_MAX_DESC,
-				       &regs->TuneMaxRxDesc);
-			if (!tx_ratio[board_idx])
-				writel(DEF_JUMBO_TX_RATIO, &regs->TxBufRat);
-		}
-	}
-}
-
-
-static void ace_watchdog(struct net_device *data, unsigned int txqueue)
-{
-	struct net_device *dev = data;
-	struct ace_private *ap = netdev_priv(dev);
-	struct ace_regs __iomem *regs = ap->regs;
-
-	/*
-	 * We haven't received a stats update event for more than 2.5
-	 * seconds and there is data in the transmit queue, thus we
-	 * assume the card is stuck.
-	 */
-	if (*ap->tx_csm != ap->tx_ret_csm) {
-		printk(KERN_WARNING "%s: Transmitter is stuck, %08x\n",
-		       dev->name, (unsigned int)readl(&regs->HostCtrl));
-		/* This can happen due to ieee flow control. */
-	} else {
-		printk(KERN_DEBUG "%s: BUG... transmitter died. Kicking it.\n",
-		       dev->name);
-#if 0
-		netif_wake_queue(dev);
-#endif
-	}
-}
-
-
-static void ace_bh_work(struct work_struct *work)
-{
-	struct ace_private *ap = from_work(ap, work, ace_bh_work);
-	struct net_device *dev = ap->ndev;
-	int cur_size;
-
-	cur_size = atomic_read(&ap->cur_rx_bufs);
-	if ((cur_size < RX_LOW_STD_THRES) &&
-	    !test_and_set_bit(0, &ap->std_refill_busy)) {
-#ifdef DEBUG
-		printk("refilling buffers (current %i)\n", cur_size);
-#endif
-		ace_load_std_rx_ring(dev, RX_RING_SIZE - cur_size);
-	}
-
-	if (ap->version >= 2) {
-		cur_size = atomic_read(&ap->cur_mini_bufs);
-		if ((cur_size < RX_LOW_MINI_THRES) &&
-		    !test_and_set_bit(0, &ap->mini_refill_busy)) {
-#ifdef DEBUG
-			printk("refilling mini buffers (current %i)\n",
-			       cur_size);
-#endif
-			ace_load_mini_rx_ring(dev, RX_MINI_SIZE - cur_size);
-		}
-	}
-
-	cur_size = atomic_read(&ap->cur_jumbo_bufs);
-	if (ap->jumbo && (cur_size < RX_LOW_JUMBO_THRES) &&
-	    !test_and_set_bit(0, &ap->jumbo_refill_busy)) {
-#ifdef DEBUG
-		printk("refilling jumbo buffers (current %i)\n", cur_size);
-#endif
-		ace_load_jumbo_rx_ring(dev, RX_JUMBO_SIZE - cur_size);
-	}
-	ap->bh_work_pending = 0;
-}
-
-
-/*
- * Copy the contents of the NIC's trace buffer to kernel memory.
- */
-static void ace_dump_trace(struct ace_private *ap)
-{
-#if 0
-	if (!ap->trace_buf)
-		if (!(ap->trace_buf = kmalloc(ACE_TRACE_SIZE, GFP_KERNEL)))
-		    return;
-#endif
-}
-
-
-/*
- * Load the standard rx ring.
- *
- * Loading rings is safe without holding the spin lock since this is
- * done only before the device is enabled, thus no interrupts are
- * generated and by the interrupt handler/bh handler.
- */
-static void ace_load_std_rx_ring(struct net_device *dev, int nr_bufs)
-{
-	struct ace_private *ap = netdev_priv(dev);
-	struct ace_regs __iomem *regs = ap->regs;
-	short i, idx;
-
-
-	prefetchw(&ap->cur_rx_bufs);
-
-	idx = ap->rx_std_skbprd;
-
-	for (i = 0; i < nr_bufs; i++) {
-		struct sk_buff *skb;
-		struct rx_desc *rd;
-		dma_addr_t mapping;
-
-		skb = netdev_alloc_skb_ip_align(dev, ACE_STD_BUFSIZE);
-		if (!skb)
-			break;
-
-		mapping = dma_map_page(&ap->pdev->dev,
-				       virt_to_page(skb->data),
-				       offset_in_page(skb->data),
-				       ACE_STD_BUFSIZE, DMA_FROM_DEVICE);
-		ap->skb->rx_std_skbuff[idx].skb = skb;
-		dma_unmap_addr_set(&ap->skb->rx_std_skbuff[idx],
-				   mapping, mapping);
-
-		rd = &ap->rx_std_ring[idx];
-		set_aceaddr(&rd->addr, mapping);
-		rd->size = ACE_STD_BUFSIZE;
-		rd->idx = idx;
-		idx = (idx + 1) % RX_STD_RING_ENTRIES;
-	}
-
-	if (!i)
-		goto error_out;
-
-	atomic_add(i, &ap->cur_rx_bufs);
-	ap->rx_std_skbprd = idx;
-
-	if (ACE_IS_TIGON_I(ap)) {
-		struct cmd cmd;
-		cmd.evt = C_SET_RX_PRD_IDX;
-		cmd.code = 0;
-		cmd.idx = ap->rx_std_skbprd;
-		ace_issue_cmd(regs, &cmd);
-	} else {
-		writel(idx, &regs->RxStdPrd);
-		wmb();
-	}
-
- out:
-	clear_bit(0, &ap->std_refill_busy);
-	return;
-
- error_out:
-	printk(KERN_INFO "Out of memory when allocating "
-	       "standard receive buffers\n");
-	goto out;
-}
-
-
-static void ace_load_mini_rx_ring(struct net_device *dev, int nr_bufs)
-{
-	struct ace_private *ap = netdev_priv(dev);
-	struct ace_regs __iomem *regs = ap->regs;
-	short i, idx;
-
-	prefetchw(&ap->cur_mini_bufs);
-
-	idx = ap->rx_mini_skbprd;
-	for (i = 0; i < nr_bufs; i++) {
-		struct sk_buff *skb;
-		struct rx_desc *rd;
-		dma_addr_t mapping;
-
-		skb = netdev_alloc_skb_ip_align(dev, ACE_MINI_BUFSIZE);
-		if (!skb)
-			break;
-
-		mapping = dma_map_page(&ap->pdev->dev,
-				       virt_to_page(skb->data),
-				       offset_in_page(skb->data),
-				       ACE_MINI_BUFSIZE, DMA_FROM_DEVICE);
-		ap->skb->rx_mini_skbuff[idx].skb = skb;
-		dma_unmap_addr_set(&ap->skb->rx_mini_skbuff[idx],
-				   mapping, mapping);
-
-		rd = &ap->rx_mini_ring[idx];
-		set_aceaddr(&rd->addr, mapping);
-		rd->size = ACE_MINI_BUFSIZE;
-		rd->idx = idx;
-		idx = (idx + 1) % RX_MINI_RING_ENTRIES;
-	}
-
-	if (!i)
-		goto error_out;
-
-	atomic_add(i, &ap->cur_mini_bufs);
-
-	ap->rx_mini_skbprd = idx;
-
-	writel(idx, &regs->RxMiniPrd);
-	wmb();
-
- out:
-	clear_bit(0, &ap->mini_refill_busy);
-	return;
- error_out:
-	printk(KERN_INFO "Out of memory when allocating "
-	       "mini receive buffers\n");
-	goto out;
-}
-
-
-/*
- * Load the jumbo rx ring, this may happen at any time if the MTU
- * is changed to a value > 1500.
- */
-static void ace_load_jumbo_rx_ring(struct net_device *dev, int nr_bufs)
-{
-	struct ace_private *ap = netdev_priv(dev);
-	struct ace_regs __iomem *regs = ap->regs;
-	short i, idx;
-
-	idx = ap->rx_jumbo_skbprd;
-
-	for (i = 0; i < nr_bufs; i++) {
-		struct sk_buff *skb;
-		struct rx_desc *rd;
-		dma_addr_t mapping;
-
-		skb = netdev_alloc_skb_ip_align(dev, ACE_JUMBO_BUFSIZE);
-		if (!skb)
-			break;
-
-		mapping = dma_map_page(&ap->pdev->dev,
-				       virt_to_page(skb->data),
-				       offset_in_page(skb->data),
-				       ACE_JUMBO_BUFSIZE, DMA_FROM_DEVICE);
-		ap->skb->rx_jumbo_skbuff[idx].skb = skb;
-		dma_unmap_addr_set(&ap->skb->rx_jumbo_skbuff[idx],
-				   mapping, mapping);
-
-		rd = &ap->rx_jumbo_ring[idx];
-		set_aceaddr(&rd->addr, mapping);
-		rd->size = ACE_JUMBO_BUFSIZE;
-		rd->idx = idx;
-		idx = (idx + 1) % RX_JUMBO_RING_ENTRIES;
-	}
-
-	if (!i)
-		goto error_out;
-
-	atomic_add(i, &ap->cur_jumbo_bufs);
-	ap->rx_jumbo_skbprd = idx;
-
-	if (ACE_IS_TIGON_I(ap)) {
-		struct cmd cmd;
-		cmd.evt = C_SET_RX_JUMBO_PRD_IDX;
-		cmd.code = 0;
-		cmd.idx = ap->rx_jumbo_skbprd;
-		ace_issue_cmd(regs, &cmd);
-	} else {
-		writel(idx, &regs->RxJumboPrd);
-		wmb();
-	}
-
- out:
-	clear_bit(0, &ap->jumbo_refill_busy);
-	return;
- error_out:
-	if (net_ratelimit())
-		printk(KERN_INFO "Out of memory when allocating "
-		       "jumbo receive buffers\n");
-	goto out;
-}
-
-
-/*
- * All events are considered to be slow (RX/TX ints do not generate
- * events) and are handled here, outside the main interrupt handler,
- * to reduce the size of the handler.
- */
-static u32 ace_handle_event(struct net_device *dev, u32 evtcsm, u32 evtprd)
-{
-	struct ace_private *ap;
-
-	ap = netdev_priv(dev);
-
-	while (evtcsm != evtprd) {
-		switch (ap->evt_ring[evtcsm].evt) {
-		case E_FW_RUNNING:
-			printk(KERN_INFO "%s: Firmware up and running\n",
-			       ap->name);
-			ap->fw_running = 1;
-			wmb();
-			break;
-		case E_STATS_UPDATED:
-			break;
-		case E_LNK_STATE:
-		{
-			u16 code = ap->evt_ring[evtcsm].code;
-			switch (code) {
-			case E_C_LINK_UP:
-			{
-				u32 state = readl(&ap->regs->GigLnkState);
-				printk(KERN_WARNING "%s: Optical link UP "
-				       "(%s Duplex, Flow Control: %s%s)\n",
-				       ap->name,
-				       state & LNK_FULL_DUPLEX ? "Full":"Half",
-				       state & LNK_TX_FLOW_CTL_Y ? "TX " : "",
-				       state & LNK_RX_FLOW_CTL_Y ? "RX" : "");
-				break;
-			}
-			case E_C_LINK_DOWN:
-				printk(KERN_WARNING "%s: Optical link DOWN\n",
-				       ap->name);
-				break;
-			case E_C_LINK_10_100:
-				printk(KERN_WARNING "%s: 10/100BaseT link "
-				       "UP\n", ap->name);
-				break;
-			default:
-				printk(KERN_ERR "%s: Unknown optical link "
-				       "state %02x\n", ap->name, code);
-			}
-			break;
-		}
-		case E_ERROR:
-			switch(ap->evt_ring[evtcsm].code) {
-			case E_C_ERR_INVAL_CMD:
-				printk(KERN_ERR "%s: invalid command error\n",
-				       ap->name);
-				break;
-			case E_C_ERR_UNIMP_CMD:
-				printk(KERN_ERR "%s: unimplemented command "
-				       "error\n", ap->name);
-				break;
-			case E_C_ERR_BAD_CFG:
-				printk(KERN_ERR "%s: bad config error\n",
-				       ap->name);
-				break;
-			default:
-				printk(KERN_ERR "%s: unknown error %02x\n",
-				       ap->name, ap->evt_ring[evtcsm].code);
-			}
-			break;
-		case E_RESET_JUMBO_RNG:
-		{
-			int i;
-			for (i = 0; i < RX_JUMBO_RING_ENTRIES; i++) {
-				if (ap->skb->rx_jumbo_skbuff[i].skb) {
-					ap->rx_jumbo_ring[i].size = 0;
-					set_aceaddr(&ap->rx_jumbo_ring[i].addr, 0);
-					dev_kfree_skb(ap->skb->rx_jumbo_skbuff[i].skb);
-					ap->skb->rx_jumbo_skbuff[i].skb = NULL;
-				}
-			}
-
-			if (ACE_IS_TIGON_I(ap)) {
-				struct cmd cmd;
-				cmd.evt = C_SET_RX_JUMBO_PRD_IDX;
-				cmd.code = 0;
-				cmd.idx = 0;
-				ace_issue_cmd(ap->regs, &cmd);
-			} else {
-				writel(0, &((ap->regs)->RxJumboPrd));
-				wmb();
-			}
-
-			ap->jumbo = 0;
-			ap->rx_jumbo_skbprd = 0;
-			printk(KERN_INFO "%s: Jumbo ring flushed\n",
-			       ap->name);
-			clear_bit(0, &ap->jumbo_refill_busy);
-			break;
-		}
-		default:
-			printk(KERN_ERR "%s: Unhandled event 0x%02x\n",
-			       ap->name, ap->evt_ring[evtcsm].evt);
-		}
-		evtcsm = (evtcsm + 1) % EVT_RING_ENTRIES;
-	}
-
-	return evtcsm;
-}
-
-
-static void ace_rx_int(struct net_device *dev, u32 rxretprd, u32 rxretcsm)
-{
-	struct ace_private *ap = netdev_priv(dev);
-	u32 idx;
-	int mini_count = 0, std_count = 0;
-
-	idx = rxretcsm;
-
-	prefetchw(&ap->cur_rx_bufs);
-	prefetchw(&ap->cur_mini_bufs);
-
-	while (idx != rxretprd) {
-		struct ring_info *rip;
-		struct sk_buff *skb;
-		struct rx_desc *retdesc;
-		u32 skbidx;
-		int bd_flags, desc_type, mapsize;
-		u16 csum;
-
-
-		/* make sure the rx descriptor isn't read before rxretprd */
-		if (idx == rxretcsm)
-			rmb();
-
-		retdesc = &ap->rx_return_ring[idx];
-		skbidx = retdesc->idx;
-		bd_flags = retdesc->flags;
-		desc_type = bd_flags & (BD_FLG_JUMBO | BD_FLG_MINI);
-
-		switch(desc_type) {
-			/*
-			 * Normal frames do not have any flags set
-			 *
-			 * Mini and normal frames arrive frequently,
-			 * so use a local counter to avoid doing
-			 * atomic operations for each packet arriving.
-			 */
-		case 0:
-			rip = &ap->skb->rx_std_skbuff[skbidx];
-			mapsize = ACE_STD_BUFSIZE;
-			std_count++;
-			break;
-		case BD_FLG_JUMBO:
-			rip = &ap->skb->rx_jumbo_skbuff[skbidx];
-			mapsize = ACE_JUMBO_BUFSIZE;
-			atomic_dec(&ap->cur_jumbo_bufs);
-			break;
-		case BD_FLG_MINI:
-			rip = &ap->skb->rx_mini_skbuff[skbidx];
-			mapsize = ACE_MINI_BUFSIZE;
-			mini_count++;
-			break;
-		default:
-			printk(KERN_INFO "%s: unknown frame type (0x%02x) "
-			       "returned by NIC\n", dev->name,
-			       retdesc->flags);
-			goto error;
-		}
-
-		skb = rip->skb;
-		rip->skb = NULL;
-		dma_unmap_page(&ap->pdev->dev, dma_unmap_addr(rip, mapping),
-			       mapsize, DMA_FROM_DEVICE);
-		skb_put(skb, retdesc->size);
-
-		/*
-		 * Fly baby, fly!
-		 */
-		csum = retdesc->tcp_udp_csum;
-
-		skb->protocol = eth_type_trans(skb, dev);
-
-		/*
-		 * Instead of forcing the poor tigon mips cpu to calculate
-		 * pseudo hdr checksum, we do this ourselves.
-		 */
-		if (bd_flags & BD_FLG_TCP_UDP_SUM) {
-			skb->csum = htons(csum);
-			skb->ip_summed = CHECKSUM_COMPLETE;
-		} else {
-			skb_checksum_none_assert(skb);
-		}
-
-		/* send it up */
-		if ((bd_flags & BD_FLG_VLAN_TAG))
-			__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q), retdesc->vlan);
-		netif_rx(skb);
-
-		dev->stats.rx_packets++;
-		dev->stats.rx_bytes += retdesc->size;
-
-		idx = (idx + 1) % RX_RETURN_RING_ENTRIES;
-	}
-
-	atomic_sub(std_count, &ap->cur_rx_bufs);
-	if (!ACE_IS_TIGON_I(ap))
-		atomic_sub(mini_count, &ap->cur_mini_bufs);
-
- out:
-	/*
-	 * According to the documentation RxRetCsm is obsolete with
-	 * the 12.3.x Firmware - my Tigon I NICs seem to disagree!
-	 */
-	if (ACE_IS_TIGON_I(ap)) {
-		writel(idx, &ap->regs->RxRetCsm);
-	}
-	ap->cur_rx = idx;
-
-	return;
- error:
-	idx = rxretprd;
-	goto out;
-}
-
-
-static inline void ace_tx_int(struct net_device *dev,
-			      u32 txcsm, u32 idx)
-{
-	struct ace_private *ap = netdev_priv(dev);
-
-	do {
-		struct sk_buff *skb;
-		struct tx_ring_info *info;
-
-		info = ap->skb->tx_skbuff + idx;
-		skb = info->skb;
-
-		if (dma_unmap_len(info, maplen)) {
-			dma_unmap_page(&ap->pdev->dev,
-				       dma_unmap_addr(info, mapping),
-				       dma_unmap_len(info, maplen),
-				       DMA_TO_DEVICE);
-			dma_unmap_len_set(info, maplen, 0);
-		}
-
-		if (skb) {
-			dev->stats.tx_packets++;
-			dev->stats.tx_bytes += skb->len;
-			dev_consume_skb_irq(skb);
-			info->skb = NULL;
-		}
-
-		idx = (idx + 1) % ACE_TX_RING_ENTRIES(ap);
-	} while (idx != txcsm);
-
-	if (netif_queue_stopped(dev))
-		netif_wake_queue(dev);
-
-	wmb();
-	ap->tx_ret_csm = txcsm;
-
-	/* So... tx_ret_csm is advanced _after_ check for device wakeup.
-	 *
-	 * We could try to make it before. In this case we would get
-	 * the following race condition: hard_start_xmit on other cpu
-	 * enters after we advanced tx_ret_csm and fills space,
-	 * which we have just freed, so that we make illegal device wakeup.
-	 * There is no good way to workaround this (at entry
-	 * to ace_start_xmit detects this condition and prevents
-	 * ring corruption, but it is not a good workaround.)
-	 *
-	 * When tx_ret_csm is advanced after, we wake up device _only_
-	 * if we really have some space in ring (though the core doing
-	 * hard_start_xmit can see full ring for some period and has to
-	 * synchronize.) Superb.
-	 * BUT! We get another subtle race condition. hard_start_xmit
-	 * may think that ring is full between wakeup and advancing
-	 * tx_ret_csm and will stop device instantly! It is not so bad.
-	 * We are guaranteed that there is something in ring, so that
-	 * the next irq will resume transmission. To speedup this we could
-	 * mark descriptor, which closes ring with BD_FLG_COAL_NOW
-	 * (see ace_start_xmit).
-	 *
-	 * Well, this dilemma exists in all lock-free devices.
-	 * We, following scheme used in drivers by Donald Becker,
-	 * select the least dangerous.
-	 *							--ANK
-	 */
-}
-
-
-static irqreturn_t ace_interrupt(int irq, void *dev_id)
-{
-	struct net_device *dev = (struct net_device *)dev_id;
-	struct ace_private *ap = netdev_priv(dev);
-	struct ace_regs __iomem *regs = ap->regs;
-	u32 idx;
-	u32 txcsm, rxretcsm, rxretprd;
-	u32 evtcsm, evtprd;
-
-	/*
-	 * In case of PCI shared interrupts or spurious interrupts,
-	 * we want to make sure it is actually our interrupt before
-	 * spending any time in here.
-	 */
-	if (!(readl(&regs->HostCtrl) & IN_INT))
-		return IRQ_NONE;
-
-	/*
-	 * ACK intr now. Otherwise we will lose updates to rx_ret_prd,
-	 * which happened _after_ rxretprd = *ap->rx_ret_prd; but before
-	 * writel(0, &regs->Mb0Lo).
-	 *
-	 * "IRQ avoidance" recommended in docs applies to IRQs served
-	 * threads and it is wrong even for that case.
-	 */
-	writel(0, &regs->Mb0Lo);
-	readl(&regs->Mb0Lo);
-
-	/*
-	 * There is no conflict between transmit handling in
-	 * start_xmit and receive processing, thus there is no reason
-	 * to take a spin lock for RX handling. Wait until we start
-	 * working on the other stuff - hey we don't need a spin lock
-	 * anymore.
-	 */
-	rxretprd = *ap->rx_ret_prd;
-	rxretcsm = ap->cur_rx;
-
-	if (rxretprd != rxretcsm)
-		ace_rx_int(dev, rxretprd, rxretcsm);
-
-	txcsm = *ap->tx_csm;
-	idx = ap->tx_ret_csm;
-
-	if (txcsm != idx) {
-		/*
-		 * If each skb takes only one descriptor this check degenerates
-		 * to identity, because new space has just been opened.
-		 * But if skbs are fragmented we must check that this index
-		 * update releases enough of space, otherwise we just
-		 * wait for device to make more work.
-		 */
-		if (!tx_ring_full(ap, txcsm, ap->tx_prd))
-			ace_tx_int(dev, txcsm, idx);
-	}
-
-	evtcsm = readl(&regs->EvtCsm);
-	evtprd = *ap->evt_prd;
-
-	if (evtcsm != evtprd) {
-		evtcsm = ace_handle_event(dev, evtcsm, evtprd);
-		writel(evtcsm, &regs->EvtCsm);
-	}
-
-	/*
-	 * This has to go last in the interrupt handler and run with
-	 * the spin lock released ... what lock?
-	 */
-	if (netif_running(dev)) {
-		int cur_size;
-		int run_bh_work = 0;
-
-		cur_size = atomic_read(&ap->cur_rx_bufs);
-		if (cur_size < RX_LOW_STD_THRES) {
-			if ((cur_size < RX_PANIC_STD_THRES) &&
-			    !test_and_set_bit(0, &ap->std_refill_busy)) {
-#ifdef DEBUG
-				printk("low on std buffers %i\n", cur_size);
-#endif
-				ace_load_std_rx_ring(dev,
-						     RX_RING_SIZE - cur_size);
-			} else
-				run_bh_work = 1;
-		}
-
-		if (!ACE_IS_TIGON_I(ap)) {
-			cur_size = atomic_read(&ap->cur_mini_bufs);
-			if (cur_size < RX_LOW_MINI_THRES) {
-				if ((cur_size < RX_PANIC_MINI_THRES) &&
-				    !test_and_set_bit(0,
-						      &ap->mini_refill_busy)) {
-#ifdef DEBUG
-					printk("low on mini buffers %i\n",
-					       cur_size);
-#endif
-					ace_load_mini_rx_ring(dev,
-							      RX_MINI_SIZE - cur_size);
-				} else
-					run_bh_work = 1;
-			}
-		}
-
-		if (ap->jumbo) {
-			cur_size = atomic_read(&ap->cur_jumbo_bufs);
-			if (cur_size < RX_LOW_JUMBO_THRES) {
-				if ((cur_size < RX_PANIC_JUMBO_THRES) &&
-				    !test_and_set_bit(0,
-						      &ap->jumbo_refill_busy)){
-#ifdef DEBUG
-					printk("low on jumbo buffers %i\n",
-					       cur_size);
-#endif
-					ace_load_jumbo_rx_ring(dev,
-							       RX_JUMBO_SIZE - cur_size);
-				} else
-					run_bh_work = 1;
-			}
-		}
-		if (run_bh_work && !ap->bh_work_pending) {
-			ap->bh_work_pending = 1;
-			queue_work(system_bh_wq, &ap->ace_bh_work);
-		}
-	}
-
-	return IRQ_HANDLED;
-}
-
-static int ace_open(struct net_device *dev)
-{
-	struct ace_private *ap = netdev_priv(dev);
-	struct ace_regs __iomem *regs = ap->regs;
-	struct cmd cmd;
-
-	if (!(ap->fw_running)) {
-		printk(KERN_WARNING "%s: Firmware not running!\n", dev->name);
-		return -EBUSY;
-	}
-
-	writel(dev->mtu + ETH_HLEN + 4, &regs->IfMtu);
-
-	cmd.evt = C_CLEAR_STATS;
-	cmd.code = 0;
-	cmd.idx = 0;
-	ace_issue_cmd(regs, &cmd);
-
-	cmd.evt = C_HOST_STATE;
-	cmd.code = C_C_STACK_UP;
-	cmd.idx = 0;
-	ace_issue_cmd(regs, &cmd);
-
-	if (ap->jumbo &&
-	    !test_and_set_bit(0, &ap->jumbo_refill_busy))
-		ace_load_jumbo_rx_ring(dev, RX_JUMBO_SIZE);
-
-	if (dev->flags & IFF_PROMISC) {
-		cmd.evt = C_SET_PROMISC_MODE;
-		cmd.code = C_C_PROMISC_ENABLE;
-		cmd.idx = 0;
-		ace_issue_cmd(regs, &cmd);
-
-		ap->promisc = 1;
-	}else
-		ap->promisc = 0;
-	ap->mcast_all = 0;
-
-#if 0
-	cmd.evt = C_LNK_NEGOTIATION;
-	cmd.code = 0;
-	cmd.idx = 0;
-	ace_issue_cmd(regs, &cmd);
-#endif
-
-	netif_start_queue(dev);
-
-	/*
-	 * Setup the bottom half rx ring refill handler
-	 */
-	INIT_WORK(&ap->ace_bh_work, ace_bh_work);
-	return 0;
-}
-
-
-static int ace_close(struct net_device *dev)
-{
-	struct ace_private *ap = netdev_priv(dev);
-	struct ace_regs __iomem *regs = ap->regs;
-	struct cmd cmd;
-	unsigned long flags;
-	short i;
-
-	/*
-	 * Without (or before) releasing irq and stopping hardware, this
-	 * is an absolute non-sense, by the way. It will be reset instantly
-	 * by the first irq.
-	 */
-	netif_stop_queue(dev);
-
-
-	if (ap->promisc) {
-		cmd.evt = C_SET_PROMISC_MODE;
-		cmd.code = C_C_PROMISC_DISABLE;
-		cmd.idx = 0;
-		ace_issue_cmd(regs, &cmd);
-		ap->promisc = 0;
-	}
-
-	cmd.evt = C_HOST_STATE;
-	cmd.code = C_C_STACK_DOWN;
-	cmd.idx = 0;
-	ace_issue_cmd(regs, &cmd);
-
-	cancel_work_sync(&ap->ace_bh_work);
-
-	/*
-	 * Make sure one CPU is not processing packets while
-	 * buffers are being released by another.
-	 */
-
-	local_irq_save(flags);
-	ace_mask_irq(dev);
-
-	for (i = 0; i < ACE_TX_RING_ENTRIES(ap); i++) {
-		struct sk_buff *skb;
-		struct tx_ring_info *info;
-
-		info = ap->skb->tx_skbuff + i;
-		skb = info->skb;
-
-		if (dma_unmap_len(info, maplen)) {
-			if (ACE_IS_TIGON_I(ap)) {
-				/* NB: TIGON_1 is special, tx_ring is in io space */
-				struct tx_desc __iomem *tx;
-				tx = (__force struct tx_desc __iomem *) &ap->tx_ring[i];
-				writel(0, &tx->addr.addrhi);
-				writel(0, &tx->addr.addrlo);
-				writel(0, &tx->flagsize);
-			} else
-				memset(ap->tx_ring + i, 0,
-				       sizeof(struct tx_desc));
-			dma_unmap_page(&ap->pdev->dev,
-				       dma_unmap_addr(info, mapping),
-				       dma_unmap_len(info, maplen),
-				       DMA_TO_DEVICE);
-			dma_unmap_len_set(info, maplen, 0);
-		}
-		if (skb) {
-			dev_kfree_skb(skb);
-			info->skb = NULL;
-		}
-	}
-
-	if (ap->jumbo) {
-		cmd.evt = C_RESET_JUMBO_RNG;
-		cmd.code = 0;
-		cmd.idx = 0;
-		ace_issue_cmd(regs, &cmd);
-	}
-
-	ace_unmask_irq(dev);
-	local_irq_restore(flags);
-
-	return 0;
-}
-
-
-static inline dma_addr_t
-ace_map_tx_skb(struct ace_private *ap, struct sk_buff *skb,
-	       struct sk_buff *tail, u32 idx)
-{
-	dma_addr_t mapping;
-	struct tx_ring_info *info;
-
-	mapping = dma_map_page(&ap->pdev->dev, virt_to_page(skb->data),
-			       offset_in_page(skb->data), skb->len,
-			       DMA_TO_DEVICE);
-
-	info = ap->skb->tx_skbuff + idx;
-	info->skb = tail;
-	dma_unmap_addr_set(info, mapping, mapping);
-	dma_unmap_len_set(info, maplen, skb->len);
-	return mapping;
-}
-
-
-static inline void
-ace_load_tx_bd(struct ace_private *ap, struct tx_desc *desc, u64 addr,
-	       u32 flagsize, u32 vlan_tag)
-{
-#if !USE_TX_COAL_NOW
-	flagsize &= ~BD_FLG_COAL_NOW;
-#endif
-
-	if (ACE_IS_TIGON_I(ap)) {
-		struct tx_desc __iomem *io = (__force struct tx_desc __iomem *) desc;
-		writel(addr >> 32, &io->addr.addrhi);
-		writel(addr & 0xffffffff, &io->addr.addrlo);
-		writel(flagsize, &io->flagsize);
-		writel(vlan_tag, &io->vlanres);
-	} else {
-		desc->addr.addrhi = addr >> 32;
-		desc->addr.addrlo = addr;
-		desc->flagsize = flagsize;
-		desc->vlanres = vlan_tag;
-	}
-}
-
-
-static netdev_tx_t ace_start_xmit(struct sk_buff *skb,
-				  struct net_device *dev)
-{
-	struct ace_private *ap = netdev_priv(dev);
-	struct ace_regs __iomem *regs = ap->regs;
-	struct tx_desc *desc;
-	u32 idx, flagsize;
-	unsigned long maxjiff = jiffies + 3*HZ;
-
-restart:
-	idx = ap->tx_prd;
-
-	if (tx_ring_full(ap, ap->tx_ret_csm, idx))
-		goto overflow;
-
-	if (!skb_shinfo(skb)->nr_frags)	{
-		dma_addr_t mapping;
-		u32 vlan_tag = 0;
-
-		mapping = ace_map_tx_skb(ap, skb, skb, idx);
-		flagsize = (skb->len << 16) | (BD_FLG_END);
-		if (skb->ip_summed == CHECKSUM_PARTIAL)
-			flagsize |= BD_FLG_TCP_UDP_SUM;
-		if (skb_vlan_tag_present(skb)) {
-			flagsize |= BD_FLG_VLAN_TAG;
-			vlan_tag = skb_vlan_tag_get(skb);
-		}
-		desc = ap->tx_ring + idx;
-		idx = (idx + 1) % ACE_TX_RING_ENTRIES(ap);
-
-		/* Look at ace_tx_int for explanations. */
-		if (tx_ring_full(ap, ap->tx_ret_csm, idx))
-			flagsize |= BD_FLG_COAL_NOW;
-
-		ace_load_tx_bd(ap, desc, mapping, flagsize, vlan_tag);
-	} else {
-		dma_addr_t mapping;
-		u32 vlan_tag = 0;
-		int i;
-
-		mapping = ace_map_tx_skb(ap, skb, NULL, idx);
-		flagsize = (skb_headlen(skb) << 16);
-		if (skb->ip_summed == CHECKSUM_PARTIAL)
-			flagsize |= BD_FLG_TCP_UDP_SUM;
-		if (skb_vlan_tag_present(skb)) {
-			flagsize |= BD_FLG_VLAN_TAG;
-			vlan_tag = skb_vlan_tag_get(skb);
-		}
-
-		ace_load_tx_bd(ap, ap->tx_ring + idx, mapping, flagsize, vlan_tag);
-
-		idx = (idx + 1) % ACE_TX_RING_ENTRIES(ap);
-
-		for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
-			const skb_frag_t *frag = &skb_shinfo(skb)->frags[i];
-			struct tx_ring_info *info;
-
-			info = ap->skb->tx_skbuff + idx;
-			desc = ap->tx_ring + idx;
-
-			mapping = skb_frag_dma_map(&ap->pdev->dev, frag, 0,
-						   skb_frag_size(frag),
-						   DMA_TO_DEVICE);
-
-			flagsize = skb_frag_size(frag) << 16;
-			if (skb->ip_summed == CHECKSUM_PARTIAL)
-				flagsize |= BD_FLG_TCP_UDP_SUM;
-			idx = (idx + 1) % ACE_TX_RING_ENTRIES(ap);
-
-			if (i == skb_shinfo(skb)->nr_frags - 1) {
-				flagsize |= BD_FLG_END;
-				if (tx_ring_full(ap, ap->tx_ret_csm, idx))
-					flagsize |= BD_FLG_COAL_NOW;
-
-				/*
-				 * Only the last fragment frees
-				 * the skb!
-				 */
-				info->skb = skb;
-			} else {
-				info->skb = NULL;
-			}
-			dma_unmap_addr_set(info, mapping, mapping);
-			dma_unmap_len_set(info, maplen, skb_frag_size(frag));
-			ace_load_tx_bd(ap, desc, mapping, flagsize, vlan_tag);
-		}
-	}
-
-	wmb();
-	ap->tx_prd = idx;
-	ace_set_txprd(regs, ap, idx);
-
-	if (flagsize & BD_FLG_COAL_NOW) {
-		netif_stop_queue(dev);
-
-		/*
-		 * A TX-descriptor producer (an IRQ) might have gotten
-		 * between, making the ring free again. Since xmit is
-		 * serialized, this is the only situation we have to
-		 * re-test.
-		 */
-		if (!tx_ring_full(ap, ap->tx_ret_csm, idx))
-			netif_wake_queue(dev);
-	}
-
-	return NETDEV_TX_OK;
-
-overflow:
-	/*
-	 * This race condition is unavoidable with lock-free drivers.
-	 * We wake up the queue _before_ tx_prd is advanced, so that we can
-	 * enter hard_start_xmit too early, while tx ring still looks closed.
-	 * This happens ~1-4 times per 100000 packets, so that we can allow
-	 * to loop syncing to other CPU. Probably, we need an additional
-	 * wmb() in ace_tx_intr as well.
-	 *
-	 * Note that this race is relieved by reserving one more entry
-	 * in tx ring than it is necessary (see original non-SG driver).
-	 * However, with SG we need to reserve 2*MAX_SKB_FRAGS+1, which
-	 * is already overkill.
-	 *
-	 * Alternative is to return with 1 not throttling queue. In this
-	 * case loop becomes longer, no more useful effects.
-	 */
-	if (time_before(jiffies, maxjiff)) {
-		barrier();
-		cpu_relax();
-		goto restart;
-	}
-
-	/* The ring is stuck full. */
-	printk(KERN_WARNING "%s: Transmit ring stuck full\n", dev->name);
-	return NETDEV_TX_BUSY;
-}
-
-
-static int ace_change_mtu(struct net_device *dev, int new_mtu)
-{
-	struct ace_private *ap = netdev_priv(dev);
-	struct ace_regs __iomem *regs = ap->regs;
-
-	writel(new_mtu + ETH_HLEN + 4, &regs->IfMtu);
-	WRITE_ONCE(dev->mtu, new_mtu);
-
-	if (new_mtu > ACE_STD_MTU) {
-		if (!(ap->jumbo)) {
-			printk(KERN_INFO "%s: Enabling Jumbo frame "
-			       "support\n", dev->name);
-			ap->jumbo = 1;
-			if (!test_and_set_bit(0, &ap->jumbo_refill_busy))
-				ace_load_jumbo_rx_ring(dev, RX_JUMBO_SIZE);
-			ace_set_rxtx_parms(dev, 1);
-		}
-	} else {
-		while (test_and_set_bit(0, &ap->jumbo_refill_busy));
-		ace_sync_irq(dev->irq);
-		ace_set_rxtx_parms(dev, 0);
-		if (ap->jumbo) {
-			struct cmd cmd;
-
-			cmd.evt = C_RESET_JUMBO_RNG;
-			cmd.code = 0;
-			cmd.idx = 0;
-			ace_issue_cmd(regs, &cmd);
-		}
-	}
-
-	return 0;
-}
-
-static int ace_get_link_ksettings(struct net_device *dev,
-				  struct ethtool_link_ksettings *cmd)
-{
-	struct ace_private *ap = netdev_priv(dev);
-	struct ace_regs __iomem *regs = ap->regs;
-	u32 link;
-	u32 supported;
-
-	memset(cmd, 0, sizeof(struct ethtool_link_ksettings));
-
-	supported = (SUPPORTED_10baseT_Half | SUPPORTED_10baseT_Full |
-		     SUPPORTED_100baseT_Half | SUPPORTED_100baseT_Full |
-		     SUPPORTED_1000baseT_Half | SUPPORTED_1000baseT_Full |
-		     SUPPORTED_Autoneg | SUPPORTED_FIBRE);
-
-	cmd->base.port = PORT_FIBRE;
-
-	link = readl(&regs->GigLnkState);
-	if (link & LNK_1000MB) {
-		cmd->base.speed = SPEED_1000;
-	} else {
-		link = readl(&regs->FastLnkState);
-		if (link & LNK_100MB)
-			cmd->base.speed = SPEED_100;
-		else if (link & LNK_10MB)
-			cmd->base.speed = SPEED_10;
-		else
-			cmd->base.speed = 0;
-	}
-	if (link & LNK_FULL_DUPLEX)
-		cmd->base.duplex = DUPLEX_FULL;
-	else
-		cmd->base.duplex = DUPLEX_HALF;
-
-	if (link & LNK_NEGOTIATE)
-		cmd->base.autoneg = AUTONEG_ENABLE;
-	else
-		cmd->base.autoneg = AUTONEG_DISABLE;
-
-#if 0
-	/*
-	 * Current struct ethtool_cmd is insufficient
-	 */
-	ecmd->trace = readl(&regs->TuneTrace);
-
-	ecmd->txcoal = readl(&regs->TuneTxCoalTicks);
-	ecmd->rxcoal = readl(&regs->TuneRxCoalTicks);
-#endif
-
-	ethtool_convert_legacy_u32_to_link_mode(cmd->link_modes.supported,
-						supported);
-
-	return 0;
-}
-
-static int ace_set_link_ksettings(struct net_device *dev,
-				  const struct ethtool_link_ksettings *cmd)
-{
-	struct ace_private *ap = netdev_priv(dev);
-	struct ace_regs __iomem *regs = ap->regs;
-	u32 link, speed;
-
-	link = readl(&regs->GigLnkState);
-	if (link & LNK_1000MB)
-		speed = SPEED_1000;
-	else {
-		link = readl(&regs->FastLnkState);
-		if (link & LNK_100MB)
-			speed = SPEED_100;
-		else if (link & LNK_10MB)
-			speed = SPEED_10;
-		else
-			speed = SPEED_100;
-	}
-
-	link = LNK_ENABLE | LNK_1000MB | LNK_100MB | LNK_10MB |
-		LNK_RX_FLOW_CTL_Y | LNK_NEG_FCTL;
-	if (!ACE_IS_TIGON_I(ap))
-		link |= LNK_TX_FLOW_CTL_Y;
-	if (cmd->base.autoneg == AUTONEG_ENABLE)
-		link |= LNK_NEGOTIATE;
-	if (cmd->base.speed != speed) {
-		link &= ~(LNK_1000MB | LNK_100MB | LNK_10MB);
-		switch (cmd->base.speed) {
-		case SPEED_1000:
-			link |= LNK_1000MB;
-			break;
-		case SPEED_100:
-			link |= LNK_100MB;
-			break;
-		case SPEED_10:
-			link |= LNK_10MB;
-			break;
-		}
-	}
-
-	if (cmd->base.duplex == DUPLEX_FULL)
-		link |= LNK_FULL_DUPLEX;
-
-	if (link != ap->link) {
-		struct cmd cmd;
-		printk(KERN_INFO "%s: Renegotiating link state\n",
-		       dev->name);
-
-		ap->link = link;
-		writel(link, &regs->TuneLink);
-		if (!ACE_IS_TIGON_I(ap))
-			writel(link, &regs->TuneFastLink);
-		wmb();
-
-		cmd.evt = C_LNK_NEGOTIATION;
-		cmd.code = 0;
-		cmd.idx = 0;
-		ace_issue_cmd(regs, &cmd);
-	}
-	return 0;
-}
-
-static void ace_get_drvinfo(struct net_device *dev,
-			    struct ethtool_drvinfo *info)
-{
-	struct ace_private *ap = netdev_priv(dev);
-
-	strscpy(info->driver, "acenic", sizeof(info->driver));
-	snprintf(info->fw_version, sizeof(info->version), "%i.%i.%i",
-		 ap->firmware_major, ap->firmware_minor, ap->firmware_fix);
-
-	if (ap->pdev)
-		strscpy(info->bus_info, pci_name(ap->pdev),
-			sizeof(info->bus_info));
-
-}
-
-/*
- * Set the hardware MAC address.
- */
-static int ace_set_mac_addr(struct net_device *dev, void *p)
-{
-	struct ace_private *ap = netdev_priv(dev);
-	struct ace_regs __iomem *regs = ap->regs;
-	struct sockaddr *addr=p;
-	const u8 *da;
-	struct cmd cmd;
-
-	if(netif_running(dev))
-		return -EBUSY;
-
-	eth_hw_addr_set(dev, addr->sa_data);
-
-	da = (const u8 *)dev->dev_addr;
-
-	writel(da[0] << 8 | da[1], &regs->MacAddrHi);
-	writel((da[2] << 24) | (da[3] << 16) | (da[4] << 8) | da[5],
-	       &regs->MacAddrLo);
-
-	cmd.evt = C_SET_MAC_ADDR;
-	cmd.code = 0;
-	cmd.idx = 0;
-	ace_issue_cmd(regs, &cmd);
-
-	return 0;
-}
-
-
-static void ace_set_multicast_list(struct net_device *dev)
-{
-	struct ace_private *ap = netdev_priv(dev);
-	struct ace_regs __iomem *regs = ap->regs;
-	struct cmd cmd;
-
-	if ((dev->flags & IFF_ALLMULTI) && !(ap->mcast_all)) {
-		cmd.evt = C_SET_MULTICAST_MODE;
-		cmd.code = C_C_MCAST_ENABLE;
-		cmd.idx = 0;
-		ace_issue_cmd(regs, &cmd);
-		ap->mcast_all = 1;
-	} else if (ap->mcast_all) {
-		cmd.evt = C_SET_MULTICAST_MODE;
-		cmd.code = C_C_MCAST_DISABLE;
-		cmd.idx = 0;
-		ace_issue_cmd(regs, &cmd);
-		ap->mcast_all = 0;
-	}
-
-	if ((dev->flags & IFF_PROMISC) && !(ap->promisc)) {
-		cmd.evt = C_SET_PROMISC_MODE;
-		cmd.code = C_C_PROMISC_ENABLE;
-		cmd.idx = 0;
-		ace_issue_cmd(regs, &cmd);
-		ap->promisc = 1;
-	}else if (!(dev->flags & IFF_PROMISC) && (ap->promisc)) {
-		cmd.evt = C_SET_PROMISC_MODE;
-		cmd.code = C_C_PROMISC_DISABLE;
-		cmd.idx = 0;
-		ace_issue_cmd(regs, &cmd);
-		ap->promisc = 0;
-	}
-
-	/*
-	 * For the time being multicast relies on the upper layers
-	 * filtering it properly. The Firmware does not allow one to
-	 * set the entire multicast list at a time and keeping track of
-	 * it here is going to be messy.
-	 */
-	if (!netdev_mc_empty(dev) && !ap->mcast_all) {
-		cmd.evt = C_SET_MULTICAST_MODE;
-		cmd.code = C_C_MCAST_ENABLE;
-		cmd.idx = 0;
-		ace_issue_cmd(regs, &cmd);
-	}else if (!ap->mcast_all) {
-		cmd.evt = C_SET_MULTICAST_MODE;
-		cmd.code = C_C_MCAST_DISABLE;
-		cmd.idx = 0;
-		ace_issue_cmd(regs, &cmd);
-	}
-}
-
-
-static struct net_device_stats *ace_get_stats(struct net_device *dev)
-{
-	struct ace_private *ap = netdev_priv(dev);
-	struct ace_mac_stats __iomem *mac_stats =
-		(struct ace_mac_stats __iomem *)ap->regs->Stats;
-
-	dev->stats.rx_missed_errors = readl(&mac_stats->drop_space);
-	dev->stats.multicast = readl(&mac_stats->kept_mc);
-	dev->stats.collisions = readl(&mac_stats->coll);
-
-	return &dev->stats;
-}
-
-
-static void ace_copy(struct ace_regs __iomem *regs, const __be32 *src,
-		     u32 dest, int size)
-{
-	void __iomem *tdest;
-	short tsize, i;
-
-	if (size <= 0)
-		return;
-
-	while (size > 0) {
-		tsize = min_t(u32, ((~dest & (ACE_WINDOW_SIZE - 1)) + 1),
-			    min_t(u32, size, ACE_WINDOW_SIZE));
-		tdest = (void __iomem *) &regs->Window +
-			(dest & (ACE_WINDOW_SIZE - 1));
-		writel(dest & ~(ACE_WINDOW_SIZE - 1), &regs->WinBase);
-		for (i = 0; i < (tsize / 4); i++) {
-			/* Firmware is big-endian */
-			writel(be32_to_cpup(src), tdest);
-			src++;
-			tdest += 4;
-			dest += 4;
-			size -= 4;
-		}
-	}
-}
-
-
-static void ace_clear(struct ace_regs __iomem *regs, u32 dest, int size)
-{
-	void __iomem *tdest;
-	short tsize = 0, i;
-
-	if (size <= 0)
-		return;
-
-	while (size > 0) {
-		tsize = min_t(u32, ((~dest & (ACE_WINDOW_SIZE - 1)) + 1),
-				min_t(u32, size, ACE_WINDOW_SIZE));
-		tdest = (void __iomem *) &regs->Window +
-			(dest & (ACE_WINDOW_SIZE - 1));
-		writel(dest & ~(ACE_WINDOW_SIZE - 1), &regs->WinBase);
-
-		for (i = 0; i < (tsize / 4); i++) {
-			writel(0, tdest + i*4);
-		}
-
-		dest += tsize;
-		size -= tsize;
-	}
-}
-
-
-/*
- * Download the firmware into the SRAM on the NIC
- *
- * This operation requires the NIC to be halted and is performed with
- * interrupts disabled and with the spinlock hold.
- */
-static int ace_load_firmware(struct net_device *dev)
-{
-	const struct firmware *fw;
-	const char *fw_name = "acenic/tg2.bin";
-	struct ace_private *ap = netdev_priv(dev);
-	struct ace_regs __iomem *regs = ap->regs;
-	const __be32 *fw_data;
-	u32 load_addr;
-	int ret;
-
-	if (!(readl(&regs->CpuCtrl) & CPU_HALTED)) {
-		printk(KERN_ERR "%s: trying to download firmware while the "
-		       "CPU is running!\n", ap->name);
-		return -EFAULT;
-	}
-
-	if (ACE_IS_TIGON_I(ap))
-		fw_name = "acenic/tg1.bin";
-
-	ret = request_firmware(&fw, fw_name, &ap->pdev->dev);
-	if (ret) {
-		printk(KERN_ERR "%s: Failed to load firmware \"%s\"\n",
-		       ap->name, fw_name);
-		return ret;
-	}
-
-	fw_data = (void *)fw->data;
-
-	/* Firmware blob starts with version numbers, followed by
-	   load and start address. Remainder is the blob to be loaded
-	   contiguously from load address. We don't bother to represent
-	   the BSS/SBSS sections any more, since we were clearing the
-	   whole thing anyway. */
-	ap->firmware_major = fw->data[0];
-	ap->firmware_minor = fw->data[1];
-	ap->firmware_fix = fw->data[2];
-
-	ap->firmware_start = be32_to_cpu(fw_data[1]);
-	if (ap->firmware_start < 0x4000 || ap->firmware_start >= 0x80000) {
-		printk(KERN_ERR "%s: bogus load address %08x in \"%s\"\n",
-		       ap->name, ap->firmware_start, fw_name);
-		ret = -EINVAL;
-		goto out;
-	}
-
-	load_addr = be32_to_cpu(fw_data[2]);
-	if (load_addr < 0x4000 || load_addr >= 0x80000) {
-		printk(KERN_ERR "%s: bogus load address %08x in \"%s\"\n",
-		       ap->name, load_addr, fw_name);
-		ret = -EINVAL;
-		goto out;
-	}
-
-	/*
-	 * Do not try to clear more than 512KiB or we end up seeing
-	 * funny things on NICs with only 512KiB SRAM
-	 */
-	ace_clear(regs, 0x2000, 0x80000-0x2000);
-	ace_copy(regs, &fw_data[3], load_addr, fw->size-12);
- out:
-	release_firmware(fw);
-	return ret;
-}
-
-
-/*
- * The eeprom on the AceNIC is an Atmel i2c EEPROM.
- *
- * Accessing the EEPROM is `interesting' to say the least - don't read
- * this code right after dinner.
- *
- * This is all about black magic and bit-banging the device .... I
- * wonder in what hospital they have put the guy who designed the i2c
- * specs.
- *
- * Oh yes, this is only the beginning!
- *
- * Thanks to Stevarino Webinski for helping tracking down the bugs in the
- * code i2c readout code by beta testing all my hacks.
- */
-static void eeprom_start(struct ace_regs __iomem *regs)
-{
-	u32 local;
-
-	readl(&regs->LocalCtrl);
-	udelay(ACE_SHORT_DELAY);
-	local = readl(&regs->LocalCtrl);
-	local |= EEPROM_DATA_OUT | EEPROM_WRITE_ENABLE;
-	writel(local, &regs->LocalCtrl);
-	readl(&regs->LocalCtrl);
-	mb();
-	udelay(ACE_SHORT_DELAY);
-	local |= EEPROM_CLK_OUT;
-	writel(local, &regs->LocalCtrl);
-	readl(&regs->LocalCtrl);
-	mb();
-	udelay(ACE_SHORT_DELAY);
-	local &= ~EEPROM_DATA_OUT;
-	writel(local, &regs->LocalCtrl);
-	readl(&regs->LocalCtrl);
-	mb();
-	udelay(ACE_SHORT_DELAY);
-	local &= ~EEPROM_CLK_OUT;
-	writel(local, &regs->LocalCtrl);
-	readl(&regs->LocalCtrl);
-	mb();
-}
-
-
-static void eeprom_prep(struct ace_regs __iomem *regs, u8 magic)
-{
-	short i;
-	u32 local;
-
-	udelay(ACE_SHORT_DELAY);
-	local = readl(&regs->LocalCtrl);
-	local &= ~EEPROM_DATA_OUT;
-	local |= EEPROM_WRITE_ENABLE;
-	writel(local, &regs->LocalCtrl);
-	readl(&regs->LocalCtrl);
-	mb();
-
-	for (i = 0; i < 8; i++, magic <<= 1) {
-		udelay(ACE_SHORT_DELAY);
-		if (magic & 0x80)
-			local |= EEPROM_DATA_OUT;
-		else
-			local &= ~EEPROM_DATA_OUT;
-		writel(local, &regs->LocalCtrl);
-		readl(&regs->LocalCtrl);
-		mb();
-
-		udelay(ACE_SHORT_DELAY);
-		local |= EEPROM_CLK_OUT;
-		writel(local, &regs->LocalCtrl);
-		readl(&regs->LocalCtrl);
-		mb();
-		udelay(ACE_SHORT_DELAY);
-		local &= ~(EEPROM_CLK_OUT | EEPROM_DATA_OUT);
-		writel(local, &regs->LocalCtrl);
-		readl(&regs->LocalCtrl);
-		mb();
-	}
-}
-
-
-static int eeprom_check_ack(struct ace_regs __iomem *regs)
-{
-	int state;
-	u32 local;
-
-	local = readl(&regs->LocalCtrl);
-	local &= ~EEPROM_WRITE_ENABLE;
-	writel(local, &regs->LocalCtrl);
-	readl(&regs->LocalCtrl);
-	mb();
-	udelay(ACE_LONG_DELAY);
-	local |= EEPROM_CLK_OUT;
-	writel(local, &regs->LocalCtrl);
-	readl(&regs->LocalCtrl);
-	mb();
-	udelay(ACE_SHORT_DELAY);
-	/* sample data in middle of high clk */
-	state = (readl(&regs->LocalCtrl) & EEPROM_DATA_IN) != 0;
-	udelay(ACE_SHORT_DELAY);
-	mb();
-	writel(readl(&regs->LocalCtrl) & ~EEPROM_CLK_OUT, &regs->LocalCtrl);
-	readl(&regs->LocalCtrl);
-	mb();
-
-	return state;
-}
-
-
-static void eeprom_stop(struct ace_regs __iomem *regs)
-{
-	u32 local;
-
-	udelay(ACE_SHORT_DELAY);
-	local = readl(&regs->LocalCtrl);
-	local |= EEPROM_WRITE_ENABLE;
-	writel(local, &regs->LocalCtrl);
-	readl(&regs->LocalCtrl);
-	mb();
-	udelay(ACE_SHORT_DELAY);
-	local &= ~EEPROM_DATA_OUT;
-	writel(local, &regs->LocalCtrl);
-	readl(&regs->LocalCtrl);
-	mb();
-	udelay(ACE_SHORT_DELAY);
-	local |= EEPROM_CLK_OUT;
-	writel(local, &regs->LocalCtrl);
-	readl(&regs->LocalCtrl);
-	mb();
-	udelay(ACE_SHORT_DELAY);
-	local |= EEPROM_DATA_OUT;
-	writel(local, &regs->LocalCtrl);
-	readl(&regs->LocalCtrl);
-	mb();
-	udelay(ACE_LONG_DELAY);
-	local &= ~EEPROM_CLK_OUT;
-	writel(local, &regs->LocalCtrl);
-	mb();
-}
-
-
-/*
- * Read a whole byte from the EEPROM.
- */
-static int read_eeprom_byte(struct net_device *dev, unsigned long offset)
-{
-	struct ace_private *ap = netdev_priv(dev);
-	struct ace_regs __iomem *regs = ap->regs;
-	unsigned long flags;
-	u32 local;
-	int result = 0;
-	short i;
-
-	/*
-	 * Don't take interrupts on this CPU will bit banging
-	 * the %#%#@$ I2C device
-	 */
-	local_irq_save(flags);
-
-	eeprom_start(regs);
-
-	eeprom_prep(regs, EEPROM_WRITE_SELECT);
-	if (eeprom_check_ack(regs)) {
-		local_irq_restore(flags);
-		printk(KERN_ERR "%s: Unable to sync eeprom\n", ap->name);
-		result = -EIO;
-		goto eeprom_read_error;
-	}
-
-	eeprom_prep(regs, (offset >> 8) & 0xff);
-	if (eeprom_check_ack(regs)) {
-		local_irq_restore(flags);
-		printk(KERN_ERR "%s: Unable to set address byte 0\n",
-		       ap->name);
-		result = -EIO;
-		goto eeprom_read_error;
-	}
-
-	eeprom_prep(regs, offset & 0xff);
-	if (eeprom_check_ack(regs)) {
-		local_irq_restore(flags);
-		printk(KERN_ERR "%s: Unable to set address byte 1\n",
-		       ap->name);
-		result = -EIO;
-		goto eeprom_read_error;
-	}
-
-	eeprom_start(regs);
-	eeprom_prep(regs, EEPROM_READ_SELECT);
-	if (eeprom_check_ack(regs)) {
-		local_irq_restore(flags);
-		printk(KERN_ERR "%s: Unable to set READ_SELECT\n",
-		       ap->name);
-		result = -EIO;
-		goto eeprom_read_error;
-	}
-
-	for (i = 0; i < 8; i++) {
-		local = readl(&regs->LocalCtrl);
-		local &= ~EEPROM_WRITE_ENABLE;
-		writel(local, &regs->LocalCtrl);
-		readl(&regs->LocalCtrl);
-		udelay(ACE_LONG_DELAY);
-		mb();
-		local |= EEPROM_CLK_OUT;
-		writel(local, &regs->LocalCtrl);
-		readl(&regs->LocalCtrl);
-		mb();
-		udelay(ACE_SHORT_DELAY);
-		/* sample data mid high clk */
-		result = (result << 1) |
-			((readl(&regs->LocalCtrl) & EEPROM_DATA_IN) != 0);
-		udelay(ACE_SHORT_DELAY);
-		mb();
-		local = readl(&regs->LocalCtrl);
-		local &= ~EEPROM_CLK_OUT;
-		writel(local, &regs->LocalCtrl);
-		readl(&regs->LocalCtrl);
-		udelay(ACE_SHORT_DELAY);
-		mb();
-		if (i == 7) {
-			local |= EEPROM_WRITE_ENABLE;
-			writel(local, &regs->LocalCtrl);
-			readl(&regs->LocalCtrl);
-			mb();
-			udelay(ACE_SHORT_DELAY);
-		}
-	}
-
-	local |= EEPROM_DATA_OUT;
-	writel(local, &regs->LocalCtrl);
-	readl(&regs->LocalCtrl);
-	mb();
-	udelay(ACE_SHORT_DELAY);
-	writel(readl(&regs->LocalCtrl) | EEPROM_CLK_OUT, &regs->LocalCtrl);
-	readl(&regs->LocalCtrl);
-	udelay(ACE_LONG_DELAY);
-	writel(readl(&regs->LocalCtrl) & ~EEPROM_CLK_OUT, &regs->LocalCtrl);
-	readl(&regs->LocalCtrl);
-	mb();
-	udelay(ACE_SHORT_DELAY);
-	eeprom_stop(regs);
-
-	local_irq_restore(flags);
- out:
-	return result;
-
- eeprom_read_error:
-	printk(KERN_ERR "%s: Unable to read eeprom byte 0x%02lx\n",
-	       ap->name, offset);
-	goto out;
-}
-
-module_pci_driver(acenic_pci_driver);
diff --git a/arch/loongarch/configs/loongson32_defconfig b/arch/loongarch/configs/loongson32_defconfig
index 276b1577e0be..37e5eada5a67 100644
--- a/arch/loongarch/configs/loongson32_defconfig
+++ b/arch/loongarch/configs/loongson32_defconfig
@@ -571,7 +571,6 @@ CONFIG_VIRTIO_NET=m
 # CONFIG_NET_VENDOR_ADAPTEC is not set
 # CONFIG_NET_VENDOR_AGERE is not set
 # CONFIG_NET_VENDOR_ALACRITECH is not set
-# CONFIG_NET_VENDOR_ALTEON is not set
 # CONFIG_NET_VENDOR_AMAZON is not set
 # CONFIG_NET_VENDOR_AMD is not set
 # CONFIG_NET_VENDOR_AQUANTIA is not set
diff --git a/arch/loongarch/configs/loongson64_defconfig b/arch/loongarch/configs/loongson64_defconfig
index a14db1a95e7e..7648f6c73929 100644
--- a/arch/loongarch/configs/loongson64_defconfig
+++ b/arch/loongarch/configs/loongson64_defconfig
@@ -587,7 +587,6 @@ CONFIG_VIRTIO_NET=m
 # CONFIG_NET_VENDOR_ADAPTEC is not set
 # CONFIG_NET_VENDOR_AGERE is not set
 # CONFIG_NET_VENDOR_ALACRITECH is not set
-# CONFIG_NET_VENDOR_ALTEON is not set
 # CONFIG_NET_VENDOR_AMAZON is not set
 # CONFIG_NET_VENDOR_AMD is not set
 # CONFIG_NET_VENDOR_AQUANTIA is not set
diff --git a/arch/mips/configs/cavium_octeon_defconfig b/arch/mips/configs/cavium_octeon_defconfig
index 68c363366bce..64da32b570aa 100644
--- a/arch/mips/configs/cavium_octeon_defconfig
+++ b/arch/mips/configs/cavium_octeon_defconfig
@@ -60,7 +60,6 @@ CONFIG_PATA_OCTEON_CF=y
 CONFIG_NETDEVICES=y
 # CONFIG_NET_VENDOR_3COM is not set
 # CONFIG_NET_VENDOR_ADAPTEC is not set
-# CONFIG_NET_VENDOR_ALTEON is not set
 # CONFIG_NET_VENDOR_AMD is not set
 # CONFIG_NET_VENDOR_ATHEROS is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
diff --git a/arch/mips/configs/loongson2k_defconfig b/arch/mips/configs/loongson2k_defconfig
index a5c50b63d478..ca534a6b66de 100644
--- a/arch/mips/configs/loongson2k_defconfig
+++ b/arch/mips/configs/loongson2k_defconfig
@@ -137,7 +137,6 @@ CONFIG_NETDEVICES=y
 CONFIG_TUN=m
 # CONFIG_NET_VENDOR_3COM is not set
 # CONFIG_NET_VENDOR_ADAPTEC is not set
-# CONFIG_NET_VENDOR_ALTEON is not set
 # CONFIG_NET_VENDOR_AMD is not set
 # CONFIG_NET_VENDOR_ARC is not set
 # CONFIG_NET_VENDOR_ATHEROS is not set
diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 575aaf242361..12cb1a6a1360 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -184,7 +184,6 @@ CONFIG_VETH=m
 CONFIG_VIRTIO_NET=m
 # CONFIG_NET_VENDOR_3COM is not set
 # CONFIG_NET_VENDOR_ADAPTEC is not set
-# CONFIG_NET_VENDOR_ALTEON is not set
 # CONFIG_NET_VENDOR_AMD is not set
 # CONFIG_NET_VENDOR_ARC is not set
 # CONFIG_NET_VENDOR_ATHEROS is not set
diff --git a/arch/mips/configs/malta_qemu_32r6_defconfig b/arch/mips/configs/malta_qemu_32r6_defconfig
index accb471a1d93..dafc9a716e85 100644
--- a/arch/mips/configs/malta_qemu_32r6_defconfig
+++ b/arch/mips/configs/malta_qemu_32r6_defconfig
@@ -85,7 +85,6 @@ CONFIG_ATA_GENERIC=y
 CONFIG_NETDEVICES=y
 # CONFIG_NET_VENDOR_3COM is not set
 # CONFIG_NET_VENDOR_ADAPTEC is not set
-# CONFIG_NET_VENDOR_ALTEON is not set
 CONFIG_PCNET32=y
 # CONFIG_NET_VENDOR_ATHEROS is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
diff --git a/arch/mips/configs/maltaaprp_defconfig b/arch/mips/configs/maltaaprp_defconfig
index 6bda67c5f68f..7361bca6a405 100644
--- a/arch/mips/configs/maltaaprp_defconfig
+++ b/arch/mips/configs/maltaaprp_defconfig
@@ -87,7 +87,6 @@ CONFIG_ATA_GENERIC=y
 CONFIG_NETDEVICES=y
 # CONFIG_NET_VENDOR_3COM is not set
 # CONFIG_NET_VENDOR_ADAPTEC is not set
-# CONFIG_NET_VENDOR_ALTEON is not set
 CONFIG_PCNET32=y
 # CONFIG_NET_VENDOR_ATHEROS is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
diff --git a/arch/mips/configs/maltasmvp_defconfig b/arch/mips/configs/maltasmvp_defconfig
index e4082537f80f..c848a1bfca5c 100644
--- a/arch/mips/configs/maltasmvp_defconfig
+++ b/arch/mips/configs/maltasmvp_defconfig
@@ -86,7 +86,6 @@ CONFIG_ATA_PIIX=y
 CONFIG_NETDEVICES=y
 # CONFIG_NET_VENDOR_3COM is not set
 # CONFIG_NET_VENDOR_ADAPTEC is not set
-# CONFIG_NET_VENDOR_ALTEON is not set
 CONFIG_PCNET32=y
 # CONFIG_NET_VENDOR_ATHEROS is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
diff --git a/arch/mips/configs/maltasmvp_eva_defconfig b/arch/mips/configs/maltasmvp_eva_defconfig
index 58f5af45fa98..905248e01b95 100644
--- a/arch/mips/configs/maltasmvp_eva_defconfig
+++ b/arch/mips/configs/maltasmvp_eva_defconfig
@@ -89,7 +89,6 @@ CONFIG_ATA_GENERIC=y
 CONFIG_NETDEVICES=y
 # CONFIG_NET_VENDOR_3COM is not set
 # CONFIG_NET_VENDOR_ADAPTEC is not set
-# CONFIG_NET_VENDOR_ALTEON is not set
 CONFIG_PCNET32=y
 # CONFIG_NET_VENDOR_ATHEROS is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
diff --git a/arch/mips/configs/maltaup_defconfig b/arch/mips/configs/maltaup_defconfig
index 9bfef7de0d1c..b9bbe02f3595 100644
--- a/arch/mips/configs/maltaup_defconfig
+++ b/arch/mips/configs/maltaup_defconfig
@@ -86,7 +86,6 @@ CONFIG_ATA_GENERIC=y
 CONFIG_NETDEVICES=y
 # CONFIG_NET_VENDOR_3COM is not set
 # CONFIG_NET_VENDOR_ADAPTEC is not set
-# CONFIG_NET_VENDOR_ALTEON is not set
 CONFIG_PCNET32=y
 # CONFIG_NET_VENDOR_ATHEROS is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
diff --git a/arch/mips/configs/mtx1_defconfig b/arch/mips/configs/mtx1_defconfig
index 77050ae3945f..2428a6a72747 100644
--- a/arch/mips/configs/mtx1_defconfig
+++ b/arch/mips/configs/mtx1_defconfig
@@ -257,7 +257,6 @@ CONFIG_PCMCIA_3C589=m
 CONFIG_VORTEX=m
 CONFIG_TYPHOON=m
 CONFIG_ADAPTEC_STARFIRE=m
-CONFIG_ACENIC=m
 CONFIG_AMD8111_ETH=m
 CONFIG_PCNET32=m
 CONFIG_PCMCIA_NMCLAN=m
diff --git a/arch/parisc/configs/generic-32bit_defconfig b/arch/parisc/configs/generic-32bit_defconfig
index 5444ce6405f3..ad2fb69184f3 100644
--- a/arch/parisc/configs/generic-32bit_defconfig
+++ b/arch/parisc/configs/generic-32bit_defconfig
@@ -78,7 +78,6 @@ CONFIG_DUMMY=m
 CONFIG_TUN=m
 # CONFIG_NET_VENDOR_3COM is not set
 # CONFIG_NET_VENDOR_ADAPTEC is not set
-# CONFIG_NET_VENDOR_ALTEON is not set
 # CONFIG_NET_VENDOR_AMD is not set
 # CONFIG_NET_VENDOR_ATHEROS is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
diff --git a/arch/parisc/configs/generic-64bit_defconfig b/arch/parisc/configs/generic-64bit_defconfig
index ce91f9d1fdbf..b21287a9250c 100644
--- a/arch/parisc/configs/generic-64bit_defconfig
+++ b/arch/parisc/configs/generic-64bit_defconfig
@@ -97,7 +97,6 @@ CONFIG_NETCONSOLE_DYNAMIC=y
 CONFIG_TUN=y
 # CONFIG_NET_VENDOR_3COM is not set
 # CONFIG_NET_VENDOR_ADAPTEC is not set
-# CONFIG_NET_VENDOR_ALTEON is not set
 # CONFIG_NET_VENDOR_AMD is not set
 # CONFIG_NET_VENDOR_ATHEROS is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
diff --git a/arch/powerpc/configs/44x/akebono_defconfig b/arch/powerpc/configs/44x/akebono_defconfig
index 02e88648a2e6..11ad5ed3cc90 100644
--- a/arch/powerpc/configs/44x/akebono_defconfig
+++ b/arch/powerpc/configs/44x/akebono_defconfig
@@ -47,7 +47,6 @@ CONFIG_SATA_AHCI_PLATFORM=y
 # CONFIG_ATA_SFF is not set
 # CONFIG_NET_VENDOR_3COM is not set
 # CONFIG_NET_VENDOR_ADAPTEC is not set
-# CONFIG_NET_VENDOR_ALTEON is not set
 # CONFIG_NET_VENDOR_AMD is not set
 # CONFIG_NET_VENDOR_ARC is not set
 # CONFIG_NET_VENDOR_ATHEROS is not set
diff --git a/arch/powerpc/configs/g5_defconfig b/arch/powerpc/configs/g5_defconfig
index 428f17b45513..4247d9a30eba 100644
--- a/arch/powerpc/configs/g5_defconfig
+++ b/arch/powerpc/configs/g5_defconfig
@@ -92,8 +92,6 @@ CONFIG_NETDEVICES=y
 CONFIG_BONDING=m
 CONFIG_DUMMY=m
 CONFIG_TUN=m
-CONFIG_ACENIC=m
-CONFIG_ACENIC_OMIT_TIGON_I=y
 CONFIG_TIGON3=y
 CONFIG_E1000=y
 CONFIG_SUNGEM=y
diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index 9ac746cfb4be..ce72c6d22ca2 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -158,8 +158,6 @@ CONFIG_NETCONSOLE=m
 CONFIG_TUN=m
 CONFIG_VETH=m
 CONFIG_VORTEX=m
-CONFIG_ACENIC=m
-CONFIG_ACENIC_OMIT_TIGON_I=y
 CONFIG_PCNET32=m
 CONFIG_TIGON3=y
 CONFIG_BNX2X=m
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 2b0720f2753b..7603af319385 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -204,8 +204,6 @@ CONFIG_NETCONSOLE=y
 CONFIG_TUN=m
 CONFIG_VIRTIO_NET=m
 CONFIG_VORTEX=m
-CONFIG_ACENIC=m
-CONFIG_ACENIC_OMIT_TIGON_I=y
 CONFIG_PCNET32=m
 CONFIG_TIGON3=y
 CONFIG_BNX2X=m
diff --git a/arch/powerpc/configs/ppc64e_defconfig b/arch/powerpc/configs/ppc64e_defconfig
index 90247b2a0ab0..e44c65693b51 100644
--- a/arch/powerpc/configs/ppc64e_defconfig
+++ b/arch/powerpc/configs/ppc64e_defconfig
@@ -96,8 +96,6 @@ CONFIG_DUMMY=m
 CONFIG_NETCONSOLE=y
 CONFIG_TUN=m
 CONFIG_VORTEX=y
-CONFIG_ACENIC=y
-CONFIG_ACENIC_OMIT_TIGON_I=y
 CONFIG_PCNET32=y
 CONFIG_TIGON3=y
 CONFIG_E100=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 3c08f46f3d41..b70307b70af0 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -410,7 +410,6 @@ CONFIG_PCMCIA_3C589=m
 CONFIG_VORTEX=m
 CONFIG_TYPHOON=m
 CONFIG_ADAPTEC_STARFIRE=m
-CONFIG_ACENIC=m
 CONFIG_AMD8111_ETH=m
 CONFIG_PCNET32=m
 CONFIG_PCMCIA_NMCLAN=m
diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 86c74146824a..ff1bed4b6d2c 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -125,8 +125,6 @@ CONFIG_DM_MULTIPATH=m
 # CONFIG_NET_VENDOR_ADAPTEC is not set
 # CONFIG_NET_VENDOR_AGERE is not set
 # CONFIG_NET_VENDOR_ALACRITECH is not set
-CONFIG_ACENIC=m
-CONFIG_ACENIC_OMIT_TIGON_I=y
 # CONFIG_NET_VENDOR_AMAZON is not set
 # CONFIG_NET_VENDOR_AMD is not set
 # CONFIG_NET_VENDOR_AQUANTIA is not set
diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_defconfig
index 98fd0a2f51c6..2a94abcabd72 100644
--- a/arch/s390/configs/debug_defconfig
+++ b/arch/s390/configs/debug_defconfig
@@ -524,7 +524,6 @@ CONFIG_NLMON=m
 # CONFIG_NET_VENDOR_ADAPTEC is not set
 # CONFIG_NET_VENDOR_AGERE is not set
 # CONFIG_NET_VENDOR_ALACRITECH is not set
-# CONFIG_NET_VENDOR_ALTEON is not set
 # CONFIG_NET_VENDOR_AMAZON is not set
 # CONFIG_NET_VENDOR_AMD is not set
 # CONFIG_NET_VENDOR_AQUANTIA is not set
diff --git a/arch/s390/configs/defconfig b/arch/s390/configs/defconfig
index 0f4cedcab3ce..763fc7db101f 100644
--- a/arch/s390/configs/defconfig
+++ b/arch/s390/configs/defconfig
@@ -514,7 +514,6 @@ CONFIG_NLMON=m
 # CONFIG_NET_VENDOR_ADAPTEC is not set
 # CONFIG_NET_VENDOR_AGERE is not set
 # CONFIG_NET_VENDOR_ALACRITECH is not set
-# CONFIG_NET_VENDOR_ALTEON is not set
 # CONFIG_NET_VENDOR_AMAZON is not set
 # CONFIG_NET_VENDOR_AMD is not set
 # CONFIG_NET_VENDOR_AQUANTIA is not set
diff --git a/rust/kernel/pci/id.rs b/rust/kernel/pci/id.rs
index 50005d176561..dc2035a4c175 100644
--- a/rust/kernel/pci/id.rs
+++ b/rust/kernel/pci/id.rs
@@ -428,7 +428,6 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
     TRANSMETA                = bindings::PCI_VENDOR_ID_TRANSMETA,                // 0x1279
     ROCKWELL                 = bindings::PCI_VENDOR_ID_ROCKWELL,                 // 0x127A
     ITE                      = bindings::PCI_VENDOR_ID_ITE,                      // 0x1283
-    ALTEON                   = bindings::PCI_VENDOR_ID_ALTEON,                   // 0x12ae
     NVIDIA_SGS               = bindings::PCI_VENDOR_ID_NVIDIA_SGS,               // 0x12d2
     PERICOM                  = bindings::PCI_VENDOR_ID_PERICOM,                  // 0x12D8
     AUREAL                   = bindings::PCI_VENDOR_ID_AUREAL,                   // 0x12eb
-- 
2.53.0


