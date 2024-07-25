Return-Path: <linux-mips+bounces-4464-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E724D93C6FD
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jul 2024 18:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0F731C21ACC
	for <lists+linux-mips@lfdr.de>; Thu, 25 Jul 2024 16:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7B119B584;
	Thu, 25 Jul 2024 16:10:23 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 187E3199231;
	Thu, 25 Jul 2024 16:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721923823; cv=none; b=P00FMBSA047VxWiCefv0k1FNksAcAvNsAo0rH/WWrKKor/kinFozalM1ZYZoMaN/cusEBfa9NW3qHDUkb1CbqKl0PtrdVBxNjcZ3YKh0rd5w8ViAn8ifl3D0PwNk9IP+zK4AnGTVyEC+v7ZA6Sf37iiHFtE9Cl3pj1Kedqttj/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721923823; c=relaxed/simple;
	bh=Zhw8+nfwN+QIJMe8AOBERx8m/pQ/Ho4iGN2V5ay9pGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k7krKgaG2Mez6GXL4BMtj1sC20Jfi7w8fevvjM13F3tYYcuSjxpOdmCJvzlhgYfVcWu0zDSTrcFIJIGSnw6QJyi8pn8KRUOOW4ccW5A0swB5P3wHm/67i62a1scRo0RAmB8HB5vKTfGp+dZZ9jkSK+Ne8O0jrqms+J2OdjBUIZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sX12a-0005Dm-00; Thu, 25 Jul 2024 18:10:04 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 73E41C014D; Thu, 25 Jul 2024 18:09:56 +0200 (CEST)
Date: Thu, 25 Jul 2024 18:09:56 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS changes part 2 for v6.11
Message-ID: <ZqJ41Aiswy5guHm/@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit bb2d63500b5c8fd1ea425caffe2d44c931fefc6b:

  MIPS: config: Add ip30_defconfig (2024-07-15 18:17:34 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips_6.11_1

for you to fetch changes up to 2c716cf17edee74424336e87fe42b99ee5e91bad:

  mips: sibyte: add missing MODULE_DESCRIPTION() macro (2024-07-23 09:47:40 +0200)

----------------------------------------------------------------
- Use improved timer sync for Loongson64
- Fix address of GCR_ACCESS register
- Add missing MODULE_DESCRIPTION

----------------------------------------------------------------
Gregory CLEMENT (1):
      MIPS: SMP-CPS: Fix address for GCR_ACCESS register for CM3 and later

Jeff Johnson (1):
      mips: sibyte: add missing MODULE_DESCRIPTION() macro

Jiaxun Yang (1):
      MIPS: Loongson64: Switch to SYNC_R4K

 arch/mips/Kconfig                   |  1 +
 arch/mips/include/asm/mips-cm.h     |  4 ++++
 arch/mips/include/asm/smp.h         |  1 -
 arch/mips/kernel/smp-cps.c          |  5 ++++-
 arch/mips/loongson64/smp.c          | 35 ++---------------------------------
 arch/mips/sibyte/common/sb_tbprof.c |  1 +
 6 files changed, 12 insertions(+), 35 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

