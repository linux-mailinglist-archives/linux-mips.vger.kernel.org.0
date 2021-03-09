Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF74331DD5
	for <lists+linux-mips@lfdr.de>; Tue,  9 Mar 2021 05:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbhCIESi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 23:18:38 -0500
Received: from mail.loongson.cn ([114.242.206.163]:41882 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229980AbhCIESS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Mar 2021 23:18:18 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxKdUG90ZgeDsXAA--.29488S2;
        Tue, 09 Mar 2021 12:18:14 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        David Laight <David.Laight@ACULAB.COM>
Subject: [PATCH v2] MIPS: Check __clang__ to avoid performance influence with GCC in csum_tcpudp_nofold()
Date:   Tue,  9 Mar 2021 12:18:13 +0800
Message-Id: <1615263493-10609-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxKdUG90ZgeDsXAA--.29488S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFWUCFWUJw4DXFWxWw4fGrg_yoW8AF1xpF
        4jk3s2qrWvqryUKasxAr429r15Ww4rGr97ZrnIg3Wjvas8Xw15Wry3K3W3WF18J3ykAa4f
        uFWfWrn5Grs2kaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gryl
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUUhF4JUUUUU==
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
 arch/mips/include/asm/checksum.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/checksum.h b/arch/mips/include/asm/checksum.h
index 1e6c135..80eddd4 100644
--- a/arch/mips/include/asm/checksum.h
+++ b/arch/mips/include/asm/checksum.h
@@ -128,9 +128,13 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
 
 static inline __wsum csum_tcpudp_nofold(__be32 saddr, __be32 daddr,
 					__u32 len, __u8 proto,
-					__wsum sum)
+					__wsum sum_in)
 {
-	unsigned long tmp = (__force unsigned long)sum;
+#ifdef __clang__
+	unsigned long sum = (__force unsigned long)sum_in;
+#else
+	__wsum sum = sum_in;
+#endif
 
 	__asm__(
 	"	.set	push		# csum_tcpudp_nofold\n"
@@ -159,7 +163,7 @@ static inline __wsum csum_tcpudp_nofold(__be32 saddr, __be32 daddr,
 	"	addu	%0, $1		\n"
 #endif
 	"	.set	pop"
-	: "=r" (tmp)
+	: "=r" (sum)
 	: "0" ((__force unsigned long)daddr),
 	  "r" ((__force unsigned long)saddr),
 #ifdef __MIPSEL__
@@ -169,7 +173,7 @@ static inline __wsum csum_tcpudp_nofold(__be32 saddr, __be32 daddr,
 #endif
 	  "r" ((__force unsigned long)sum));
 
-	return (__force __wsum)tmp;
+	return (__force __wsum)sum;
 }
 #define csum_tcpudp_nofold csum_tcpudp_nofold
 
-- 
2.1.0

