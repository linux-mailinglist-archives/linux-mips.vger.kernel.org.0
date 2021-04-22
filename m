Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA4B367769
	for <lists+linux-mips@lfdr.de>; Thu, 22 Apr 2021 04:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234078AbhDVCZi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 21 Apr 2021 22:25:38 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44218 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230259AbhDVCZh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 21 Apr 2021 22:25:37 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT+5n3oBgwxoMAA--.4114S2;
        Thu, 22 Apr 2021 10:24:40 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, Baoquan He <bhe@redhat.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jinyang He <hejinyang@loongson.cn>, kexec@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] mips: Fix related problems in kdump operation
Date:   Thu, 22 Apr 2021 10:24:30 +0800
Message-Id: <1619058274-6996-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxT+5n3oBgwxoMAA--.4114S2
X-Coremail-Antispam: 1UD129KBjvdXoWrXF18XryUJFWUKrWUWw43GFg_yoWxWFb_tF
        WIvr97Jr48K3WrGFy2kr4xGrWqka15uryYgF17try7KrWDJa1DAFs0yF98XrnrJFs5AF15
        JF98Ar1vqF12vjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb4xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
        6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
        4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_
        Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
        WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
        7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
        1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8
        JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUCg4hUUU
        UU=
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1. Fix the "mem=" parameter parsing problem.
2. Solve the problem that panic may be triggered due to insufficient memory
when entering the capture kernel.
3. Fix the problem that the captured production kernel data may be destroyed.

Youling Tang (4):
  MIPS: Fix cmdline "mem=" parameter parsing
  mips: kdump: Capture kernel should be able to see old memories
  mips: kdump: Reserve extra memory for crash dump
  mips: kdump: Reserve old memory to avoid the destruction of production
    kernel data

 arch/mips/kernel/setup.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 79 insertions(+), 3 deletions(-)

-- 
2.1.0

