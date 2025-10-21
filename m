Return-Path: <linux-mips+bounces-11835-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FAEBF8478
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 21:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC228188E2E9
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 19:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01717264A76;
	Tue, 21 Oct 2025 19:38:21 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9A4350A2C;
	Tue, 21 Oct 2025 19:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761075500; cv=none; b=aGVsGR1ULJmPqx8T/Zk+Lglvqt/nUspCp2lNAl6Jm1VOJu4nnd/LVeECdh9dBb7uruGb/OlN2ba1e7oZSlrqKIs76V/Tw9ZluSiyxeHQjuX3/yNtFZAw1zW6En2Igbv5myKtXSkEpP3qN58FiEToiTlWcn6vYNILcGkUysdNGDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761075500; c=relaxed/simple;
	bh=OjXVbRCjz6XFSAFq9qxmaLge9r+jFNuwZDP6v12fHQo=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=PJrxy1r2lN9HM6NvvlGfeN58zqk4YhWDTsYjrgtsJTjNFwjqik6KfZ8JeWYoYGYvSLdaJJ2kwMSZOfmBjVMkywmwRo5sE7IEOKgLVXIIMVCsoBBXuzLexVTVPylfuD8bEp6SgR6KqOBHiUn+5sIW2VNX2mmAeLdn1/XPNSSatTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id B51C492009C; Tue, 21 Oct 2025 21:38:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id ADF1792009B;
	Tue, 21 Oct 2025 20:38:15 +0100 (BST)
Date: Tue, 21 Oct 2025 20:38:15 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Bjorn Helgaas <helgaas@kernel.org>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>
cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    Bjorn Helgaas <bhelgaas@google.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] MIPS: Malta: Fix PCI southbridge legacy resource
 clashes
Message-ID: <alpine.DEB.2.21.2510211901530.8377@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi,

 This mini patch series sorts out issues with southbridge legacy resource 
management on the MIPS Malta platform.  Two changes turned out required, 
because merely removing the clash would regress the PS/2 interfaces, fixed 
by accident with the PCIBIOS_MIN_IO fix.

 This does prove nobody has used these interfaces since forever, or most 
likely since the move to the new serio driver.  Things most likely worked 
fine with 2.4 and I still have such old Malta kernel builds lying around 
(though sadly no hardware to try with), although I do know I've never used 
the PS/2 stuff with this platform, e.g. quoting an arbitrarily picked 
2.4.19-rc1 bootstrap log:

CPU revision is: 00018101
Primary instruction cache 16kb, linesize 32 bytes(4 ways)
Primary data cache 16kb, linesize 32 bytes (4 ways)
Linux version 2.4.19-rc1 (macro@macro.ds2.pg.gda.pl) (gcc version 2.95.4 20010319 (prerelease)) #1 Fri Aug 23 02:55:02 CEST 2002
[...]
parport0: PC-style at 0x378 [PCSPP,EPP]
initialize_kbd: Keyboard reset failed, no ACK
Detected PS/2 Mouse Port.
pty: 256 Unix98 ptys configured
keyboard: Timeout - AT keyboard not present?(ed)
keyboard: Timeout - AT keyboard not present?(f4)
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ DETECT_IRQ SERIAL_PCI enabled
[...]

However to prevent the PS/2 interfaces from getting fixed and then broken 
again with backports in a random fashion I have marked both changes for 
backporting as appropriate.

 Bjorn, may I request that these changes be placed, with Thomas's ack of 
course (hopefully a formality), ahead of Ilpo's commit 16fbaba2b78f 
("MIPS: Malta: Use pcibios_align_resource() to block io range") (or 
whatever the latest version is, as said commit seems to be missing tags 
updates you mentioned), and then merged via your tree?  That will prevent 
things from breaking just to be fixed again shortly, and overall getting 
out of sync.

 See individual commit descriptions for details.

  Maciej

