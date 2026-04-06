Return-Path: <linux-mips+bounces-14074-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uF1pCJSo02k4kAcAu9opvQ
	(envelope-from <linux-mips+bounces-14074-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 14:35:32 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C04873A3511
	for <lists+linux-mips@lfdr.de>; Mon, 06 Apr 2026 14:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A4F633009087
	for <lists+linux-mips@lfdr.de>; Mon,  6 Apr 2026 12:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7155A33CEA7;
	Mon,  6 Apr 2026 12:35:10 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02080334C1C;
	Mon,  6 Apr 2026 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775478910; cv=none; b=JuVqEzsCpSN/pRBo/Dk8MufQV6aZy+/dtxzs/sJvHJe/5wC+M+NksRWlLrCDjHFI0LL6Uv68Pjb1eUo8Y8yK8IYy0+9DXNX5eLjFFgdQym19CHbGS9UxljT1uSpsgKo2obHSxONDBXGyxcBV0yygeVAaFgpWq3HNdgKIQZxgznU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775478910; c=relaxed/simple;
	bh=Sv35e/4aVpkN9NRvLBMAG0bfQeJoGoPQLZSh2oao9yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRfQSVR1JrsxciC6DknJ0QdumCMelqB8Nf4IHKwtzVjeazypcY4g+UpekLLcfrsq97btKLBQoDJnJY3YxnfN6p8bDNSuETQ8Z22pC0I0qQw0XTHddAr4O1zs/ElDpjHJHdDFeVI45wBt3nEYa6Sbp4lQ1GYuRM/4/GOcL58y+Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1w9jAQ-00040v-00; Mon, 06 Apr 2026 14:34:58 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E5D2DC0E09; Mon,  6 Apr 2026 14:33:40 +0200 (CEST)
Date: Mon, 6 Apr 2026 14:33:40 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: kernel: Remove $0 clobber from `mult_sh_align_mod'
Message-ID: <adOoJAYbhEvCNtfC@alpha.franken.de>
References: <alpine.DEB.2.21.2603281409240.60268@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2603281409240.60268@angie.orcam.me.uk>
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_HAS_CURRENCY(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-14074-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[franken.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tsbogend@alpha.franken.de,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.536];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,orcam.me.uk:email,alpha.franken.de:mid]
X-Rspamd-Queue-Id: C04873A3511
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 02:29:10PM +0000, Maciej W. Rozycki wrote:
> Remove rubbish $0 clobber added to inline asm within `mult_sh_align_mod' 
> with the removal of support for GCC versions below 3.4 made with commit 
> 57810ecb581a ("MIPS: Remove GCC_IMM_ASM & GCC_REG_ACCUM macros").  
> 
> Previously a macro was used that, depending on GCC version, expanded to 
> either `accum' or $0.  Since the latter choice was only a placeholder to 
> keep the syntax consistent and the register referred is hardwired, there 
> is no point in having it here as it has no effect on code generation.  
> 
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> ---
>  arch/mips/kernel/r4k-bugs64.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> linux-mips-cpu-bugs64-gcc-reg-accum-zero.diff
> Index: linux-macro/arch/mips/kernel/r4k-bugs64.c
> ===================================================================
> --- linux-macro.orig/arch/mips/kernel/r4k-bugs64.c
> +++ linux-macro/arch/mips/kernel/r4k-bugs64.c
> @@ -91,7 +91,7 @@ void mult_sh_align_mod(long *v1, long *v
>  		".set	pop"
>  		: "=&r" (lv1), "=r" (lw)
>  		: "r" (m1), "r" (m2), "r" (s), "I" (0)
> -		: "hi", "lo", "$0");
> +		: "hi", "lo");
>  	/* We have to use single integers for m1 and m2 and a double
>  	 * one for p to be sure the mulsidi3 gcc's RTL multiplication
>  	 * instruction has the workaround applied.  Older versions of

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

