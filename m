Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474E93C3473
	for <lists+linux-mips@lfdr.de>; Sat, 10 Jul 2021 14:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232622AbhGJMSc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 10 Jul 2021 08:18:32 -0400
Received: from elvis.franken.de ([193.175.24.41]:50133 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231303AbhGJMSc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 10 Jul 2021 08:18:32 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1m2Bta-0004XW-00; Sat, 10 Jul 2021 14:15:46 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C9424C0813; Sat, 10 Jul 2021 14:15:23 +0200 (CEST)
Date:   Sat, 10 Jul 2021 14:15:23 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v5.14
Message-ID: <20210710121523.GA8431@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following changes since commit cf02ce742f09188272bcc8b0e62d789eb671fc4c:

  MIPS: Fix PKMAP with 32-bit MIPS huge page support (2021-06-30 14:41:32 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_5.14_1

for you to fetch changes up to 47ce8527fbba145a7723685bc9a27d9855e06491:

  MIPS: vdso: Invalid GIC access through VDSO (2021-07-09 15:29:06 +0200)

----------------------------------------------------------------
- fix for accesing gic via vdso
- two build fixes

----------------------------------------------------------------
Arnd Bergmann (1):
      mips: always link byteswap helpers into decompressor

Martin Fäcknitz (1):
      MIPS: vdso: Invalid GIC access through VDSO

Randy Dunlap (1):
      mips: disable branch profiling in boot/decompress.o

 arch/mips/boot/compressed/Makefile     | 4 ++--
 arch/mips/boot/compressed/decompress.c | 2 ++
 arch/mips/include/asm/vdso/vdso.h      | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
