Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A35C82545A7
	for <lists+linux-mips@lfdr.de>; Thu, 27 Aug 2020 15:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726936AbgH0NFp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Aug 2020 09:05:45 -0400
Received: from mail.loongson.cn ([114.242.206.163]:51496 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726250AbgH0NFk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 Aug 2020 09:05:40 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz92Tr0df6psOAA--.34S2;
        Thu, 27 Aug 2020 21:05:23 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: CPU_P5600: Cleanup unused code
Date:   Thu, 27 Aug 2020 21:05:17 +0800
Message-Id: <1598533517-13491-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxz92Tr0df6psOAA--.34S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZrW8XFW7Jw43AryxAFW5Jrb_yoWxAwc_Jw
        sIya1rWrn3Z3s7WryUWrWrAF1qyayj9ryxArnFvryav3ySv3W7J3yUJFnrXr1DGanF934r
        ZrWfJr1Uurn7tjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb28YjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6ry8MxAIw28I
        cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUJVWUXwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
        IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jaSoJUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

$ grep "CPU_SUPPORTS_UNCACHED_ACCELERATED" -nR
arch/mips/Kconfig:1591:	select \
CPU_SUPPORTS_UNCACHED_ACCELERATED

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 99220e7..6ee4488 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1589,7 +1589,6 @@ config CPU_P5600
 	select CPU_SUPPORTS_32BIT_KERNEL
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_MSA
-	select CPU_SUPPORTS_UNCACHED_ACCELERATED
 	select CPU_SUPPORTS_CPUFREQ
 	select CPU_MIPSR2_IRQ_VI
 	select CPU_MIPSR2_IRQ_EI
-- 
2.1.0

