Return-Path: <linux-mips+bounces-5549-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAF997661F
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2024 11:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D20041C21CF9
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2024 09:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF30519E990;
	Thu, 12 Sep 2024 09:55:48 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E56E19F132;
	Thu, 12 Sep 2024 09:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726134948; cv=none; b=Tq3iQqbxhl5HxD1+9brirBJ2Wl+fwqW6i2Iu3TG0zsImDFRvmsLJ1Tp4GM0D7yebmST0X8rPxqSb/e6jstYR75Oq4hjyhR2Ovc1apzHBVvwF8tMD/KHL/hTvcV70pl7GCyH6FVqDg2wgYv6rR88J2eFNxBq1MUSAyl7gCyVZ1XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726134948; c=relaxed/simple;
	bh=VOCJPqVsl9L8Gqzs0YlXeTB4sByDOT3XB7vXD9+LNik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZcQ05afCyZ7iEcO+eOS8mzDNZunL0dpINF9AGtx/a9zHoxwM6dayAy336hZA+h0kuXzhAzDM0fVdsmLgvAlblGIQ3IlQ/q2aDhMN/76OrEN21jIVYpABmqg+Og2NJuNlWmIkK9jdF8cudForVPami3sppaClhs4kg1Rkh5gpOEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sogY3-0001w9-00; Thu, 12 Sep 2024 11:55:35 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id D70FFC014D; Thu, 12 Sep 2024 11:54:41 +0200 (CEST)
Date: Thu, 12 Sep 2024 11:54:41 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v6.12
Message-ID: <ZuK6YZHRIcriY+Ys@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 5be63fc19fcaa4c236b307420483578a56986a37:

  Linux 6.11-rc5 (2024-08-25 19:07:11 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.12

for you to fetch changes up to 439667fb943cfea46d7bde5c7b29c89efec3cbc7:

  mips: Remove posix_types.h include from sigcontext.h (2024-08-29 10:46:00 +0200)

----------------------------------------------------------------
- use devm_clk_get_enabled() helper
- prototype fixes
- cleanup unused stuff

----------------------------------------------------------------
Gaosheng Cui (6):
      MIPS: Remove unused function dump_au1000_dma_channel() in dma.c
      mips/jazz: remove unused jazz_handle_int() declaration
      MIPS: MT: Remove unused function mips_mt_regdump()
      MIPS: Remove unused declarations in asm/cmp.h
      MIPS: Remove unused mips_display/_scroll_message() declarations
      MIPS: dec: prom: Remove unused unregister_prom_console() declaration

Vincent Legoll (2):
      MIPS: ralink: Fix missing `plat_time_init` prototype
      MIPS: ralink: Fix missing `get_c0_perfcount_int` prototype

Wu Bo (2):
      bus: bt1-axi: change to use devm_clk_get_enabled() helper
      bus: bt1-apb: change to use devm_clk_get_enabled() helper

Xi Ruoyao (1):
      mips: Remove posix_types.h include from sigcontext.h

 arch/mips/alchemy/common/dma.c                 | 23 --------
 arch/mips/include/asm/cmp.h                    |  8 ---
 arch/mips/include/asm/dec/prom.h               |  1 -
 arch/mips/include/asm/mach-au1x00/au1000_dma.h |  1 -
 arch/mips/include/asm/mips-boards/generic.h    |  3 -
 arch/mips/include/asm/mips_mt.h                |  2 -
 arch/mips/include/uapi/asm/sigcontext.h        |  1 -
 arch/mips/jazz/setup.c                         |  2 -
 arch/mips/kernel/mips-mt.c                     | 77 --------------------------
 arch/mips/ralink/irq-gic.c                     |  1 +
 arch/mips/ralink/timer-gic.c                   |  2 +
 drivers/bus/bt1-apb.c                          | 23 +-------
 drivers/bus/bt1-axi.c                          | 23 +-------
 13 files changed, 6 insertions(+), 161 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

