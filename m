Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17D1910C5AD
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 10:09:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfK1JJt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 04:09:49 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:38648 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfK1JJt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 04:09:49 -0500
Received: by mail-pj1-f68.google.com with SMTP id l4so231063pjt.5
        for <linux-mips@vger.kernel.org>; Thu, 28 Nov 2019 01:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=CinX+wxadbl5WA2Zg4PxgiI+0CuYy15McX5c4hR/ePs=;
        b=ZaEeDAzh0VnjJMMoMfEiuV1KobmvbFtrUfVMOy2+ynb81EDLt4QHLhH2vRvH9YR3KH
         ChsbM2NBNABhpocmnbkYoJ7XLYvPTdICE+Zo8NRPJA5VCtPaN2WF5/wslH9TLxExUpDy
         kEb4ToapzDxHaVy2/0/B36+9W89HdsVbXG/iBsdUwSO2OEs3DPtZ6xHmFIpx1YcWmGRc
         vAMG+rCTzxGkGg5qi2zmQDfTI9N6VkS13zxxIVZ98jEuniT8xNtI3ktFRuGg+x2od2xc
         G5ZWWYgZnm3qpyPPFuSqB8dOBthYpF84orTAivskSHzSI2kjpl/XAvKCSAERtxQc+Bxt
         z7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=CinX+wxadbl5WA2Zg4PxgiI+0CuYy15McX5c4hR/ePs=;
        b=lzHSjKhVYa4oqDrQk6nbidqWZFxA7TDgpXYEDKGP/ZEnfsQ6CxLQgqCmzofbbVmZbu
         OciEANOiz0ITUtwA8RhQc8pEWWDvAV53o5NdPgpwJ25VYvtz75G8pBPhMUnSYmC5SR7o
         Urx+kQoWgX2CkJhCCcnTIXoifSXfVKLUqpjFTzk1dvZ4wOArQXvUSLyJxzqAihmZo0Pv
         cHPRLkpmedoApa9jkLdThTLtwLLFzsQHZgHEKIfi/BVUTgfI+NfuJi4VEYkOqc9ITddi
         e+LRwEVo5VmWdbFl3whxqk/e2X9ZphiErvkymi+2tSq5t4H7Me6/hO0U0EfRPVphCmMX
         KXBA==
X-Gm-Message-State: APjAAAVxejWxIQbCi26X9bazTY7zQwDp+yYHNDWUPu0eE8R9G0aXuXMv
        Cv1I7yDh7ELA0FMBi/CYsTg=
X-Google-Smtp-Source: APXvYqy1ZtUx+qU4EsnSBcJYMy7TbG2WJgk3wD4CKqtpujValAWH8BSpqEKfsqdO9L0ezcPJXSHgsw==
X-Received: by 2002:a17:90a:1089:: with SMTP id c9mr11790300pja.8.1574932188259;
        Thu, 28 Nov 2019 01:09:48 -0800 (PST)
Received: from software.domain.org (li566-100.members.linode.com. [192.155.80.100])
        by smtp.gmail.com with ESMTPSA id s15sm17059455pgq.4.2019.11.28.01.09.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 28 Nov 2019 01:09:47 -0800 (PST)
From:   Huacai Chen <chenhc@lemote.com>
To:     Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
Cc:     linux-mips@linux-mips.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V3] MIPS: Loongson: Add board_ebase_setup() support
Date:   Thu, 28 Nov 2019 17:13:09 +0800
Message-Id: <1574932389-17160-1-git-send-email-chenhc@lemote.com>
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
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index 912fe61..8e2047d 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -15,6 +15,16 @@
 
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
@@ -48,6 +58,7 @@ void __init prom_init(void)
 	setup_8250_early_printk_port(TO_UNCAC(LOONGSON_REG_BASE + 0x1e0), 0, 1024);
 
 	register_smp_ops(&loongson3_smp_ops);
+	board_ebase_setup = mips_ebase_setup;
 	board_nmi_handler_setup = mips_nmi_setup;
 }
 
-- 
2.7.0

