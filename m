Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF1DCFCB9
	for <lists+linux-mips@lfdr.de>; Tue,  8 Oct 2019 16:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbfJHOpm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Oct 2019 10:45:42 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44422 "EHLO
        mail.loongson.cn" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725795AbfJHOpl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Oct 2019 10:45:41 -0400
X-Greylist: delayed 397 seconds by postgrey-1.27 at vger.kernel.org; Tue, 08 Oct 2019 10:45:39 EDT
Received: from linux.loongson.cn (unknown [10.20.41.27])
        by mail (Coremail) with SMTP id QMiowPDxv2CAn5xdu7sLAA--.72S2;
        Tue, 08 Oct 2019 22:38:56 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     paul.burton@mips.com, ralf@linux-mips.org, jhogan@kernel.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: generic: Use __initconst for const init data
Date:   Tue,  8 Oct 2019 22:38:53 +0800
Message-Id: <1570545533-12718-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: QMiowPDxv2CAn5xdu7sLAA--.72S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKw1rKrW8uryxGFWkuF15urg_yoWkCwb_uw
        s2yF18Gr1rCrWY9FsFvw15Ja4IkaySvF9rA34kKan8A3s3tF15Cw4q9r13Jry8WFZ0yry5
        JF4rXa45Cr17ujkaLaAFLSUrUUUUYb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb6AYjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_JFC_Wr1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r1q6r43M2AIxVAIcxkEcVAq07x20xvEncxI
        r21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87
        Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7xvr2IY
        c2Ij64vIr40E4x8a64kEw24lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I
        8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWU
        JVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7V
        AKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j
        6r4UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIx
        AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU51GQDUUUUU=
        =
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix the following checkpatch errors:

$ ./scripts/checkpatch.pl --no-tree -f arch/mips/generic/init.c
ERROR: Use of const init definition must use __initconst
+static __initdata const void *fdt;

ERROR: Use of const init definition must use __initconst
+static __initdata const struct mips_machine *mach;

ERROR: Use of const init definition must use __initconst
+static __initdata const void *mach_match_data;

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/generic/init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
index d5b8c47..1de215b 100644
--- a/arch/mips/generic/init.c
+++ b/arch/mips/generic/init.c
@@ -20,9 +20,9 @@
 #include <asm/smp-ops.h>
 #include <asm/time.h>
 
-static __initdata const void *fdt;
-static __initdata const struct mips_machine *mach;
-static __initdata const void *mach_match_data;
+static __initconst const void *fdt;
+static __initconst const struct mips_machine *mach;
+static __initconst const void *mach_match_data;
 
 void __init prom_init(void)
 {
-- 
2.1.0


