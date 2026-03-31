Return-Path: <linux-mips+bounces-13994-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MmwJUMoy2nLEQYAu9opvQ
	(envelope-from <linux-mips+bounces-13994-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 03:49:55 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB57363251
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 03:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E74803010217
	for <lists+linux-mips@lfdr.de>; Tue, 31 Mar 2026 01:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37C3303C97;
	Tue, 31 Mar 2026 01:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZ4auciO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AA4184524;
	Tue, 31 Mar 2026 01:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774921787; cv=none; b=Yd7PNRG5UJoZpARkAPb3D5UZEYUGFzenzIyDOJrqq/TdIM/GMQMGHYaS9HQdpEUtM+EfpT67VhjcpgH/XGypQwGkbxWWiNB4ZdTKW0SWFTjmr38JxVfijjplz/q3aAlbPSLBznYG37TpPuxlR1PNEIw670oBmgxnAGg8YB+rjas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774921787; c=relaxed/simple;
	bh=PkI133hxpyomjeVUtgKx63fvmx/xJt8VuhQdt5D0O9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3gBwDtDL1ZaZcQpTMcFR6Mw/nA25PWE5D2g7T5r/+0dGCD2runNruUD7VzuvYqo6fIhyX7hpIdbOLVClid6cNJgPjRbtLr+MnVJwgs74XpcBOHHV7OojYd3fPrheXYepOvMzSA9yB8YznmUOaMDI+MUalcypacpyEeSqzV2Hk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZ4auciO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FDBAC4CEF7;
	Tue, 31 Mar 2026 01:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774921787;
	bh=PkI133hxpyomjeVUtgKx63fvmx/xJt8VuhQdt5D0O9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZ4auciONLLYUeuDYJ8guHi0sJS8PVtZSbPJDn2gEHs7UNsPoTBtUe35mF0p/QEvl
	 FHKJD2yQvght4sdFCez9oT3TBDjRaFLhkYOjo4MA/ELZIqdVKs5F/r76tSSMxHsZ/T
	 fmCSquPTGwT4IFJBSLpFa58YXFXCQkAv91hFuXE379vAOL6ZyWBFFlPwRqZ/Et9tbC
	 T7ejagBIuWYcEEciK/LYq7rgk2RRptj8Xj3l81kBqbJal7BeC+jKJ7L0S3xB4pn3GL
	 Vu1mzibtyE2oIW7KVHe4OHKUdu6HfOV1dI30i6siYwe7X6kDr8EFZUSCs9L5Kg6Z1S
	 4/e/wA0uFrrDA==
Date: Mon, 30 Mar 2026 18:48:37 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sohil Mehta <sohil.mehta@intel.com>, linux-crypto@vger.kernel.org,
	linux-mips@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: lib/crypto/mips/poly1305-core.S:95: Error: opcode not supported
 on this processor: mips64r6 (mips64r6) `lwl $8,0+3($5)'
Message-ID: <20260331014837.GC5190@sol>
References: <202603210105.sdD4rsTq-lkp@intel.com>
 <20260330203731.GG4303@sol>
 <alpine.DEB.2.21.2603310147220.60268@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2603310147220.60268@angie.orcam.me.uk>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUBJECT_HAS_CURRENCY(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-13994-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8DB57363251
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 31, 2026 at 02:01:44AM +0100, Maciej W. Rozycki wrote:
> On Mon, 30 Mar 2026, Eric Biggers wrote:
> 
> > > All errors (new ones prefixed by >>):
> > > 
> > >    lib/crypto/mips/poly1305-core.S: Assembler messages:
> > > >> lib/crypto/mips/poly1305-core.S:95: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $8,0+3($5)'
> > >    lib/crypto/mips/poly1305-core.S:96: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $9,4+3($5)'
> > >    lib/crypto/mips/poly1305-core.S:97: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $10,8+3($5)'
> > >    lib/crypto/mips/poly1305-core.S:98: Error: opcode not supported on this processor: mips64r6 (mips64r6) `lwl $11,12+3($5)'
> > 
> > This isn't new.  It was first reported in 2021:
> > https://lore.kernel.org/all/202108040636.P6t1LvPP-lkp@intel.com/
> > 
> > It's caused by:
> > 
> > CONFIG_64BIT=n causes the 32-bit Poly1305 assembly code to be generated.
> > That code checks the _MIPS_ARCH_MIPS32R6 macro.  But, the code is
> > actually built with -march=mips64r6, due to CONFIG_CPU_MIPS64_R6=y.
> > Thus _MIPS_ARCH_MIPS32R6 is not defined; _MIPS_ARCH_MIPS64R6 is defined
> > instead.  So the wrong code gets built.
> > 
> > Maybe someone from linux-mips@vger.kernel.org can confirm whether
> > CONFIG_64BIT=n && CONFIG_CPU_MIPS64_R6=y actually makes sense?
> 
>  Absolutely, you can build a 32-bit kernel for and run on 64-bit hardware 
> and we have supported it since forever across all the MIPS architecture 
> revisions.
> 
>  You probably want to check for CONFIG_CPU_MIPSR6 instead (and similarly 
> for CONFIG_CPU_MIPSR2, etc.).

Okay, but does it make sense to use -march=mips64r6 in that case,
instead of -march=mips32r6?  I guess you get something that uses the
32-bit ABI but is free to use 64-bit instructions?  It looks like
poly1305-mips.pl doesn't really support that combination: it just has
32-bit ABI + 32-bit instructions, and 64-bit ABI + 64-bit instructions.

Maybe it would be easiest to always compile poly1305-mips.pl with the
corresponding mips32 flag when CONFIG_64BIT is unset?  Note: since
poly1305-mips.pl was taken from an external source
(https://github.com/dot-asm/cryptogams/blob/master/mips/poly1305-mips.pl),
modifying the build system to pass the appropriate flag might be
preferable to extensive local patching of that file.

- Eric

