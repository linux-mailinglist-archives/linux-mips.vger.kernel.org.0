Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E597475474
	for <lists+linux-mips@lfdr.de>; Wed, 15 Dec 2021 09:45:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240898AbhLOIpW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Dec 2021 03:45:22 -0500
Received: from mail.loongson.cn ([114.242.206.163]:38792 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231561AbhLOIpU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Dec 2021 03:45:20 -0500
Received: from localhost.localdomain (unknown [111.9.175.10])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxrNwUq7lh0P4AAA--.1916S3;
        Wed, 15 Dec 2021 16:45:13 +0800 (CST)
From:   Huang Pei <huangpei@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com
Cc:     Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH 1/4] MIPS: fix local_{add,sub}_return on MIPS64
Date:   Wed, 15 Dec 2021 16:44:57 +0800
Message-Id: <20211215084500.24444-2-huangpei@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215084500.24444-1-huangpei@loongson.cn>
References: <20211215084500.24444-1-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxrNwUq7lh0P4AAA--.1916S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ArW3WFy7WF1kZF43Kr1Dtrb_yoW8tr4kpF
        WDCas7KFWqgFyxGasIkFWSkr43u3y5GrZa9Fy09r9FyF9aqwnrtrZ7K34vqF1kJa18t3W8
        GFWa9ry5WF1IyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPG14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
        yTuYvjfU0Q6pDUUUU
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use "daddu/dsubu" for long int on MIPS64 instead of "addu/subu"

Fixes: 7232311ef14c ("local_t: mips extension")
Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/include/asm/llsc.h  | 4 ++++
 arch/mips/include/asm/local.h | 8 ++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/llsc.h b/arch/mips/include/asm/llsc.h
index ec09fe5d6d6c..8cc28177c37f 100644
--- a/arch/mips/include/asm/llsc.h
+++ b/arch/mips/include/asm/llsc.h
@@ -14,10 +14,14 @@
 #if _MIPS_SZLONG == 32
 #define __LL		"ll	"
 #define __SC		"sc	"
+#define __ADDU		"addu	"
+#define __SUBU		"subu	"
 #define __INS		"ins	"
 #define __EXT		"ext	"
 #elif _MIPS_SZLONG == 64
 #define __LL		"lld	"
+#define __ADDU		"daddu	"
+#define __SUBU		"dsubu	"
 #define __SC		"scd	"
 #define __INS		"dins	"
 #define __EXT		"dext	"
diff --git a/arch/mips/include/asm/local.h b/arch/mips/include/asm/local.h
index ecda7295ddcd..608651d9affe 100644
--- a/arch/mips/include/asm/local.h
+++ b/arch/mips/include/asm/local.h
@@ -39,7 +39,7 @@ static __inline__ long local_add_return(long i, local_t * l)
 		"	.set	arch=r4000				\n"
 			__SYNC(full, loongson3_war) "			\n"
 		"1:"	__LL	"%1, %2		# local_add_return	\n"
-		"	addu	%0, %1, %3				\n"
+			__ADDU	"%0, %1, %3				\n"
 			__SC	"%0, %2					\n"
 		"	beqzl	%0, 1b					\n"
 		"	addu	%0, %1, %3				\n"
@@ -55,7 +55,7 @@ static __inline__ long local_add_return(long i, local_t * l)
 		"	.set	"MIPS_ISA_ARCH_LEVEL"			\n"
 			__SYNC(full, loongson3_war) "			\n"
 		"1:"	__LL	"%1, %2		# local_add_return	\n"
-		"	addu	%0, %1, %3				\n"
+			__ADDU	"%0, %1, %3				\n"
 			__SC	"%0, %2					\n"
 		"	beqz	%0, 1b					\n"
 		"	addu	%0, %1, %3				\n"
@@ -88,7 +88,7 @@ static __inline__ long local_sub_return(long i, local_t * l)
 		"	.set	arch=r4000				\n"
 			__SYNC(full, loongson3_war) "			\n"
 		"1:"	__LL	"%1, %2		# local_sub_return	\n"
-		"	subu	%0, %1, %3				\n"
+			__SUBU	"%0, %1, %3				\n"
 			__SC	"%0, %2					\n"
 		"	beqzl	%0, 1b					\n"
 		"	subu	%0, %1, %3				\n"
@@ -104,7 +104,7 @@ static __inline__ long local_sub_return(long i, local_t * l)
 		"	.set	"MIPS_ISA_ARCH_LEVEL"			\n"
 			__SYNC(full, loongson3_war) "			\n"
 		"1:"	__LL	"%1, %2		# local_sub_return	\n"
-		"	subu	%0, %1, %3				\n"
+			__SUBU	"%0, %1, %3				\n"
 			__SC	"%0, %2					\n"
 		"	beqz	%0, 1b					\n"
 		"	subu	%0, %1, %3				\n"
-- 
2.20.1

