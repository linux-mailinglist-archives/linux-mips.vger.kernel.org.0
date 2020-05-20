Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20FD51DAB96
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2020 09:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgETHIK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 03:08:10 -0400
Received: from mail.loongson.cn ([114.242.206.163]:51986 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725998AbgETHIK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 May 2020 03:08:10 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxJupT18ReLeE2AA--.121S2;
        Wed, 20 May 2020 15:08:03 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] MIPS: SGI-IP27: Remove not used definition TICK_SIZE in ip27-timer.c
Date:   Wed, 20 May 2020 15:08:02 +0800
Message-Id: <1589958482-9948-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxJupT18ReLeE2AA--.121S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw1xAw1UKFy8Zry5KF1UGFg_yoWfGwc_Kr
        s2kwsYgr95Wrnaya9I9ws5XFyrAw4xXa1fArn5JF1rJa4rtF45ZrWqyryUCrW3WanY9F4F
        9ay5J348Ar4agjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbckFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
        0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4x
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUfpnQUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

After commit f5ff0a280201 ("[MIPS] Use generic NTP code for all MIPS
platforms"), TICK_SIZE is not used in ip27-timer.c for many years,
remove it.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

Hi Thomas,

I find this not used definition TICK_SIZE just now, maybe I should send
these cleanup patches in a patch series, sorry for that if it is noisy.

 arch/mips/sgi-ip27/ip27-timer.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/sgi-ip27/ip27-timer.c b/arch/mips/sgi-ip27/ip27-timer.c
index 115b1d9..c0e3363 100644
--- a/arch/mips/sgi-ip27/ip27-timer.c
+++ b/arch/mips/sgi-ip27/ip27-timer.c
@@ -28,8 +28,6 @@
 
 #include "ip27-common.h"
 
-#define TICK_SIZE (tick_nsec / 1000)
-
 static int rt_next_event(unsigned long delta, struct clock_event_device *evt)
 {
 	unsigned int cpu = smp_processor_id();
-- 
2.1.0

