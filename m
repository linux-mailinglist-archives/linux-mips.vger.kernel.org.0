Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6B01A1FFB
	for <lists+linux-mips@lfdr.de>; Wed,  8 Apr 2020 13:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728497AbgDHLkK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Apr 2020 07:40:10 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17847 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728495AbgDHLkK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Apr 2020 07:40:10 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1586345803; cv=none; 
        d=zoho.com.cn; s=zohoarc; 
        b=ktM0p/VLgeyxhuHarSGAHIWGuBytEId+BMh4P/kfdRl1DDvMpQG9ufh6qn2Ec764Y0KU1NUtcSrVSzy6yFmyC0Dzpfswe9POwQILYk46/f8DUskxKQOBoDaFSr/CVhSSN4VJV5/TlXnVkn78CxY93aHnqy6X9DbYh1m7LHIckVI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn; s=zohoarc; 
        t=1586345803; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=x1C0J0dW+TFy1A/rQgku1MmxKq3NJPJkkGtqpNKObTQ=; 
        b=qktwhZsYG7BIHRgBgCH3Ou0bkfmki5IUBj8AXsncoZfT4mp7pyDLpuVo5uPfM78BxZewhsrFHUEIwbla/4yFslxF0GzZjKMl1IVul4BeUB3m2C4xFzC9ZJKEUOpnD+MyUiZ3G0j26jSQ/pGEKck59ZkKYFhH4euxxUEZFOWAS80=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
        dkim=pass  header.i=flygoat.com;
        spf=pass  smtp.mailfrom=jiaxun.yang@flygoat.com;
        dmarc=pass header.from=<jiaxun.yang@flygoat.com> header.from=<jiaxun.yang@flygoat.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1586345803;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=x1C0J0dW+TFy1A/rQgku1MmxKq3NJPJkkGtqpNKObTQ=;
        b=agrWO9EgVsZuV6M/NtYZPq/9kvBSLCtvE/CY3de3FNVq7T76ifH8N+uAvd7RbwRi
        jCnrDk/P5JRLRMsYLEw8z4AXTjv57oErOXthP+KZy7JlR6yrpaNjG4z1vqw3FeLe5DM
        EHeT/F/YwvYWUnaFxVnPdLYHh/dikNdqPW8hX6X4=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1586345800507759.7747042437669; Wed, 8 Apr 2020 19:36:40 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Robert Richter <rric@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Vladimir Kondratiev <vladimir.kondratiev@intel.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>, YunQiang Su <syq@debian.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        Matt Redfearn <matt.redfearn@mips.com>,
        Steve Winslow <swinslow@gmail.com>,
        Richard Fontana <rfontana@redhat.com>,
        Peter Xu <peterx@redhat.com>,
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com, oprofile-list@lists.sf.net
Message-ID: <20200408113505.2528103-1-jiaxun.yang@flygoat.com>
Subject: [PATCH 00/12] MIPS: Topology & DeviceTree CPU rework
Date:   Wed,  8 Apr 2020 19:34:10 +0800
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This set mainly added DeviceTree based CPU probe support and reworked
topology handling for MIPS. In order to prepare for pure DeviceTree
boot for Loongson64. It can also convinient Yanjie's Inegnic jz4780/X2000
SMP/SMT support.

I've done build test for bmips, nlm, ip27 and boot test for malta with
34Kf, I6400 in QEMU, Loongson64 on a Loongson-3B1500 real machine.

Thanks.

Jiaxun Yang (12):
  MIPS: setup: Drop prefill_possible_map
  MIPS: prom: Add helper to parse CPU node in dt
  arch_topology: Make it avilable for MIPS
  arch_topology: Reset all cpus in reset_cpu_topology
  MIPS: Switch to arch_topology
  MIPS: Kernel: Switch to new topology interface
  MIPS: CPS & MT: Switch to new topology interface
  irqchip: mips-cpu: Switch to new topology interface
  MIPS: bmips: Switch to new topology interface
  MIPS: nlm: Switch to new topology interface
  MIPS: Loongson64: Switch to new topology interface
  MIPS: ip27: Fix includes

 arch/mips/Kconfig                             |   1 +
 arch/mips/include/asm/cpu-info.h              |  49 -------
 arch/mips/include/asm/mach-ip27/mmzone.h      |   2 +
 arch/mips/include/asm/mach-ip27/topology.h    |   2 +
 .../include/asm/mach-loongson64/topology.h    |   2 +
 arch/mips/include/asm/mips-cm.h               |   9 +-
 arch/mips/include/asm/mips-cps.h              |   2 +
 arch/mips/include/asm/prom.h                  |   2 +
 arch/mips/include/asm/smp-ops.h               |   2 -
 arch/mips/include/asm/smp.h                   |   2 -
 arch/mips/include/asm/sn/addrs.h              |   1 +
 arch/mips/include/asm/topology.h              |  48 ++++++-
 arch/mips/kernel/cacheinfo.c                  |   5 +-
 arch/mips/kernel/cpu-probe.c                  |  43 ------
 arch/mips/kernel/mips-cm.c                    |   4 +-
 arch/mips/kernel/mips-cpc.c                   |   4 +-
 arch/mips/kernel/perf_event_mipsxx.c          |   4 +-
 arch/mips/kernel/pm-cps.c                     |  12 +-
 arch/mips/kernel/proc.c                       |   8 +-
 arch/mips/kernel/prom.c                       |  96 ++++++++++++++
 arch/mips/kernel/setup.c                      |  22 +---
 arch/mips/kernel/smp-bmips.c                  |   3 +-
 arch/mips/kernel/smp-cmp.c                    |   5 +-
 arch/mips/kernel/smp-cps.c                    |  41 +++---
 arch/mips/kernel/smp-mt.c                     |   3 +-
 arch/mips/kernel/smp.c                        |  55 +-------
 arch/mips/kernel/topology.c                   |  42 ++++++
 arch/mips/loongson64/smp.c                    |  20 +--
 arch/mips/mm/c-r4k.c                          |   4 +-
 arch/mips/mm/context.c                        |   4 +-
 arch/mips/netlogic/common/smp.c               |   4 +-
 arch/mips/oprofile/op_model_mipsxx.c          |   4 +-
 drivers/base/arch_topology.c                  | 123 ++++++++++--------
 drivers/irqchip/irq-mips-cpu.c                |   2 +-
 34 files changed, 337 insertions(+), 293 deletions(-)

--=20
2.26.0.rc2


