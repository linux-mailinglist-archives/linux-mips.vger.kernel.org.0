Return-Path: <linux-mips+bounces-12428-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B12CAFDCE
	for <lists+linux-mips@lfdr.de>; Tue, 09 Dec 2025 13:05:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BBD073010069
	for <lists+linux-mips@lfdr.de>; Tue,  9 Dec 2025 12:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903EA2E091B;
	Tue,  9 Dec 2025 12:05:26 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9AB13195E3;
	Tue,  9 Dec 2025 12:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765281926; cv=none; b=riMUygdNmMLX0iZ0Vtb99vfj6tF30T4nO9u4iYiw39juHWvrPsW3BwdVoDLG7zAPo747CklXLsVjMm9Q/WOwbhkP4dfQtsW0l/6IPQecUmd0LvFrq1z7Pkfk7j2LuXDv4QzrA/x08TZMTRuprr7s6dOn6gjDwRiGDHns5S4DA4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765281926; c=relaxed/simple;
	bh=adSxjgSw7N7wp+4V8BVHAo59O55Tiws4yxlT7gmglWI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MXNWfii9i300p7V+9DY6SHgFwZux+h7ZKzYit5yVS9Hw/a/+MvDB1y4Wc7x0L29tNa78UNHQMkVKC5Wv7panbHb6ggbo48mKEuRw/7H3EMH9+VpQlaH+5KWXylRngb6GJaoub6VKBsQ3mJAbgfb3YQvvRo1D4997bQZd3Gv9Y1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vSwSu-0000ie-00; Tue, 09 Dec 2025 13:05:12 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id CB787C0256; Tue,  9 Dec 2025 13:05:03 +0100 (CET)
Date: Tue, 9 Dec 2025 13:05:03 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes for v6.19
Message-ID: <aTgQb7d1YDZCk3IQ@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 7d0a66e4bb9081d75c82ec4957c50034cb0ea449:

  Linux 6.18 (2025-11-30 14:42:10 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.19

for you to fetch changes up to 2b6d718c8dbe61aedffd7d12cf7bc60fab6f3d0e:

  MIPS: Fix whitespace damage in r4k_wait from VS timer fix (2025-12-01 10:34:34 +0100)

----------------------------------------------------------------
just cleanups and fixes

----------------------------------------------------------------
Dmitry Torokhov (1):
      MIPS: alchemy: mtx1: switch to static device properties

Gregory CLEMENT (2):
      MIPS: Fix HOTPLUG_PARALLEL dependency
      MIPS: ftrace: Fix memory corruption when kernel is located beyond 32 bits

Keguang Zhang (1):
      mips: configs: loongson1: Update defconfig

Maciej W. Rozycki (1):
      MIPS: Fix whitespace damage in r4k_wait from VS timer fix

Rob Herring (Arm) (1):
      MIPS: dts: Always descend vendor subdirectories

Vishal Moola (Oracle) (1):
      mips: Remove __GFP_HIGHMEM masking

Yury Norov (1):
      mips: kvm: simplify kvm_mips_deliver_interrupts()

 arch/mips/Kconfig                     |   2 +-
 arch/mips/alchemy/board-mtx1.c        | 181 +++++++++++++++++++++++-----------
 arch/mips/boot/dts/Makefile           |  35 +++----
 arch/mips/boot/dts/realtek/Makefile   |   4 +-
 arch/mips/configs/loongson1_defconfig |  16 ++-
 arch/mips/include/asm/pgalloc.h       |   3 +-
 arch/mips/kernel/ftrace.c             |  25 ++++-
 arch/mips/kernel/genex.S              |   8 +-
 arch/mips/kvm/interrupt.c             |  20 +---
 9 files changed, 178 insertions(+), 116 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

