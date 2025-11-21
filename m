Return-Path: <linux-mips+bounces-12319-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5067FC7908D
	for <lists+linux-mips@lfdr.de>; Fri, 21 Nov 2025 13:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BEEFA3509A1
	for <lists+linux-mips@lfdr.de>; Fri, 21 Nov 2025 12:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F82530EF7F;
	Fri, 21 Nov 2025 12:40:56 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CC62D8379;
	Fri, 21 Nov 2025 12:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763728856; cv=none; b=gJjZ9QToykbHWHyNZWNOBBRpFTQzwxb/Yij/dwX3VEN4oW7kSJ+gM3OsxCgrpLemC9zQqqxPBPtZogbW6V1TF11ruyCUmfSC5oFIQkQZ0uWO9XOrJYsuP0/n9JYuKmfpsNPXoPvtPoyCQVceltZimrY3paiS9E/4Ej4wiLA1q3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763728856; c=relaxed/simple;
	bh=22+oWXer/V5g8n+lWuDMIFDGZ+lXMXKIf3gGcew19Q8=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GlDc+POBZ9r1c1QD2uZ/x5lLECr6HL5HzbegAqCxIoIKYIyCy81UDrQ2rC6SJyEKtdKJqYtSs7IgO6p4wdb1gVtiR4HFBDKazVSfqzVxSt5lMS/Ud7sssq6Pm92Sk5kR0r2qnffCHK34HdnFYYwrINq4DAQgarR5uiGt7NmQddc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1vMQRQ-0005wC-00; Fri, 21 Nov 2025 13:40:44 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 61906C0256; Fri, 21 Nov 2025 13:25:22 +0100 (CET)
Date: Fri, 21 Nov 2025 13:25:22 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nam Cao <namcao@linutronix.de>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: kernel: Fix random segmentation faults
Message-ID: <aSBaMmJtKk6cfpuU@alpha.franken.de>
References: <20251120121030.28524-1-tsbogend@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120121030.28524-1-tsbogend@alpha.franken.de>

On Thu, Nov 20, 2025 at 01:10:29PM +0100, Thomas Bogendoerfer wrote:
> Commit 69896119dc9d ("MIPS: vdso: Switch to generic storage
> implementation") switches to a generic vdso storage, which increases
> the number of data pages from 1 to 4. But there is only one page
> reserved, which causes segementation faults depending where the VDSO
> area is randomized to. To fix this use the same size of reservation
> and allocation of the VDSO data pages.
> 
> Fixes: 69896119dc9d ("MIPS: vdso: Switch to generic storage implementation")
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
> v2: Don't reserve additionnal VDSO_NR_PAGES, but reserve VDSO_NR_PAGES
>     instead of the one page before.
>     Reworked description
> v1: https://lore.kernel.org/all/20251117191815.69556-1-tsbogend@alpha.franken.de/
> 
>  arch/mips/kernel/process.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
> index 29191fa1801e..a3101f2268c6 100644
> --- a/arch/mips/kernel/process.c
> +++ b/arch/mips/kernel/process.c
> @@ -692,7 +692,7 @@ unsigned long mips_stack_top(void)
>  	/* Space for the VDSO, data page & GIC user page */
>  	if (current->thread.abi) {
>  		top -= PAGE_ALIGN(current->thread.abi->vdso->size);
> -		top -= PAGE_SIZE;
> +		top -= VDSO_NR_PAGES * PAGE_SIZE;
>  		top -= mips_gic_present() ? PAGE_SIZE : 0;
>  
>  		/* Space to randomize the VDSO base */
> -- 
> 2.43.0

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

