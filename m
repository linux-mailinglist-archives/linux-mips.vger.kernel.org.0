Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8981D3E8C72
	for <lists+linux-mips@lfdr.de>; Wed, 11 Aug 2021 10:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233605AbhHKIwA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Aug 2021 04:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236374AbhHKIv6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Aug 2021 04:51:58 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77EB0C0613D3
        for <linux-mips@vger.kernel.org>; Wed, 11 Aug 2021 01:51:35 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by andre.telenet-ops.be with bizsmtp
        id g8rG2500S1gJxCh018rGYb; Wed, 11 Aug 2021 10:51:32 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDjxE-001ya9-4k; Wed, 11 Aug 2021 10:51:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDjxD-0058wr-AC; Wed, 11 Aug 2021 10:51:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Kossifidis <mick@ics.forth.gr>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Frank Rowand <frowand.list@gmail.com>,
        Dave Young <dyoung@redhat.com>
Cc:     Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
        Mike Rapoport <rppt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 2/9] crash_dump: Make elfcorehdr address/size symbols always visible
Date:   Wed, 11 Aug 2021 10:51:00 +0200
Message-Id: <ba965ca613c0cc82c1ec2fe353ee34fb13b36474.1628670468.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628670468.git.geert+renesas@glider.be>
References: <cover.1628670468.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Make the forward declarations of elfcorehdr_addr and elfcorehdr_size,
and the definitions of ELFCORE_ADDR_MAX and ELFCORE_ADDR_ERR always
available, like is done for phys_initrd_start and phys_initrd_size.
Code referring to these symbols can then just check for
IS_ENABLED(CONFIG_CRASH_DUMP), instead of requiring conditional
compilation using an #ifdef, thus preparing to increase compile
coverage.

Suggested-by: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5:
  - Make ELFCORE_ADDR_{MAX,ERR} visible, too,

v4:
  - New.
---
 include/linux/crash_dump.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/crash_dump.h b/include/linux/crash_dump.h
index a5192b718dbe4f9a..2618577a4d6da77e 100644
--- a/include/linux/crash_dump.h
+++ b/include/linux/crash_dump.h
@@ -10,13 +10,14 @@
 
 #include <linux/pgtable.h> /* for pgprot_t */
 
-#ifdef CONFIG_CRASH_DUMP
+/* For IS_ENABLED(CONFIG_CRASH_DUMP) */
 #define ELFCORE_ADDR_MAX	(-1ULL)
 #define ELFCORE_ADDR_ERR	(-2ULL)
 
 extern unsigned long long elfcorehdr_addr;
 extern unsigned long long elfcorehdr_size;
 
+#ifdef CONFIG_CRASH_DUMP
 extern int elfcorehdr_alloc(unsigned long long *addr, unsigned long long *size);
 extern void elfcorehdr_free(unsigned long long addr);
 extern ssize_t elfcorehdr_read(char *buf, size_t count, u64 *ppos);
-- 
2.25.1

