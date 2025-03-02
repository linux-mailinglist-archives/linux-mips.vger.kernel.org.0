Return-Path: <linux-mips+bounces-8064-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C147A4B0BB
	for <lists+linux-mips@lfdr.de>; Sun,  2 Mar 2025 09:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65C4716AF39
	for <lists+linux-mips@lfdr.de>; Sun,  2 Mar 2025 08:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEFE21C3BF9;
	Sun,  2 Mar 2025 08:48:35 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCFA1CA84;
	Sun,  2 Mar 2025 08:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740905315; cv=none; b=lVMl+NdzpfQLaf0u2scZgrCbPlEvqQ8dShvJ4ji8qP7Gomjwz6mPuGc0Y3q2aY3I8xpzRtCTMY1Bzo0xK9gY/KF+eEMEhbY9b0jVjKuYJ5BbXGkZ/iIkMYHnJNc9qOVJTOt7ztpiAfULqC/GLghLtqq8grx8ePxRwQv89t35IoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740905315; c=relaxed/simple;
	bh=GpAubITbfEu6s2rjNggxWmrFc1oAakKX/e/I6ZqoDuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DKk4fB88IsTS8XTj+lxjbNV5xrSV7aW2cAGDvmGyKqimgZsM4l+SJQYFveJC5eieGP3/uV1q+FIT4FdWgwgn9D8PbGyVUPRBy4QbnUV/aTG31m++jBebH6x/z6uwO6zLn4CPHpYS6UaUd3FKiFsaRHOZxP7TbfElRXOGoEPYCuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1toezn-0000OS-00; Sun, 02 Mar 2025 09:48:23 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 46680C0135; Sun,  2 Mar 2025 09:48:17 +0100 (CET)
Date: Sun, 2 Mar 2025 09:48:17 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: torvalds@linux-foundation.org
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] MIPS fixes for v6.14
Message-ID: <Z8QbUbukL7ejc6T6@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0ad2507d5d93f39619fc42372c347d6006b64319:

  Linux 6.14-rc3 (2025-02-16 14:02:44 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.14_2

for you to fetch changes up to 6d48ad04075729519f6baaa1dc9e5a3a39d05f53:

  MIPS: Ignore relocs against __ex_table for relocatable kernel (2025-02-27 11:07:50 +0100)

----------------------------------------------------------------
Fix fallout of /scripts/sorttable cleanup

----------------------------------------------------------------
Xi Ruoyao (1):
      MIPS: Ignore relocs against __ex_table for relocatable kernel

 arch/mips/boot/tools/relocs.c | 5 +++++
 1 file changed, 5 insertions(+)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

