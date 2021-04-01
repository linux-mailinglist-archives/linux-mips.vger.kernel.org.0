Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0D4C351E0F
	for <lists+linux-mips@lfdr.de>; Thu,  1 Apr 2021 20:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235183AbhDASeI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Apr 2021 14:34:08 -0400
Received: from mx2.suse.de ([195.135.220.15]:53828 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236067AbhDASXj (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 1 Apr 2021 14:23:39 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id D037CB1E9;
        Thu,  1 Apr 2021 12:56:44 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     hch@lst.de
Subject: [PATCH v3 0/4] MIPS: Remove get_fs/set_fs
Date:   Thu,  1 Apr 2021 14:56:33 +0200
Message-Id: <20210401125639.42963-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This series replaces get_fs/set_fs and removes it from MIPS arch code.

Changes in v3:
- use get_user/get_kernel_nofault for helper functions

Changes in v2:
- added copy_from_kernel_nofault_allowed() for !EVA to restrict
  access of __get/__put_kernel_nofault
- replaced __get_data macro by helper functions
- removed leftover set_fs calls in ftrace.c
- further cleanup uaccess.h

Thomas Bogendoerfer (4):
  MIPS: kernel: Remove not needed set_fs calls
  MIPS: uaccess: Added __get/__put_kernel_nofault
  MIPS: uaccess: Remove get_fs/set_fs call sites
  MIPS: Remove get_fs/set_fs

 arch/mips/Kconfig                   |   1 -
 arch/mips/include/asm/processor.h   |   4 -
 arch/mips/include/asm/thread_info.h |   6 -
 arch/mips/include/asm/uaccess.h     | 436 +++++++++++-----------------
 arch/mips/kernel/access-helper.h    |  18 ++
 arch/mips/kernel/asm-offsets.c      |   1 -
 arch/mips/kernel/ftrace.c           |   8 -
 arch/mips/kernel/process.c          |   2 -
 arch/mips/kernel/scall32-o32.S      |   4 +-
 arch/mips/kernel/traps.c            | 105 +++----
 arch/mips/kernel/unaligned.c        | 199 +++++--------
 arch/mips/lib/memcpy.S              |  28 +-
 arch/mips/lib/memset.S              |   3 -
 arch/mips/lib/strncpy_user.S        |  48 +--
 arch/mips/lib/strnlen_user.S        |  44 +--
 arch/mips/mm/Makefile               |   4 +
 arch/mips/mm/maccess.c              |  10 +
 17 files changed, 357 insertions(+), 564 deletions(-)
 create mode 100644 arch/mips/kernel/access-helper.h
 create mode 100644 arch/mips/mm/maccess.c

-- 
2.29.2

