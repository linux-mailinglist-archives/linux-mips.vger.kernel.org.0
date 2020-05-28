Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7741E5AC6
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 10:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbgE1I2Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 04:28:24 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39142 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726892AbgE1I2W (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 28 May 2020 04:28:22 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf2r7dc9euh46AA--.1133S2;
        Thu, 28 May 2020 16:27:39 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] MIPS: Fix build warning about "PTR_STR" redefined under CONFIG_TEST_PRINTF
Date:   Thu, 28 May 2020 16:27:39 +0800
Message-Id: <1590654459-10827-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxf2r7dc9euh46AA--.1133S2
X-Coremail-Antispam: 1UD129KBjvJXoWfJFyUXr1UXrW3AryfXr1xGrg_yoWkCF43pr
        Wvkw4SvrW8tFWDAw1Y9w4j9r4kXryFvrn7CF13KFW8Gryagw1vkr9rArn8CF93Jw45u3W7
        ZF47CFnrZa12vaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
        ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
        1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
        64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
        0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
        42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUbKZGDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Replace PTR_STR with INST_PTR_STR to fix the following build warning when
CONFIG_TEST_PRINTF is set:

  CC      lib/test_printf.o
lib/test_printf.c:214:0: warning: "PTR_STR" redefined
 #define PTR_STR "ffff0123456789ab"
 ^
In file included from ./arch/mips/include/asm/dsemul.h:11:0,
                 from ./arch/mips/include/asm/processor.h:22,
                 from ./arch/mips/include/asm/thread_info.h:16,
                 from ./include/linux/thread_info.h:38,
                 from ./include/asm-generic/preempt.h:5,
                 from ./arch/mips/include/generated/asm/preempt.h:1,
                 from ./include/linux/preempt.h:78,
                 from ./include/linux/spinlock.h:51,
                 from ./include/linux/seqlock.h:36,
                 from ./include/linux/time.h:6,
                 from ./include/linux/stat.h:19,
                 from ./include/linux/module.h:13,
                 from lib/test_printf.c:10:
./arch/mips/include/asm/inst.h:20:0: note: this is the location of the previous definition
 #define PTR_STR  ".dword"
 ^

Fixes: e701656ec4db ("MIPS: inst.h: Stop including asm.h to avoid various build failures")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/inst.h | 180 +++++++++++++++++++++----------------------
 1 file changed, 90 insertions(+), 90 deletions(-)

diff --git a/arch/mips/include/asm/inst.h b/arch/mips/include/asm/inst.h
index 6d74ba3..3ab1c6b 100644
--- a/arch/mips/include/asm/inst.h
+++ b/arch/mips/include/asm/inst.h
@@ -14,10 +14,10 @@
 #include <uapi/asm/inst.h>
 
 #if (_MIPS_SZPTR == 32)
-#define PTR_STR		".word"
+#define INST_PTR_STR		".word"
 #endif
 #if (_MIPS_SZPTR == 64)
-#define PTR_STR		".dword"
+#define INST_PTR_STR		".dword"
 #endif
 
 /* HACHACHAHCAHC ...  */
@@ -108,8 +108,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
+		INST_PTR_STR"\t1b, 4b\n\t"          \
+		INST_PTR_STR"\t2b, 4b\n\t"          \
 		".previous"                         \
 		: "=&r" (value), "=r" (res)         \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -129,8 +129,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
+		INST_PTR_STR"\t1b, 4b\n\t"          \
+		INST_PTR_STR"\t2b, 4b\n\t"          \
 		".previous"                         \
 		: "=&r" (value), "=r" (res)         \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -162,10 +162,10 @@ do {                                                \
 		"j\t10b\n\t"			    \
 		".previous\n\t"			    \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 11b\n\t"		    \
-		PTR_STR"\t2b, 11b\n\t"		    \
-		PTR_STR"\t3b, 11b\n\t"		    \
-		PTR_STR"\t4b, 11b\n\t"		    \
+		INST_PTR_STR"\t1b, 11b\n\t"         \
+		INST_PTR_STR"\t2b, 11b\n\t"         \
+		INST_PTR_STR"\t3b, 11b\n\t"         \
+		INST_PTR_STR"\t4b, 11b\n\t"         \
 		".previous"			    \
 		: "=&r" (value), "=r" (res)	    \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -190,8 +190,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
+		INST_PTR_STR"\t1b, 4b\n\t"          \
+		INST_PTR_STR"\t2b, 4b\n\t"          \
 		".previous"                         \
 		: "=&r" (value), "=r" (res)         \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -213,8 +213,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
+		INST_PTR_STR"\t1b, 4b\n\t"          \
+		INST_PTR_STR"\t2b, 4b\n\t"          \
 		".previous"                         \
 		: "=&r" (value), "=r" (res)         \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -233,8 +233,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
+		INST_PTR_STR"\t1b, 4b\n\t"          \
+		INST_PTR_STR"\t2b, 4b\n\t"          \
 		".previous"                         \
 		: "=&r" (value), "=r" (res)         \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -266,10 +266,10 @@ do {                                                \
 		"j\t10b\n\t"			    \
 		".previous\n\t"			    \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 11b\n\t"		    \
-		PTR_STR"\t2b, 11b\n\t"		    \
-		PTR_STR"\t3b, 11b\n\t"		    \
-		PTR_STR"\t4b, 11b\n\t"		    \
+		INST_PTR_STR"\t1b, 11b\n\t"         \
+		INST_PTR_STR"\t2b, 11b\n\t"         \
+		INST_PTR_STR"\t3b, 11b\n\t"         \
+		INST_PTR_STR"\t4b, 11b\n\t"         \
 		".previous"			    \
 		: "=&r" (value), "=r" (res)	    \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -311,14 +311,14 @@ do {                                                \
 		"j\t10b\n\t"			    \
 		".previous\n\t"			    \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 11b\n\t"		    \
-		PTR_STR"\t2b, 11b\n\t"		    \
-		PTR_STR"\t3b, 11b\n\t"		    \
-		PTR_STR"\t4b, 11b\n\t"		    \
-		PTR_STR"\t5b, 11b\n\t"		    \
-		PTR_STR"\t6b, 11b\n\t"		    \
-		PTR_STR"\t7b, 11b\n\t"		    \
-		PTR_STR"\t8b, 11b\n\t"		    \
+		INST_PTR_STR"\t1b, 11b\n\t"         \
+		INST_PTR_STR"\t2b, 11b\n\t"         \
+		INST_PTR_STR"\t3b, 11b\n\t"         \
+		INST_PTR_STR"\t4b, 11b\n\t"         \
+		INST_PTR_STR"\t5b, 11b\n\t"         \
+		INST_PTR_STR"\t6b, 11b\n\t"         \
+		INST_PTR_STR"\t7b, 11b\n\t"         \
+		INST_PTR_STR"\t8b, 11b\n\t"         \
 		".previous"			    \
 		: "=&r" (value), "=r" (res)	    \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -343,8 +343,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"              \
-		PTR_STR"\t2b, 4b\n\t"              \
+		INST_PTR_STR"\t1b, 4b\n\t"          \
+		INST_PTR_STR"\t2b, 4b\n\t"          \
 		".previous"                         \
 		: "=r" (res)                        \
 		: "r" (value), "r" (addr), "i" (-EFAULT));\
@@ -364,8 +364,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
+		INST_PTR_STR"\t1b, 4b\n\t"          \
+		INST_PTR_STR"\t2b, 4b\n\t"          \
 		".previous"                         \
 		: "=r" (res)                                \
 		: "r" (value), "r" (addr), "i" (-EFAULT));  \
@@ -384,8 +384,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
+		INST_PTR_STR"\t1b, 4b\n\t"          \
+		INST_PTR_STR"\t2b, 4b\n\t"          \
 		".previous"                         \
 		: "=r" (res)                                \
 		: "r" (value), "r" (addr), "i" (-EFAULT));  \
@@ -413,10 +413,10 @@ do {                                                \
 		"j\t10b\n\t"			    \
 		".previous\n\t"			    \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 11b\n\t"		    \
-		PTR_STR"\t2b, 11b\n\t"		    \
-		PTR_STR"\t3b, 11b\n\t"		    \
-		PTR_STR"\t4b, 11b\n\t"		    \
+		INST_PTR_STR"\t1b, 11b\n\t"         \
+		INST_PTR_STR"\t2b, 11b\n\t"         \
+		INST_PTR_STR"\t3b, 11b\n\t"         \
+		INST_PTR_STR"\t4b, 11b\n\t"         \
 		".previous"			    \
 		: "=&r" (res)				    \
 		: "r" (value), "r" (addr), "i" (-EFAULT)    \
@@ -453,14 +453,14 @@ do {                                                \
 		"j\t10b\n\t"			    \
 		".previous\n\t"			    \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 11b\n\t"		    \
-		PTR_STR"\t2b, 11b\n\t"		    \
-		PTR_STR"\t3b, 11b\n\t"		    \
-		PTR_STR"\t4b, 11b\n\t"		    \
-		PTR_STR"\t5b, 11b\n\t"		    \
-		PTR_STR"\t6b, 11b\n\t"		    \
-		PTR_STR"\t7b, 11b\n\t"		    \
-		PTR_STR"\t8b, 11b\n\t"		    \
+		INST_PTR_STR"\t1b, 11b\n\t"         \
+		INST_PTR_STR"\t2b, 11b\n\t"         \
+		INST_PTR_STR"\t3b, 11b\n\t"         \
+		INST_PTR_STR"\t4b, 11b\n\t"         \
+		INST_PTR_STR"\t5b, 11b\n\t"         \
+		INST_PTR_STR"\t6b, 11b\n\t"         \
+		INST_PTR_STR"\t7b, 11b\n\t"         \
+		INST_PTR_STR"\t8b, 11b\n\t"         \
 		".previous"			    \
 		: "=&r" (res)				    \
 		: "r" (value), "r" (addr), "i" (-EFAULT)    \
@@ -486,8 +486,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
+		INST_PTR_STR"\t1b, 4b\n\t"          \
+		INST_PTR_STR"\t2b, 4b\n\t"          \
 		".previous"                         \
 		: "=&r" (value), "=r" (res)         \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -507,8 +507,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
+		INST_PTR_STR"\t1b, 4b\n\t"          \
+		INST_PTR_STR"\t2b, 4b\n\t"          \
 		".previous"                         \
 		: "=&r" (value), "=r" (res)         \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -540,10 +540,10 @@ do {                                                \
 		"j\t10b\n\t"			    \
 		".previous\n\t"			    \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 11b\n\t"		    \
-		PTR_STR"\t2b, 11b\n\t"		    \
-		PTR_STR"\t3b, 11b\n\t"		    \
-		PTR_STR"\t4b, 11b\n\t"		    \
+		INST_PTR_STR"\t1b, 11b\n\t"         \
+		INST_PTR_STR"\t2b, 11b\n\t"         \
+		INST_PTR_STR"\t3b, 11b\n\t"         \
+		INST_PTR_STR"\t4b, 11b\n\t"         \
 		".previous"			    \
 		: "=&r" (value), "=r" (res)	    \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -569,8 +569,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
+		INST_PTR_STR"\t1b, 4b\n\t"          \
+		INST_PTR_STR"\t2b, 4b\n\t"          \
 		".previous"                         \
 		: "=&r" (value), "=r" (res)         \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -592,8 +592,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
+		INST_PTR_STR"\t1b, 4b\n\t"          \
+		INST_PTR_STR"\t2b, 4b\n\t"          \
 		".previous"                         \
 		: "=&r" (value), "=r" (res)         \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -612,8 +612,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
+		INST_PTR_STR"\t1b, 4b\n\t"          \
+		INST_PTR_STR"\t2b, 4b\n\t"          \
 		".previous"                         \
 		: "=&r" (value), "=r" (res)         \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -645,10 +645,10 @@ do {                                                \
 		"j\t10b\n\t"			    \
 		".previous\n\t"			    \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 11b\n\t"		    \
-		PTR_STR"\t2b, 11b\n\t"		    \
-		PTR_STR"\t3b, 11b\n\t"		    \
-		PTR_STR"\t4b, 11b\n\t"		    \
+		INST_PTR_STR"\t1b, 11b\n\t"         \
+		INST_PTR_STR"\t2b, 11b\n\t"         \
+		INST_PTR_STR"\t3b, 11b\n\t"         \
+		INST_PTR_STR"\t4b, 11b\n\t"         \
 		".previous"			    \
 		: "=&r" (value), "=r" (res)	    \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -690,14 +690,14 @@ do {                                                \
 		"j\t10b\n\t"			    \
 		".previous\n\t"			    \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 11b\n\t"		    \
-		PTR_STR"\t2b, 11b\n\t"		    \
-		PTR_STR"\t3b, 11b\n\t"		    \
-		PTR_STR"\t4b, 11b\n\t"		    \
-		PTR_STR"\t5b, 11b\n\t"		    \
-		PTR_STR"\t6b, 11b\n\t"		    \
-		PTR_STR"\t7b, 11b\n\t"		    \
-		PTR_STR"\t8b, 11b\n\t"		    \
+		INST_PTR_STR"\t1b, 11b\n\t"         \
+		INST_PTR_STR"\t2b, 11b\n\t"         \
+		INST_PTR_STR"\t3b, 11b\n\t"         \
+		INST_PTR_STR"\t4b, 11b\n\t"         \
+		INST_PTR_STR"\t5b, 11b\n\t"         \
+		INST_PTR_STR"\t6b, 11b\n\t"         \
+		INST_PTR_STR"\t7b, 11b\n\t"         \
+		INST_PTR_STR"\t8b, 11b\n\t"         \
 		".previous"			    \
 		: "=&r" (value), "=r" (res)	    \
 		: "r" (addr), "i" (-EFAULT));       \
@@ -720,8 +720,8 @@ do {                                                 \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
+		INST_PTR_STR"\t1b, 4b\n\t"          \
+		INST_PTR_STR"\t2b, 4b\n\t"          \
 		".previous"                         \
 		: "=r" (res)                        \
 		: "r" (value), "r" (addr), "i" (-EFAULT));\
@@ -741,8 +741,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
+		INST_PTR_STR"\t1b, 4b\n\t"          \
+		INST_PTR_STR"\t2b, 4b\n\t"          \
 		".previous"                         \
 		: "=r" (res)                                \
 		: "r" (value), "r" (addr), "i" (-EFAULT));  \
@@ -761,8 +761,8 @@ do {                                                \
 		"j\t3b\n\t"                         \
 		".previous\n\t"                     \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 4b\n\t"               \
-		PTR_STR"\t2b, 4b\n\t"               \
+		INST_PTR_STR"\t1b, 4b\n\t"          \
+		INST_PTR_STR"\t2b, 4b\n\t"          \
 		".previous"                         \
 		: "=r" (res)                                \
 		: "r" (value), "r" (addr), "i" (-EFAULT));  \
@@ -791,10 +791,10 @@ do {                                                \
 		"j\t10b\n\t"			    \
 		".previous\n\t"			    \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 11b\n\t"		    \
-		PTR_STR"\t2b, 11b\n\t"		    \
-		PTR_STR"\t3b, 11b\n\t"		    \
-		PTR_STR"\t4b, 11b\n\t"		    \
+		INST_PTR_STR"\t1b, 11b\n\t"         \
+		INST_PTR_STR"\t2b, 11b\n\t"         \
+		INST_PTR_STR"\t3b, 11b\n\t"         \
+		INST_PTR_STR"\t4b, 11b\n\t"         \
 		".previous"			    \
 		: "=&r" (res)				    \
 		: "r" (value), "r" (addr), "i" (-EFAULT)    \
@@ -831,14 +831,14 @@ do {                                                \
 		"j\t10b\n\t"			    \
 		".previous\n\t"			    \
 		".section\t__ex_table,\"a\"\n\t"    \
-		PTR_STR"\t1b, 11b\n\t"		    \
-		PTR_STR"\t2b, 11b\n\t"		    \
-		PTR_STR"\t3b, 11b\n\t"		    \
-		PTR_STR"\t4b, 11b\n\t"		    \
-		PTR_STR"\t5b, 11b\n\t"		    \
-		PTR_STR"\t6b, 11b\n\t"		    \
-		PTR_STR"\t7b, 11b\n\t"		    \
-		PTR_STR"\t8b, 11b\n\t"		    \
+		INST_PTR_STR"\t1b, 11b\n\t"         \
+		INST_PTR_STR"\t2b, 11b\n\t"         \
+		INST_PTR_STR"\t3b, 11b\n\t"         \
+		INST_PTR_STR"\t4b, 11b\n\t"         \
+		INST_PTR_STR"\t5b, 11b\n\t"         \
+		INST_PTR_STR"\t6b, 11b\n\t"         \
+		INST_PTR_STR"\t7b, 11b\n\t"         \
+		INST_PTR_STR"\t8b, 11b\n\t"         \
 		".previous"			    \
 		: "=&r" (res)				    \
 		: "r" (value), "r" (addr), "i" (-EFAULT)    \
-- 
2.1.0

