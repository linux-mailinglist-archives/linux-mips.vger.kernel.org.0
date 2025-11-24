Return-Path: <linux-mips+bounces-12345-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 768A6C827A8
	for <lists+linux-mips@lfdr.de>; Mon, 24 Nov 2025 22:07:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EE965349AF0
	for <lists+linux-mips@lfdr.de>; Mon, 24 Nov 2025 21:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544262EC0A5;
	Mon, 24 Nov 2025 21:07:16 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6620C318136;
	Mon, 24 Nov 2025 21:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764018436; cv=none; b=fDNE9qaH5Q+nDI3FpctrAFFMigAbWksBafKUi3+fl9cBYoobzNDbyecDcSAGOuJQHbGYfxLOh5Smb/Ws7A0rMGGQ17JHDKX9fKUgIFtNKmud9ZlFBxQG2XM1cn5D2U4cjA8UKlSQGknbbkG2q/WWN864vi2eRuvLlS7R8lcxo9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764018436; c=relaxed/simple;
	bh=Jz0hVHmZtTtcauy6vpRUsaL64wpIUcvZym8CvXHXmcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s2TXBmuPDL/an4xnhCW7HNG0B6CtjDgZpwQgGgvApdS8Abd7LhNFrpuHO5/yBIq6NamkzHKdxFmcQfN3zEiDZJIXOInfPKDxdOYqEj9it7nevva7YpB534/5eDzyA3Yxui7NJvygrGwwWdGB5WrIWV/IGCKq4LrM1v12UIzvXy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vNdm2-0002Rp-00; Mon, 24 Nov 2025 22:07:02 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id AFBD5C0256; Mon, 24 Nov 2025 22:06:53 +0100 (CET)
Date: Mon, 24 Nov 2025 22:06:53 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: torvalds@linux-foundation.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, macro@orcam.me.uk
Subject: Re: [GIT PULL] MIPS fixes for v6.18
Message-ID: <aSTI7RHnKXkoxWw-@alpha.franken.de>
References: <aSIhefXIXrLpMaC5@alpha.franken.de>
 <87wm3f8mcb.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wm3f8mcb.fsf@BLaptop.bootlin.com>

On Mon, Nov 24, 2025 at 04:46:44PM +0100, Gregory CLEMENT wrote:
> Hello Thomas,
> 
> > The following changes since commit e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c:
> >
> >   Linux 6.18-rc5 (2025-11-09 15:10:19 -0800)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/ tags/mips-fixes_6.18_1
> >
> > for you to fetch changes up to 14b46ba92bf547508b4a49370c99aba76cb53b53:
> >
> >   MIPS: kernel: Fix random segmentation faults (2025-11-21 13:24:05 +0100)
> >
> > ----------------------------------------------------------------
> > - Fix CPU type in DT for econet
> > - Fix for Malta PCI MMIO breakage for SOC-it
> > - Fix TLB shutdown caused by iniital uniquification
> > - Fix random seg faults
> >
> > ----------------------------------------------------------------
> > Aleksander Jan Bajkowski (1):
> >       mips: dts: econet: fix EN751221 core type
> >
> > Maciej W. Rozycki (2):
> >       MIPS: Malta: Fix !EVA SOC-it PCI MMIO
> >       MIPS: mm: Prevent a TLB shutdown on initial uniquification
> 
> Today, the kernel v6.18-rc7 no longer boots on EyeQ5 and EyeQ6H (MIPS
> I6500)-based boards. After a git bisect between v6.18-rc6 and v6.18-rc7,
> we found that the culprit is the commit "MIPS: mm: Prevent a TLB
> shutdown on initial uniquification".
> 
> Here is the log from a vanilla v6.18-rc7:
> 
> Linux version 6.18.0-rc7 (gclement@BLaptop) (mips-img-linux-gnu-gcc (Codescape GNU Tools 2021.09-01 for MIPS IMG Linux) 11.2.0, GNU ld (Codescape GNU Tools 2021.09-01 for MIPS IMG Linux) 2.31.1) #1015 SMP Mon Nov 24 14:48:06 CET 2025
> CPU0 revision is: 0001b031 (MIPS I6500)
> FPU revision is: 20f30320
> MSA revision is: 00000320
> MIPS: machine is Mobile EyeQ6H MP6 Evaluation board
> earlycon: pl11 at MMIO32 0x00000000d3331000 (options '921600n8')
> printk: legacy bootconsole [pl11] enabled
> Initrd not found or empty - disabling initrd
> OF: reserved mem: Reserved memory: No reserved-memory node in the DT
> VP topology {4,4,4,4},{4,4,4,4} total 32
> VP Local Reset Exception Base support 47 bits address
> Primary instruction cache 64kB, VIPT, 4-way, linesize 64 bytes.
> Primary data cache 32kB, 4-way, PIPT, no aliases, linesize 64 bytes
> MIPS secondary cache 1024kB, 16-way, linesize 64 bytes.
> Zone ranges:
>   Normal   [mem 0x0000000100000000-0x00000001ffffffff]
> Movable zone start for each node
> Early memory node ranges
>   node   0: [mem 0x0000000100000000-0x00000001ffffffff]
> Initmem setup node 0 [mem 0x0000000100000000-0x00000001ffffffff]
> percpu: Embedded 6 pages/cpu s46496 r8192 d43616 u98304
> Kernel command line: earlycon
> printk: log buffer data + meta data: 131072 + 458752 = 589824 bytes
> Dentry cache hash table entries: 524288 (order: 8, 4194304 bytes, linear)
> Inode-cache hash table entries: 262144 (order: 7, 2097152 bytes, linear)
> 
> and with the commit reverted:

I see something similair on a Octeon board with the addition

Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: r4k_tlb_uniquify+0x31c/0x320

Maciej, any idea ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

