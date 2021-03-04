Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A796832D175
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 12:03:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239318AbhCDLCY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 06:02:24 -0500
Received: from mail.loongson.cn ([114.242.206.163]:59742 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239165AbhCDLBu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Mar 2021 06:01:50 -0500
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn_DpvUBgUFAUAA--.3851S2;
        Thu, 04 Mar 2021 19:00:58 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] some cleanup code
Date:   Thu,  4 Mar 2021 19:00:55 +0800
Message-Id: <20210304110057.22144-1-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn_DpvUBgUFAUAA--.3851S2
X-Coremail-Antispam: 1UD129KBjvdXoWrGFykuF4xtF1UZF1DCryfWFg_yoWxWFgEka
        42qFWkGryxAa4xJayUXr17XrW2gFWkG3Z8CFn8JrZ0va4Sv3sxAFy8Ar4UWFnrXr4Yvr1r
        XrW8ur18A3Z7XjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb2xYjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_Gw4l42xK82IY
        c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
        026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF
        0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
        vE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E
        87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcxwIDUUUU
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

These patches clean up some code about Loongson64.

Qing Zhang (2):
  MIPS: Loongson64: Remove unused sysconf members
  MIPS: Loongson64: Move loongson_system_configuration to loongson.h

 .../include/asm/mach-loongson64/boot_param.h  | 27 ------------
 .../include/asm/mach-loongson64/loongson.h    | 18 ++++++++
 arch/mips/loongson64/Makefile                 |  2 +-
 arch/mips/loongson64/env.c                    | 20 ---------
 arch/mips/loongson64/platform.c               | 42 -------------------
 drivers/irqchip/irq-loongson-liointc.c        |  2 +-
 6 files changed, 20 insertions(+), 91 deletions(-)
 delete mode 100644 arch/mips/loongson64/platform.c

-- 
2.20.1

