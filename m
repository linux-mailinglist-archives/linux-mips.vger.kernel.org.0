Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9DFF193879
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2020 07:18:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgCZGSj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Mar 2020 02:18:39 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17982 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726354AbgCZGSj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 26 Mar 2020 02:18:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585203478;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=1tUS5brjQz/W4PzttFM/uURRT9pAJ4lCQJg8KB6iyOo=;
        b=QvywNxaY/l6tSA8dvuVTmqqouHiorY6v1iWdcV744Isf0pirQmHoKK8MBAR1aXOv
        3Pg+HVzTQWDl0xVL193a1yv+1qb5uPG4l7DgfSpeeFnOGWBeGU4UrnSXB5YieBi9mMI
        /4AEmAf0F7U4AbDcBKXPUri7QM0b7nyID16X41Y4=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585203475511185.45193109667787; Thu, 26 Mar 2020 14:17:55 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, maz@kernel.org, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <20200326061704.387483-1-jiaxun.yang@flygoat.com>
Subject: [RFC PATCH 0/6] MIPS: Handle CPU IRQ in domain's way
Date:   Thu, 26 Mar 2020 14:16:56 +0800
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In [1], we discussed about why MIPS CPU IRQ doesn't fit simple IRQ domain.
I felt it's time to remove this barrier and "modernize" the whole flow.

This set is simply a proof of concept of removing the whole MIPS_CPU_IRQ_BA=
SE
and use the irq_domain's way.

Currently only Loongson64 and ip22 are adapted for testing purpose,
if everybody is happy with it, then I'll take a look at more platforms.

Btw: Thomas, are you still willing to drop some platforms in 5.8?

[1]: https://patchwork.kernel.org/patch/11456911/

Jiaxun Yang (6):
  MIPS: irq_cpu: Add a helper to map virq for CPU IRQ
  irqchip: mips-cpu: Allocate fwnode for non-DT platforms
  irqchip: mips-cpu: Convert to simple domain
  MIPS: kernel: Use mips_cpu_map_virq helper
  MIPS: loongson64: Use mips_cpu_map_virq helper
  MIPS: ip22: Use mips_cpu_map_virq helper

 arch/mips/include/asm/irq_cpu.h      | 19 +++++++++++++++++-
 arch/mips/include/asm/sgi/ip22.h     | 30 ++++++++++++++--------------
 arch/mips/kernel/cevt-r4k.c          |  2 +-
 arch/mips/kernel/perf_event_mipsxx.c |  3 ++-
 arch/mips/kernel/rtlx-mt.c           |  7 +++++--
 arch/mips/loongson64/smp.c           |  6 ++++--
 arch/mips/sgi-ip22/ip22-int.c        | 14 ++++++++-----
 drivers/irqchip/irq-mips-cpu.c       | 22 ++++++++++++++------
 8 files changed, 70 insertions(+), 33 deletions(-)

--=20
2.26.0.rc2


