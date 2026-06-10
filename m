Return-Path: <linux-mips+bounces-15021-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8fcrMmAWKWpAQQMAu9opvQ
	(envelope-from <linux-mips+bounces-15021-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 09:46:40 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2467E666BF7
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 09:46:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=beeRaj4J;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=eqkyOY9b;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15021-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15021-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linutronix.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BEDB302296E
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2026 07:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E153939C8;
	Wed, 10 Jun 2026 07:45:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95D4392822;
	Wed, 10 Jun 2026 07:45:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077513; cv=none; b=ZEzQ6tqpu9hBlGeO9P/8WBmyC5AdQX+2k56TJlaOJCPkrdRw8f690BoKOVvpR+Q4Q81+pe4cxzUSSyunfBT+hqH+W3f/s9GwXv4W6Bu0fIBsCW184bNBWhRYprvT5p/P3AQyeAwoAuJhkKkcmqs3+nFu+FgUypQu6cYdnX5L3Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077513; c=relaxed/simple;
	bh=mrT72NpDyJ+EcW/kQxk9KXKE9VDzc9jsDSfXj0RwJnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dtQWFuBXCYPoOKHjxoG7TCJ6OBcre/yVbaQ1wFqqWidXmGSx2TC+ZuhHrKHNrbF1guoc7kodEUEzHyJnzz3Hk7Bcx2y64SQze7196OSn0Q7my3q3L8FBBpGmkpV2oiFbnjaXrEwak48zWUimmjFxkeMXyF+bpNJ1wo2W0aBpPNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=beeRaj4J; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eqkyOY9b; arc=none smtp.client-ip=193.142.43.55
Date: Wed, 10 Jun 2026 09:45:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781077508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s1QHTAcGCZjoHAFnkUpH3vBVhfa+4JWG9ulZflyy3Bg=;
	b=beeRaj4JB8POwuj28/8Rkq4pz+drf2oMpCKURsbTFhDnibcy5w6F4Ga8o34WZa2kYn5W1p
	qx0t+0AwSgZnkU22XcGXh6dgWrBce+iqPVC98lpbnjtIAeQVK2+3ZdeaL8SSmiiMoiD56o
	Xc0yblqFQOEyVKLeRtS1oeLHth8rbw7csvUk1+oCwBdc+LJ5DmcGRQv1I+ARInQwFCbmpw
	1/1eEiN3zif3VGhcSbR5jJsIt7z8dvaeHooCla5+xfc6Nz3JoMtsVv4L50V2G8Q9MdikY6
	H7XGJ4DIIo2GFaKD9HsFm/P/IBFBzwEhz6z/A1HooVNJwTYfzDoY8FHYJVDkgQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781077508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s1QHTAcGCZjoHAFnkUpH3vBVhfa+4JWG9ulZflyy3Bg=;
	b=eqkyOY9biUNqNaJq8Xtppac2kfagVVNEz4/L5KA1SYRKasmi062UPa5ce03aLadbwW6u14
	X4SgEXgptDSEV7Ag==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Subject: Re: [PATCH] MIPS: VDSO: Avoid including .got in dynamic segment
Message-ID: <20260610093311-dcb6efd5-6921-48a6-a97a-8739fe7d3417@linutronix.de>
References: <20260609-mips-vdso-fix-section-layout-v1-1-0e80ffadf7c7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260609-mips-vdso-fix-section-layout-v1-1-0e80ffadf7c7@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15021-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:tglx@kernel.org,m:tsbogend@alpha.franken.de,m:morbo@google.com,m:justinstitt@google.com,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,m:nick.desaulniers+lkml@gmail.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,alpha.franken.de,google.com,vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-mips,lkml];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2467E666BF7

On Tue, Jun 09, 2026 at 06:31:21PM -0700, Nathan Chancellor wrote:
> After commit 2db1ec80dfd5 ("MIPS: VDSO: Fold MIPS_DISABLE_VDSO into
> MIPS_GENERIC_GETTIMEOFDAY"), building ARCH=mips allnoconfig with LLVM=1
> shows some warnings from llvm-readelf while checking the VDSO for
> dynamic relocations:
> 
>   llvm-readelf: warning: 'arch/mips/vdso/vdso.so.dbg.raw': invalid PT_DYNAMIC size (0xa4)
>   llvm-readelf: warning: 'arch/mips/vdso/vdso.so.dbg.raw': PT_DYNAMIC dynamic table is invalid: SHT_DYNAMIC will be used
> 
> The blamed commit alters the link order of objects into vdso.so.raw,
> placing vgettimeofday.o after sigreturn.o. This ultimately results in
> the .text section shrinking slightly in size, which in turn changes the
> offset of the .dynamic section.
> 
>   -  [ 9] .text             PROGBITS        000002f0 0002f0 000930 00  AX  0   0 16
>   -  [10] .dynamic          DYNAMIC         00000c20 000c20 000090 08   A  5   0  4
>   +  [ 9] .text             PROGBITS        000002f0 0002f0 000924 00  AX  0   0 16
>   +  [10] .dynamic          DYNAMIC         00000c14 000c14 000090 08   A  5   0  4
> 
> Changing the offset of the .dynamic section causes the dynamic segment
> size to grow by the same amount, which triggers a warning in
> llvm-readelf because PT_DYNAMIC's p_filesz (0xa4) is no longer a
> multiple of its sh_entsize (8):
> 
>   -  DYNAMIC        0x000c20 0x00000c20 0x00000c20 0x00098 0x00098 R   0x10
>   +  DYNAMIC        0x000c14 0x00000c14 0x00000c14 0x000a4 0x000a4 R   0x10
> 
> The size of the dynamic segment was already incorrect before the blamed
> comment, as it should be 0x90 like the .dynamic section above (18
> entries at 8 bytes per entry); it just so happens that 0x98 % 8 is 0,
> whereas 0xa4 % 8 is 4, so there was no warning.
> 
> Looking at the section to segment mapping of the dynamic segment reveals
> that it includes the .got section, as it is implicitly placed after
> .dynamic by ld.lld's orphan section heuristics and inherits its segments
> from the linker script.
> 
>   [ 9] .text             PROGBITS        000002f0 0002f0 000924 00  AX  0   0 16
>   [10] .dynamic          DYNAMIC         00000c14 000c14 000090 08   A  5   0  4
>   [11] .got              PROGBITS        00000cb0 000cb0 000008 00 WAp  0   0 16
> 
>   Section to Segment mapping:
>    Segment Sections...
>     00     .mips_abiflags
>     01     .reginfo
>     02     .mips_abiflags .reginfo .hash .dynsym .dynstr .gnu.version .gnu.version_d .note .text .dynamic .got
>     03     .dynamic .got
>     04     .note
> 
> Explicitly describe the .got section in the MIPS VDSO linker script
> after .rodata, which switches back to the default text segment,
> resulting in a dynamic segment that is the exact size of the .dynamic
> section as expected with no other layout changes.
> 
>   -  DYNAMIC        0x000c14 0x00000c14 0x00000c14 0x000a4 0x000a4 R   0x10
>   +  DYNAMIC        0x000c14 0x00000c14 0x00000c14 0x00090 0x00090 R   0x4
> 
>   -   03     .dynamic .got
>   +   03     .dynamic
> 
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2166
> Fixes: 2db1ec80dfd5 ("MIPS: VDSO: Fold MIPS_DISABLE_VDSO into MIPS_GENERIC_GETTIMEOFDAY")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

> ---
> The fixes tag feels a little strong since it seems like it has just been
> luck up until this point that there has been no warning but I decided to
> be conservative and include it regardless. Feel free to remove it if you
> see fit.

I have seen this issue independently from the commit blamed above.
It occurs at least on commit 2b7a25df823d ("Merge tag 'mm-nonmm-stable-2026-02-18-19-56'
of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm").
If you want I can investigate more, but the Fixes above works for me, too.

> I think this should go via timers/vdso with the blamed commit. I plan to
> send a follow up series for 7.3 to add '--orphan-handling' to the MIPS
> VDSO to avoid issues like this in the future but that can go via the
> MIPS tree, as it is not really a fix and I will need to properly test
> it.
> ---
>  arch/mips/vdso/vdso.lds.S | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
> index 05badf3ae0ff..278ab6444e98 100644
> --- a/arch/mips/vdso/vdso.lds.S
> +++ b/arch/mips/vdso/vdso.lds.S
> @@ -56,6 +56,7 @@ SECTIONS
>  	.dynamic	: { *(.dynamic) }		:text :dynamic
>  
>  	.rodata		: { *(.rodata*) }		:text
> +	.got		: { *(.got) }
>  
>  	_end = .;
>  	PROVIDE(end = .);
> 
> ---
> base-commit: 13f6218e6fe79dc64aed76d738b765b45f62492b
> change-id: 20260608-mips-vdso-fix-section-layout-262bc18d0c29
> 
> Best regards,
> --  
> Cheers,
> Nathan
> 

