Return-Path: <linux-mips+bounces-10517-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98447B32E16
	for <lists+linux-mips@lfdr.de>; Sun, 24 Aug 2025 10:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53D8B3B656E
	for <lists+linux-mips@lfdr.de>; Sun, 24 Aug 2025 08:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930FD1EDA2A;
	Sun, 24 Aug 2025 08:03:38 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812221805E;
	Sun, 24 Aug 2025 08:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756022618; cv=none; b=GnIrizVcQ4cOXLenDUQKUQiRJeN2xnVSxj+PhGqKKwLuCejKlhyrmkVacLxGLMplE7dqOYb0F/QgQ1P9k5ljY3DxPPSGsoFiN1fp2zEKQE7vFN4vZXaf1ULqShIL7MdrZOY48JvqeiRG2j+4fWvpyZAGfm2oNWCfsgyLPY4P4M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756022618; c=relaxed/simple;
	bh=0ub0vC7mGI16Y1TUyO63PS94J6Ae0xvlHsww1DA4EoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kkW+ipEfeBwTLOFvP+6F1RZnqYiFDeJQvHJxBrCwYMF0BGfvaRfiXKxogIT7/5wqwo25uWdWfL3GnK81aivNorUmvPszhKdoLluXZlGf3q6eHz8jlDug4GJnyx7deVvoXmcNTt4/DD5zsiZNHHWRcdd4bn40sqtYCWcRMd5q2Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1uq5hG-0005L6-00; Sun, 24 Aug 2025 10:03:26 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id B234FC04FD; Sun, 24 Aug 2025 10:03:12 +0200 (CEST)
Date: Sun, 24 Aug 2025 10:03:12 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v6.17
Message-ID: <aKrHQC7qQxQV3TKW@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9:

  Linux 6.17-rc2 (2025-08-17 15:22:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.17_1

for you to fetch changes up to 8c431ea8f3f795c4b9cfa57a85bc4166b9cce0ac:

  mips: lantiq: xway: sysctrl: rename the etop node (2025-08-22 22:03:21 +0200)

----------------------------------------------------------------
Fix ethernet on Lantiq boards

----------------------------------------------------------------
Aleksander Jan Bajkowski (2):
      mips: dts: lantiq: danube: add missing burst length property
      mips: lantiq: xway: sysctrl: rename the etop node

 arch/mips/boot/dts/lantiq/danube_easy50712.dts |  5 ++++-
 arch/mips/lantiq/xway/sysctrl.c                | 10 +++++-----
 2 files changed, 9 insertions(+), 6 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

