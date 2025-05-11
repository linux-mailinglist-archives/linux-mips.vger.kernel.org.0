Return-Path: <linux-mips+bounces-8969-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CEFAB26FD
	for <lists+linux-mips@lfdr.de>; Sun, 11 May 2025 09:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EAC93BC9C7
	for <lists+linux-mips@lfdr.de>; Sun, 11 May 2025 07:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A56119D880;
	Sun, 11 May 2025 07:34:58 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A4319E971;
	Sun, 11 May 2025 07:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746948898; cv=none; b=NI3ExQGz3ZwSkd9MpqyOqwvHBCCvTQ6WsEb4l0Q39i2iyVjsgyfMjQAgp1++ApgdFa8lsJk2wJCLYXiS6i4vHHbe4w0f22h+hOxfmhXJ8lNtz2rtzVegYw45A4LM3uW84VupW9p7sSdj/v7F6wCp/ey0A3h/QPg6IKjDm8X4XmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746948898; c=relaxed/simple;
	bh=Doh9LCt+Ux6Z/Yi03IcCaklolO8jUuYjlW6T0irfjGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=olHZAwiJrX+uwz+Yinb/5NA3IwPwZB5jXxQZO8TykuYcw27lcjG9/LnAB1R32+H/WfJddUyvW0iwqwUsC8HrQEi5RBeNA/lPSBEnqi9Y5/gM3+JOuNr4Z+mAGXJJfV4gIn5AqXmCvpWGqIG6YPjUEE7t9q/1MjrywzJRlbbugEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uE1Cv-0005sg-00; Sun, 11 May 2025 09:34:45 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id B1497C02B0; Sun, 11 May 2025 09:34:34 +0200 (CEST)
Date: Sun, 11 May 2025 09:34:34 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v6.15
Message-ID: <aCBTCo8kyo-LxpV5@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.15_1

for you to fetch changes up to c44572e0cc13c9afff83fd333135a0aa9b27ba26:

  MIPS: Fix MAX_REG_OFFSET (2025-04-30 20:04:59 +0200)

----------------------------------------------------------------
Fix delayed timers
Fix NULL pointer deref
Fix wrong range check

----------------------------------------------------------------
Marco Crivellari (3):
      MIPS: Fix idle VS timer enqueue
      MIPS: Move r4k_wait() to .cpuidle.text section
      MIPS: rename rollback_handler with skipover_handler

Thorsten Blum (2):
      MIPS: CPS: Fix potential NULL pointer dereferences in cps_prepare_cpus()
      MIPS: Fix MAX_REG_OFFSET

 arch/mips/include/asm/idle.h   |  5 ++-
 arch/mips/include/asm/ptrace.h |  3 +-
 arch/mips/kernel/genex.S       | 71 ++++++++++++++++++++++++------------------
 arch/mips/kernel/idle.c        |  7 -----
 arch/mips/kernel/smp-cps.c     |  4 +++
 arch/mips/kernel/traps.c       | 10 +++---
 6 files changed, 54 insertions(+), 46 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

