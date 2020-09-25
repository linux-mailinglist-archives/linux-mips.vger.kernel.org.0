Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB3E5279308
	for <lists+linux-mips@lfdr.de>; Fri, 25 Sep 2020 23:12:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgIYVMP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Sep 2020 17:12:15 -0400
Received: from elvis.franken.de ([193.175.24.41]:57638 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726119AbgIYVMP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 25 Sep 2020 17:12:15 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kLv0o-0003HA-00; Fri, 25 Sep 2020 23:12:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4FC3DC101A; Fri, 25 Sep 2020 20:07:08 +0200 (CEST)
Date:   Fri, 25 Sep 2020 20:07:08 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v5.9
Message-ID: <20200925180708.GA5280@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following changes since commit b959b97860d0fee8c8f6a3e641d3c2ad76eab6be:

  MIPS: SNI: Fix spurious interrupts (2020-09-16 22:40:58 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_fixes_5.9_3

for you to fetch changes up to be090fa62080d8501a5651a73cb954721966b125:

  MIPS: BCM47XX: Remove the needless check with the 1074K (2020-09-23 14:48:53 +0200)

----------------------------------------------------------------
- fixed FP register access on Loongsoon-3
- added missing 1074 cpu handling
- fixed Loongson2ef build error

----------------------------------------------------------------
Huacai Chen (1):
      MIPS: Loongson-3: Fix fp register access if MSA enabled

Jiaxun Yang (1):
      MIPS: Loongson2ef: Disable Loongson MMI instructions

Wei Li (2):
      MIPS: Add the missing 'CPU_1074K' into __get_cpu_type()
      MIPS: BCM47XX: Remove the needless check with the 1074K

 arch/mips/bcm47xx/setup.c        |  2 +-
 arch/mips/include/asm/cpu-type.h |  1 +
 arch/mips/loongson2ef/Platform   |  4 ++++
 arch/mips/loongson64/cop2-ex.c   | 24 ++++++++----------------
 4 files changed, 14 insertions(+), 17 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
