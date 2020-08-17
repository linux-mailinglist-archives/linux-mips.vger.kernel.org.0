Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E190245B29
	for <lists+linux-mips@lfdr.de>; Mon, 17 Aug 2020 05:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgHQDrl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Aug 2020 23:47:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbgHQDrk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Aug 2020 23:47:40 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58306C061388;
        Sun, 16 Aug 2020 20:47:40 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id B244B1FED2;
        Mon, 17 Aug 2020 03:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1597636056; bh=oWs/OR6uGAmxHxGeX7FqOfuNk1VxyUq9ikoG+zJSSlo=;
        h=From:To:Cc:Subject:Date:From;
        b=SeE8f4Bsk8v5HwBE92s2WK9WLsmYWvUXvxLjfOaOzszCjrx79qi3FPbEnCiaRsa9n
         /6ddDJ+tF5mM9foWZQbiDUJswvc4fUzFgsKCBJ5IT8ywjYbXREg9bFoeTJ+QBwrZ0O
         iHe1rePOJzxFY6rTuL4WtbAucL+4ZTix36nTA+tTzmPC0C0hkI6EVdqWieDkliuUgM
         4mrKC+qblbk4dmAy0UMKrXtMvuz0unwudD6IkBQCUBdsDFJf0FgdEPbuywPiVqOQhT
         zSE0ocSK6vWCx6KHK99NQs34WpGXnPOav3E9GU4wieOIXRrIHKSjP9E7hGUOlA5arQ
         X/J8G6CCAE4gg==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        WANG Xuerui <git@xen0n.name>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Peter Xu <peterx@redhat.com>,
        Sergey Korolev <s.korolev@ndmsystems.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Marc Zyngier <maz@kernel.org>, Anup Patel <anup.patel@wdc.com>,
        Ming Lei <ming.lei@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Atish Patra <atish.patra@wdc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Daniel Jordan <daniel.m.jordan@oracle.com>,
        Steven Price <steven.price@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Michael Kelley <mikelley@microsoft.com>,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Subject: [PATCH 0/7] R4000 clock enhancements for Loongson
Date:   Mon, 17 Aug 2020 11:46:39 +0800
Message-Id: <20200817034701.3515721-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Jiaxun Yang (7):
  MIPS: sync-r4k: Rework to be many cores firendly
  MIPS: time: Use CPUHUP to handle r4k timer
  MIPS: Kconfig: Always select SYNC_R4K if both SMP and r4k timer is
    enabled
  MIPS: Loongson64: Remove custom count sync procudure
  MIPS: cevt-r4k: Don't handle IRQ if clockevent is not enabled
  MIPS: cevt-r4k: Enable intimer for Loongson CPUs with extimer
  MIPS: KVM: Don't use htimer when INTIMER is disabled

 arch/mips/Kconfig                    |  10 +-
 arch/mips/include/asm/cpu-features.h |   4 +
 arch/mips/include/asm/cpu.h          |   1 +
 arch/mips/include/asm/r4k-timer.h    |   5 -
 arch/mips/include/asm/smp.h          |   1 -
 arch/mips/include/asm/time.h         |  28 +++---
 arch/mips/kernel/cevt-r4k.c          |  65 ++++++++++--
 arch/mips/kernel/cpu-probe.c         |   6 +-
 arch/mips/kernel/smp.c               |   5 -
 arch/mips/kernel/sync-r4k.c          | 143 ++++++++++++---------------
 arch/mips/kernel/time.c              |  22 ++++-
 arch/mips/kvm/vz.c                   |   6 ++
 arch/mips/loongson64/smp.c           |  32 +-----
 include/linux/cpuhotplug.h           |   1 +
 14 files changed, 173 insertions(+), 156 deletions(-)

-- 
2.28.0.rc1

