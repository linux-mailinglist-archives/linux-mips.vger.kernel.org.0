Return-Path: <linux-mips+bounces-5048-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB7795D5D7
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2024 21:06:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 725001C215A5
	for <lists+linux-mips@lfdr.de>; Fri, 23 Aug 2024 19:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4E81922C7;
	Fri, 23 Aug 2024 19:06:01 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7077F192B91;
	Fri, 23 Aug 2024 19:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724439961; cv=none; b=lkGfb2LD7VRf8mXbRtE5HP3QEOcfGM8e0Y6Y8P7jrv4GZAgMPl8fDu9M+/Dbr/OmYStAHdIyR0IeX7QubKEHFdP6GGKliLbciXurKa/U0u9If9zED/3H8W4CfbUkkS/GOO31BRzg8+qqEFMwRPrsT9veipxz1k1LrTISTuXTgxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724439961; c=relaxed/simple;
	bh=PZhFfVq/5TLv1q5Wiz+NgiFaYM4/wZWwGU915fqABSs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NHzo9ELMtMw/lo3FYGfgWhok+sXXUj79LA1L/4O5PG0PqTNuwKLAH2iuSqvc8mdhDLWcveP+P7q6HX1yQEoUmF0kChF5zxQ31LXaOm2Q44s96XNLMoKegKohjnSJfkWZSag8SRf0oi4BCaHSytmuczHPUKvfLVrdrLPoNltgvrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1shZbT-0001Kd-00; Fri, 23 Aug 2024 21:05:43 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id DCF27C014D; Fri, 23 Aug 2024 21:05:33 +0200 (CEST)
Date: Fri, 23 Aug 2024 21:05:33 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for V6.11
Message-ID: <ZsjdfYhJ2F/JIsFT@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.11_1

for you to fetch changes up to 50f2b98dc83de7809a5c5bf0ccf9af2e75c37c13:

  MIPS: cevt-r4k: Don't call get_c0_compare_int if timer irq is installed (2024-08-20 10:36:52 +0200)

----------------------------------------------------------------
- Set correct timer mode on  Loongson64
- Only request r4k clockevent interrupt on one CPU

----------------------------------------------------------------
Jiaxun Yang (2):
      MIPS: Loongson64: Set timer mode in cpu-probe
      MIPS: cevt-r4k: Don't call get_c0_compare_int if timer irq is installed

 arch/mips/kernel/cevt-r4k.c  | 15 +++++++--------
 arch/mips/kernel/cpu-probe.c |  4 ++++
 2 files changed, 11 insertions(+), 8 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

