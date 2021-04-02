Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03ED33529B7
	for <lists+linux-mips@lfdr.de>; Fri,  2 Apr 2021 12:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbhDBK1Z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Apr 2021 06:27:25 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49634 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229605AbhDBK1Z (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 2 Apr 2021 06:27:25 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxycmI8WZgY6cDAA--.7636S2;
        Fri, 02 Apr 2021 18:27:21 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v3] MIPS: Check __clang__ to avoid performance influence with GCC in csum_tcpudp_nofold()
Date:   Fri,  2 Apr 2021 18:27:20 +0800
Message-Id: <1617359240-16609-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9CxycmI8WZgY6cDAA--.7636S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKF4UJr17ZFW3Kr15Jr4rAFb_yoW7GF1kpF
        nrtr18Wr4UXry5Ca40k3y8WFy5Ww45GrZxua4rAr9akr98Zr18X3ZYgFy5CrsFkrs2q3W7
        ZrWrtrsrKFyDt3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gw1l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUVHq7UUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The asm code in csum_tcpudp_nofold() is performance critical, I am sorry
for the poorly considered implementation about the performance influence
with GCC in the commit 198688edbf77 ("MIPS: Fix inline asm input/output
type mismatch in checksum.h used with Clang").

Using __clang__ instead of CC_IS_CLANG as check condition, because it
still occurs build error under CC_IS_GCC when make M=samples/bpf which
used with Clang compiler.

With this patch, we can build successfully by both GCC and Clang,
at the same time, the logic is much clear to avoid the potential
performance influence with GCC.

Here are some test data, the config file is loongson3_defconfig, the gcc
version is 10.2.1, we can see that the size has no differences between (1)
and (3).

(1) linux-5.12-rc5.nopatch:
without commit 198688edbf77 ("MIPS: Fix inline asm input/output type
mismatch in checksum.h used with Clang").

(2) linux-5.12-rc5:
with commit 198688edbf77 ("MIPS: Fix inline asm input/output type
mismatch in checksum.h used with Clang").

(3) linux-5.12-rc5.newpatch:
with this patch based on linux-5.12-rc5.

loongson@linux:~$ size --format=GNU linux-5.12-rc5.nopatch/vmlinux
      text       data        bss      total filename
  10273312    3489518   17865568   31628398 linux-5.12-rc5.nopatch/vmlinux

loongson@linux:~$ size --format=GNU linux-5.12-rc5/vmlinux
      text       data        bss      total filename
  10273536    3489550   17865568   31628654 linux-5.12-rc5/vmlinux

loongson@linux:~$ size --format=GNU linux-5.12-rc5.newpatch/vmlinux
      text       data        bss      total filename
  10273312    3489518   17865568   31628398 linux-5.12-rc5.newpatch/vmlinux

As far as I can tell, the differences between (1) and (2) is due to the
following affected objects:

loongson@linux:~$ size --format=GNU linux-5.12-rc5.nopatch/net/ipv4/tcp_ipv4.o
      text       data        bss      total filename
     20684       2268        576      23528 linux-5.12-rc5.nopatch/net/ipv4/tcp_ipv4.o
loongson@linux:~$ size --format=GNU linux-5.12-rc5/net/ipv4/tcp_ipv4.o
      text       data        bss      total filename
     20700       2268        576      23544 linux-5.12-rc5/net/ipv4/tcp_ipv4.o

loongson@linux:~$ size --format=GNU linux-5.12-rc5.nopatch/net/ipv4/tcp_offload.o
      text       data        bss      total filename
      3584        167          0       3751 linux-5.12-rc5.nopatch/net/ipv4/tcp_offload.o
loongson@linux:~$ size --format=GNU linux-5.12-rc5/net/ipv4/tcp_offload.o
      text       data        bss      total filename
      3600        167          0       3767 linux-5.12-rc5/net/ipv4/tcp_offload.o

loongson@linux:~$ size --format=GNU linux-5.12-rc5.nopatch/net/ipv4/udp.o
      text       data        bss      total filename
     30068       3018         32      33118 linux-5.12-rc5.nopatch/net/ipv4/udp.o
loongson@linux:~$ size --format=GNU linux-5.12-rc5/net/ipv4/udp.o
      text       data        bss      total filename
     30100       3018         32      33150 linux-5.12-rc5/net/ipv4/udp.o

loongson@linux:~$ size --format=GNU linux-5.12-rc5.nopatch/net/ipv4/udp_offload.o
      text       data        bss      total filename
      6624        311          0       6935 linux-5.12-rc5.nopatch/net/ipv4/udp_offload.o
loongson@linux:~$ size --format=GNU linux-5.12-rc5/net/ipv4/udp_offload.o
      text       data        bss      total filename
      6640        311          0       6951 linux-5.12-rc5/net/ipv4/udp_offload.o

loongson@linux:~$ size --format=GNU linux-5.12-rc5.nopatch/net/netfilter/nf_nat.o
      text       data        bss      total filename
     20804       2102       4112      27018 linux-5.12-rc5.nopatch/net/netfilter/nf_nat.o
loongson@linux:~$ size --format=GNU linux-5.12-rc5/net/netfilter/nf_nat.o
      text       data        bss      total filename
     20820       2102       4112      27034 linux-5.12-rc5/net/netfilter/nf_nat.o

loongson@linux:~$ size --format=GNU linux-5.12-rc5.nopatch/net/netfilter/nf_nat_proto.o
      text       data        bss      total filename
      7392        770          0       8162 linux-5.12-rc5.nopatch/net/netfilter/nf_nat_proto.o
loongson@linux:~$ size --format=GNU linux-5.12-rc5/net/netfilter/nf_nat_proto.o
      text       data        bss      total filename
      7408        770          0       8178 linux-5.12-rc5/net/netfilter/nf_nat_proto.o

loongson@linux:~$ size --format=GNU linux-5.12-rc5.nopatch/net/ipv4/netfilter/nf_reject_ipv4.o
      text       data        bss      total filename
      3776        429          0       4205 linux-5.12-rc5.nopatch/net/ipv4/netfilter/nf_reject_ipv4.o
loongson@linux:~$ size --format=GNU linux-5.12-rc5/net/ipv4/netfilter/nf_reject_ipv4.o
      text       data        bss      total filename
      3792        429          0       4221 linux-5.12-rc5/net/ipv4/netfilter/nf_reject_ipv4.o

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/checksum.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/include/asm/checksum.h b/arch/mips/include/asm/checksum.h
index 1e6c135..e1f80407 100644
--- a/arch/mips/include/asm/checksum.h
+++ b/arch/mips/include/asm/checksum.h
@@ -130,7 +130,11 @@ static inline __wsum csum_tcpudp_nofold(__be32 saddr, __be32 daddr,
 					__u32 len, __u8 proto,
 					__wsum sum)
 {
+#ifdef __clang__
 	unsigned long tmp = (__force unsigned long)sum;
+#else
+	__wsum tmp = sum;
+#endif
 
 	__asm__(
 	"	.set	push		# csum_tcpudp_nofold\n"
-- 
2.1.0

