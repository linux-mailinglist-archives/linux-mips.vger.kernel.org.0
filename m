Return-Path: <linux-mips+bounces-7786-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2CAA37367
	for <lists+linux-mips@lfdr.de>; Sun, 16 Feb 2025 10:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9963016C01D
	for <lists+linux-mips@lfdr.de>; Sun, 16 Feb 2025 09:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E64A18C034;
	Sun, 16 Feb 2025 09:38:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9C8290F;
	Sun, 16 Feb 2025 09:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739698730; cv=none; b=AcGJ4lCm70R5X2bZO3pj9vM4p4jMQXJ6oVMuRMk+VyhWEItvhkRmrrLIUxgMM80/GmK5djiw6oMt9iGtlMuvXApPUCC8vfDpahzhim0GrQfFO7/XWgLgIcAuKYynuhuqJ9zx0P6LmZS+Q+ZYntA/sfiN2UNU8Q8gTAclDUXWomE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739698730; c=relaxed/simple;
	bh=8gHbHKvxkRS3nnYekQqimtgaD9gDQL4A67uM5Q9hc+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BX923W7D6xtEyG9kDFkDn642x7fW+eIZC/PRoi1KfM9sbAtawhJ4kx8Oj37pnAibVXr+g+rbN3NRIw0U4ei0gt7PQ3BB5k9x6ShB1SK1fHgGO8C4aDqrrWVRvkW9Dfreky5JSu9g9MVYAQobTuyearki6TzU3Uo4iDErITSyaKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1tjb6k-0002kq-00; Sun, 16 Feb 2025 10:38:38 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id A1610C0135; Sun, 16 Feb 2025 10:38:28 +0100 (CET)
Date: Sun, 16 Feb 2025 10:38:28 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v6.14
Message-ID: <Z7GyFB5hAays_aII@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.14_1

for you to fetch changes up to 733a90561ad0a4a74035d2d627098da85d43b592:

  MIPS: fix mips_get_syscall_arg() for o32 (2025-02-13 12:41:29 +0100)

----------------------------------------------------------------
Fix for o32 ptrace/get_syscall_info

----------------------------------------------------------------
Dmitry V. Levin (1):
      MIPS: fix mips_get_syscall_arg() for o32

Maciej W. Rozycki (1):
      MIPS: Export syscall stack arguments properly for remote use

 arch/mips/include/asm/ptrace.h  |  4 ++--
 arch/mips/include/asm/syscall.h | 32 ++++++++------------------------
 arch/mips/kernel/asm-offsets.c  |  6 ++++++
 arch/mips/kernel/scall32-o32.S  |  8 ++++----
 4 files changed, 20 insertions(+), 30 deletions(-)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

