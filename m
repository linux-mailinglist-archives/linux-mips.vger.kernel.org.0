Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02AAA182C87
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2020 10:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbgCLJe1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Mar 2020 05:34:27 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46209 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgCLJe1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 12 Mar 2020 05:34:27 -0400
Received: by mail-pg1-f193.google.com with SMTP id y30so2770805pga.13
        for <linux-mips@vger.kernel.org>; Thu, 12 Mar 2020 02:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=/j8Mk9K9ZO4s2g2oK65oo7oRibebb73yvO/I8invN3k=;
        b=CwBZ9LxLN3Y2eZrX/CgMdnhniUccSjahfSXhyrOa7AvpNb+hbmkdmgCZSqzIwGPvZE
         BKPauisCF1cLQcePvsG7dCAG6cb88gPYReuQm2WbI59VcFiK+Dq/5spwSLxzMhMdC2fz
         O0qRL1fM482OqOcyWv8SqyyzbVgLV1HZ8D8Vv5yu/LqnzujgKDiZCjELne0U4tFnfqPf
         StL4227pQZJUO6rA647ro5mjorAogz+VElok81Rhsd+f7xL32/6pDEriSpMpRoLLi5Sy
         Y7J5FrTgl+Xzj2QuixXis2p+M3qtJ/M+bcfn2CDVbvQ7XOE0hBFcVD04uJAhKRyGbBDC
         wrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=/j8Mk9K9ZO4s2g2oK65oo7oRibebb73yvO/I8invN3k=;
        b=OF1qclxvMNdj3ifYD+dLg4mPrrOTlYBK/Bl3/mmwjuWm9P2ZQpacUlPdBndUZY1fjL
         eVWuWyPW6WxSb9Ikg4TG0RCa2Xa3EIOMEzyeA3NEfkMO2nEPrp88zMppNQoOhjNclbL8
         k8jjh99RVcUL7Dl8A1fR/A7YsgXYALmCC1ws1/Eq/1E3KzOWbryGzSz+1M946lbbBXd6
         8U7vngWxZsOktfDJhrVNM/Hwk6xrJwKK9uMop0/0SvQjq62cjJnpRS4vXq1zmGR1PajC
         XnRIpT1yRGclJb7ZmNKTI19RlUJolV5GruKbHRhxoebhkx1kJ+x1iXuvPLYhDWmzZqkN
         IbLA==
X-Gm-Message-State: ANhLgQ3xJDCso/GzNdHtli0l0uZQRhiZzHBgfK0dw01CCi/FlmM4kYFa
        jTYkmyv2cMmKT+xGuZPlqeo=
X-Google-Smtp-Source: ADFU+vtdTbCXRsWKaCAZeE89GiElIGp0z9hLBbVmIvNnEoARkdqs3/NhI+3VWQ1fLVEImVHPlh2L2Q==
X-Received: by 2002:a62:ed0b:: with SMTP id u11mr7263596pfh.46.1584005665874;
        Thu, 12 Mar 2020 02:34:25 -0700 (PDT)
Received: from software.domain.org ([103.118.43.97])
        by smtp.gmail.com with ESMTPSA id 139sm31012357pfy.70.2020.03.12.02.34.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 12 Mar 2020 02:34:25 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V3 Resend] MIPS: Loongson: Add board_ebase_setup() support
Date:   Thu, 12 Mar 2020 17:41:57 +0800
Message-Id: <1584006117-28985-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The EBase registers of old Loongson processor models before 3A2000 are
32bit and have no WG bit; those of newer models are 64bit and do have
the WG bit.

Unfortunately, dynamically allocated EBase addresses do not work well
for the Loongson platform, because Loongson's memory layout is very
limited below 0x20000000. The dynamically allocated EBase address above
0x20000000 is thus unmappable to a KSEG0/KSEG1 virtual address, but the
cache error handler MUST be in KSEG1 (please see set_uncached_handler()
in traps.c).

Some might suggest that the cache error handler is hardly used so this
is not a problem, but Loongson's MMIO configuration registers might be
corrupted by set_uncached_handler().

To make Linux kernel on Loongson more robust, a board_ebase_setup() hook
is added to ensure CKSEG0 is always used for EBase. This is also useful
for configurations where firmware-provided EBase is not sane.

Maybe this problem is present for all MIPSr2 processors, but it seems
not all platforms have memory at physical address 0. So this patch only
touches Loongson.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/loongson64/init.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index 5ac1a0f..b8e54e1 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -13,6 +13,16 @@
 
 #include <loongson.h>
 
+static void __init mips_ebase_setup(void)
+{
+	ebase = CKSEG0;
+
+	if (cpu_has_ebase_wg)
+		write_c0_ebase(ebase | MIPS_EBASE_WG);
+
+	write_c0_ebase(ebase);
+}
+
 static void __init mips_nmi_setup(void)
 {
 	void *base;
@@ -38,6 +48,7 @@ void __init prom_init(void)
 	setup_8250_early_printk_port(TO_UNCAC(LOONGSON_REG_BASE + 0x1e0), 0, 1024);
 
 	register_smp_ops(&loongson3_smp_ops);
+	board_ebase_setup = mips_ebase_setup;
 	board_nmi_handler_setup = mips_nmi_setup;
 }
 
-- 
2.7.0

