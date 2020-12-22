Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11ED22E074E
	for <lists+linux-mips@lfdr.de>; Tue, 22 Dec 2020 09:39:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbgLVIiY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Dec 2020 03:38:24 -0500
Received: from mail.loongson.cn ([114.242.206.163]:34650 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725841AbgLVIiY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 22 Dec 2020 03:38:24 -0500
Received: from localhost.localdomain (unknown [112.20.110.48])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxGcpNsOFfAlkDAA--.8814S2;
        Tue, 22 Dec 2020 16:37:34 +0800 (CST)
From:   siyanteng@loongson.cn
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        siyanteng <siyanteng@loongson.cn>
Subject: [PATCH] MIPS: loongson64: smp.c: Fix block comment coding style
Date:   Tue, 22 Dec 2020 16:37:00 +0800
Message-Id: <20201222083700.3651527-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxGcpNsOFfAlkDAA--.8814S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFykur4rKFyxur4ruFW7Jwb_yoW8GF4fpr
        WfZa4DGF45WF10va4fJFyUJry8C39xJF9ruF42qrW5uasxGr12qrW8K3Z8XF47ZFsYgF17
        W348Cw4Uua1rtwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWUWVWUuwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4kE6xkIj40Ew7xC
        0wCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
        IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
        6r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2
        IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E
        87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
        ZFpf9x0JU2ZXOUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: siyanteng <siyanteng@loongson.cn>

This patch fixes:
"WARNING: Block comments use a trailing */ on a separate line"
by checkpatch.pl

Signed-off-by: siyanteng <siyanteng@loongson.cn>
---
 arch/mips/loongson64/smp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/loongson64/smp.c b/arch/mips/loongson64/smp.c
index b8c1fc3158fd..459ea5b7a1b0 100644
--- a/arch/mips/loongson64/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -483,7 +483,8 @@ static void __init loongson3_smp_setup(void)
 	init_cpu_possible(cpu_none_mask);
 
 	/* For unified kernel, NR_CPUS is the maximum possible value,
-	 * loongson_sysconf.nr_cpus is the really present value */
+	 * loongson_sysconf.nr_cpus is the really present value
+	 */
 	while (i < loongson_sysconf.nr_cpus) {
 		if (loongson_sysconf.reserved_cpus_mask & (1<<i)) {
 			/* Reserved physical CPU cores */
@@ -567,7 +568,8 @@ static void loongson3_cpu_die(unsigned int cpu)
 /* To shutdown a core in Loongson 3, the target core should go to CKSEG1 and
  * flush all L1 entries at first. Then, another core (usually Core 0) can
  * safely disable the clock of the target core. loongson3_play_dead() is
- * called via CKSEG1 (uncached and unmmaped) */
+ * called via CKSEG1 (uncached and unmmaped)
+ */
 static void loongson3_type1_play_dead(int *state_addr)
 {
 	register int val;
-- 
2.27.0

