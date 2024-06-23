Return-Path: <linux-mips+bounces-3863-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 528AA913969
	for <lists+linux-mips@lfdr.de>; Sun, 23 Jun 2024 12:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E5431C2113B
	for <lists+linux-mips@lfdr.de>; Sun, 23 Jun 2024 10:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2E838398;
	Sun, 23 Jun 2024 10:10:17 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95FD2F2D;
	Sun, 23 Jun 2024 10:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719137417; cv=none; b=MwBTZGyGdiE+uQGl42s9Q3Sz5tk9AJnN/lzwTLuhQochUyjJjXNgjVA5RDUkcLX9L0HQtZyNpYGWuNX/3//o7FxPCeDvMbe6A9tg2/MurNn0al7mF8znTMxu6QwArQwCDiCdERteVP5Zlkyv1OEco4c+jL+gVtCfZLI0nkjor8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719137417; c=relaxed/simple;
	bh=0DBoc103yRHwG+10tyvDWTz+CPnU08kwKuK3KFTQ6j8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H0Q4xYg1s6LGoMPeCj4wM58caPKm0AxJXiO9y/F8uhP74UzVcmii3mWtQ8IJvMpa0xdriCYmPHFomIV7sJycEah1byBqPACMnCKlikvPDw+LfzModuf09oKjCRVXawNgPc6qdf29n3B2DcOr61NxoWRcX4paRjNY0XyXgIHOCLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sLKAX-0007Vv-00; Sun, 23 Jun 2024 12:09:57 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 16777C0120; Sun, 23 Jun 2024 12:09:49 +0200 (CEST)
Date: Sun, 23 Jun 2024 12:09:49 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v6.10
Message-ID: <Znf0bReGRC9C1ACk@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 6e5aee08bd2517397c9572243a816664f2ead547:

  Revert "MIPS: pci: lantiq: restore reset gpio polarity" (2024-06-13 10:17:09 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.10_2

for you to fetch changes up to 0d5679a0aae2d8cda72169452c32e5cb88a7ab33:

  mips: fix compat_sys_lseek syscall (2024-06-21 10:16:34 +0200)

----------------------------------------------------------------
- fix lseek in o32 compat mode
- fix for microMIPS MT ASE helpers

----------------------------------------------------------------
Arnd Bergmann (1):
      mips: fix compat_sys_lseek syscall

Jiaxun Yang (1):
      MIPS: mipsmtregs: Fix target register for MFTC0

 arch/mips/include/asm/mipsmtregs.h        | 2 +-
 arch/mips/kernel/syscalls/syscall_o32.tbl | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

