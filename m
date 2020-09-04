Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503B125D8AB
	for <lists+linux-mips@lfdr.de>; Fri,  4 Sep 2020 14:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729930AbgIDMcf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Sep 2020 08:32:35 -0400
Received: from elvis.franken.de ([193.175.24.41]:52961 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728588AbgIDMce (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 4 Sep 2020 08:32:34 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kEAtJ-0005xV-00; Fri, 04 Sep 2020 14:32:29 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 79461C00F2; Fri,  4 Sep 2020 14:32:23 +0200 (CEST)
Date:   Fri, 4 Sep 2020 14:32:23 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v5.9
Message-ID: <20200904123223.GA18627@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_fixes_5.9_1

for you to fetch changes up to baf5cb30fbd1c22f6aa03c081794c2ee0f5be4da:

  MIPS: SNI: Fix SCSI interrupt (2020-09-03 12:00:23 +0200)

----------------------------------------------------------------
A few MIPS fixes:

- fallthrough fallout fix
- BMIPS fixes
- MSA fix to avoid leaking MSA register contents
- Loongson perf and cpu feature fix
- SNI interrupt fix

----------------------------------------------------------------
Florian Fainelli (2):
      MIPS: mm: BMIPS5000 has inclusive physical caches
      MIPS: BMIPS: Also call bmips_cpu_setup() for secondary cores

He Zhe (1):
      mips/oprofile: Fix fallthrough placement

Huang Pei (1):
      MIPS: add missing MSACSR and upper MSA initialization

Jiaxun Yang (1):
      MIPS: Loongson64: Do not override watch and ejtag feature

Thomas Bogendoerfer (1):
      MIPS: SNI: Fix SCSI interrupt

Tiezhu Yang (1):
      MIPS: perf: Fix wrong check condition of Loongson event IDs

WANG Xuerui (1):
      MIPS: Loongson64: Remove unnecessary inclusion of boot_param.h

 .../mips/include/asm/mach-loongson64/cpu-feature-overrides.h |  2 --
 arch/mips/include/asm/mach-loongson64/irq.h                  |  2 --
 arch/mips/include/asm/mach-loongson64/mmzone.h               |  1 -
 arch/mips/kernel/perf_event_mipsxx.c                         |  4 ++--
 arch/mips/kernel/smp-bmips.c                                 |  2 ++
 arch/mips/kernel/traps.c                                     | 12 ++++++++++++
 arch/mips/mm/c-r4k.c                                         |  4 ++++
 arch/mips/oprofile/op_model_mipsxx.c                         |  4 +++-
 arch/mips/sni/a20r.c                                         |  4 ++--
 9 files changed, 25 insertions(+), 10 deletions(-)
-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
