Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 985F026DEEE
	for <lists+linux-mips@lfdr.de>; Thu, 17 Sep 2020 16:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727716AbgIQO7d (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Sep 2020 10:59:33 -0400
Received: from elvis.franken.de ([193.175.24.41]:43281 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727441AbgIQO73 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 17 Sep 2020 10:59:29 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kIvCM-0007Bk-00; Thu, 17 Sep 2020 16:47:46 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6CB92C0FD0; Thu, 17 Sep 2020 16:47:36 +0200 (CEST)
Date:   Thu, 17 Sep 2020 16:47:36 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v5.9
Message-ID: <20200917144736.GA14255@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following changes since commit baf5cb30fbd1c22f6aa03c081794c2ee0f5be4da:

  MIPS: SNI: Fix SCSI interrupt (2020-09-03 12:00:23 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_fixes_5.9_2

for you to fetch changes up to b959b97860d0fee8c8f6a3e641d3c2ad76eab6be:

  MIPS: SNI: Fix spurious interrupts (2020-09-16 22:40:58 +0200)

----------------------------------------------------------------
Two small fixes for SNI machines

----------------------------------------------------------------
Thomas Bogendoerfer (2):
      MIPS: SNI: Fix MIPS_L1_CACHE_SHIFT
      MIPS: SNI: Fix spurious interrupts

 arch/mips/Kconfig    | 1 +
 arch/mips/sni/a20r.c | 9 +++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
