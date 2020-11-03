Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C73112A3AE9
	for <lists+linux-mips@lfdr.de>; Tue,  3 Nov 2020 04:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbgKCDPR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Nov 2020 22:15:17 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47014 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725913AbgKCDPN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 2 Nov 2020 22:15:13 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx7387y6BfU3sEAA--.3657S2;
        Tue, 03 Nov 2020 11:15:07 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 0/6] Modify some registers operations and move decode_cpucfg() to loongson_regs.h
Date:   Tue,  3 Nov 2020 11:15:00 +0800
Message-Id: <1604373306-3599-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx7387y6BfU3sEAA--.3657S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZrWkGw1fKw1kAryrAr1UKFg_yoW3ZFg_KF
        W7tas5J3yxW3WfJa4kXr18XrW7XFW8Cay3GFn8tr9aqa4Yqr98Zr48Cr4UWa1DWa1q9ryr
        Xr48WFykA3WIqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbcAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
        GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
        1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij
        64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
        0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
        IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU84SoDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v2: Add some callbacks in csr_ipi probe() for patch #4

Tiezhu Yang (6):
  MIPS: Loongson64: Do not write the read only field LPA of CP0_CONFIG3
  MIPS: Loongson64: Set the field ELPA of CP0_PAGEGRAIN only once
  MIPS: Loongson64: Set IPI_Enable register per core by itself
  MIPS: Loongson64: Add Mail_Send support for 3A4000+ CPU
  MIPS: Loongson64: Make sure the PC address is correct when 3A4000+ CPU
    hotplug
  MIPS: Loongson64: Move decode_cpucfg() to loongson_regs.h

 .../asm/mach-loongson64/kernel-entry-init.h        |   8 --
 .../include/asm/mach-loongson64/loongson_regs.h    |  34 ++++++
 arch/mips/kernel/cpu-probe.c                       |  31 +-----
 arch/mips/loongson64/numa.c                        |  20 +---
 arch/mips/loongson64/smp.c                         | 123 +++++++++++++++++----
 5 files changed, 136 insertions(+), 80 deletions(-)

-- 
2.1.0

