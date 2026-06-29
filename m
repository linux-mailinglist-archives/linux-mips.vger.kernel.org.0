Return-Path: <linux-mips+bounces-15320-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9kzfAkKuQmqA/gkAu9opvQ
	(envelope-from <linux-mips+bounces-15320-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 19:41:22 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8F26DDD19
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 19:41:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15320-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15320-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63A1E30264F8
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 17:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413E73822AB;
	Mon, 29 Jun 2026 17:40:05 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCFFB3C76AF;
	Mon, 29 Jun 2026 17:40:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782754805; cv=none; b=UpXlwZjntp/rU0V06yJJSi0KLLrFH4K7mNf9t4ISC+fygrd50PZxhWgc5lwc4vZgSPe7hEiCjWFLY98YB89b011WteaetQp+KVxep/CDHLzRhtDYvBX0U+CjrZUULEPm6+qFlsQeOZn93f2zCr8D3gD5gbBoMelQ9vjpmty8VkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782754805; c=relaxed/simple;
	bh=5Xp6Gna+QerBHHtTloQenMnRCJCRT4SCo+ZoZI5cseY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQhbOYUIbHDFfKSsopZWEsBzcGIJ1HYi2QAyi3pMtUiTrBqwQGAtH9dA1alSAIbzY1i/ugF9MiacOUF/CtyV6UkKJbqP6Be9UFDOAmQea1smPngRTM3mIj0RI4xUefv3ObiqGyjvYYISMXCwt+bO8l73FdsBZpYheLGb44WavoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1weFd2-0005iT-00; Mon, 29 Jun 2026 19:18:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 16F44C012A; Mon, 29 Jun 2026 19:12:39 +0200 (CEST)
Date: Mon, 29 Jun 2026 19:12:39 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Bastian Blank <waldi@debian.org>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mips: Add build salt to the vDSO
Message-ID: <akKnh5c2IIJRAg23@alpha.franken.de>
References: <ajQY5adFB_yOfIl5@steamhammer.waldi.eu.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajQY5adFB_yOfIl5@steamhammer.waldi.eu.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-15320-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FORGED_RECIPIENTS(0.00)[m:waldi@debian.org,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,alpha.franken.de:mid,alpha.franken.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8C8F26DDD19

On Thu, Jun 18, 2026 at 06:12:21PM +0200, Bastian Blank wrote:
> The vDSO needs to have a unique build id in a similar manner
> to the kernel and modules. Use the build salt macro.
> 
> Signed-off-by: Bastian Blank <waldi@debian.org>
> ---
> I was not able to properly test this change, due to unavailable
> toolchain.
> 
>  arch/mips/vdso/elf.S | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/mips/vdso/elf.S b/arch/mips/vdso/elf.S
> index a25cb147f1ca..821fcffe7655 100644
> --- a/arch/mips/vdso/elf.S
> +++ b/arch/mips/vdso/elf.S
> @@ -8,6 +8,7 @@
>  
>  #include <asm/isa-rev.h>
>  
> +#include <linux/build-salt.h>
>  #include <linux/elfnote.h>
>  #include <linux/version.h>
>  
> @@ -15,6 +16,8 @@ ELFNOTE_START(Linux, 0, "a")
>  	.long LINUX_VERSION_CODE
>  ELFNOTE_END
>  
> +BUILD_SALT
> +
>  /*
>   * The .MIPS.abiflags section must be defined with the FP ABI flags set
>   * to 'any' to be able to link with both old and new libraries.
> -- 
> 2.53.0

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

