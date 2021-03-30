Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4E1F34EF6F
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 19:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232201AbhC3R1N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 13:27:13 -0400
Received: from mx2.suse.de ([195.135.220.15]:38402 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232160AbhC3R1F (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Mar 2021 13:27:05 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 9731BB329;
        Tue, 30 Mar 2021 17:27:04 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     hch@lst.de
Subject: [PATCH 0/3] MIPS: Remove get_fs/set_fs
Date:   Tue, 30 Mar 2021 19:26:57 +0200
Message-Id: <20210330172702.146909-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This series replaces get_fs/set_fs and removes it from MIPS arch code.

Thomas Bogendoerfer (3):
  MIPS: uaccess: Added __get/__put_kernel_nofault
  MIPS: uaccess: Remove get_fs/set_fs call sites
  MIPS: Remove get_fs/set_fs

 arch/mips/Kconfig                   |   1 -
 arch/mips/include/asm/processor.h   |   4 -
 arch/mips/include/asm/thread_info.h |   6 -
 arch/mips/include/asm/uaccess.h     | 244 +++++++++++-----------------
 arch/mips/kernel/asm-offsets.c      |   1 -
 arch/mips/kernel/process.c          |   2 -
 arch/mips/kernel/scall32-o32.S      |   4 +-
 arch/mips/kernel/traps.c            |  72 +++-----
 arch/mips/kernel/unaligned.c        | 197 ++++++++--------------
 arch/mips/lib/memset.S              |   3 -
 arch/mips/lib/strncpy_user.S        |  48 ++----
 arch/mips/lib/strnlen_user.S        |  44 ++---
 12 files changed, 215 insertions(+), 411 deletions(-)

-- 
2.29.2

