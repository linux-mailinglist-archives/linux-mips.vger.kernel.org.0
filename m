Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADAE2B8A15
	for <lists+linux-mips@lfdr.de>; Thu, 19 Nov 2020 03:29:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgKSC3V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 18 Nov 2020 21:29:21 -0500
Received: from mail.loongson.cn ([114.242.206.163]:52810 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726304AbgKSC3U (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 18 Nov 2020 21:29:20 -0500
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxytF62LVfImASAA--.42816S2;
        Thu, 19 Nov 2020 10:29:15 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] MIPS: KASLR: Correcte valid bits in apply_r_mips_26_rel
Date:   Thu, 19 Nov 2020 10:29:12 +0800
Message-Id: <1605752954-10368-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxytF62LVfImASAA--.42816S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw4UGF13tw18Gw1fWw17Wrg_yoW8WF17pr
        nrG34xJrWUJrWjkrWUXFy5Jr1UJw1DX347XF1xtw1xZw15ur9rGF18Gry7ta4UGry0kF47
        Xa4Dtr4UJr4UAFUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkvb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr
        0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8JwCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
        1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j7eOLUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Apply_r_mips_26_rel() relocates instructions like j, jal and etc. These
instructions consist of 6bits function field and 26bits address field.
The value of target_addr as follows,
=================================================================
|     high 4bits           |            low 28bits              |
=================================================================
|the high 4bits of this PC | the low 26bits of instructions << 2|
=================================================================
Thus, loc_orig and log_new both need high 4bits ranther than high 6bits.
Replace 0x3ffffff with 0xfffffff.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/kernel/relocate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
index 3d80a51..709cfa0 100644
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/relocate.c
@@ -95,7 +95,7 @@ static int __init apply_r_mips_26_rel(u32 *loc_orig, u32 *loc_new, long offset)
 
 	/* Original target address */
 	target_addr <<= 2;
-	target_addr += (unsigned long)loc_orig & ~0x03ffffff;
+	target_addr += (unsigned long)loc_orig & ~0x0fffffff;
 
 	/* Get the new target address */
 	target_addr += offset;
@@ -105,7 +105,7 @@ static int __init apply_r_mips_26_rel(u32 *loc_orig, u32 *loc_new, long offset)
 		return -ENOEXEC;
 	}
 
-	target_addr -= (unsigned long)loc_new & ~0x03ffffff;
+	target_addr -= (unsigned long)loc_new & ~0x0fffffff;
 	target_addr >>= 2;
 
 	*loc_new = (*loc_new & ~0x03ffffff) | (target_addr & 0x03ffffff);
-- 
2.1.0

