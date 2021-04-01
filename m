Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD40351903
	for <lists+linux-mips@lfdr.de>; Thu,  1 Apr 2021 19:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235110AbhDARs7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Apr 2021 13:48:59 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43916 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235018AbhDARq4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 1 Apr 2021 13:46:56 -0400
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX8s0ymVgtFkDAA--.7389S3;
        Thu, 01 Apr 2021 21:27:17 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC 1/3] MIPS: relocate: Only compile relocs when CONFIG_RELOCATABLE is enabled
Date:   Thu,  1 Apr 2021 21:27:11 +0800
Message-Id: <1617283633-18598-2-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1617283633-18598-1-git-send-email-hejinyang@loongson.cn>
References: <1617283633-18598-1-git-send-email-hejinyang@loongson.cn>
X-CM-TRANSID: AQAAf9DxX8s0ymVgtFkDAA--.7389S3
X-Coremail-Antispam: 1UD129KBjvdXoWrZF15Kry5Kw45ur4fZFyUGFg_yoWxtFg_K3
        y7Kw4rKw1rJryDW3y7W3WrWryUu3y8urn5CF4qqwn8J34Yyr13GFWDt3sxJF45ua1q9rWr
        tF93ZFnrCrs2kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbfxYjsxI4VWkCwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
        IE14v26r18M28IrcIa0xkI8VCY1x0267AKxVWUXVWUCwA2ocxC64kIII0Yj41l84x0c7CE
        w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6x
        kF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY
        1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4
        xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCa
        FVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkIecxEwVAFwVW5GwCF04k20xvY0x0EwI
        xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
        Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7
        IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
        6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
        AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j46wZUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Relocs is used for create relocate information, only CONFIG_RELOCATABLE
is enabled can it be used.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index e71d587..cb54d86 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -17,7 +17,9 @@ archscripts: scripts_basic
 ifeq ($(CONFIG_CPU_LOONGSON3_WORKAROUNDS),y)
 	$(Q)$(MAKE) $(build)=arch/mips/tools loongson3-llsc-check
 endif
+ifeq ($(CONFIG_RELOCATABLE),y)
 	$(Q)$(MAKE) $(build)=arch/mips/boot/tools relocs
+endif
 
 KBUILD_DEFCONFIG := 32r2el_defconfig
 KBUILD_DTBS      := dtbs
-- 
2.1.0

