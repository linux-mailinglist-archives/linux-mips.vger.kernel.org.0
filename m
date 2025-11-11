Return-Path: <linux-mips+bounces-12193-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 674AAC4DBC0
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 13:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 168074F73EF
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 12:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C246358D11;
	Tue, 11 Nov 2025 12:27:27 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49112550D4;
	Tue, 11 Nov 2025 12:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762864046; cv=none; b=UAZnnSYuShy/Y0VME5Zp2Gzdit/4eOqsX/f1zAUfL2aGf1RXNIKg3expaVdyCKuN5YId3lD0sM+NrD2c2TZdJTwTGJ5B3EfBaMjuAMNgvEoHUqM/Xs+CnekI5HNTc49SSVaUEknrkACqg4gUopR1TZ+ACBZlnZgmyVVEHl40Oo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762864046; c=relaxed/simple;
	bh=0WvQS+WeTyVY50j5gvueYLNa+MYoM6suUDTVF7hYWoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSILPGIIvfPy9KCBJVzSpu2L2BJ/O+ESOS8onPMSR7XDJl1fblWg9jwFiCwpMYn3Xgii4oSvcwwxf2PW/M1eFq9LPfO7FD+Ys3XgcKnElYsF7wrkzPQqPmqtsQsvzat4LgdqY3yYEfTWa9GBCMNd8c62Jn39jQW/OqP0Ym1Fl1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vInSx-0008Kw-00; Tue, 11 Nov 2025 13:27:19 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 904BBC0256; Tue, 11 Nov 2025 13:07:50 +0100 (CET)
Date: Tue, 11 Nov 2025 13:07:50 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Malta: Fix !EVA SOC-it PCI MMIO
Message-ID: <aRMnForYr_wNgbZ6@alpha.franken.de>
References: <alpine.DEB.2.21.2510191251130.39634@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2510191251130.39634@angie.orcam.me.uk>

On Mon, Oct 20, 2025 at 02:11:49AM +0100, Maciej W. Rozycki wrote:
> Fix a regression that has caused accesses to the PCI MMIO window to 
> complete unclaimed in non-EVA configurations with the SOC-it family of 
> system controllers, preventing PCI devices from working that use MMIO.
> 
> In the non-EVA case PHYS_OFFSET is set to 0, meaning that PCI_BAR0 is 
> set with an empty mask (and PCI_HEAD4 matches addresses starting from 0 
> accordingly).  Consequently all addresses are matched for incoming DMA 
> accesses from PCI.  This seems to confuse the system controller's logic 
> and outgoing bus cycles targeting the PCI MMIO window seem not to make 
> it to the intended devices.
> 
> This happens as well when a wider mask is used with PCI_BAR0, such as 
> 0x80000000 or 0xe0000000, that makes addresses match that overlap with 
> the PCI MMIO window, which starts at 0x10000000 in our configuration.
> 
> Set the mask in PCI_BAR0 to 0xf0000000 for non-EVA then, covering the 
> non-EVA maximum 256 MiB of RAM, which is what YAMON does and which used 
> to work correctly up to the offending commit.  Set PCI_P2SCMSKL to match 
> PCI_BAR0 as required by the system controller's specification, and match 
> PCI_P2SCMAPL to PCI_HEAD4 for identity mapping.
> 
> Verified with:
> 
> Core board type/revision =      0x0d (Core74K) / 0x01
> System controller/revision =    MIPS SOC-it 101 OCP / 1.3   SDR-FW-4:1
> Processor Company ID/options =  0x01 (MIPS Technologies, Inc.) / 0x1c
> Processor ID/revision =         0x97 (MIPS 74Kf) / 0x4c
> 
> for non-EVA and with:
> 
> Core board type/revision =      0x0c (CoreFPGA-5) / 0x00
> System controller/revision =    MIPS ROC-it2 / 0.0   FW-1:1 (CLK_unknown) GIC
> Processor Company ID/options =  0x01 (MIPS Technologies, Inc.) / 0x00
> Processor ID/revision =         0xa0 (MIPS interAptiv UP) / 0x20
> 
> for EVA/non-EVA, fixing:
> 
> defxx 0000:00:12.0: assign IRQ: got 10
> defxx: v1.12 2021/03/10  Lawrence V. Stefani and others
> 0000:00:12.0: Could not read adapter factory MAC address!
> 
> vs:
> 
> defxx 0000:00:12.0: assign IRQ: got 10
> defxx: v1.12 2021/03/10  Lawrence V. Stefani and others
> 0000:00:12.0: DEFPA at MMIO addr = 0x10142000, IRQ = 10, Hardware addr = 00-00-f8-xx-xx-xx
> 0000:00:12.0: registered as fddi0
> 
> for non-EVA and causing no change for EVA.
> 
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Fixes: 422dd256642b ("MIPS: Malta: Allow PCI devices DMA to lower 2GB physical")
> Cc: stable@vger.kernel.org # v4.9+
> ---
>  arch/mips/mti-malta/malta-init.c |   20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

