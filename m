Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83F2A4209C5
	for <lists+linux-mips@lfdr.de>; Mon,  4 Oct 2021 13:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbhJDLQA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Oct 2021 07:16:00 -0400
Received: from elvis.franken.de ([193.175.24.41]:58559 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231575AbhJDLQA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 Oct 2021 07:16:00 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mXLv7-0002pA-00; Mon, 04 Oct 2021 13:14:09 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 00816C2110; Mon,  4 Oct 2021 13:14:01 +0200 (CEST)
Date:   Mon, 4 Oct 2021 13:14:01 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     torvalds@linux-foundation.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v5.15
Message-ID: <20211004111401.GA5195@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_5.15_1

for you to fetch changes up to 740da9d7ca4e25f5d87db9f80d75432681b61305:

  MIPS: Revert "add support for buggy MT7621S core detection" (2021-10-02 10:23:35 +0200)

----------------------------------------------------------------
Revert workaround for buggy cpu detection because regressions

----------------------------------------------------------------
Ilya Lipnitskiy (1):
      MIPS: Revert "add support for buggy MT7621S core detection"

 arch/mips/include/asm/mips-cps.h | 23 +----------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
