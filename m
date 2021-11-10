Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B501144BA8B
	for <lists+linux-mips@lfdr.de>; Wed, 10 Nov 2021 04:09:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbhKJDMg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Nov 2021 22:12:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbhKJDMf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Nov 2021 22:12:35 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EEA2C061764;
        Tue,  9 Nov 2021 19:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=FXmVtpJ4dtKVVY4Mzvp+Ukjb6evX82LYRB501Bqkq0c=; b=3RJHmjtQjn3v0nTHExO3JOmsfn
        /ce32uqK+QMm84FiS1Hz8U5/qXQGExx5MM3CIs1qilylAgmNGW8mTBvR6eWSEIR6B5P4ySvOWT0ba
        F8xQNrdxBlkiT/bx1SQWOCAmWomn0FNTBB5GkuRcukMx3it/OhpG5NfDRYW7qWbQTPY4RakyOlH+r
        Qi0Qsq85H2E8toxhKASnU1B69q2KPNP9uADj4JWdHUqiCFvVIJZ3mQFPCp7E50sCIUeTTYnvu3AFy
        6M5czQXxZsUpszHphS//ZqBpgCAFQZ8O6aJDmAPoFgRdaz2lzqpO3C8uPCuUgrcZoyipBQvj6Wdph
        3JFO3g7A==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mkdzf-004N91-MW; Wed, 10 Nov 2021 03:09:47 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: boot/compressed/: add __bswapdi2() to target for ZSTD decompression
Date:   Tue,  9 Nov 2021 19:09:44 -0800
Message-Id: <20211110030944.6733-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

For MIPS pre-boot, when CONFIG_KERNEL_ZSTD=y, the decompressor
function uses __bswapdi2(), so this object file should be added to
the target object file.

Fixes these build errors:

mips-linux-ld: arch/mips/boot/compressed/decompress.o: in function `xxh64':
decompress.c:(.text+0x8be0): undefined reference to `__bswapdi2'
mips-linux-ld: decompress.c:(.text+0x8c78): undefined reference to `__bswapdi2'
mips-linux-ld: decompress.c:(.text+0x8d04): undefined reference to `__bswapdi2'
mips-linux-ld: arch/mips/boot/compressed/decompress.o:decompress.c:(.text+0xa010): more undefined references to `__bswapdi2' follow

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/boot/compressed/Makefile |    6 ++++++
 1 file changed, 6 insertions(+)

--- linux-next-20211109.orig/arch/mips/boot/compressed/Makefile
+++ linux-next-20211109/arch/mips/boot/compressed/Makefile
@@ -56,6 +56,8 @@ $(obj)/uart-ath79.c: $(srctree)/arch/mip
 
 vmlinuzobjs-$(CONFIG_KERNEL_XZ) += $(obj)/ashldi3.o
 
+vmlinuzobjs-$(CONFIG_KERNEL_ZSTD) += $(obj)/bswapdi.o
+
 extra-y += ashldi3.c
 $(obj)/ashldi3.c: $(obj)/%.c: $(srctree)/lib/%.c FORCE
 	$(call if_changed,shipped)
@@ -64,6 +66,10 @@ extra-y += bswapsi.c
 $(obj)/bswapsi.c: $(obj)/%.c: $(srctree)/arch/mips/lib/%.c FORCE
 	$(call if_changed,shipped)
 
+extra-y += bswapdi.c
+$(obj)/bswapdi.c: $(obj)/%.c: $(srctree)/arch/mips/lib/%.c FORCE
+	$(call if_changed,shipped)
+
 targets := $(notdir $(vmlinuzobjs-y))
 
 targets += vmlinux.bin
