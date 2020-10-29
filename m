Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADE0429E5B6
	for <lists+linux-mips@lfdr.de>; Thu, 29 Oct 2020 09:05:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbgJ2IFP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Oct 2020 04:05:15 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58388 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727264AbgJ2ID2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 29 Oct 2020 04:03:28 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_9JJd5pfmHcCAA--.10240S2;
        Thu, 29 Oct 2020 16:03:22 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH 0/6] Modify some registers operations and move decode_cpucfg() to loongson_regs.h
Date:   Thu, 29 Oct 2020 16:02:55 +0800
Message-Id: <1603958581-4723-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx_9JJd5pfmHcCAA--.10240S2
X-Coremail-Antispam: 1UD129KBjvdXoWruFy8JF4xKrWkWrykZw4fXwb_yoW3Wrb_KF
        W7ta4rJ3yxW3WfJa4DWr1xXrW7XFWUC3y3CFn8JrZagayYqryDZr48Ar4UWa1DWa1q9ry5
        Xr48uFykA3WIqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbcxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GFyl
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUjwL05UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Tiezhu Yang (6):
  MIPS: Loongson64: Do not write the read only field LPA of CP0_CONFIG3
  MIPS: Loongson64: Set the field ELPA of CP0_PAGEGRAIN only once
  MIPS: Loongson64: Set IPI_Enable register per core by itself
  MIPS: Loongson64: Add Mail_Send support for 3A4000+ CPU
  MIPS: Loongson64: Make sure the PC address is correct when 3A4000+ CPU
    hotplug
  MIPS: Loongson64: Move decode_cpucfg() to loongson_regs.h

 .../asm/mach-loongson64/kernel-entry-init.h        |  8 ---
 .../include/asm/mach-loongson64/loongson_regs.h    | 34 ++++++++++
 arch/mips/kernel/cpu-probe.c                       | 31 +--------
 arch/mips/loongson64/numa.c                        | 20 +-----
 arch/mips/loongson64/smp.c                         | 78 +++++++++++++++++-----
 5 files changed, 97 insertions(+), 74 deletions(-)

-- 
2.1.0

