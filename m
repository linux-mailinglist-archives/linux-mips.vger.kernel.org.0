Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 637692A3D4D
	for <lists+linux-mips@lfdr.de>; Tue,  3 Nov 2020 08:13:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbgKCHMO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 3 Nov 2020 02:12:14 -0500
Received: from mail.loongson.cn ([114.242.206.163]:37224 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725968AbgKCHMO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 3 Nov 2020 02:12:14 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx79PGAqFfIKEEAA--.12977S2;
        Tue, 03 Nov 2020 15:12:06 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v3 0/6] Modify some registers operations and move decode_cpucfg() to loongson_regs.h
Date:   Tue,  3 Nov 2020 15:11:59 +0800
Message-Id: <1604387525-23400-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx79PGAqFfIKEEAA--.12977S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZrWkWw1xKr18Cr43Ar1UZFb_yoW3Krg_Kr
        y2yF93G3yxW3WfJFykXF4xXrW7XFW8C3y3CFn8tr9av3WYqr98Zr48Cr4UWws8uanF9ry5
        XF48WFykA3Z7XjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb3xFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUGVWUXwAv7VCY1x0262k0Y48FwI0_Jr0_Gr1lYx0Ex4A2jsIE14v26r
        4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAq
        YI8I648v4I1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
        1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
        b7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
        vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1l
        IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
        C2KfnxnUUI43ZEXa7VUj5fQtUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

v2: Add some callbacks in csr_ipi probe() for patch #4
v3: Update the commit message and comment for patch #5

Tiezhu Yang (6):
  MIPS: Loongson64: Do not write the read only field LPA of CP0_CONFIG3
  MIPS: Loongson64: Set the field ELPA of CP0_PAGEGRAIN only once
  MIPS: Loongson64: Set IPI_Enable register per core by itself
  MIPS: Loongson64: Add Mail_Send support for 3A4000+ CPU
  MIPS: Loongson64: SMP: Fix up play_dead jump indicator
  MIPS: Loongson64: Move decode_cpucfg() to loongson_regs.h

 .../asm/mach-loongson64/kernel-entry-init.h        |   8 --
 .../include/asm/mach-loongson64/loongson_regs.h    |  34 ++++++
 arch/mips/kernel/cpu-probe.c                       |  31 +-----
 arch/mips/loongson64/numa.c                        |  20 +---
 arch/mips/loongson64/smp.c                         | 123 +++++++++++++++++----
 5 files changed, 136 insertions(+), 80 deletions(-)

-- 
2.1.0

