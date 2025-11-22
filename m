Return-Path: <linux-mips+bounces-12323-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E2AC7D7A1
	for <lists+linux-mips@lfdr.de>; Sat, 22 Nov 2025 21:48:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3C72D4E07D3
	for <lists+linux-mips@lfdr.de>; Sat, 22 Nov 2025 20:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1C121C9E5;
	Sat, 22 Nov 2025 20:48:15 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368691F5858;
	Sat, 22 Nov 2025 20:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763844495; cv=none; b=ulZTzImMhUWBfy4jaL7lLrpXyJjjoYjKQSXd98W7xgtNi/QwiZbxwYbccdnWSYT8HQcMjMLXsl2ffN1ybwBsnD0FC9/VRgNgZEKvr7pNzz7JTQE4eKBGNu21sQf3cWLI5ETy4aQYBgd2PhaJhrtdxBxAxA9Fbu01KHY9YO79lJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763844495; c=relaxed/simple;
	bh=i1UWevb9o1kQXVkncYPOdFDymHqA4jy/qMAlR7RQpU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=muhePAWUCMILgf7An26Y2g62Z4sl7XIN3Op7VtORaMaH4jKlFkBnE4p0jFeCGq+PE55ncAjYOvQ/PO+dgdO5hF5ozwSYatZHbsy1npmqicLYmYjaFlQbDTCq38wlfxGALn42LplnqxT7wZMib+VVHEMmfyl5WylO1LtT5n3UX6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vMuWZ-0004gJ-00; Sat, 22 Nov 2025 21:48:03 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 99B2BC0256; Sat, 22 Nov 2025 21:47:53 +0100 (CET)
Date: Sat, 22 Nov 2025 21:47:53 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v6.18
Message-ID: <aSIhefXIXrLpMaC5@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c:

  Linux 6.18-rc5 (2025-11-09 15:10:19 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.18_1

for you to fetch changes up to 14b46ba92bf547508b4a49370c99aba76cb53b53:

  MIPS: kernel: Fix random segmentation faults (2025-11-21 13:24:05 +0100)

----------------------------------------------------------------
- Fix CPU type in DT for econet
- Fix for Malta PCI MMIO breakage for SOC-it
- Fix TLB shutdown caused by iniital uniquification
- Fix random seg faults

----------------------------------------------------------------
Aleksander Jan Bajkowski (1):
      mips: dts: econet: fix EN751221 core type

Maciej W. Rozycki (2):
      MIPS: Malta: Fix !EVA SOC-it PCI MMIO
      MIPS: mm: Prevent a TLB shutdown on initial uniquification

Thomas Bogendoerfer (1):
      MIPS: kernel: Fix random segmentation faults

 arch/mips/boot/dts/econet/en751221.dtsi |   2 +-
 arch/mips/kernel/process.c              |   2 +-
 arch/mips/mm/tlb-r4k.c                  | 100 ++++++++++++++++++++------------
 arch/mips/mti-malta/malta-init.c        |  20 ++++---
 4 files changed, 78 insertions(+), 46 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

