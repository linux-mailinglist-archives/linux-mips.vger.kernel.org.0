Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01EFB35C632
	for <lists+linux-mips@lfdr.de>; Mon, 12 Apr 2021 14:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239097AbhDLM2v (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Apr 2021 08:28:51 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59210 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238414AbhDLM2u (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Apr 2021 08:28:50 -0400
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxzcjsPHRgCyoHAA--.9793S2;
        Mon, 12 Apr 2021 20:28:28 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] MIPS: relocate: Add automatic relocation to CONFIG_RELOCATABLE
Date:   Mon, 12 Apr 2021 20:28:09 +0800
Message-Id: <1618230494-6207-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxzcjsPHRgCyoHAA--.9793S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZrW8Zr1kCw43GryUtr18Xwb_yoWkGFbEgr
        W2gry0qr4xXFW29FW5Aw4xX34akay3CFySk3WkXrWayFy3Ar13AF48G34UGr4vvwsYyFWk
        ZF93Xr1kCanrAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb2xYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_Xr1l42xK82IY
        c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
        026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF
        0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
        vE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
        87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUyAsgUUUUU
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1, To get the address the kernel is linked to, use PC-region(static) +
   offset(dynamic) way. See detail at [PATCH v2 3/5]
2, To deal with smp cpu in kernel entry, e.g. cavium-octeon platform,
   move smp cpu handle later than jump to the address kernel linked to.
   See detail at [PATCH v2 4/5]

Jinyang He (5):
  MIPS: relocate: Only compile relocs when CONFIG_RELOCATABLE is enabled
  MIPS: relocate: Use CONFIG_RANDOMIZE_BASE to enable kaslr
  MIPS: Jump to kernel linked address by PC relative way
  MIPS: cavium-octeon: Execute the smp handle after jumping to kernel
    linked address
  MIPS: relocate: Add support to auto relocate kernel

 arch/mips/Makefile                                 |   2 +
 arch/mips/cavium-octeon/smp.c                      |   9 +-
 arch/mips/generic/init.c                           |   4 +-
 arch/mips/include/asm/bootinfo.h                   |   4 +-
 .../asm/mach-cavium-octeon/kernel-entry-init.h     |  24 ++-
 arch/mips/kernel/Makefile                          |   2 +-
 arch/mips/kernel/head.S                            | 185 ++++++++++++++++++++-
 arch/mips/kernel/{relocate.c => kaslr.c}           |  15 --
 8 files changed, 214 insertions(+), 31 deletions(-)
 rename arch/mips/kernel/{relocate.c => kaslr.c} (97%)

-- 
2.1.0

