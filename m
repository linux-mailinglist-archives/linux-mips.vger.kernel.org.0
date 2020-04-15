Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 854FD1A99B7
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2020 11:57:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729231AbgDOJ4y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Apr 2020 05:56:54 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40910 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2405628AbgDOJ4w (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Apr 2020 05:56:52 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb9xf2pZe1iYoAA--.7S2;
        Wed, 15 Apr 2020 17:56:47 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: Fix typo for user_ld macro definition
Date:   Wed, 15 Apr 2020 17:56:43 +0800
Message-Id: <1586944603-5107-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9Dxb9xf2pZe1iYoAA--.7S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF13Xr15urW5WF1UKryUWrg_yoW3GFb_Z3
        W0qw4kury8GrWa9FW5Xan7Aryjq3y8ur9rZ3W5Crn3t390qr1DJrZ5Gr98Xr98Cr1DurW5
        Za1Utry5CFnxKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbFAYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I
        3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
        WUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
        wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcI
        k0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
        Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8v_M3UUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There is typo for macro user_ld if __ASSEMBLY__ is declared, this
patch fixes this issue.

Signed-off-by: bibo mao <maobibo@loongson.cn>
---
 arch/mips/include/asm/asm-eva.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/asm-eva.h b/arch/mips/include/asm/asm-eva.h
index d80be38..e327ebc 100644
--- a/arch/mips/include/asm/asm-eva.h
+++ b/arch/mips/include/asm/asm-eva.h
@@ -180,7 +180,7 @@
 #define user_ld(reg, addr)		kernel_lw(reg, addr)
 #else
 #define user_sd(reg, addr)		kernel_sd(reg, addr)
-#define user_ld(reg, addr)		kernel_sd(reg, addr)
+#define user_ld(reg, addr)		kernel_ld(reg, addr)
 #endif /* CONFIG_32BIT */
 
 #endif /* CONFIG_EVA */
-- 
1.8.3.1

