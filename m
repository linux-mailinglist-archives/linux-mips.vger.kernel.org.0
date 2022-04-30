Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39DF1515E94
	for <lists+linux-mips@lfdr.de>; Sat, 30 Apr 2022 17:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242657AbiD3PKk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 30 Apr 2022 11:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242673AbiD3PKi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 30 Apr 2022 11:10:38 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AB43B644C1;
        Sat, 30 Apr 2022 08:07:16 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id D0C4A9200B3; Sat, 30 Apr 2022 17:07:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id CD72292009D;
        Sat, 30 Apr 2022 16:07:15 +0100 (BST)
Date:   Sat, 30 Apr 2022 16:07:15 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc:     Joshua Kinard <kumba@gentoo.org>,
        Stephen Zhang <starzhangzsd@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH v2 2/2] MIPS: IP30: Remove incorrect `cpu_has_fpu' override
In-Reply-To: <alpine.DEB.2.21.2204301559030.9383@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2204301603530.9383@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2204301559030.9383@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove unsupported forcing of `cpu_has_fpu' to 1, which makes the `nofpu' 
kernel parameter non-functional, and also causes a link error:

ld: arch/mips/kernel/traps.o: in function `trap_init':
./arch/mips/include/asm/msa.h:(.init.text+0x348): undefined reference to `handle_fpe'
ld: ./arch/mips/include/asm/msa.h:(.init.text+0x354): undefined reference to `handle_fpe'
ld: ./arch/mips/include/asm/msa.h:(.init.text+0x360): undefined reference to `handle_fpe'

where the CONFIG_MIPS_FP_SUPPORT configuration option has been disabled.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
Fixes: 7505576d1c1a ("MIPS: add support for SGI Octane (IP30)")
Cc: stable@vger.kernel.org # v5.5+
---
Changes from v1:

- s/chosen/disabled/ in the change description.
---
 arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h |    1 -
 1 file changed, 1 deletion(-)

linux-mips-ip30-cpu-has-fpu.diff
Index: linux-macro/arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h
===================================================================
--- linux-macro.orig/arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h
+++ linux-macro/arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h
@@ -28,7 +28,6 @@
 #define cpu_has_4kex			1
 #define cpu_has_3k_cache		0
 #define cpu_has_4k_cache		1
-#define cpu_has_fpu			1
 #define cpu_has_nofpuex			0
 #define cpu_has_32fpr			1
 #define cpu_has_counter			1
