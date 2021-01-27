Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0B930524A
	for <lists+linux-mips@lfdr.de>; Wed, 27 Jan 2021 06:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbhA0FoI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Jan 2021 00:44:08 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47050 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232111AbhA0Emp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 Jan 2021 23:42:45 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxGL4N7xBgzKANAA--.20532S2;
        Wed, 27 Jan 2021 12:41:49 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Alexander Potapenko <glider@google.com>
Subject: [PATCH] MIPS: Fix inline asm input/output type mismatch in checksum.h used with Clang
Date:   Wed, 27 Jan 2021 12:41:47 +0800
Message-Id: <1611722507-12017-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxGL4N7xBgzKANAA--.20532S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr4kXF4xJry7XFyDJrykAFb_yoW8ZF4kpa
        1DC3sFqrWqgry8Gas8Aw42gryYgw4kG3savr9Igw1jva4aqFy5Wr9xKr1UCF18Jr4vya4S
        9FZ3GF1DGrnrtaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
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
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUeyx_UUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix the following build error when make M=samples/bpf used with Clang:

  CLANG-bpf  samples/bpf/sockex2_kern.o
In file included from samples/bpf/sockex2_kern.c:7:
In file included from ./include/uapi/linux/if_tunnel.h:7:
In file included from ./include/linux/ip.h:16:
In file included from ./include/linux/skbuff.h:28:
In file included from ./include/net/checksum.h:22:
./arch/mips/include/asm/checksum.h:161:9: error: unsupported inline asm: input with type 'unsigned long' matching output with type '__wsum' (aka 'unsigned int')
        : "0" ((__force unsigned long)daddr),
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
1 error generated.

This is a known issue on MIPS [1], the changed code can be compiled
successfully by both GCC and Clang.

[1] https://lore.kernel.org/linux-mips/CAG_fn=W0JHf8QyUX==+rQMp8PoULHrsQCa9Htffws31ga8k-iw@mail.gmail.com/

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/checksum.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/checksum.h b/arch/mips/include/asm/checksum.h
index 5f80c28..1e6c135 100644
--- a/arch/mips/include/asm/checksum.h
+++ b/arch/mips/include/asm/checksum.h
@@ -130,6 +130,8 @@ static inline __wsum csum_tcpudp_nofold(__be32 saddr, __be32 daddr,
 					__u32 len, __u8 proto,
 					__wsum sum)
 {
+	unsigned long tmp = (__force unsigned long)sum;
+
 	__asm__(
 	"	.set	push		# csum_tcpudp_nofold\n"
 	"	.set	noat		\n"
@@ -157,7 +159,7 @@ static inline __wsum csum_tcpudp_nofold(__be32 saddr, __be32 daddr,
 	"	addu	%0, $1		\n"
 #endif
 	"	.set	pop"
-	: "=r" (sum)
+	: "=r" (tmp)
 	: "0" ((__force unsigned long)daddr),
 	  "r" ((__force unsigned long)saddr),
 #ifdef __MIPSEL__
@@ -167,7 +169,7 @@ static inline __wsum csum_tcpudp_nofold(__be32 saddr, __be32 daddr,
 #endif
 	  "r" ((__force unsigned long)sum));
 
-	return sum;
+	return (__force __wsum)tmp;
 }
 #define csum_tcpudp_nofold csum_tcpudp_nofold
 
-- 
2.1.0

