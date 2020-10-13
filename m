Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 306EB28C869
	for <lists+linux-mips@lfdr.de>; Tue, 13 Oct 2020 07:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388748AbgJMFzc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Oct 2020 01:55:32 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41150 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388506AbgJMFzb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 13 Oct 2020 01:55:31 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX8c3QYVfhPscAA--.14939S2;
        Tue, 13 Oct 2020 13:55:04 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH 0/2] Add /sys/firmware/lefi/boardinfo for Loongson64
Date:   Tue, 13 Oct 2020 13:55:00 +0800
Message-Id: <1602568502-18044-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxX8c3QYVfhPscAA--.14939S2
X-Coremail-Antispam: 1UD129KBjvdXoWrJr4fKw45ur1kAr4kuFyxuFg_yoWxWrbEkr
        12y348Kry8Za4rAFWUZr43CrW7uayUWF15CFy3Jr1jqwn5Za9xGF18A34UuFn7Zryjvr45
        JFy8try8ZFn29jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbckFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GrWl
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUP5rcUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Tiezhu Yang (2):
  MIPS: Loongson64: Add /sys/firmware/lefi/boardinfo
  Documentation: ABI: Add /sys/firmware/lefi/boardinfo description for
    Loongson64

 .../ABI/testing/sysfs-firmware-lefi-boardinfo      | 35 ++++++++++++++++
 arch/mips/include/asm/mach-loongson64/boot_param.h |  4 ++
 arch/mips/loongson64/Makefile                      |  1 +
 arch/mips/loongson64/boardinfo.c                   | 48 ++++++++++++++++++++++
 arch/mips/loongson64/env.c                         | 10 +++++
 5 files changed, 98 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-lefi-boardinfo
 create mode 100644 arch/mips/loongson64/boardinfo.c

-- 
2.1.0

