Return-Path: <linux-mips+bounces-12534-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B202CD2E96
	for <lists+linux-mips@lfdr.de>; Sat, 20 Dec 2025 13:10:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B7F6300F59D
	for <lists+linux-mips@lfdr.de>; Sat, 20 Dec 2025 12:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA002F0C68;
	Sat, 20 Dec 2025 12:10:12 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E30D2F691B;
	Sat, 20 Dec 2025 12:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766232612; cv=none; b=nFWPy9TCzUja0oCxZKK/mmV8oDfJVoCQFsB8cV3wM9l6ItCtGuiC6HM4ypM/63PEL1JFc9B7DLTwm1hRppyLkApXNAORo2jMZv769tn4JP+5xxydG32moniBNq3CwaENqeiu7s8dX9xOri8AhhkbFfhT/ZeEGD1c8E7nRAwgSic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766232612; c=relaxed/simple;
	bh=NBxjHBcjr9xufhL4wcCMbW8gIOVEDPX++2+EenieqmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZdY7VWZMDL9Pm6PXIO9b2pf5tMqOR6LeO9lYrw494eOFVrWBUHrl8Z91+JWc6EKZyWtLGeh+bdXW7Dixuj3WHF0qeQ70vXsmKfqKjoScrbaZXQ7JeQjGIMfing2z9lR4MsT11yLgFVUfVqcXfG6ka4kxKfdwZB1Vwcgy25lhPU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vWvmb-0005Sq-00; Sat, 20 Dec 2025 13:10:01 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 0F2E5C0113; Sat, 20 Dec 2025 13:09:54 +0100 (CET)
Date: Sat, 20 Dec 2025 13:09:54 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v6.19
Message-ID: <aUaSEkIf-vwMXc5j@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.19_1

for you to fetch changes up to 680ad315caaa2860df411cb378bf3614d96c7648:

  MIPS: Fix a reference leak bug in ip22_check_gio() (2025-12-15 16:11:14 +0100)

----------------------------------------------------------------
Fix build error for Alchemy
Fix reference leak

----------------------------------------------------------------
Haoxiang Li (1):
      MIPS: Fix a reference leak bug in ip22_check_gio()

Thierry Reding (1):
      MIPS: Alchemy: Remove bogus static/inline specifiers

 arch/mips/alchemy/common/setup.c | 3 +--
 arch/mips/sgi-ip22/ip22-gio.c    | 3 ++-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

