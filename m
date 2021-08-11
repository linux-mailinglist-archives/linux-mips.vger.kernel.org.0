Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00AF63E8C90
	for <lists+linux-mips@lfdr.de>; Wed, 11 Aug 2021 10:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236513AbhHKIwT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Aug 2021 04:52:19 -0400
Received: from newton.telenet-ops.be ([195.130.132.45]:53434 "EHLO
        newton.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236424AbhHKIwB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Aug 2021 04:52:01 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by newton.telenet-ops.be (Postfix) with ESMTPS id 4Gl3TL74lVzMqlKy
        for <linux-mips@vger.kernel.org>; Wed, 11 Aug 2021 10:51:34 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by baptiste.telenet-ops.be with bizsmtp
        id g8rG250091gJxCh018rG46; Wed, 11 Aug 2021 10:51:34 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDjxE-001yaE-4C; Wed, 11 Aug 2021 10:51:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDjxD-0058xK-E7; Wed, 11 Aug 2021 10:51:15 +0200
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
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [PATCH v5 6/9] riscv: Remove non-standard linux,elfcorehdr handling
Date:   Wed, 11 Aug 2021 10:51:04 +0200
Message-Id: <41c75d6ee3114ae6304f8afe0051895af91200ee.1628670468.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628670468.git.geert+renesas@glider.be>
References: <cover.1628670468.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

RISC-V uses platform-specific code to locate the elf core header in
memory.  However, this does not conform to the standard
"linux,elfcorehdr" DT bindings, as it relies on a reserved memory node
with the "linux,elfcorehdr" compatible value, instead of on a
"linux,elfcorehdr" property under the "/chosen" node.

The non-compliant code can just be removed, as the standard behavior is
already implemented by platform-agnostic handling in the FDT core code.

Fixes: 5640975003d0234d ("RISC-V: Add crash kernel support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
v5:
  - Add Reviewed-by, Acked-by,

v4:
  - No changes.
---
 arch/riscv/mm/init.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 88134cc288d9a60b..3f284b2d327166af 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -860,26 +860,6 @@ static void __init reserve_crashkernel(void)
 }
 #endif /* CONFIG_KEXEC_CORE */
 
-#ifdef CONFIG_CRASH_DUMP
-/*
- * We keep track of the ELF core header of the crashed
- * kernel with a reserved-memory region with compatible
- * string "linux,elfcorehdr". Here we register a callback
- * to populate elfcorehdr_addr/size when this region is
- * present. Note that this region will be marked as
- * reserved once we call early_init_fdt_scan_reserved_mem()
- * later on.
- */
-static int __init elfcore_hdr_setup(struct reserved_mem *rmem)
-{
-	elfcorehdr_addr = rmem->base;
-	elfcorehdr_size = rmem->size;
-	return 0;
-}
-
-RESERVEDMEM_OF_DECLARE(elfcorehdr, "linux,elfcorehdr", elfcore_hdr_setup);
-#endif
-
 void __init paging_init(void)
 {
 	setup_bootmem();
-- 
2.25.1

