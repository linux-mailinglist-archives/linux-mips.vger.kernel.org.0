Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1D3288772
	for <lists+linux-mips@lfdr.de>; Fri,  9 Oct 2020 12:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732584AbgJIK5r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Oct 2020 06:57:47 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38256 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732388AbgJIK5h (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 9 Oct 2020 06:57:37 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx2MUaQoBf2pcbAA--.2238S2;
        Fri, 09 Oct 2020 18:57:31 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH 0/3] Avoid build error, clean up numa.c and add /proc/boardinfo
Date:   Fri,  9 Oct 2020 18:57:27 +0800
Message-Id: <1602241050-24051-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx2MUaQoBf2pcbAA--.2238S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF18trWrGw45XF43GFW7Jwb_yoWxZFc_KF
        W2ya48K34fZFyxJayUXr4fXrW7WayUW3ZxCFn8JrWYvasavF9xJFW8Aw4UWF1DZ3Wqvr4r
        XFW8Cr18ZFs2gjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbc8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8twCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
        1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
        cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfU0NtxUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Tiezhu Yang (3):
  MIPS: Loongson64: Select SMP in Kconfig to avoid build error
  MIPS: Loongson64: Clean up numa.c
  MIPS: Loongson64: Add /proc/boardinfo

 arch/mips/Kconfig                                  |  1 +
 arch/mips/configs/loongson3_defconfig              |  1 -
 arch/mips/include/asm/mach-loongson64/boot_param.h |  4 +++
 arch/mips/include/asm/mach-loongson64/mmzone.h     |  6 +---
 arch/mips/loongson64/Makefile                      |  2 +-
 arch/mips/loongson64/boardinfo.c                   | 40 ++++++++++++++++++++++
 arch/mips/loongson64/env.c                         | 10 ++++++
 arch/mips/loongson64/numa.c                        | 29 ++--------------
 8 files changed, 60 insertions(+), 33 deletions(-)
 create mode 100644 arch/mips/loongson64/boardinfo.c

-- 
2.1.0

