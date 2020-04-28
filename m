Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38D7C1BB3C4
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 04:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgD1CPM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Apr 2020 22:15:12 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:60356 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbgD1CPM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Apr 2020 22:15:12 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id AEAE82049B;
        Tue, 28 Apr 2020 02:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1588040111; bh=GkNn6QDS6+1D5/N1KKM+IIJftlwxUET+1TaEhVK7DDc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OIVpEj1hTI1EHHTITeN/a1gvWSbzafVeYpfsmb75lfz6g/nL2w4GrzGORSelO7hbD
         oRp2k5LOGOVeNTCWmHN2LxvYXwnyHVqcKZHLJLZNmPqDLdnqijvUoh7CyRyAy4CfQl
         nh/n3L237Z0j/6rduYk5N531su177IfvlZRmXKr3ceUwiVKBX59u5KFtfpaYd4fUOr
         AFVnLc9v9KYtYclP0X7fi1vrbCtIKdcA/yy1VcPoOANm+EZqz4hCs0G+HQcE/kGp0F
         cpagZKT3yYTU3C+1bzZQQm33JkQphVpVTTrAyPPU3W02nyyclYzqiB3bWv5h0z0nni
         GvTV/1vNZ4L5Q==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     john.garry@huawei.com, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Kitt <steve@sk2.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Daniel Silsby <dansilsby@gmail.com>,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] MIPS: Loongson64: Use logic_pio v2
Date:   Tue, 28 Apr 2020 10:14:11 +0800
Message-Id: <20200428021437.2000066-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: 20200426114806.1176629-1-jiaxun.yang@flygoat.com
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

To add I/O ports for PCI host bridge via devicetree, we have to use
logic_pio mechanism.
That would require convert I/O ports into virt memory map.

v2: Register a logic_pio range instead of reserve in logic_pio system.

Jiaxun Yang (3):
  MIPS: Massage address spaces headers
  MIPS: Introduce PCI_IO_VMMAP
  MIPS: Loongson64: Enable PCI_IO_VMMAP

 arch/mips/Kconfig                             |  4 ++
 arch/mips/include/asm/addrspace.h             |  4 +-
 arch/mips/include/asm/io.h                    | 36 ++++++++++++----
 arch/mips/include/asm/mach-generic/spaces.h   | 42 ++++++++++++++-----
 .../include/asm/mach-loongson64/loongson.h    |  2 +
 arch/mips/include/asm/page-def.h              | 29 +++++++++++++
 arch/mips/include/asm/page.h                  | 21 ----------
 arch/mips/include/asm/pgtable-32.h            |  2 -
 arch/mips/include/asm/pgtable-64.h            | 10 +----
 arch/mips/include/asm/sync.h                  |  2 +
 arch/mips/kernel/cps-vec.S                    |  3 +-
 arch/mips/kernel/setup.c                      |  2 +
 arch/mips/lib/iomap-pci.c                     |  2 +-
 arch/mips/lib/uncached.c                      |  6 +--
 arch/mips/loongson64/init.c                   | 34 +++++++++++++--
 arch/mips/loongson64/pci.c                    |  2 +-
 16 files changed, 138 insertions(+), 63 deletions(-)
 create mode 100644 arch/mips/include/asm/page-def.h

-- 
2.26.0.rc2

