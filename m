Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 102002CB317
	for <lists+linux-mips@lfdr.de>; Wed,  2 Dec 2020 04:04:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbgLBDBW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Dec 2020 22:01:22 -0500
Received: from mail.loongson.cn ([114.242.206.163]:42984 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726483AbgLBDBW (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Dec 2020 22:01:22 -0500
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx79M1A8df4_cYAA--.49809S2;
        Wed, 02 Dec 2020 11:00:05 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: KASLR: Fix sync_icache() trapped in loop when synci_step is zero
Date:   Wed,  2 Dec 2020 11:00:05 +0800
Message-Id: <1606878005-11427-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx79M1A8df4_cYAA--.49809S2
X-Coremail-Antispam: 1UD129KBjvdXoWruFW3Ww4DXFy5KFWUAry8uFg_yoWfJwb_GF
        1UKw48Gw1rGr4jvr1Y9ayfXryUtw15WF1fC34qqrW3tay3Zry8A395JFs8Wrs8XrsYyF13
        Xr98GFZrAF4fujkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb28YjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I
        8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW8GwCF04k2
        0xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
        AIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
        87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bw2-5UUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reading synci_step by using rdhwr instruction may return zero if no cache
need be synchronized. On the one hand, to make sure all load operation and
store operation finished we do __sync() for every platform. On the other
hand, some platform need operate synci one time although step is zero.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/kernel/relocate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
index 57bdd276..47aeb33 100644
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/relocate.c
@@ -64,7 +64,7 @@ static void __init sync_icache(void *kbase, unsigned long kernel_length)
 			: "r" (kbase));
 
 		kbase += step;
-	} while (kbase < kend);
+	} while (step && kbase < kend);
 
 	/* Completion barrier */
 	__sync();
-- 
2.1.0

