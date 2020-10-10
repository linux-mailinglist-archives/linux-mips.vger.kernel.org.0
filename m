Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 710B328A484
	for <lists+linux-mips@lfdr.de>; Sun, 11 Oct 2020 01:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727894AbgJJXsB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 10 Oct 2020 19:48:01 -0400
Received: from mail.loongson.cn ([114.242.206.163]:36514 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726098AbgJJXsB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 10 Oct 2020 19:48:01 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxGMQrSIJfLfobAA--.13680S2;
        Sun, 11 Oct 2020 07:47:55 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 0/4 RESEND] Avoid build error, clean up numa.c and add /proc/boardinfo
Date:   Sun, 11 Oct 2020 07:47:50 +0800
Message-Id: <1602373674-4579-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9DxGMQrSIJfLfobAA--.13680S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZr1DJrW8uF1xuF4kGr18AFb_yoWDKFXEkF
        ZFya48KryrAa4xJayxZF4fWFW7WayUW3ZxCF15XrWavas3ZFZxGFW8A3yjgF1kZ3Wjvrs5
        XFW8Cr1kZFs2kjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbcxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
        1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVWfMxAI
        w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
        4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxG
        rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJw
        CI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
        cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjS_M3UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

[RESEND due to the following reason:
Can not connect to recipient's server because of unstable
network or firewall filter. rcpt handle timeout,last handle
info: Host vger.kernel.org(23.128.96.18) command RCPT TO
respond timeout or disconnected]

v2: add patch #4 suggested by Jiaxun 

Tiezhu Yang (4):
  MIPS: Loongson64: Select SMP in Kconfig to avoid build error
  MIPS: Loongson64: Clean up numa.c
  MIPS: Loongson64: Add /proc/boardinfo
  docs: fs: proc.rst: Add boardinfo description for Loongson64

 Documentation/filesystems/proc.rst                 |  1 +
 arch/mips/Kconfig                                  |  1 +
 arch/mips/configs/loongson3_defconfig              |  1 -
 arch/mips/include/asm/mach-loongson64/boot_param.h |  4 +++
 arch/mips/include/asm/mach-loongson64/mmzone.h     |  6 +---
 arch/mips/loongson64/Makefile                      |  2 +-
 arch/mips/loongson64/boardinfo.c                   | 40 ++++++++++++++++++++++
 arch/mips/loongson64/env.c                         | 10 ++++++
 arch/mips/loongson64/numa.c                        | 29 ++--------------
 9 files changed, 61 insertions(+), 33 deletions(-)
 create mode 100644 arch/mips/loongson64/boardinfo.c

-- 
2.1.0

