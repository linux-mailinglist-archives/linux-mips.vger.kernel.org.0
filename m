Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDE1F3E8C75
	for <lists+linux-mips@lfdr.de>; Wed, 11 Aug 2021 10:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236402AbhHKIwB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Aug 2021 04:52:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236364AbhHKIv6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Aug 2021 04:51:58 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA3CC061798
        for <linux-mips@vger.kernel.org>; Wed, 11 Aug 2021 01:51:35 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by andre.telenet-ops.be with bizsmtp
        id g8rG2500H1gJxCh018rGYY; Wed, 11 Aug 2021 10:51:32 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDjxD-001yaB-TH; Wed, 11 Aug 2021 10:51:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDjxD-0058wf-87; Wed, 11 Aug 2021 10:51:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Kossifidis <mick@ics.forth.gr>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Frank Rowand <frowand.list@gmail.com>,
        Dave Young <dyoung@redhat.com>
Cc:     Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
        Mike Rapoport <rppt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 0/9] Add generic support for kdump DT properties
Date:   Wed, 11 Aug 2021 10:50:58 +0200
Message-Id: <cover.1628670468.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

	Hi all,

This patch series adds generic support for parsing DT properties related
to crash dump kernels ("linux,elfcorehdr" and "linux,elfcorehdr" under
the "/chosen" node), makes use of it on arm32, and performs a few
cleanups.  It is an evolution of the combination of [1] and [2].

The series consists of 6 parts:
  1. Patch 1 prepares architecture-specific code (needed for MIPS only)
     to avoid duplicating elf core header reservation later.
  2. Patch 2 prepares the visibility of variables used to hold
     information retrieved from the DT properties.
  3. Patches 3-5 add support to the FDT core for handling the
     properties.
     This can co-exist safely with architecture-specific handling, until
     the latter has been removed.
  4. Patch 6 removes the non-standard handling of "linux,elfcorehdr" on
     riscv.
  5. Patches 7-8 convert arm64 to use the generic handling instead of
     its own implementation.
  6. Patch 9 adds support for kdump properties to arm32.
     The corresponding patch for kexec-tools is "[PATCH] arm: kdump: Add
     DT properties to crash dump kernel's DTB"[3], which is still valid.

Changes compared to v4[4]:
  - New patch "[PATCH v5 1/9] MIPS: Avoid future duplicate elf core
    header reservation",
  - Drop "memblock: Add variables for usable memory limitation", as this
    is now handled in FDT core code,
  - Make ELFCORE_ADDR_{MAX,ERR} visible, too,
  - Handle the actual elf core header reservation and memory capping in
    FDT core code,
  - Add Reviewed-by, Acked-by,
  - Remove all architecture-specific handling on arm64,
  - Drop "arm64: kdump: Use IS_ENABLED(CONFIG_CRASH_DUMP) instead of
    #ifdef", as the affected code is gone,
  - Remove the addition of "linux,elfcorehdr" and
    "linux,usable-memory-range" handling to arch/arm/mm/init.c.

Changes compared to older versions:
  - Make elfcorehdr_{addr,size} always visible,
  - Add variables for usable memory limitation,
  - Use IS_ENABLED() instead of #ifdef (incl. initrd and arm64),
  - Clarify what architecture-specific code is still responsible for,
  - Add generic support for parsing linux,usable-memory-range,
  - Remove custom linux,usable-memory-range parsing on arm64,
  - Use generic handling on ARM.
  
This has been tested with kexec/kdump on arm32 and arm64, and
boot-tested on riscv64 and DT-less MIPS.

Thanks!

[1] "[PATCH v3] ARM: Parse kdump DT properties"
    https://lore.kernel.org/r/20210317113130.2554368-1-geert+renesas@glider.be/
[2] "[PATCH 0/3] Add generic-support for linux,elfcorehdr and fix riscv"
    https://lore.kernel.org/r/cover.1623780059.git.geert+renesas@glider.be/
[3] "[PATCH] arm: kdump: Add DT properties to crash dump kernel's DTB"
    https://lore.kernel.org/r/20200902154129.6358-1-geert+renesas@glider.be/
[4] "[PATCH v4 00/10] Add generic support for kdump DT properties"
    https://lore.kernel.org/r/cover.1626266516.git.geert+renesas@glider.be

Geert Uytterhoeven (9):
  MIPS: Avoid future duplicate elf core header reservation
  crash_dump: Make elfcorehdr address/size symbols always visible
  of: fdt: Add generic support for handling elf core headers property
  of: fdt: Add generic support for handling usable memory range property
  of: fdt: Use IS_ENABLED(CONFIG_BLK_DEV_INITRD) instead of #ifdef
  riscv: Remove non-standard linux,elfcorehdr handling
  arm64: kdump: Remove custom linux,elfcorehdr handling
  arm64: kdump: Remove custom linux,usable-memory-range handling
  ARM: uncompress: Parse "linux,usable-memory-range" DT property

 Documentation/devicetree/bindings/chosen.txt  | 12 +--
 .../arm/boot/compressed/fdt_check_mem_start.c | 48 ++++++++--
 arch/arm64/mm/init.c                          | 88 -----------------
 arch/mips/kernel/setup.c                      |  3 +-
 arch/riscv/mm/init.c                          | 20 ----
 drivers/of/fdt.c                              | 94 +++++++++++++++++--
 include/linux/crash_dump.h                    |  3 +-
 7 files changed, 139 insertions(+), 129 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
