Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E337C2B8A1A
	for <lists+linux-mips@lfdr.de>; Thu, 19 Nov 2020 03:30:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgKSC3W (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 18 Nov 2020 21:29:22 -0500
Received: from mail.loongson.cn ([114.242.206.163]:52816 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726316AbgKSC3W (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 18 Nov 2020 21:29:22 -0500
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxytF62LVfImASAA--.42816S4;
        Thu, 19 Nov 2020 10:29:16 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] MIPS: KASLR: Make relocation_address can be configured
Date:   Thu, 19 Nov 2020 10:29:14 +0800
Message-Id: <1605752954-10368-3-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1605752954-10368-1-git-send-email-hejinyang@loongson.cn>
References: <1605752954-10368-1-git-send-email-hejinyang@loongson.cn>
X-CM-TRANSID: AQAAf9AxytF62LVfImASAA--.42816S4
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFWrZr13Gr4kZF1xtr43Wrg_yoW8Gr47p3
        9rJaykGw4jgF13G390q395Wry5A3Z3Xay3uF4qy3y5Z3W3ur17A3WkWr10q3yvqr1ktayf
        Wr90gFWjyw1Fk3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280
        aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
        kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm
        72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r4UMxAIw28Icx
        kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
        xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42
        IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
        6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
        CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5uwZ3UUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When CONFIG_RANDOMIZE_BASE is not set, determine_relocation_address()
always returns a constant. It is not friendly to users if the address
cannot be used. Make it can be configured at Kconfig.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/Kconfig           | 5 +++++
 arch/mips/kernel/relocate.c | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 1508829..1c95478 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2803,6 +2803,11 @@ config RELOCATION_TABLE_SIZE
 
 	  If unsure, leave at the default value.
 
+config RELOCATE_DESTINATION
+	hex "Relocate address when RANDOMIZE_BASE is not set"
+	depends on RELOCATABLE && !RANDOMIZE_BASE
+	default "0xffffffff81000000"
+
 config RANDOMIZE_BASE
 	bool "Randomize the address of the kernel image"
 	depends on RELOCATABLE
diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
index 709cfa0..b7ea6ff 100644
--- a/arch/mips/kernel/relocate.c
+++ b/arch/mips/kernel/relocate.c
@@ -276,7 +276,7 @@ static inline void __init *determine_relocation_address(void)
 	 * Choose a new address for the kernel
 	 * For now we'll hard code the destination
 	 */
-	return (void *)0xffffffff81000000;
+	return (void *)CONFIG_RELOCATE_DESTINATION;
 }
 
 #endif
-- 
2.1.0

