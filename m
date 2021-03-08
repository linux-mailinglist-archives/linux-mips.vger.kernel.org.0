Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93CC0330EA8
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 13:50:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhCHMu0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 07:50:26 -0500
Received: from mail.loongson.cn ([114.242.206.163]:38742 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229818AbhCHMuN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Mar 2021 07:50:13 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxedSBHUZggvkWAA--.28765S2;
        Mon, 08 Mar 2021 20:50:09 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] MIPS: Check __clang__ to avoid performance influence with GCC in csum_tcpudp_nofold()
Date:   Mon,  8 Mar 2021 20:50:07 +0800
Message-Id: <1615207807-29972-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxedSBHUZggvkWAA--.28765S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFWUCFWUGr18uw4DZr45Awb_yoW8Wry3pF
        4qkr92grWvqryUG343Ar42g3s8ur48Gr92vrnIg3Wjva98Xw13WryfKw13WFyxJ395Aa4f
        uFWfWrn8Jrn2kw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW5JwCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
        1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUr8nnUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The asm code in csum_tcpudp_nofold() is performance-critical, I am sorry
for the poorly considered implementation about the performance influence
with GCC in the commit 198688edbf77 ("MIPS: Fix inline asm input/output
type mismatch in checksum.h used with Clang").

With this patch, we can build successfully by both GCC and Clang,
at the same time, we can avoid the potential performance influence
with GCC.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/checksum.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/mips/include/asm/checksum.h b/arch/mips/include/asm/checksum.h
index 1e6c135..64d353e 100644
--- a/arch/mips/include/asm/checksum.h
+++ b/arch/mips/include/asm/checksum.h
@@ -130,7 +130,9 @@ static inline __wsum csum_tcpudp_nofold(__be32 saddr, __be32 daddr,
 					__u32 len, __u8 proto,
 					__wsum sum)
 {
+#ifdef __clang__
 	unsigned long tmp = (__force unsigned long)sum;
+#endif
 
 	__asm__(
 	"	.set	push		# csum_tcpudp_nofold\n"
@@ -159,7 +161,11 @@ static inline __wsum csum_tcpudp_nofold(__be32 saddr, __be32 daddr,
 	"	addu	%0, $1		\n"
 #endif
 	"	.set	pop"
+#ifdef __clang__
 	: "=r" (tmp)
+#else
+	: "=r" (sum)
+#endif
 	: "0" ((__force unsigned long)daddr),
 	  "r" ((__force unsigned long)saddr),
 #ifdef __MIPSEL__
@@ -169,7 +175,11 @@ static inline __wsum csum_tcpudp_nofold(__be32 saddr, __be32 daddr,
 #endif
 	  "r" ((__force unsigned long)sum));
 
+#ifdef __clang__
 	return (__force __wsum)tmp;
+#else
+	return sum;
+#endif
 }
 #define csum_tcpudp_nofold csum_tcpudp_nofold
 
-- 
2.1.0

