Return-Path: <linux-mips+bounces-637-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C52B80B355
	for <lists+linux-mips@lfdr.de>; Sat,  9 Dec 2023 09:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21951281097
	for <lists+linux-mips@lfdr.de>; Sat,  9 Dec 2023 08:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B8E79EB;
	Sat,  9 Dec 2023 08:54:21 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id EFA0710D0;
	Sat,  9 Dec 2023 00:54:14 -0800 (PST)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rBt6A-0003dX-00; Sat, 09 Dec 2023 09:54:10 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A6EE4C028A; Sat,  9 Dec 2023 09:54:00 +0100 (CET)
Date: Sat, 9 Dec 2023 09:54:00 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v6.7
Message-ID: <ZXQrKJy+ZW0nF2FF@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 33cc938e65a98f1d29d0a18403dbbee050dcad9a:

  Linux 6.7-rc4 (2023-12-03 18:52:56 +0900)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.7_1

for you to fetch changes up to a58a173444a68412bb08849bd81c679395f20ca0:

  MIPS: kernel: Clear FPU states when setting up kernel threads (2023-12-05 18:47:11 +0100)

----------------------------------------------------------------
- Fixes for broken Loongson firmware
- Fix lockdep splat
- Fix FPU states when creating kernel threads

----------------------------------------------------------------
Jiaxun Yang (3):
      MIPS: Loongson64: Reserve vgabios memory on boot
      MIPS: Loongson64: Enable DMA noncoherent support
      MIPS: Loongson64: Handle more memory types passed from firmware

Stefan Wiehler (1):
      mips/smp: Call rcutree_report_cpu_starting() earlier

Thomas Bogendoerfer (1):
      MIPS: kernel: Clear FPU states when setting up kernel threads

 arch/mips/Kconfig                                  |  2 +
 arch/mips/include/asm/mach-loongson64/boot_param.h |  9 ++++-
 arch/mips/kernel/process.c                         | 25 ++++++------
 arch/mips/kernel/smp.c                             |  4 +-
 arch/mips/loongson64/env.c                         | 10 ++++-
 arch/mips/loongson64/init.c                        | 47 ++++++++++++++--------
 6 files changed, 64 insertions(+), 33 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

