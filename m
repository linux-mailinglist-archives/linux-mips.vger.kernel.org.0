Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5070C34E845
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 15:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231968AbhC3NDG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 09:03:06 -0400
Received: from elvis.franken.de ([193.175.24.41]:37664 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232019AbhC3NDC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Mar 2021 09:03:02 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lRE1N-00043F-01; Tue, 30 Mar 2021 15:03:01 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 2AC11C1DF5; Tue, 30 Mar 2021 15:02:19 +0200 (CEST)
Date:   Tue, 30 Mar 2021 15:02:19 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v5.12
Message-ID: <20210330130219.GA10841@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following changes since commit 3f6c515d723480bc8afd456b0a52438fe79128a8:

  MIPS: vmlinux.lds.S: Fix appended dtb not properly aligned (2021-03-16 22:53:08 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.12_3

for you to fetch changes up to 9ae31e2ab293bf4d9c42e7079b156072f8a7f8ca:

  MIPS: kernel: setup.c: fix compilation error (2021-03-30 14:51:23 +0200)

----------------------------------------------------------------
- fixed compile error with option MIPS_ELF_APPENDED_DTB

----------------------------------------------------------------
Mauri Sandberg (1):
      MIPS: kernel: setup.c: fix compilation error

 arch/mips/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
