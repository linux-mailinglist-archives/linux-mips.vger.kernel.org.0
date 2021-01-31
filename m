Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADEA309B1E
	for <lists+linux-mips@lfdr.de>; Sun, 31 Jan 2021 09:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbhAaIQE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 31 Jan 2021 03:16:04 -0500
Received: from mail.loongson.cn ([114.242.206.163]:57048 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230035AbhAaIPw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 31 Jan 2021 03:15:52 -0500
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz_PvZhZg1dIAAA--.880S2;
        Sun, 31 Jan 2021 16:14:39 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>
Cc:     Wu Zhangjin <wuzhangjin@gmail.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH 1/3] MIPS: ftrace: Fix N32 save registers
Date:   Sun, 31 Jan 2021 16:14:36 +0800
Message-Id: <1612080878-5426-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxz_PvZhZg1dIAAA--.880S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr47uw4fWw4fuFy8KryUJrb_yoWfXrcEg3
        4Iyw1rWrs3Zr1vqr1qgws8Jr90ya42qwnI9wnrtrWUCr90yrZ8trWkJas5Kas5WF109rsx
        Xr4rG3429FZ7JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb4xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
        Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
        0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
        ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
        1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
        64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
        0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4U
        MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUhdbbUUU
        UU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CONFIG_64BIT is confusing. N32 also pass parameters by a0~a7.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/kernel/mcount.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/mcount.S b/arch/mips/kernel/mcount.S
index cff52b2..808257a 100644
--- a/arch/mips/kernel/mcount.S
+++ b/arch/mips/kernel/mcount.S
@@ -27,7 +27,7 @@
 	PTR_S	a1, PT_R5(sp)
 	PTR_S	a2, PT_R6(sp)
 	PTR_S	a3, PT_R7(sp)
-#ifdef CONFIG_64BIT
+#if _MIPS_SIM == _MIPS_SIM_ABI64 || _MIPS_SIM == _MIPS_SIM_NABI32
 	PTR_S	a4, PT_R8(sp)
 	PTR_S	a5, PT_R9(sp)
 	PTR_S	a6, PT_R10(sp)
@@ -42,7 +42,7 @@
 	PTR_L	a1, PT_R5(sp)
 	PTR_L	a2, PT_R6(sp)
 	PTR_L	a3, PT_R7(sp)
-#ifdef CONFIG_64BIT
+#if _MIPS_SIM == _MIPS_SIM_ABI64 || _MIPS_SIM == _MIPS_SIM_NABI32
 	PTR_L	a4, PT_R8(sp)
 	PTR_L	a5, PT_R9(sp)
 	PTR_L	a6, PT_R10(sp)
-- 
2.1.0

