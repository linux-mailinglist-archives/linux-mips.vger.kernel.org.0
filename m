Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA2210482C
	for <lists+linux-mips@lfdr.de>; Thu, 21 Nov 2019 02:42:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfKUBmV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Nov 2019 20:42:21 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47540 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725936AbfKUBmU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 Nov 2019 20:42:20 -0500
Received: from localhost (unknown [124.64.18.131])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx7xVm69VdVT0BAA--.303S2;
        Thu, 21 Nov 2019 09:41:59 +0800 (CST)
From:   Lichao Liu <liulichao@loongson.cn>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Marc Dionne <marc.dionne@auristor.com>,
        David Howells <dhowells@redhat.com>,
        Lichao Liu <liulichao@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Use the macro CONFIG_I8259 to control whether to include the asm/i8259.h header file.
Date:   Thu, 21 Nov 2019 09:41:56 +0800
Message-Id: <20191121014156.25618-1-liulichao@loongson.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: AQAAf9Dx7xVm69VdVT0BAA--.303S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr17ZryDJF1rWF4UXryxKrg_yoWxZrbEka
        y2yw18G3yfAr48try7Zry3WrW2934UW3W3CFn5ArnIq3Z0qanIgaykAr4kJr13Crn0vr4f
        XrW8KryrCr47CjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb48FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
        0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVWk
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
        IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbLiSPUUUU
        U==
X-CM-SenderInfo: xolxzxpfkd0qxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Not all platform config CONFIG_I8259, So Use the macro CONFIG_I8259
to control whether to include the asm/i8259.h header file.

Signed-off-by: Lichao Liu <liulichao@loongson.cn>
---
 arch/mips/loongson64/common/pm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/loongson64/common/pm.c b/arch/mips/loongson64/common/pm.c
index b8aed878d..bc619e4d0 100644
--- a/arch/mips/loongson64/common/pm.c
+++ b/arch/mips/loongson64/common/pm.c
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

