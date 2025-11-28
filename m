Return-Path: <linux-mips+bounces-12367-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E42EEC916CD
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 10:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B8D73A1666
	for <lists+linux-mips@lfdr.de>; Fri, 28 Nov 2025 09:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963B72FF147;
	Fri, 28 Nov 2025 09:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VM3/J7jO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8792773C6;
	Fri, 28 Nov 2025 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764321786; cv=none; b=Yd4j86av2BCCNZAPcc+DgIXs48uZnCFc0WCFfBnO4mZiegr1pt4oFk3otkrJznnIWLcMidOy9I9smGZcnos74f7KzjR0E3xc94iDIHTSg1VamFiYQnIp2ma0mCJbeDcyqA6bW3aoI4yscMi9iX4SmuLdy/nFLl9PKGiGR0KHXhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764321786; c=relaxed/simple;
	bh=bFtQ+ySZNQpcK0m7ydpMb0JRLRoBTbNDcO0pP9Ch6Tk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pjEcYHQx+HeICKoLpFSRykd3vg6KG46K2SecXEaWYKK5W7qoRsIaIKC+0fXKvSIIyE6/96axbu6Ec//gf9cCAZnisrA38WAJxIDYS8g+ZM9s250j5aD8oZk9Oz69DQuNHboTdr/qJrbHJgIOBw8IJViTVdbBjg1Ty9nkSEFvvzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VM3/J7jO; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 87774C16A37;
	Fri, 28 Nov 2025 09:22:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 595B660706;
	Fri, 28 Nov 2025 09:23:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D3350103C8F63;
	Fri, 28 Nov 2025 10:22:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764321779; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aYSEZUQj2S9GkReKvZzmDgLwZsVKNb8GqAT9vK7plTM=;
	b=VM3/J7jOKZ1g7iR3HIuBWaVyAll5uYJQy4wQYhkJTpevrJcqKVsUePJYKohOb3HduqBswG
	4MXx66XmfJ5vO0c7k0by1gYBGRY+DtyxyVvLMPRagWT+IXdrlYCNbm/sVFBbphp90gQwAp
	FVmDfD32+heGhLpPUgh1n+e/r848gmRq/quZJ50NquICftZ7KYlLD8E+JbFag2Jb8aLlHy
	j4HKGzmR6d1sr7Yaf5o+dRxnMmUYV1l8iq7nEegUwJUg6+5TfBwFAmW8KM0yH5xDC7gGsK
	papzHj34CJjtNgtMw4NdOGC4u/4W3PA1UY6shW3+p0jWzqrhpxdjbDlxO5fAcQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow
In-Reply-To: <alpine.DEB.2.21.2511280544050.36486@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2511280544050.36486@angie.orcam.me.uk>
Date: Fri, 28 Nov 2025 10:22:57 +0100
Message-ID: <871pli5x5a.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Maciej,

> From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>
> Owing to Config4.MMUSizeExt and VTLB/FTLB MMU features later MIPSr2+=20
> cores can have more than 64 TLB entries.  Therefore allocate an array=20
> for uniquification instead of placing too small an array on the stack.
>
> Fixes: 35ad7e181541 ("MIPS: mm: tlb-r4k: Uniquify TLB entries on init")
> Co-developed-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: stable@vger.kernel.org # v6.17+: 9f048fa48740: MIPS: mm: Prevent a TL=
B shutdown on initial uniquification
> Cc: stable@vger.kernel.org # v6.17+

Thanks for this patch. It allows booting on EyQ5 and EyeQ6H. However,
during the build process, I saw this new warning:

WARNING: modpost: vmlinux: section mismatch in reference: r4k_tlb_configure=
+0x3e4 (section: .text) -> memblock_alloc_try_nid_raw (section: .init.text)

Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Gregory

> ---
>  Verified with Malta/74Kf and Malta/interAptiv for initial and secondary=
=20
> CPU bootstrap.  The PM path hasn't been covered, but is expected to be=20
> the same as secondary CPU bootstrap.
>
>  NB Malta/interAptiv has issues later on in SMP boot (boots fine UP) and=
=20
> hangs with repeated:
>
> irq 23: nobody cared (try booting with the "irqpoll" option)
> CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.18.0-rc1-dirty #2 NONE
>
> messages (for the CP0 timer interrupt AFAICT; GIC timer is supposed to=20
> be used instead).  This will have to be bisected.
>
> Changes from v3:
>
> - Rearrange tags including stable backport ones so as to pick the origina=
l=20
>   change together with this fix only.
>
> Changes from v2:
>
> - Use the bootmem allocator for early calls (CPU #0 bootstrap).
>
> - Update the change description; mark for stable backporting.
> ---
>  arch/mips/mm/tlb-r4k.c |   16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> linux-mips-tlb-r4k-uniquify-tlbsize.diff
> Index: linux-macro/arch/mips/mm/tlb-r4k.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux-macro.orig/arch/mips/mm/tlb-r4k.c
> +++ linux-macro/arch/mips/mm/tlb-r4k.c
> @@ -12,6 +12,7 @@
>  #include <linux/init.h>
>  #include <linux/sched.h>
>  #include <linux/smp.h>
> +#include <linux/memblock.h>
>  #include <linux/mm.h>
>  #include <linux/hugetlb.h>
>  #include <linux/export.h>
> @@ -524,15 +525,24 @@ static int r4k_vpn_cmp(const void *a, co
>   */
>  static void r4k_tlb_uniquify(void)
>  {
> -	unsigned long tlb_vpns[1 << MIPS_CONF1_TLBS_SIZE];
>  	int tlbsize =3D current_cpu_data.tlbsize;
> +	bool use_slab =3D slab_is_available();
>  	int start =3D num_wired_entries();
> +	phys_addr_t tlb_vpn_size;
> +	unsigned long *tlb_vpns;
>  	unsigned long vpn_mask;
>  	int cnt, ent, idx, i;
>=20=20
>  	vpn_mask =3D GENMASK(cpu_vmbits - 1, 13);
>  	vpn_mask |=3D IS_ENABLED(CONFIG_64BIT) ? 3ULL << 62 : 1 << 31;
>=20=20
> +	tlb_vpn_size =3D tlbsize * sizeof(*tlb_vpns);
> +	tlb_vpns =3D (use_slab ?
> +		    kmalloc(tlb_vpn_size, GFP_KERNEL) :
> +		    memblock_alloc_raw(tlb_vpn_size, sizeof(*tlb_vpns)));
> +	if (WARN_ON(!tlb_vpns))
> +		return; /* Pray local_flush_tlb_all() is good enough. */
> +
>  	htw_stop();
>=20=20
>  	for (i =3D start, cnt =3D 0; i < tlbsize; i++, cnt++) {
> @@ -585,6 +595,10 @@ static void r4k_tlb_uniquify(void)
>  	tlbw_use_hazard();
>  	htw_start();
>  	flush_micro_tlb();
> +	if (use_slab)
> +		kfree(tlb_vpns);
> +	else
> +		memblock_free(tlb_vpns, tlb_vpn_size);
>  }
>=20=20
>  /*

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

