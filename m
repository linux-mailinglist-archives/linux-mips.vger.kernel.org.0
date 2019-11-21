Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5E481056DE
	for <lists+linux-mips@lfdr.de>; Thu, 21 Nov 2019 17:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbfKUQVk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Nov 2019 11:21:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:35380 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726690AbfKUQVk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 Nov 2019 11:21:40 -0500
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9679A20692;
        Thu, 21 Nov 2019 16:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574353299;
        bh=jRHPUdh/q+ZeknX4bTbCJ4Ve3ahDcrni2zelflzUwfU=;
        h=From:To:Cc:Subject:Date:From;
        b=X+XtSni8UQeUXzHhQgLBpzMWbOSS8CDcezExjVyZM+2HukuGKwgWJlHLzo2LJ6NkH
         0tbR4mVunKgjwM/eMIExSaRQytbZ8+LPWBzgxO0NCFs/SKNog22waUMeSJTSNCNZc/
         NKJTA9eoEVY76IzqJD7YZrs9xWI1EzTDndq4KQr4=
From:   Mike Rapoport <rppt@kernel.org>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 0/3] mips: get rid of __ARCH_USE_5LEVEL_HACK
Date:   Thu, 21 Nov 2019 18:21:30 +0200
Message-Id: <20191121162133.15833-1-rppt@kernel.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

Hi,

These patches update the mips page table folding/unfolding to take into
account the 5th level.

Mike Rapoport (3):
  mips: fix build when "48 bits virtual memory" is enabled
  mips: drop __pXd_offset() macros that duplicate pXd_index() ones
  mips: add support for folded p4d page tables

 arch/mips/include/asm/fixmap.h     |  2 +-
 arch/mips/include/asm/pgalloc.h    |  4 +--
 arch/mips/include/asm/pgtable-32.h |  6 +---
 arch/mips/include/asm/pgtable-64.h | 44 ++++++++++++++++--------------
 arch/mips/kvm/mmu.c                | 40 ++++++++++++++++-----------
 arch/mips/kvm/trap_emul.c          |  4 ++-
 arch/mips/mm/c-r3k.c               |  4 ++-
 arch/mips/mm/c-r4k.c               |  4 ++-
 arch/mips/mm/c-tx39.c              |  4 ++-
 arch/mips/mm/fault.c               | 12 ++++++--
 arch/mips/mm/hugetlbpage.c         | 14 +++++++---
 arch/mips/mm/init.c                |  6 ++--
 arch/mips/mm/ioremap.c             |  6 +++-
 arch/mips/mm/pgtable-32.c          |  6 ++--
 arch/mips/mm/tlb-r4k.c             |  4 ++-
 15 files changed, 97 insertions(+), 63 deletions(-)

-- 
2.24.0

