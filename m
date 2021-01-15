Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68B492F7DFF
	for <lists+linux-mips@lfdr.de>; Fri, 15 Jan 2021 15:20:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730741AbhAOOTw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Jan 2021 09:19:52 -0500
Received: from elvis.franken.de ([193.175.24.41]:53867 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730027AbhAOOTw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 Jan 2021 09:19:52 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l0PwU-0006ED-00; Fri, 15 Jan 2021 15:19:10 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B1F1FC0325; Fri, 15 Jan 2021 15:19:03 +0100 (CET)
Date:   Fri, 15 Jan 2021 15:19:03 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v5.11
Message-ID: <20210115141903.GA13991@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_fixes_5.11.1

for you to fetch changes up to 7b490a8ab0f2d3ab8d838a4ff22ae86edafd34a1:

  MIPS: OCTEON: fix unreachable code in octeon_irq_init_ciu (2021-01-13 10:59:32 +0100)

----------------------------------------------------------------
- fix coredumps on 64bit kernels
- fix for alignment bugs preventing booting
- fix checking for failed irq_alloc_desc calls

----------------------------------------------------------------
Al Viro (1):
      MIPS: Fix malformed NT_FILE and NT_SIGINFO in 32bit coredumps

Alexander Lobakin (1):
      MIPS: relocatable: fix possible boot hangup with KASLR enabled

Menglong Dong (1):
      MIPS: OCTEON: fix unreachable code in octeon_irq_init_ciu

Paul Cercueil (1):
      MIPS: boot: Fix unaligned access with CONFIG_MIPS_RAW_APPENDED_DTB

 arch/mips/boot/compressed/decompress.c |  3 ++-
 arch/mips/cavium-octeon/octeon-irq.c   |  2 +-
 arch/mips/kernel/binfmt_elfn32.c       |  7 +++++++
 arch/mips/kernel/binfmt_elfo32.c       |  7 +++++++
 arch/mips/kernel/relocate.c            | 10 ++++++++--
 5 files changed, 25 insertions(+), 4 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
