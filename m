Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4416525D674
	for <lists+linux-mips@lfdr.de>; Fri,  4 Sep 2020 12:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729753AbgIDKaF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Sep 2020 06:30:05 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42988 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730185AbgIDKaA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 4 Sep 2020 06:30:00 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX90gF1Jfx8AQAA--.125S2;
        Fri, 04 Sep 2020 18:29:53 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Loongson64: Remove unused loongson_reboot.
Date:   Fri,  4 Sep 2020 18:29:51 +0800
Message-Id: <1599215391-2644-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxX90gF1Jfx8AQAA--.125S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF15WrWkJr1rCF4UZFW3Awb_yoWxZrX_tF
        W2yr4rWF9ayr1xCa4UWr13Wr4xu34DK3W5CFnxJ34Fq3Z0qrsxJ3y8Ar4UtF13XrZ0vr13
        Xr4kGF1xu3Z7KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb28YjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26F4j6r4UJw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r4DMxAIw28I
        cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
        IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jbiSdUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 1bdb7b76705a ("MIPS: Loongson64: Cleanup unused code")
left the loongson_reboot unused, delete it.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/loongson64/reset.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
index bc76710..3bb8a1e 100644
--- a/arch/mips/loongson64/reset.c
+++ b/arch/mips/loongson64/reset.c
@@ -15,11 +15,6 @@
 #include <loongson.h>
 #include <boot_param.h>
 
-static inline void loongson_reboot(void)
-{
-	((void (*)(void))ioremap(LOONGSON_BOOT_BASE, 4)) ();
-}
-
 static void loongson_restart(char *command)
 {
 
-- 
2.1.0

