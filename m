Return-Path: <linux-mips+bounces-12377-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5675EC94830
	for <lists+linux-mips@lfdr.de>; Sat, 29 Nov 2025 21:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 005F73A75CB
	for <lists+linux-mips@lfdr.de>; Sat, 29 Nov 2025 20:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F2B264A77;
	Sat, 29 Nov 2025 20:55:29 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65B11221D9E;
	Sat, 29 Nov 2025 20:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764449729; cv=none; b=oodsBLPPLRyPgCwf31Q1iDSREcFYSAE6GoUawUekErsHtrGoFsNhnPcaZ9IL28vvW8YyC/B6BNZ0MfYpKOiBg6omyzXnPsNyjEpwjQCLDYkg9Kk+rWjdQajzlCknguBQV+IcZ3qUJXStYPqnB44deHSWmBopPkyx00UYscmKwLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764449729; c=relaxed/simple;
	bh=QDsMYqcjrWPGPq86W/+C/JMLnxp0+iV+J1Je6rVpMSs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NSQulvR7Or0C/iA5z9SiEb9WROUVoJRURhmDKXerS2FbRsEmH4ZImXtMKbGmcWgX8Wxd5d1YVRNHGewxTjZZQuc3G5rkz6oEYGLv7y3YDmKM5nktNiJ63gJFd5XhKKv3DZ2sCswNF687XEDfICVs7OEopSNslPGwyOwVUQ0HYfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vPRyT-0003Ux-00; Sat, 29 Nov 2025 21:55:21 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 99216C0256; Sat, 29 Nov 2025 21:55:09 +0100 (CET)
Date: Sat, 29 Nov 2025 21:55:09 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v6.18
Message-ID: <aStdrYiDwO05O1A_@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d:

  Linux 6.18-rc7 (2025-11-23 14:53:16 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.18_2

for you to fetch changes up to 841ecc979b18d3227fad5e2d6a1e6f92688776b5:

  MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow (2025-11-29 13:36:05 +0100)

----------------------------------------------------------------
Fix TLB unification for cores with more than 64 TLB entries

----------------------------------------------------------------
Thomas Bogendoerfer (1):
      MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow

 arch/mips/mm/tlb-r4k.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

