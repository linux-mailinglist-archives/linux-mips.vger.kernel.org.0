Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 364C22C3D37
	for <lists+linux-mips@lfdr.de>; Wed, 25 Nov 2020 11:07:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728833AbgKYKHW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Nov 2020 05:07:22 -0500
Received: from mail.loongson.cn ([114.242.206.163]:38556 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726197AbgKYKHW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Nov 2020 05:07:22 -0500
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL9PWLL5fkH8WAA--.45482S2;
        Wed, 25 Nov 2020 18:07:18 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] MIPS: KASLR: Correcte valid bits in apply_r_mips_26_rel()
Date:   Wed, 25 Nov 2020 18:07:18 +0800
Message-Id: <1606298838-7006-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxL9PWLL5fkH8WAA--.45482S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw4UGF13tw18Gw1fWw17Wrg_yoW8WF13pr
        nrG34xKrW7JrWjkrWDXFyUJr1UJw4DZa47XFn7Kw1xuw15uryDGF18Gw1xta4UGry0kF47
        Xa4Dtr1Utr4UAw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r4DMxAIw28I
        cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
        IY6xAIw20EY4v20xvaj40_Gr0_Zr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
        aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5GhF3UUUUU==
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
Thus, loc_orig and log_new both need high 4bits rather than high 6bits.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---

v2: Replace ~0x0fffffff with 0xf0000000

 arch/mips/kernel/relocate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
index 3d80a51..8561c7a 100644
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/relocate.c
@@ -95,7 +95,7 @@ static int __init apply_r_mips_26_rel(u32 *loc_orig, u32 *loc_new, long offset)
 
 	/* Original target address */
 	target_addr <<= 2;
-	target_addr += (unsigned long)loc_orig & ~0x03ffffff;
+	target_addr += (unsigned long)loc_orig & 0xf0000000;
 
 	/* Get the new target address */
 	target_addr += offset;
@@ -105,7 +105,7 @@ static int __init apply_r_mips_26_rel(u32 *loc_orig, u32 *loc_new, long offset)
 		return -ENOEXEC;
 	}
 
-	target_addr -= (unsigned long)loc_new & ~0x03ffffff;
+	target_addr -= (unsigned long)loc_new & 0xf0000000;
 	target_addr >>= 2;
 
 	*loc_new = (*loc_new & ~0x03ffffff) | (target_addr & 0x03ffffff);
-- 
2.1.0

