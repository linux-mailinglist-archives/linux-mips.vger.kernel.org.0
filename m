Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7C21073C1
	for <lists+linux-mips@lfdr.de>; Fri, 22 Nov 2019 14:59:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbfKVN7H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Nov 2019 08:59:07 -0500
Received: from mail.loongson.cn ([114.242.206.163]:55252 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726046AbfKVN7H (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 Nov 2019 08:59:07 -0500
Received: from localhost (unknown [111.199.189.14])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxzxac6dddevYBAA--.1171S2;
        Fri, 22 Nov 2019 21:58:52 +0800 (CST)
From:   Lichao Liu <liulichao@loongson.cn>
To:     chenhc@lemote.com, jiaxun.yang@flygoat.com
Cc:     ralf@linux-mips.org, paulburton@kernel.org, jhogan@kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lichao Liu <liulichao@loongson.cn>
Subject: [PATCH] MIPS:Loongson64:Limit 8259.h by config
Date:   Fri, 22 Nov 2019 21:58:51 +0800
Message-Id: <20191122135851.5145-1-liulichao@loongson.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: AQAAf9Dxzxac6dddevYBAA--.1171S2
X-Coremail-Antispam: 1UD129KBjvdXoWrXF18WF1xury5ZFy8Jw43KFg_yoWxWrcEka
        y2yw48G34fAry2y347ZrnrWrW7u34UuF13CFn8Ar1Sqas0vwn0gayDAr4DJr1rCrn8tr4r
        Xay8Cry8urW7CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbc8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
        Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW5GwCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
        1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUefOzUUUUU
X-CM-SenderInfo: xolxzxpfkd0qxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Not all platform config CONFIG_I8259, So Use the macro CONFIG_I8259
to control whether to include the asm/i8259.h header file.

Signed-off-by: Lichao Liu <liulichao@loongson.cn>
---
 arch/mips/loongson64/pm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/loongson64/pm.c b/arch/mips/loongson64/pm.c
index 7c8556f09781..08238a58107f 100644
--- a/arch/mips/loongson64/pm.c
+++ b/arch/mips/loongson64/pm.c
@@ -9,7 +9,9 @@
 #include <linux/interrupt.h>
 #include <linux/pm.h>
 
+#ifdef CONFIG_I8259
 #include <asm/i8259.h>
+#endif
 #include <asm/mipsregs.h>
 
 #include <loongson.h>
-- 
2.17.1

