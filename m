Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0276128F9F0
	for <lists+linux-mips@lfdr.de>; Thu, 15 Oct 2020 22:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392138AbgJOULZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Oct 2020 16:11:25 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:47315 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2392062AbgJOULY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 15 Oct 2020 16:11:24 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id C9AB29E2;
        Thu, 15 Oct 2020 16:11:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 15 Oct 2020 16:11:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com.au;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=Zsd6A3WINXnSE
        4TDtzXACX2rQA6Nb3nnjgJZqqBm4Og=; b=lcgxAmdYYv6T8YPEdsa6DM5gr1zkc
        BjJ4FlXvJgVrEtRYbCfCeUB1f8YArSF2yt7IJlDb+ls4UszB06Rmc/Tt1DJ7JZ5x
        U9quTCu85Ni1W3P8Z6gcLZAKgplOkU/WIW4gFwjdM91FO22l+FXHfhkpumI/l7MU
        +ZgBgqxWQ4C6raLAtdSqmX5/nhjsrSQhxjHq7cVRtrBwIZflujvX5R7rxwwM4QXD
        0kUNskLNk+dDEt5rTteM39LCe/mCpyoDokP0SDQYpZtgkxJDlfxV78tcbKvHaIf9
        TnMPfbWNJalAq72sRsH9UtOvFqxcRGb1Bhw7BvSyDmh/NJ07NJc61Ah9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=Zsd6A3WINXnSE4TDtzXACX2rQA6Nb3nnjgJZqqBm4Og=; b=DxW+ivUX
        KYdbcx5SJwQ2X1YbmalfsmaK8yeOgQX1NNOIzUnCRNMDECZ6aENajrrX/Kk9PvDN
        8P92SwmhEU2nXAwS1L8fD5pKie7Qigaa4M9TSDerOT6SUHsSi0mOBDpqu0lcOTUR
        y2SQdWsHXFjVbXx5QZWf33jkgdqKOir9dqeILg4Ie7In8Jgkfqbp/XTC6G0d3c4h
        M8jwnbQ7EmnhJwsWe+zINar3icmy4+m08ZyHSt1IJuUQT2EgCMmlotm2vuhDou9A
        7Q2F5tb6ZozKm0UUHVo9LVVxGEosmEVmw5V/QV40L5pKHNtDaUWgUfk7jhKrFQ2n
        BkpuEB+d88yMrA==
X-ME-Sender: <xms:66yIXz904_LpVP9ibmaOnHSxgd7IZPDSVs7Qb8GNWSchewdiFH87PQ>
    <xme:66yIX_s0U9mmKk17Xqt_PF4uqhYAzb2LE0oJgg3Wz6sHyTLe1YXl47XVyEFs66f_X
    s2nwmGl03RtmDMB2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrieefgddugeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeflohhhnhcu
    vfhhohhmshhonhcuoehgihhtsehjohhhnhhthhhomhhsohhnrdhfrghsthhmrghilhdrtg
    homhdrrghuqeenucggtffrrghtthgvrhhnpefgfeffuefgfefghfekgfejhffgvedtfeev
    keduleethedtgeekffffgfdtfffgveenucffohhmrghinheplhgushdrshgsnecukfhppe
    ehkedrudeihedrudeluddrieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepghhithesjhhohhhnthhhohhmshhonhdrfhgrshhtmhgrihhlrd
    gtohhmrdgruh
X-ME-Proxy: <xmx:66yIXxBpy8JCaWTxMhc0eiZCdhhZd-9Z6pZWDdjDTOTwXWSS5YxOkg>
    <xmx:66yIX_eHo7CgNQfFJetAWkiplYrt-A3ubH3kafUALymCP0TyqVzhsg>
    <xmx:66yIX4OSwOdJrNQLHS7x79jTyZLNWPau0gVabj0AVj-IXBH3A4QeqQ>
    <xmx:66yIXy37kIHrqHCySbZ3lN_ZTfHX3zVquUolpSGikXF8rOhNiORc3A>
Received: from john.thome.spur.red (unknown [58.165.191.67])
        by mail.messagingengine.com (Postfix) with ESMTPA id 6BF96328005D;
        Thu, 15 Oct 2020 16:11:21 -0400 (EDT)
From:   John Thomson <git@johnthomson.fastmail.com.au>
To:     linux-mips@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org,
        John Thomson <git@johnthomson.fastmail.com.au>
Subject: [PATCH 2/2] mips: boot compressed: add support for vlinuz ELF DTB
Date:   Fri, 16 Oct 2020 06:11:00 +1000
Message-Id: <20201015201100.4130-2-git@johnthomson.fastmail.com.au>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015201100.4130-1-git@johnthomson.fastmail.com.au>
References: <20201015201100.4130-1-git@johnthomson.fastmail.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

For legacy bootloader devices that do not support DTB,
and only support booting ELF, or have issues booting large ELF files.

vmlinux (objcopy to bytecode then compressed for vmlinuz)
requires MIPS_RAW_APPENDED_DTB, then
vmlinuz may use MIPS_ELF_APPENDED_DTB_VMLINUZ, and insert the DTB into
the ELF:

objcopy --update-section .appended_dtb=<filename>.dtb vmlinuz

Signed-off-by: John Thomson <git@johnthomson.fastmail.com.au>
---
 arch/mips/Kconfig                       | 21 +++++++++++++++++++++
 arch/mips/boot/compressed/decompress.c  |  4 ++++
 arch/mips/boot/compressed/vmlinuz.lds.S |  9 +++++++++
 3 files changed, 34 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 8f328298f8c..2749d46be9e 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3098,6 +3098,27 @@ choice
 		  if you don't intend to always append a DTB.
 endchoice
 
+config MIPS_ELF_APPENDED_DTB_VMLINUZ
+	bool "vmlinuz (ELF self-decompressing kernel) appended DTB support"
+	depends on MIPS_RAW_APPENDED_DTB && SYS_SUPPORTS_ZBOOT
+	help
+	  With this option, the vmlinuz (self-decompressing kernel ELF binary)
+	  boot code will look for a device tree binary (DTB|FDT) included in
+	  the vmlinux ELF section .appended_dtb. By default it is empty and
+	  the DTB can be appended using binutils command
+	  objcopy:
+
+	    objcopy --update-section .appended_dtb=<filename>.dtb vmlinuz
+
+	  This is meant as a backward compatiblity convenience for those
+	  systems with a bootloader that can't be upgraded to accommodate
+	  the documented boot protocol using a device tree.
+
+	  vmlinuz uses the compressed vmlinux.bin, thus vmlinux must use
+	  MIPS_RAW_APPENDED_DTB to expect a DTB at the end-of-uncompressed
+	  kernel location. vmlinuz copies the DTB to this location after kernel
+	  decompression.
+
 choice
 	prompt "Kernel command line type" if !CMDLINE_OVERRIDE
 	default MIPS_CMDLINE_FROM_DTB if USE_OF && !ATH79 && !MACH_INGENIC && \
diff --git a/arch/mips/boot/compressed/decompress.c b/arch/mips/boot/compressed/decompress.c
index 88f5d637b1c..cd1a47c69e3 100644
--- a/arch/mips/boot/compressed/decompress.c
+++ b/arch/mips/boot/compressed/decompress.c
@@ -33,7 +33,11 @@ extern void puthex(unsigned long long val);
 #define puthex(val) do {} while (0)
 #endif
 
+#ifdef CONFIG_MIPS_ELF_APPENDED_DTB_VMLINUZ
+unsigned char __section(.appended_dtb) __appended_dtb[0x100000];
+#else
 extern char __appended_dtb[];
+#endif
 
 void error(char *x)
 {
diff --git a/arch/mips/boot/compressed/vmlinuz.lds.S b/arch/mips/boot/compressed/vmlinuz.lds.S
index 890c31c55c1..f5a35b60059 100644
--- a/arch/mips/boot/compressed/vmlinuz.lds.S
+++ b/arch/mips/boot/compressed/vmlinuz.lds.S
@@ -31,9 +31,18 @@ SECTIONS
 		CONSTRUCTORS
 		. = ALIGN(16);
 	}
+
+#ifdef CONFIG_MIPS_ELF_APPENDED_DTB_VMLINUZ
+	/* keep the empty unreferenced ELF DTB section */
+	.appended_dtb : {
+		*(.appended_dtb)
+		KEEP(*(.appended_dtb))
+	}
+#else
 	__appended_dtb = .;
 	/* leave space for appended DTB */
 	. += 0x100000;
+#endif /* _APPENDED_DTB */
 
 	_edata = .;
 	/* End of data section */
-- 
2.28.0

