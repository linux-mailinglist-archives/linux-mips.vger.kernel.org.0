Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D306531DCB
	for <lists+linux-mips@lfdr.de>; Sat,  1 Jun 2019 15:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729603AbfFANZ6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Jun 2019 09:25:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:56320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729256AbfFANZ5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 1 Jun 2019 09:25:57 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 382A527375;
        Sat,  1 Jun 2019 13:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559395557;
        bh=zRNk1F+5d/zcwRLeFG+1vtDSoBYuQqDUjsCXFf/8Dek=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=muYYpu4RiPKtkurE6yHl+surB12mpJ2xlxN6DJRnCBGVGR3l4gYya07xB7QnV5bgj
         eiX1QaFDwJKWuTXr57LHYSMG6D/pvO7nJUMyllS6JbZm/KIdX4xXn5anIs4wAvf2d8
         6XheE3kaaoNuakUmyB5f/AIgXBo1Hgzo/kFOhTmQ=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Huacai Chen <chenhc@lemote.com>,
        Stefan Agner <stefan@agner.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Juergen Gross <jgross@suse.com>,
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        linux-mips@vger.kernel.org, Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.9 28/74] mips: Make sure dt memory regions are valid
Date:   Sat,  1 Jun 2019 09:24:15 -0400
Message-Id: <20190601132501.27021-28-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601132501.27021-1-sashal@kernel.org>
References: <20190601132501.27021-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Serge Semin <fancer.lancer@gmail.com>

[ Upstream commit 93fa5b280761a4dbb14c5330f260380385ab2b49 ]

There are situations when memory regions coming from dts may be
too big for the platform physical address space. This especially
concerns XPA-capable systems. Bootloader may determine more than 4GB
memory available and pass it to the kernel over dts memory node, while
kernel is built without XPA/64BIT support. In this case the region
may either simply be truncated by add_memory_region() method
or by u64->phys_addr_t type casting. But in worst case the method
can even drop the memory region if it exceeds PHYS_ADDR_MAX size.
So lets make sure the retrieved from dts memory regions are valid,
and if some of them aren't, just manually truncate them with a warning
printed out.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <jhogan@kernel.org>
Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc: Huacai Chen <chenhc@lemote.com>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Serge Semin <Sergey.Semin@t-platforms.ru>
Cc: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/kernel/prom.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/prom.c b/arch/mips/kernel/prom.c
index 5fcec3032f38f..6131807799b49 100644
--- a/arch/mips/kernel/prom.c
+++ b/arch/mips/kernel/prom.c
@@ -41,7 +41,19 @@ char *mips_get_machine_name(void)
 #ifdef CONFIG_USE_OF
 void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 {
-	return add_memory_region(base, size, BOOT_MEM_RAM);
+	if (base >= PHYS_ADDR_MAX) {
+		pr_warn("Trying to add an invalid memory region, skipped\n");
+		return;
+	}
+
+	/* Truncate the passed memory region instead of type casting */
+	if (base + size - 1 >= PHYS_ADDR_MAX || base + size < base) {
+		pr_warn("Truncate memory region %llx @ %llx to size %llx\n",
+			size, base, PHYS_ADDR_MAX - base);
+		size = PHYS_ADDR_MAX - base;
+	}
+
+	add_memory_region(base, size, BOOT_MEM_RAM);
 }
 
 void * __init early_init_dt_alloc_memory_arch(u64 size, u64 align)
-- 
2.20.1

