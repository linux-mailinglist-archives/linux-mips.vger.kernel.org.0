Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C53122FFDA7
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 08:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbhAVHym (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Jan 2021 02:54:42 -0500
Received: from mail.loongson.cn ([114.242.206.163]:33800 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726573AbhAVHyl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 Jan 2021 02:54:41 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxKL5vhApghTcJAA--.14162S2;
        Fri, 22 Jan 2021 15:53:19 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Ming Wang <wangming01@loongson.cn>
Subject: [PATCH] MIPS: Make definitions of MIPSInst_FMA_{FUNC,FMTM} consistent with MIPS64 manual
Date:   Fri, 22 Jan 2021 15:53:18 +0800
Message-Id: <1611301998-25676-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxKL5vhApghTcJAA--.14162S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFWxXw1fAr15Jr4xuF17Jrb_yoW8JFWkpa
        nxA3WkKr4kG34IkwnYyrWDWF13tr4kCrZYqFWUurnFga98Xwn8XFnayr1rt3s3XF4rKF10
        qw4SgF1jgFy8Cw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
        CwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
        1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
        64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
        0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
        IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjVc_3UUUU
        U==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The kernel definitions of MIPSInst_FMA_FUNC and MIPSInst_FMA_FFMT are not
consistent with MADD.fmt, NMADD.fmt and NMSUB.fmt in the MIPS64 manual [1],
the field func is bit 5..3 and fmt is bit 2..0, fix them. Otherwise there
exists error when add new instruction simulation.

[1] https://www.mips.com/?do-download=the-mips64-instruction-set-v6-06

Reported-by: Ming Wang <wangming01@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/inst.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/inst.h b/arch/mips/include/asm/inst.h
index 22912f7..2f98ced 100644
--- a/arch/mips/include/asm/inst.h
+++ b/arch/mips/include/asm/inst.h
@@ -65,11 +65,11 @@
 #define I_FR_SFT	21
 #define MIPSInst_FR(x) ((MIPSInst(x) & 0x03e00000) >> I_FR_SFT)
 
-#define I_FMA_FUNC_SFT	2
-#define MIPSInst_FMA_FUNC(x) ((MIPSInst(x) & 0x0000003c) >> I_FMA_FUNC_SFT)
+#define I_FMA_FUNC_SFT	3
+#define MIPSInst_FMA_FUNC(x) ((MIPSInst(x) & 0x00000038) >> I_FMA_FUNC_SFT)
 
 #define I_FMA_FFMT_SFT	0
-#define MIPSInst_FMA_FFMT(x) (MIPSInst(x) & 0x00000003)
+#define MIPSInst_FMA_FFMT(x) (MIPSInst(x) & 0x00000007)
 
 typedef unsigned int mips_instruction;
 
-- 
2.1.0

