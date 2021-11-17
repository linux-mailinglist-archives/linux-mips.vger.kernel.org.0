Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3BFE45502B
	for <lists+linux-mips@lfdr.de>; Wed, 17 Nov 2021 23:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240895AbhKQWOr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Nov 2021 17:14:47 -0500
Received: from elvis.franken.de ([193.175.24.41]:55643 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231929AbhKQWOr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 17 Nov 2021 17:14:47 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mnT9f-0004Od-00; Wed, 17 Nov 2021 23:11:47 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C909DC2ED6; Wed, 17 Nov 2021 23:11:36 +0100 (CET)
Date:   Wed, 17 Nov 2021 23:11:36 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v5.16
Message-ID: <20211117221136.GA16740@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.16_1

for you to fetch changes up to fc1aabb088860d6cf9dd03612b7a6f0de91ccac2:

  mips: lantiq: add support for clk_get_parent() (2021-11-16 09:27:40 +0100)

----------------------------------------------------------------
- wire futex_waitv syscall
- build fixes for lantiq and bcm63xx configs
- yamon-dt bugfix

----------------------------------------------------------------
Colin Ian King (1):
      MIPS: generic/yamon-dt: fix uninitialized variable error

Randy Dunlap (2):
      mips: bcm63xx: add support for clk_get_parent()
      mips: lantiq: add support for clk_get_parent()

Wang Haojun (1):
      MIPS: syscalls: Wire up futex_waitv syscall

 arch/mips/bcm63xx/clk.c                   | 6 ++++++
 arch/mips/generic/yamon-dt.c              | 2 +-
 arch/mips/kernel/syscalls/syscall_n32.tbl | 1 +
 arch/mips/kernel/syscalls/syscall_n64.tbl | 1 +
 arch/mips/kernel/syscalls/syscall_o32.tbl | 1 +
 arch/mips/lantiq/clk.c                    | 6 ++++++
 6 files changed, 16 insertions(+), 1 deletion(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
