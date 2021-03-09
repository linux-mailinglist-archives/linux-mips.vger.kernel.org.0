Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56315332A15
	for <lists+linux-mips@lfdr.de>; Tue,  9 Mar 2021 16:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231670AbhCIPRt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Mar 2021 10:17:49 -0500
Received: from elvis.franken.de ([193.175.24.41]:35365 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231761AbhCIPRb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Mar 2021 10:17:31 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lJe70-0002C8-01; Tue, 09 Mar 2021 16:17:30 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 013C1C1C0B; Tue,  9 Mar 2021 16:17:22 +0100 (CET)
Date:   Tue, 9 Mar 2021 16:17:22 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v5.12
Message-ID: <20210309151722.GB12267@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.12_1

for you to fetch changes up to bd67b711bfaa02cf19e88aa2d9edae5c1c1d2739:

  MIPS: kernel: Reserve exception base early to prevent corruption (2021-03-09 11:22:59 +0100)

----------------------------------------------------------------
- fixes for boot breakage because of misaligned FDTs
- fix for overwritten exception handlers
- enable MIPS optimized crypto for all MIPS CPUs to improve wireguard
  performance

----------------------------------------------------------------
Bjørn Mork (1):
      MIPS: vmlinux.lds.S: align raw appended dtb to 8 bytes

Maciej W. Rozycki (1):
      crypto: mips/poly1305 - enable for all MIPS processors

Paul Cercueil (1):
      MIPS: boot/compressed: Copy DTB to aligned address

Thomas Bogendoerfer (1):
      MIPS: kernel: Reserve exception base early to prevent corruption

 arch/mips/boot/compressed/decompress.c |  8 ++++++++
 arch/mips/crypto/Makefile              |  4 ++--
 arch/mips/include/asm/traps.h          |  3 +++
 arch/mips/kernel/cpu-probe.c           |  6 ++++++
 arch/mips/kernel/cpu-r3k-probe.c       |  3 +++
 arch/mips/kernel/traps.c               | 10 +++++-----
 arch/mips/kernel/vmlinux.lds.S         |  6 ++++++
 crypto/Kconfig                         |  2 +-
 drivers/net/Kconfig                    |  2 +-
 9 files changed, 35 insertions(+), 9 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
