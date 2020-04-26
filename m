Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 772AD1B8F83
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2020 13:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbgDZLtW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 07:49:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbgDZLtW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 26 Apr 2020 07:49:22 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F665C061A0E;
        Sun, 26 Apr 2020 04:49:20 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 89E4420CDC;
        Sun, 26 Apr 2020 11:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587901757; bh=r1y8SvWtc1gITjpG4/8SCMLhvpr+40ZG9Q9GWxOeYcU=;
        h=From:To:Cc:Subject:Date:From;
        b=fH+VvyM6my7OULyg0hlzUAoDF2Byd/WxGPNJBUYurFDCPOFSsANyB8eP2lxDP6n54
         f8UugSOSk8MD9KuLNmZoIME02cQSxbmgI3eiOuTdj9ZxikG8UrHUfp732mEvVsQAEm
         iHRIdzKrzPUXefgq5cD0tgKW5m2oELmHIWfbXwcJ/IslP3dHqu6KfpxtAuh8n+jzpM
         vdjSrLlMVUchz0cu7vum/vWG5eStHnXMZKndk9UAyYhs0ahXPRR20IzOSLlIyxsmMz
         q467ekCEZiXekKKwJ1Lb4lcR0z1CYz4o+7QeERsATa6iOfhMdq68SHYZNxGwXx/Kpi
         1awAYIadNQrdg==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephen Kitt <steve@sk2.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Daniel Silsby <dansilsby@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Wei Xu <xuwei5@hisilicon.com>,
        John Garry <john.garry@huawei.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] MIPS: Loongson64: Use logic_pio 
Date:   Sun, 26 Apr 2020 19:47:33 +0800
Message-Id: <20200426114806.1176629-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

To add I/O ports for PCI host bridge via devicetree, we have to use
logic_pio mechanism.
That would require convert I/O ports into virt memory map.

Jiaxun Yang (4):
  MIPS: Massage address spaces headers
  MIPS: Introduce PCI_IO_VMMAP
  lib: logic_pio: Introduce MMIO_LOWER_RESERVED
  MIPS: Loongson64: Enable PCI_IO_VMMAP

 arch/mips/Kconfig                           |  4 ++
 arch/mips/include/asm/addrspace.h           |  4 +-
 arch/mips/include/asm/io.h                  | 40 ++++++++++++++++----
 arch/mips/include/asm/mach-generic/spaces.h | 42 +++++++++++++++------
 arch/mips/include/asm/page-def.h            | 28 ++++++++++++++
 arch/mips/include/asm/page.h                | 21 -----------
 arch/mips/include/asm/pgtable-32.h          |  2 -
 arch/mips/include/asm/pgtable-64.h          | 10 +----
 arch/mips/include/asm/sync.h                |  2 +
 arch/mips/kernel/cps-vec.S                  |  3 +-
 arch/mips/kernel/setup.c                    |  2 +
 arch/mips/lib/iomap-pci.c                   |  2 +-
 arch/mips/lib/uncached.c                    |  6 +--
 arch/mips/loongson64/init.c                 | 12 ++++--
 arch/mips/loongson64/pci.c                  |  2 +-
 lib/logic_pio.c                             |  6 ++-
 16 files changed, 122 insertions(+), 64 deletions(-)
 create mode 100644 arch/mips/include/asm/page-def.h

-- 
2.26.0.rc2

