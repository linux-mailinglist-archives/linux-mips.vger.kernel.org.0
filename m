Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B69F198CA3
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2020 09:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgCaHAQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 31 Mar 2020 03:00:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:56926 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726001AbgCaHAP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 31 Mar 2020 03:00:15 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb9p26oJeRf8hAA--.12S2;
        Tue, 31 Mar 2020 15:00:06 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] MIPS: Loongson: Use CONFIG_NR_CPUS_DEFAULT_64 to support more CPUs
Date:   Tue, 31 Mar 2020 15:00:06 +0800
Message-Id: <1585638006-19439-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxb9p26oJeRf8hAA--.12S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtrW3Gw4rXr47Zr4rtF1fJFb_yoWfAFg_Ka
        nrKan8Jws3CF1kurW7Xw4fGFy3Xa95WFyxAr47XFyjv345Xr13J39Yy3WUur17Wr4q9Fs2
        q3yxJryUury29jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbckFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GF4l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
        42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUfpnQUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When I update the mainline kernel on the Loongson 2-way platform which
has 8 CPUs, it only shows 4 CPUs due to NR_CPUS is 4, this is obviously
wrong.

In order to support more CPUs on the Loongson platform, it is better
to use CONFIG_NR_CPUS_DEFAULT_64 instead of CONFIG_NR_CPUS_DEFAULT_4
to specify the maximum number of CPUs which the kernel will support.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index a1f973c..a0b11f5 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -475,7 +475,7 @@ config MACH_LOONGSON64
 	select ISA
 	select I8259
 	select IRQ_MIPS_CPU
-	select NR_CPUS_DEFAULT_4
+	select NR_CPUS_DEFAULT_64
 	select USE_GENERIC_EARLY_PRINTK_8250
 	select SYS_HAS_CPU_LOONGSON64
 	select SYS_HAS_EARLY_PRINTK
-- 
2.1.0

