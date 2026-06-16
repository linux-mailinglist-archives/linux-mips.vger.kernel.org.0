Return-Path: <linux-mips+bounces-15111-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VjZ9KptNMWpRgQUAu9opvQ
	(envelope-from <linux-mips+bounces-15111-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 15:20:27 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F5868FDB9
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 15:20:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YrAOnaBp;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15111-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15111-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4613F305FB2C
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 13:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DABDE315D21;
	Tue, 16 Jun 2026 13:19:49 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6FE286405;
	Tue, 16 Jun 2026 13:19:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615989; cv=none; b=SRG6fxdWJ+yUjUq0BtJHf5rHWWUayuxjWrC7enEElNYQ96ckHVkwUpNH63cYGBQHdb6nIdrBluOWuoADNw3oF5xx4QpFROSnm1eCu+mHy0foFU/AhlBH+1DFhRDE3ptvAQcEapl6tsHJDy3N9+8wsJEGssMzx5ATTulX4R79OP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615989; c=relaxed/simple;
	bh=7BHLCNepqc86m9p9uN+bQNkI4gdWOhDsVrKycNmA9QU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHy5PD5rUtRgPVLhrWW67sS2Rndqiib5/DoOoJ4ZuYdX9DWrJS3EUDpUA6RDQq6ZaYTOEk0QHc6myewN9Ds2xFHSvN7izsIhfEWuKo9nQHKstJkTQg1zpxJACqpr8lKoQYIEtNY/arp2WuffMe9d7qMnAfFDY41vCp0LtcVzlE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YrAOnaBp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6153A1F000E9;
	Tue, 16 Jun 2026 13:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781615988;
	bh=UMpsaENAnANEo2om+T4ZM6gO+4JEBCjIegzEiINmZ4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YrAOnaBpoR6jYRjXZTX7H39Gh/AawHXatxd4H8F3x/SULCMUpdYoA+3mg1MApkAEp
	 3eCVfRaDjy8iPAXdlHPYG/6TylYvKuw4BxXjG/c6GbcDELnvzpWDCXD8d2GJdHBVla
	 x3xYRN6wDXYotkoA5IEOolpzfw1s0Iwr52axO3iWqR6FPNo+WWNuUsCrkGMMDgL0BJ
	 srEGJ1EoJkhOD2q4ajoUuhE1d4QYXCYD+HGwj0L5p4t/jyZOSFI2RhnGnGzaVzzRRz
	 lUeuUsajp83OCBL6/yjzaWt3QQxg7bh+ym2LrVTvdDghVoU37WA91X7s71n9t6VGMZ
	 GZS+q/6Wavk7g==
Date: Tue, 16 Jun 2026 08:19:45 -0500
From: Rob Herring <robh@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	devicetree@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/3] of/fdt: fix misleading elfcorehdr reservation
 success message
Message-ID: <20260616131945.GA2236977-robh@kernel.org>
References: <20260614161503.2219681-1-ekffu200098@gmail.com>
 <20260614161503.2219681-2-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614161503.2219681-2-ekffu200098@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15111-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ekffu200098@gmail.com,m:saravanak@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:tsbogend@alpha.franken.de,m:devicetree@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 40F5868FDB9

On Mon, Jun 15, 2026 at 01:15:01AM +0900, Sang-Heon Jeon wrote:
> fdt_reserve_elfcorehdr() does not check the return value of
> memblock_reserve(), so a success message is falsely printed when the
> reservation fails.
> 
> Check the return value and warn on failure instead.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
>  drivers/of/fdt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 26f66046cc32..d985c07d7c5c 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -479,7 +479,10 @@ static void __init fdt_reserve_elfcorehdr(void)
>  		return;
>  	}
>  
> -	memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
> +	if (memblock_reserve(elfcorehdr_addr, elfcorehdr_size)) {
> +		pr_warn("Failed to reserve memory for elfcorehdr\n");

I would think memblock_reserve() should always succeed and if not it 
should print a message rather than having every caller print a message.

Rob

