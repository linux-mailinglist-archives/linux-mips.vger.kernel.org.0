Return-Path: <linux-mips+bounces-14735-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PI+MX1ZFGofMwcAu9opvQ
	(envelope-from <linux-mips+bounces-14735-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2026 16:15:25 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 414415CBA10
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2026 16:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1A773017390
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2026 14:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEB13B0AE9;
	Mon, 25 May 2026 14:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mK7Obk/P"
X-Original-To: linux-mips@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65E73AFCFC;
	Mon, 25 May 2026 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779718517; cv=none; b=aZ1dg7oYdCKgC6MyB/5WbwT+AF0yBQvDLJB+ucLjlVudMfa4mqteD5JyI6uyxH90U11wtsxtyP4gPS+Rp7Ib7xqivKOVm1EL2g9bY8FEVrlHnUkAcD8WmeXztu+6XTdm37PmvQlCvISKNXK5DKUrgLVkk3X99G7sPXtgwlfPA4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779718517; c=relaxed/simple;
	bh=99tuhLidBJxj8UVgzrNRyvDw9SEVpPbZIWJD+r8e6pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bd58szwo1loR5HzcReskvFSrgnSqkyIAnf5vHDfqStqnbJAgj1Oq0rR6eTymNFjq9LNM7zZo5g8enlV8qtQPfirNfP2TBtKehtckl5DlOJyttuJlKIpYkrfvHdloaSxSxMXE5faSOm8iRsd0XT6qAke/hm3Icv5NG7NAmkq74Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mK7Obk/P; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=USqwqBzB1RKOGEYVRxQsCb9ML77pZ7tmukQZc5v6ltY=; b=mK7Obk/PHZqrPItCYCIyS7MI9U
	57ZMc/P0QO/ZndvTyLQZxzu4szeUXvs6vx3gG4UxTbLeWSt9ChqotSO0o3ZlZMgPBlkepaO1AJstN
	fwifvedG7w+pm4CMEvY0gnN/3ZdYaan428Xl6MhVAoez94R58a94I6Qk5gcxgqOfCwYsw5Kq0o8S2
	IiKXvPct9g+XPPgyMlvcz2xSaZvmjoL1dkgWMz6sYHRu6EH5rExyDMsiiUQ7c/O0XhqCoWEIilkNr
	xxyeYRd3Of4AgcFmyNkpfUdJOGYYl+pFRrXUd7MS5XcALGGW8nMJs12KA5W8vWuitNMgKma7lPlR4
	tOf0UXuw==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRW5H-0000000HOcS-3dkF;
	Mon, 25 May 2026 14:15:12 +0000
Date: Mon, 25 May 2026 10:15:08 -0400
From: "Liam R. Howlett" <liam@infradead.org>
To: Yadan Fan <ydfan@suse.com>
Cc: tsbogend@alpha.franken.de, akpm@linux-foundation.org, rppt@kernel.org, 
	catalin.marinas@arm.com, jiaxun.yang@flygoat.com, paulburton@kernel.org, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: MIPS: mm: Fix out-of-bounds write in maar_res_walk()
Message-ID: <sa4yfm5wnkrzhyviympfo4oenfqytvu7lrtrcbzt3fb5x3jf6v@oolrew3tlyxg>
References: <d060de27-6fdb-452b-95f3-dbcc48db17ff@suse.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d060de27-6fdb-452b-95f3-dbcc48db17ff@suse.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14735-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[liam@infradead.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 414415CBA10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26/05/25 07:06PM, Yadan Fan wrote:
> maar_res_walk() uses wi->num_cfg as the index into the fixed-size
> wi->cfg array, but checks whether the array is full only after it has
> filled the selected entry. If walk_system_ram_range() reports more than
> 16 memory ranges, the overflow call writes one struct maar_config past
> the end of the array before WARN_ON() prevents num_cfg from advancing.
> 
> Move the full-array check before taking the array slot. Keep the
> existing behavior of warning and returning 0 when the scratch array has
> no room left.
> 
> Fixes: a5718fe8f70f ("MIPS: mm: Drop boot_mem_map")
> Signed-off-by: Yadan Fan <ydfan@suse.com>
> ---
>  arch/mips/mm/init.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
> index 55b25e85122a..0ba958b7ffa5 100644
> --- a/arch/mips/mm/init.c
> +++ b/arch/mips/mm/init.c
> @@ -272,9 +272,15 @@ static int maar_res_walk(unsigned long start_pfn, unsigned long nr_pages,
>  			 void *data)
>  {
>  	struct maar_walk_info *wi = data;
> -	struct maar_config *cfg = &wi->cfg[wi->num_cfg];
> +	struct maar_config *cfg;
>  	unsigned int maar_align;
>  
> +	/* Ensure we don't overflow the cfg array */
> +	if (WARN_ON(wi->num_cfg >= ARRAY_SIZE(wi->cfg)))
> +		return 0;

We should probably change this to WARN_ON_ONCE() if we're moving it?

> +
> +	cfg = &wi->cfg[wi->num_cfg];
> +
>  	/* MAAR registers hold physical addresses right shifted by 4 bits */
>  	maar_align = BIT(MIPS_MAAR_ADDR_SHIFT + 4);
>  
> @@ -283,9 +289,7 @@ static int maar_res_walk(unsigned long start_pfn, unsigned long nr_pages,
>  	cfg->upper = ALIGN_DOWN(PFN_PHYS(start_pfn + nr_pages), maar_align) - 1;
>  	cfg->attrs = MIPS_MAAR_S;
>  
> -	/* Ensure we don't overflow the cfg array */
> -	if (!WARN_ON(wi->num_cfg >= ARRAY_SIZE(wi->cfg)))
> -		wi->num_cfg++;
> +	wi->num_cfg++;

AFAICT, this is the only place num_cfg is incremented.  Since we are
trying to avoid overflow, I think the initial logic is flawed in that we
do trigger too late - we can write one beyond the array index max (to
the array size).

But what you have done changes the functionality in a subtle way - we
won't keep overwriting the last entry (as, I think was the initial
intent here?)

I don't think what you did is wrong, but I think this is changing the
intended functionality and you should say so in the commit log.  Right
now you are saying it doesn't change it, but I think it does - although
before we were overwriting beyond the array max so I doubt it makes a
difference and this is obviously better.

>  
>  	return 0;
>  }
> -- 
> 2.51.0

