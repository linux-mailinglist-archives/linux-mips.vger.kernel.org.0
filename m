Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4D8C2552B9
	for <lists+linux-mips@lfdr.de>; Fri, 28 Aug 2020 03:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgH1BxI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Aug 2020 21:53:08 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53298 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726147AbgH1BxH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 Aug 2020 21:53:07 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxOMR_Y0hfpMkOAA--.265S2;
        Fri, 28 Aug 2020 09:53:04 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
Cc:     linux-mips@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v2] MIPS: p5600: Discard UCA config selection
Date:   Fri, 28 Aug 2020 09:53:03 +0800
Message-Id: <1598579583-14311-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxOMR_Y0hfpMkOAA--.265S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFyrKrW3Ww1Utr17Gr1rZwb_yoWxCwc_Jw
        sFya1rGrn3u3s7Wry7WrWrAr1jyayF9FyfArsIvr1av3ySv3W3J3yUtFnrXr1DGw42934r
        Z3yfJr1UCrn2yjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb4kYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JV
        WxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6w4l42xK
        82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
        C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MI8E62xC7I0kMIIY
        rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
        v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_
        Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUTLvtDU
        UUU
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 2a5984360b01 ("MIPS: Drop CPU_SUPPORTS_UNCACHED_ACCELERATED")
removed UCA config, but left the selection unused, delete it.

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

