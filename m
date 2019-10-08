Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D03C2CFEB3
	for <lists+linux-mips@lfdr.de>; Tue,  8 Oct 2019 18:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728567AbfJHQPV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Oct 2019 12:15:21 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45551 "EHLO
        mail.loongson.cn" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbfJHQPV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Oct 2019 12:15:21 -0400
Received: from linux.loongson.cn (unknown [10.20.41.27])
        by mail (Coremail) with SMTP id QMiowPAxKcYPtpxd380LAA--.155S2;
        Wed, 09 Oct 2019 00:15:11 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     paul.burton@mips.com, ralf@linux-mips.org, jhogan@kernel.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] MIPS: generic: Use __initconst for const init data
Date:   Wed,  9 Oct 2019 00:15:09 +0800
Message-Id: <1570551309-21021-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: QMiowPAxKcYPtpxd380LAA--.155S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr4kCrW5GryrAw1DKr4kJFb_yoW8Gw1xpF
        W093W8Gr1UWF4rXa97Aa4DXrnxCan3ua4ayF1DK3s2q3Z09w17JFWvqay5Zr15G3yIq3WF
        qr1xXr9xJF4UAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9Fb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r1j6r4UMcIj6xIIjxv20xvE14v26r1j6r
        18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vI
        r41lF7xvr2IYc2Ij64vIr40E4x8a64kEw24l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
        0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
        zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
        4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j
        6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcS
        sGvfC2KfnxnUUI43ZEXa7IU0g18PUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix the following checkpatch errors:

$ ./scripts/checkpatch.pl --no-tree -f arch/mips/generic/init.c
ERROR: Use of const init definition must use __initconst
#23: FILE: arch/mips/generic/init.c:23:
+static __initdata const void *fdt;

ERROR: Use of const init definition must use __initconst
#24: FILE: arch/mips/generic/init.c:24:
+static __initdata const struct mips_machine *mach;

ERROR: Use of const init definition must use __initconst
#25: FILE: arch/mips/generic/init.c:25:
+static __initdata const void *mach_match_data;

Fixes: eed0eabd12ef ("MIPS: generic: Introduce generic DT-based board support")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v2: update the commit message and use the 'Fixes:' tag

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


