Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9499394235
	for <lists+linux-mips@lfdr.de>; Fri, 28 May 2021 13:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234558AbhE1Lzw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 May 2021 07:55:52 -0400
Received: from elvis.franken.de ([193.175.24.41]:53765 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233689AbhE1Lzv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 28 May 2021 07:55:51 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lmb4B-0000EJ-00; Fri, 28 May 2021 13:54:15 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 7ECDBC1ADD; Fri, 28 May 2021 13:54:09 +0200 (CEST)
Date:   Fri, 28 May 2021 13:54:09 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v5.13
Message-ID: <20210528115409.GA8447@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.13_1

for you to fetch changes up to 78cf0eb926cb1abeff2106bae67752e032fe5f3e:

  MIPS: Fix kernel hang under FUNCTION_GRAPH_TRACER and PREEMPT_TRACER (2021-05-25 15:33:17 +0200)

----------------------------------------------------------------
- fixed function/preempt traces hangs
- a few build fixes

----------------------------------------------------------------
Randy Dunlap (3):
      MIPS: alchemy: xxs1500: add gpio-au1000.h header file
      MIPS: launch.h: add include guard to prevent build errors
      MIPS: ralink: export rt_sysc_membase for rt2880_wdt.c

Tiezhu Yang (1):
      MIPS: Fix kernel hang under FUNCTION_GRAPH_TRACER and PREEMPT_TRACER

 arch/mips/alchemy/board-xxs1500.c          |  1 +
 arch/mips/include/asm/mips-boards/launch.h |  5 +++++
 arch/mips/lib/mips-atomic.c                | 12 ++++++------
 arch/mips/ralink/of.c                      |  2 ++
 4 files changed, 14 insertions(+), 6 deletions(-)
-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
