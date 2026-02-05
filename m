Return-Path: <linux-mips+bounces-13122-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Fs2FZBfhGng2gMAu9opvQ
	(envelope-from <linux-mips+bounces-13122-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 05 Feb 2026 10:14:56 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CED4BF06E2
	for <lists+linux-mips@lfdr.de>; Thu, 05 Feb 2026 10:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB36D3042968
	for <lists+linux-mips@lfdr.de>; Thu,  5 Feb 2026 09:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A431A3A1E91;
	Thu,  5 Feb 2026 09:06:35 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F173392809;
	Thu,  5 Feb 2026 09:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770282395; cv=none; b=vD1WGYZX2u5IJwNRo5jHyaZFyICLo1I3Cy8/xfA9yXYIImZDTi6/NmKYM08grU1bIZK6V/sVzJgR8Y5tEm+iRCTKYdKDkGY5vvJlE5N7HGcaKSPVoNTI5u2LDWE71D3uRzDRzmvPiwP+MqdvU3tKjGf2dvsDs2Z0BPYf376OKm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770282395; c=relaxed/simple;
	bh=ln2pKkV+i3yVppM/kwOY4nocOURWaEHzd/mJ+9felGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UtW8/G876g98peI09VRTTDOdtm5VEAVCBIEG6MeZpgvGZ66+o69I1KoJgnxWE5603eOsHbxkeLWz5p6P3bf8yq8GWW8QSOI5+emvuOofkNhhiEljgwx/BcL7VAB60az/UA+atjEDIaOI5NmWEdVv+8lvOpF/bfI/t+J5sWbuYZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vnvJi-0001MT-00; Thu, 05 Feb 2026 10:06:26 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 777BBC061A; Thu,  5 Feb 2026 10:05:34 +0100 (CET)
Date: Thu, 5 Feb 2026 10:05:34 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rong Zhang <rongrong@oss.cipunited.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Rong Zhang <i@rong.moe>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] MIPS: Loongson2ef: Use pcibios_align_resource() to
 block io range
Message-ID: <aYRdXhSZRrHNJmqs@alpha.franken.de>
References: <20260131214003.833520-1-rongrong@oss.cipunited.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131214003.833520-1-rongrong@oss.cipunited.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.947];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-13122-lists,linux-mips=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: CED4BF06E2
X-Rspamd-Action: no action

On Sun, Feb 01, 2026 at 05:32:57AM +0800, Rong Zhang wrote:
> Loongson2ef reserves io range below 0x4000 (LOONGSON_PCI_IO_START) while
> ISA-mode only IDE controller on the south bridge still has a hard
> dependency on ISA IO ports.
> 
> The reservation was done by lifting loongson_pci_io_resource.start onto
> 0x4000. Prior to commit ae81aad5c2e1 ("MIPS: PCI: Use
> pci_enable_resources()"), the arch specific pcibios_enable_resources()
> did not check if the resources were claimed, which diverges from what
> PCI core checks, effectively hiding the fact that IDE IO resources were
> not properly within the resource tree. After starting to use
> pcibios_enable_resources() from PCI core, enabling IDE controller fails:
> 
>   pata_cs5536 0000:00:0e.2: BAR 0 [io  0x01f0-0x01f7]: not claimed; can't enable device
>   pata_cs5536 0000:00:0e.2: probe with driver pata_cs5536 failed with error -22
> 
> MIPS PCI code already has support for enforcing lower bounds using
> PCIBIOS_MIN_IO in pcibios_align_resource() without altering the IO
> window start address itself. Register PCI controller in plat_mem_setup()
> instead of arch_initcall() to make it the root of other resources (e.g.,
> i8259) and prevent resource conflicts. Then, make Loongson2ef PCI code
> use PCIBIOS_MIN_IO too.
> 
> Rong Zhang (2):
>   MIPS: Loongson2ef: Register PCI controller in early stage
>   MIPS: Loongson2ef: Use pcibios_align_resource() to block io range
> 
>  .../include/asm/mach-loongson2ef/loongson.h    |  6 ++++++
>  arch/mips/loongson2ef/common/pci.c             | 18 +++++++++++-------
>  arch/mips/loongson2ef/common/setup.c           |  1 +
>  3 files changed, 18 insertions(+), 7 deletions(-)
> 
> 
> base-commit: ad9a728a3388dc5f66eab6b7135e0154249e9403
> -- 
> 2.51.0

series applied to mips-next
Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

