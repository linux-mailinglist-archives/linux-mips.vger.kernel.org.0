Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA9533E2B78
	for <lists+linux-mips@lfdr.de>; Fri,  6 Aug 2021 15:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344095AbhHFNhY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Aug 2021 09:37:24 -0400
Received: from elvis.franken.de ([193.175.24.41]:49402 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344062AbhHFNhY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 6 Aug 2021 09:37:24 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mC024-00012V-00; Fri, 06 Aug 2021 15:37:04 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0FE79C0657; Fri,  6 Aug 2021 15:36:56 +0200 (CEST)
Date:   Fri, 6 Aug 2021 15:36:56 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v5.14
Message-ID: <20210806133655.GA10751@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.14_1

for you to fetch changes up to 6aa32467299e9e12280a6aec9dbc21bf2db830b0:

  MIPS: check return value of pgtable_pmd_page_ctor (2021-08-05 11:45:42 +0200)

----------------------------------------------------------------
fix PMD accounting change

----------------------------------------------------------------
Huang Pei (1):
      MIPS: check return value of pgtable_pmd_page_ctor

 arch/mips/include/asm/pgalloc.h | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)


-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
