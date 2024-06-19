Return-Path: <linux-mips+bounces-3738-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C342E90E8FD
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jun 2024 13:08:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A8DC1F21546
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jun 2024 11:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29418132119;
	Wed, 19 Jun 2024 11:08:04 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B908713664C;
	Wed, 19 Jun 2024 11:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718795284; cv=none; b=A/RdsvS7o0hh2N2UEcpyPen1edkZbVYfnH240eenxzuY7gj+YIBmZGjP2XLNF8kYedAgInNoGnAUbghzvEPkqrTMp6u/9QRtnTbF86pAP4StXy3/5REQdC8HC9NfP4gbmfvaodbQ2ZYJ4BBWsVOsw1apVdzh82gv3nLeN7gaHyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718795284; c=relaxed/simple;
	bh=1roHWMTkenylQTVxa6sCfmt+lt8ygc+cj7orJ3CFXr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y9pY21zgylwDqVvOoQSftTYpXTpzFIzzusCcLCo/7TCJwC6FW6ptBDvOBxNlv30cO+3k6BrydaRHMP2pl75UgL2gG9YZ7968US2ZA4hYarOoT+/OdhebPtO13pndgo+yIx8RGDrbsMmyhCAGer4V1MUYCWu4DTQCzVoMeqHZC5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1sJtAM-00027J-00; Wed, 19 Jun 2024 13:07:50 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 7C77AC0120; Wed, 19 Jun 2024 13:07:40 +0200 (CEST)
Date: Wed, 19 Jun 2024 13:07:40 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v6.10
Message-ID: <ZnK7/CW+hLH3/Hhs@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 83a7eefedc9b56fe7bfeff13b6c7356688ffa670:

  Linux 6.10-rc3 (2024-06-09 14:19:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.10_1

for you to fetch changes up to 6e5aee08bd2517397c9572243a816664f2ead547:

  Revert "MIPS: pci: lantiq: restore reset gpio polarity" (2024-06-13 10:17:09 +0200)

----------------------------------------------------------------
- fix for BCM6538 boards
- fix RB532 PCI workaround

----------------------------------------------------------------
Christian Marangi (1):
      mips: bmips: BCM6358: make sure CBR is correctly set

Ilpo Järvinen (1):
      MIPS: Routerboard 532: Fix vendor retry check code

Martin Schiller (1):
      MIPS: pci: lantiq: restore reset gpio polarity

Thomas Bogendoerfer (1):
      Revert "MIPS: pci: lantiq: restore reset gpio polarity"

 arch/mips/bmips/setup.c     | 3 ++-
 arch/mips/pci/ops-rc32434.c | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

