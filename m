Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5B62EC8D9
	for <lists+linux-mips@lfdr.de>; Thu,  7 Jan 2021 04:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725789AbhAGDH0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 Jan 2021 22:07:26 -0500
Received: from mail.loongson.cn ([114.242.206.163]:41696 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725792AbhAGDHZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 6 Jan 2021 22:07:25 -0500
Received: from localhost.localdomain (unknown [112.20.112.14])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxWL67evZfYKAAAA--.1473S2;
        Thu, 07 Jan 2021 11:06:35 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Huacai Chen <chenhuacai@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, Yanteng Si <siyanteng01@gmail.com>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH] MIPS: init: move externs to header file
Date:   Thu,  7 Jan 2021 11:06:45 +0800
Message-Id: <20210107030645.1844215-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxWL67evZfYKAAAA--.1473S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF13Cw4kCr1UtFyUuFy7GFg_yoW5XFW8pa
        9rA3Z7GayruF4xXFZxAa4jgr13Ja93JrZ2qay2y3yjq3Wqga4UZrs3trn8Zr1UJrWUKa40
        9ryFgry7WF42yFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
        GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
        1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
        64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
        0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4U
        MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU-_-PUUU
        UU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

    This commit fixes the following checkpatch warnings:

    WARNING: externs should be avoided in .c files

    This is a warning for placing declarations in a ".c" file.
    This fix removes the declaration in ".c" and adds it to
    the common header file.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 arch/mips/include/asm/traps.h       | 1 +
 arch/mips/loongson2ef/common/init.c | 1 -
 arch/mips/loongson64/init.c         | 1 -
 arch/mips/mti-malta/malta-init.c    | 1 -
 arch/mips/pistachio/init.c          | 1 -
 5 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/traps.h b/arch/mips/include/asm/traps.h
index 6a0864bb604d..6aa8f126a43d 100644
--- a/arch/mips/include/asm/traps.h
+++ b/arch/mips/include/asm/traps.h
@@ -24,6 +24,7 @@ extern void (*board_ebase_setup)(void);
 extern void (*board_cache_error_setup)(void);
 
 extern int register_nmi_notifier(struct notifier_block *nb);
+extern char except_vec_nmi[];
 
 #define nmi_notifier(fn, pri)						\
 ({									\
diff --git a/arch/mips/loongson2ef/common/init.c b/arch/mips/loongson2ef/common/init.c
index ce3f02f75e2a..1469a03c0953 100644
--- a/arch/mips/loongson2ef/common/init.c
+++ b/arch/mips/loongson2ef/common/init.c
@@ -19,7 +19,6 @@ unsigned long __maybe_unused _loongson_addrwincfg_base;
 static void __init mips_nmi_setup(void)
 {
 	void *base;
-	extern char except_vec_nmi[];
 
 	base = (void *)(CAC_BASE + 0x380);
 	memcpy(base, except_vec_nmi, 0x80);
diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
index e13f704bef80..cd8e0e0a6104 100644
--- a/arch/mips/loongson64/init.c
+++ b/arch/mips/loongson64/init.c
@@ -25,7 +25,6 @@ u32 node_id_offset;
 static void __init mips_nmi_setup(void)
 {
 	void *base;
-	extern char except_vec_nmi[];
 
 	base = (void *)(CAC_BASE + 0x380);
 	memcpy(base, except_vec_nmi, 0x80);
diff --git a/arch/mips/mti-malta/malta-init.c b/arch/mips/mti-malta/malta-init.c
index 893af377aacc..b03cac5fdc02 100644
--- a/arch/mips/mti-malta/malta-init.c
+++ b/arch/mips/mti-malta/malta-init.c
@@ -90,7 +90,6 @@ static void __init console_config(void)
 static void __init mips_nmi_setup(void)
 {
 	void *base;
-	extern char except_vec_nmi[];
 
 	base = cpu_has_veic ?
 		(void *)(CAC_BASE + 0xa80) :
diff --git a/arch/mips/pistachio/init.c b/arch/mips/pistachio/init.c
index 558995ed6fe8..48bb4ab8839d 100644
--- a/arch/mips/pistachio/init.c
+++ b/arch/mips/pistachio/init.c
@@ -83,7 +83,6 @@ phys_addr_t mips_cdmm_phys_base(void)
 static void __init mips_nmi_setup(void)
 {
 	void *base;
-	extern char except_vec_nmi[];
 
 	base = cpu_has_veic ?
 		(void *)(CAC_BASE + 0xa80) :
-- 
2.27.0

