Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E3472B6C76
	for <lists+linux-mips@lfdr.de>; Tue, 17 Nov 2020 19:02:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728424AbgKQSCE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Nov 2020 13:02:04 -0500
Received: from elvis.franken.de ([193.175.24.41]:38928 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729970AbgKQSCD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 17 Nov 2020 13:02:03 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kf5In-0001Ut-00; Tue, 17 Nov 2020 19:02:01 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 50FCAC021B; Tue, 17 Nov 2020 19:01:54 +0100 (CET)
Date:   Tue, 17 Nov 2020 19:01:54 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v5.10
Message-ID: <20201117180154.GA21834@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_fixes_5.10_1

for you to fetch changes up to ac3b57adf87ad9bac7e33ca26bbbb13fae1ed62b:

  MIPS: Alchemy: Fix memleak in alchemy_clk_setup_cpu (2020-11-17 12:53:57 +0100)

----------------------------------------------------------------
- fix bug preventing booting on several platforms
- fix for build error, when modules need has_transparent_hugepage
- fix for memleak in alchemy clk setup

----------------------------------------------------------------
Randy Dunlap (1):
      MIPS: export has_transparent_hugepage() for modules

Thomas Bogendoerfer (1):
      MIPS: kernel: Fix for_each_memblock conversion

Zhang Qilong (1):
      MIPS: Alchemy: Fix memleak in alchemy_clk_setup_cpu

 arch/mips/alchemy/common/clock.c | 9 ++++++++-
 arch/mips/kernel/setup.c         | 6 +++---
 arch/mips/mm/tlb-r4k.c           | 1 +
 3 files changed, 12 insertions(+), 4 deletions(-)
-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
