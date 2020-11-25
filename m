Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BDD02C3D63
	for <lists+linux-mips@lfdr.de>; Wed, 25 Nov 2020 11:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728904AbgKYKLJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Nov 2020 05:11:09 -0500
Received: from mail.loongson.cn ([114.242.206.163]:39536 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728477AbgKYKLI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Nov 2020 05:11:08 -0500
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxKtC3Lb5fAIAWAA--.37041S2;
        Wed, 25 Nov 2020 18:11:04 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Loongson64: Fix up reserving kernel memory range
Date:   Wed, 25 Nov 2020 18:11:02 +0800
Message-Id: <1606299062-7427-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxKtC3Lb5fAIAWAA--.37041S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw1kurWUGw48WrykArWrZrb_yoW8Gry7pr
        WUJry5WF4DAw4xuayrtry5ZryrAa9Fvw4fXF47Aryrua9Iqr92vr1YqF1jgryjvrW0ka47
        XrnayF1jk3WIkaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r4DMxAIw28I
        cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42
        IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07brmRUUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Reserve memory from &_text to &_end. Otherwise if kernel address
was modified, the memory range of start_pfn to kernel_start_pfn
would be reserved. Then we could not use this range.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/loongson64/numa.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index 509b360..c6f0c48 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -151,6 +151,9 @@ static void __init node_mem_init(unsigned int node)
 	NODE_DATA(node)->node_spanned_pages = end_pfn - start_pfn;
 
 	if (node == 0) {
+		/* kernel start address */
+		unsigned long kernel_start_pfn = PFN_DOWN(__pa_symbol(&_text));
+
 		/* kernel end address */
 		unsigned long kernel_end_pfn = PFN_UP(__pa_symbol(&_end));
 
@@ -158,8 +161,8 @@ static void __init node_mem_init(unsigned int node)
 		max_low_pfn = end_pfn;
 
 		/* Reserve the kernel text/data/bss */
-		memblock_reserve(start_pfn << PAGE_SHIFT,
-				 ((kernel_end_pfn - start_pfn) << PAGE_SHIFT));
+		memblock_reserve(kernel_start_pfn << PAGE_SHIFT,
+				 ((kernel_end_pfn - kernel_start_pfn) << PAGE_SHIFT));
 
 		/* Reserve 0xfe000000~0xffffffff for RS780E integrated GPU */
 		if (node_end_pfn(0) >= (0xffffffff >> PAGE_SHIFT))
-- 
2.1.0

