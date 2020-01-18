Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 468BE1415DD
	for <lists+linux-mips@lfdr.de>; Sat, 18 Jan 2020 06:09:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725468AbgARFJI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 18 Jan 2020 00:09:08 -0500
Received: from fsfla.org ([217.69.89.142]:43582 "EHLO fsfla.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725385AbgARFJI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 18 Jan 2020 00:09:08 -0500
X-Greylist: delayed 456 seconds by postgrey-1.27 at vger.kernel.org; Sat, 18 Jan 2020 00:09:08 EST
Received: from free.home (unknown [186.214.91.12])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by fsfla.org (Postfix) with ESMTPSA id C785DA276B;
        Sat, 18 Jan 2020 05:01:13 +0000 (UTC)
Received: from livre.home (livre.home [172.31.160.2])
        by free.home (8.15.2/8.15.2) with ESMTPS id 00I50h6D1284778
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sat, 18 Jan 2020 02:00:46 -0300
From:   Alexandre Oliva <lxoliva@fsfla.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, paul.burton@mips.com
Subject: [PATCH] [Loongson2F] adjust cpufreq uses of LOONGSON_CHIPCFG
Organization: Free thinker, not speaking for FSF Latin America
Date:   Sat, 18 Jan 2020 02:00:43 -0300
Message-ID: <or5zh9l5ok.fsf@livre.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


The post-fork cleanup of loongson2ef from loongson64 changed
LOONGSON_CHIPCFG from a single-argument functional macro to a
non-functional macro with an mmio address in loongson2ef, but
loongson2_cpufreq still uses the notation of a functional macro call
expecting it to be an lvalue.  Fixed based on loongson_suspend_enter.

Signed-off-by: Alexandre Oliva <lxoliva@fsfla.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org
Cc: paul.burton@mips.com
---
 drivers/cpufreq/loongson2_cpufreq.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/loongson2_cpufreq.c b/drivers/cpufreq/loongson2_cpufreq.c
index 84f0eee..ace2d46 100644
--- a/drivers/cpufreq/loongson2_cpufreq.c
+++ b/drivers/cpufreq/loongson2_cpufreq.c
@@ -144,9 +144,11 @@ static void loongson2_cpu_wait(void)
 	u32 cpu_freq;
 
 	spin_lock_irqsave(&loongson2_wait_lock, flags);
-	cpu_freq = LOONGSON_CHIPCFG(0);
-	LOONGSON_CHIPCFG(0) &= ~0x7;	/* Put CPU into wait mode */
-	LOONGSON_CHIPCFG(0) = cpu_freq;	/* Restore CPU state */
+	cpu_freq = readl(LOONGSON_CHIPCFG);
+	/* Put CPU into wait mode */
+	writel(readl(LOONGSON_CHIPCFG) & ~0x7, LOONGSON_CHIPCFG);
+	/* Restore CPU state */
+	writel(cpu_freq, LOONGSON_CHIPCFG);
 	spin_unlock_irqrestore(&loongson2_wait_lock, flags);
 	local_irq_enable();
 }
-- 
2.7.4


-- 
Alexandre Oliva, freedom fighter   he/him   https://FSFLA.org/blogs/lxo
Free Software Evangelist           Stallman was right, but he's left :(
GNU Toolchain Engineer    FSMatrix: It was he who freed the first of us
FSF & FSFLA board member                The Savior shall return (true);
