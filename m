Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC483E0B0D
	for <lists+linux-mips@lfdr.de>; Thu,  5 Aug 2021 02:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233915AbhHEACd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Aug 2021 20:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbhHEACc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 4 Aug 2021 20:02:32 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB62AC0613D5;
        Wed,  4 Aug 2021 17:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=M9jCRHqmiUocu+jG8+2QqgsQS7cUPzEMoGSoEbKbCCU=; b=gSDRn8aFjSBuefsUbMv1fSFLsS
        3NNuCezwlMvwQl6Lyhn4AcYDgJtBPkjq9x/iIlHajsBOAc+Iza8sO+ubqS1xUPgzqYDdD5VALGHJ6
        2r5ao6bhnwGOVSUcf/EkVqnS3JdHtESafnChl58jJ+cwHRIEBGcj5WFQDjVQ2CPchJo7NzfWzZ476
        lw5+4LACdHwxSg+Vda/AMWQ0UB7WT1kQikCgiYgSzk6/eM3ILC8oxyilv1SEb6icKbotW6uzsnjHF
        CKnn3+uq2Ph9Sn227yUtXlV53VZYE7mAicXNvsCYBeNjf0h3klxw6piO/xjUraWUM6JDEk4YGyFGO
        c+YAR/FA==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mBQq1-007iI6-0g; Thu, 05 Aug 2021 00:02:17 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: loongson2ef: don't build serial.o unconditionally
Date:   Wed,  4 Aug 2021 17:02:16 -0700
Message-Id: <20210805000216.31833-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

LOONGSON_UART_BASE depends on EARLY_PRINTK || SERIAL_8250, but when
neither of these Kconfig symbols is set, the kernel build has errors:

../arch/mips/loongson2ef/common/serial.c: In function 'serial_init':
../arch/mips/loongson2ef/common/serial.c:66:25: error: 'loongson_uart_base' undeclared (first use in this function)
   66 |                         loongson_uart_base;
../arch/mips/loongson2ef/common/serial.c:66:25: note: each undeclared identifier is reported only once for each function it appears in
../arch/mips/loongson2ef/common/serial.c:68:41: error: '_loongson_uart_base' undeclared (first use in this function)
   68 |                         (void __iomem *)_loongson_uart_base;

Fix this by building serial.o only when one (or both) of these
Kconfig symbols is enabled.

Tested with:
	(a) EARLY_PRINTK=y, SERIAL_8250 not set;
	(b) EARLY_PRINTK=y, SERIAL_8250=y;
	(c) EARLY_PRINTK=y, SERIAL_8250=m.
	(d) EARLY_PRINTK not set, SERIAL_8250=y;
	(e) EARLY_PRINTK not set, SERIAL_8250=m;
	(f) EARLY_PRINTK not set, SERIAL_8250 not set.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
---
 arch/mips/loongson2ef/common/Makefile |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--- linext-20210803.orig/arch/mips/loongson2ef/common/Makefile
+++ linext-20210803/arch/mips/loongson2ef/common/Makefile
@@ -4,12 +4,14 @@
 #
 
 obj-y += setup.o init.o env.o time.o reset.o irq.o \
-    bonito-irq.o mem.o machtype.o platform.o serial.o
+    bonito-irq.o mem.o machtype.o platform.o
 obj-$(CONFIG_PCI) += pci.o
 
 #
 # Serial port support
 #
+obj-$(CONFIG_LOONGSON_UART_BASE) += serial.o
+obj-$(CONFIG_EARLY_PRINTK) += serial.o
 obj-$(CONFIG_LOONGSON_UART_BASE) += uart_base.o
 obj-$(CONFIG_LOONGSON_MC146818) += rtc.o
 
