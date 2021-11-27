Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C488E45FDBE
	for <lists+linux-mips@lfdr.de>; Sat, 27 Nov 2021 10:45:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353319AbhK0Jso (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Nov 2021 04:48:44 -0500
Received: from elvis.franken.de ([193.175.24.41]:44842 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353395AbhK0Jqo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 27 Nov 2021 04:46:44 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mquEz-0004ZM-00; Sat, 27 Nov 2021 10:43:29 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 2C7B9C2F83; Sat, 27 Nov 2021 10:43:17 +0100 (CET)
Date:   Sat, 27 Nov 2021 10:43:17 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v5.16
Message-ID: <20211127094317.GA6302@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following changes since commit 136057256686de39cc3a07c2e39ef6bc43003ff6:

  Linux 5.16-rc2 (2021-11-21 13:47:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.16_2

for you to fetch changes up to 41ce097f714401e6ad8f3f5eb30d7f91b0b5e495:

  MIPS: use 3-level pgtable for 64KB page size on MIPS_VA_BITS_48 (2021-11-25 16:52:11 +0100)

----------------------------------------------------------------
- build fix for ZSTD enabled configs
- fix for preempt warning
- fix for loongson FTLB detection
- fix for page table level selection

----------------------------------------------------------------
Huang Pei (2):
      MIPS: loongson64: fix FTLB configuration
      MIPS: use 3-level pgtable for 64KB page size on MIPS_VA_BITS_48

Paul Cercueil (1):
      MIPS: boot/compressed/: add __ashldi3 to target for ZSTD compression

Tiezhu Yang (1):
      MIPS: Fix using smp_processor_id() in preemptible in show_cpuinfo()

 arch/mips/Kconfig                  | 2 +-
 arch/mips/boot/compressed/Makefile | 2 +-
 arch/mips/kernel/cpu-probe.c       | 4 ++--
 arch/mips/kernel/proc.c            | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
