Return-Path: <linux-mips+bounces-13118-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFqTCo1WhGlb2gMAu9opvQ
	(envelope-from <linux-mips+bounces-13118-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 05 Feb 2026 09:36:29 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E371EFF53
	for <lists+linux-mips@lfdr.de>; Thu, 05 Feb 2026 09:36:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB1F230125CE
	for <lists+linux-mips@lfdr.de>; Thu,  5 Feb 2026 08:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF0C361DA1;
	Thu,  5 Feb 2026 08:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="ZVxab4G6"
X-Original-To: linux-mips@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD6526E719;
	Thu,  5 Feb 2026 08:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770280011; cv=pass; b=KlsQtVZlpVuaT3DOTdmfhGzLzD6bcR2o0EXjf6eqbghV12KiTVLhVoj6BoEarD6/PFnWXnkmeVGpPHJgPUqDwVtsOy+IDELcVAZj1nw5ozNDRuSv4WhI59TKvh0JNaGeWW10quBYuuU4WiK4G4cvR3kTho0eMm4Yhb37b6COCg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770280011; c=relaxed/simple;
	bh=qSyZQPi2CONXvvLOez/qZ2+J6z5FTcGGYiYR7+myPeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4XnH+8hKDJWA4jAhpuTTDArHlPd2N4zLVO/kziwtgpJrA1piKnULEAk35wiaFmG/T11On5wkpzP0VOHWLI7jXoZYErOANwqjWaqBzieK7vbihoI+Al8HdBMZ/bbpI0h1GUH50d/cjh8wGaKekjdkS0IqzsMY4f7r8dXTLO/oCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=ZVxab4G6; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
ARC-Seal: i=1; a=rsa-sha256; t=1770280004; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ti/qzRcda+/EKU6+EHKk4sMIWoTUFwWrOmpgkEnJpLfcvaGpfF5OVRt5d812fz32OM5+eNVVtPqgjAke8+9lFU+eWvg6pbJMTslI6iesKJMAabEl4whT+CPirNiWvWW8Lu9DevvqE8bAn8SucAsypOVNtzwrKdjNeZI8Lkwlt/M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770280004; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bhSy2ZJki3If9IpV5EkchllSIrZ7ZWN2XwC1w7q4228=; 
	b=DQRf94VL3loVSahNAbSrCY0dkP55n2pJSFJlspcBwDdLTR/BtvjmX0rEahYZbjHEnR2y4hxjca2GL8uDV4tXg8bLct3CthzlE6Njfp+LUMfe0gesK528PiVCPqmnPMPVMUQiIbhbaVn+rzs8HLnN2HR9jMRBWB34Y+oVG3VT56w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770280004;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=bhSy2ZJki3If9IpV5EkchllSIrZ7ZWN2XwC1w7q4228=;
	b=ZVxab4G6D715zyaMu/R492d0GWFLJN080gPyBUNo3epU2kdF1q8GCV7H0Hwbyser
	+TlPGRVFcpuseYCC8OmLuysMOUdVzviI8MFOAOGa2z3QiVWP6Oz52XiDwCmOZDa5JJn
	ePSD/U5q4D83slDiBg+xsLSlSUjoMJ8lAzg6Oczk=
Received: by mx.zohomail.com with SMTPS id 1770280001733420.96336381486356;
	Thu, 5 Feb 2026 00:26:41 -0800 (PST)
Date: Thu, 5 Feb 2026 08:26:30 +0000
From: Yao Zi <me@ziyao.cc>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Nathan Chancellor <nathan@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: tools: relocs: Ship a definition of R_MIPS_PC32
Message-ID: <aYRUNhoJ9ygNLYwF@pie>
References: <20260202041610.61389-1-me@ziyao.cc>
 <99c54e93-fb8c-4bdb-ad40-a3161a42bb8b@app.fastmail.com>
 <20260202230729.GA2319189@ax162>
 <aYFx5L2xC_u9t0IN@pie>
 <alpine.DEB.2.21.2602050110020.17548@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2602050110020.17548@angie.orcam.me.uk>
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.84 / 15.00];
	URIBL_BLACK(7.50)[ziyao.cc:dkim];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13118-lists,linux-mips=lfdr.de];
	R_DKIM_ALLOW(0.00)[ziyao.cc:s=zmail];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,body];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ziyao.cc,quarantine];
	DKIM_TRACE(0.00)[ziyao.cc:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@ziyao.cc,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	NEURAL_SPAM(0.00)[0.982];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 7E371EFF53
X-Rspamd-Action: add header
X-Spam: Yes

On Thu, Feb 05, 2026 at 01:26:39AM +0000, Maciej W. Rozycki wrote:
> On Tue, 3 Feb 2026, Yao Zi wrote:
> 
> > > I interpret that to mean that the kallsyms patch should work fine since
> > > the toolchain can handle these relocations? It is just building the
> > > relocs tool against an older glibc or musl that does not have the
> > > R_MIPS_PC32 definition that is broken? Or am I misunderstanding
> > > something?
> > 
> > Yes, this patch is only meant to fix building of relocs tool. I don't
> > think there are problems about toolchain supporting since R_MIPS_PC32
> > has been in binutils for a long time, as Nathan found, since 2004. The
> 
>  Since Y2K to be exact:
> 
> commit bb2d6cd7b19cd82313963d2d878a94e6e85a38b6
> Author: Geoffrey Keating <geoffk@geoffk.org>
> Date:   Sat Mar 11 02:16:25 2000 +0000
> 
> [...]
>     In include/elf:
>     	* mips.h: Add R_MIPS_GNU_REL_HI16, R_MIPS_GNU_REL_LO16,
>      	R_MIPS_GNU_REL16_S2, R_MIPS_PC64 and R_MIPS_PC32 relocation
>      	numbers.
> 
> > situation is that it's likely to have a toolchain supporting
> > R_MIPS_PC32, while elf.h on the build machine doesn't have its
> > definition. And after ff79d31eb536 ("mips: Add support for PC32
> > relocations in vmlinux"), the relocs tool started to require a
> > definition of R_MIPS_PC32 to build.
> 
>  But where does ff79d31eb536 come from?  I can't see it on Linus's master 
> and you can't refer an SHA-1 ID from another repo in a 'Fixes:' tag AFAIK, 
> as it's going to change as a commit is merged.

This commit has been in kbuild/kbuild-next for some time[1], and has
broken linux-next MIPS builds on my machine.

> Also can't you get the fix folded into the offending commit since it
> hasn't been merged yet?

I'm not the author of ff79d31eb536 ("mips: Add support for PC32
relocations in vmlinux"), and though it hasn't reached Linus' master,
it has been merged into kbuild-next.

I'm fine with it if the maintainer considers it necessary to squash
them together.

>   Maciej

Thanks,
Yao Zi

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git/commit/?id=ff79d31eb536f6d87bcbc09287d54d5606bf6dbe

