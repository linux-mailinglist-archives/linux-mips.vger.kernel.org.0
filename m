Return-Path: <linux-mips+bounces-13097-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKV6JlR0gWnPGQMAu9opvQ
	(envelope-from <linux-mips+bounces-13097-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 05:06:44 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA43D44B3
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 05:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D35D0300CE7F
	for <lists+linux-mips@lfdr.de>; Tue,  3 Feb 2026 03:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EDAE2F1FEA;
	Tue,  3 Feb 2026 03:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="GPgyDlTi"
X-Original-To: linux-mips@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC0B7260F;
	Tue,  3 Feb 2026 03:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770091006; cv=pass; b=eUWIsuhhvYhXWNmbPytCkGHzFYVIsGpylGNwgvUZxbb1f4dERQW8/keKZc8t7vo9q4YgQ5iUUCFRsZtMS4l0pAEZR+OwO5jUlh3HQ6aVvILEcwn0H10Rdzf0L0D/65wwmGfrHGxizwa/awznUhcik3xX8AJ5bWnI0yQUghkmYXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770091006; c=relaxed/simple;
	bh=Y1CR0uF+AxH9J5bPxKnMX+OpbHa8TXc5PzabWf14SrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOmJ5pWVncI45ua1kSW+d1Smr/oIvyNrfqGOlDV6xShhezs3MIeXhMLICTV/TzX0M0Tsmbi9iC2EOE3ezcUkeGGHsC65Q1Tr/wOBy2aopJ7rOEbegfRIHhIH6FFiWxeEypnIyG2sAAymjGndZpsvCM+b0aeBsgZUziIXxeUuIsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=GPgyDlTi; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
ARC-Seal: i=1; a=rsa-sha256; t=1770090996; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YU0ltI3NIVVgn/95tSOi3mxfmwllKc0xccXb9lpp5yLMNnYVb3OCW7xGUxOXWJfzqsCJ09khTKRQELWMyyCebVoC8KU7U2z5yWcZ5U9yA9REMofkjmTjyXiAtNXtUJcqvm8ZL2spvmO+OalPoSt6DWXx0tI/2eSW2SBqixWrZAo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770090996; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=V/7GtO73V9fEkwQX9fVGnsl56kwMBFaTeiHRr383sR8=; 
	b=Lp/zG7rujxMzpzuFMSg8H6JQKqERL6Ow6b5pMXmA8CXOHYXJJRGqajWkU8OtChDa958JGQ0uKfAxWyLKes+w63hN9xJQmCV6KBNTICxAg5t0EQW/WgQu26fN/UhRNfOUp8CLXjvemDgRgxNVo/nN2MP0mySJE0UXAUExdPtPEkQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770090996;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=V/7GtO73V9fEkwQX9fVGnsl56kwMBFaTeiHRr383sR8=;
	b=GPgyDlTiZiqd4cJmVMN3ahdm/Y7YuN1hpedmGrP8Z4nn6Vt2fFapRu4Dr5W4o6fI
	yOKpJ3BGV3buuQgpTjxBVxXsSLM/Wh9+RDHQ9Cq+BTYEuEdv4w3NWPvRx1K7xJO9P9J
	rBDho0CrY1ep5G4gKa0LSk29bjI1bUFsVqmvn9N0=
Received: by mx.zohomail.com with SMTPS id 1770090993834770.1273639904817;
	Mon, 2 Feb 2026 19:56:33 -0800 (PST)
Date: Tue, 3 Feb 2026 03:56:20 +0000
From: Yao Zi <me@ziyao.cc>
To: Nathan Chancellor <nathan@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: tools: relocs: Ship a definition of R_MIPS_PC32
Message-ID: <aYFx5L2xC_u9t0IN@pie>
References: <20260202041610.61389-1-me@ziyao.cc>
 <99c54e93-fb8c-4bdb-ad40-a3161a42bb8b@app.fastmail.com>
 <20260202230729.GA2319189@ax162>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202230729.GA2319189@ax162>
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.84 / 15.00];
	URIBL_BLACK(7.50)[ziyao.cc:email,ziyao.cc:dkim];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[ziyao.cc:s=zmail];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13097-lists,linux-mips=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ziyao.cc:+];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-mips];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@ziyao.cc,linux-mips@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[ziyao.cc,quarantine];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.806];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziyao.cc:email,ziyao.cc:dkim,sourceware.org:url]
X-Rspamd-Queue-Id: EFA43D44B3
X-Rspamd-Action: add header
X-Spam: Yes

On Mon, Feb 02, 2026 at 04:07:29PM -0700, Nathan Chancellor wrote:
> On Mon, Feb 02, 2026 at 10:17:53AM +0100, Ard Biesheuvel wrote:
> > 
> > On Mon, 2 Feb 2026, at 05:16, Yao Zi wrote:
> > > R_MIPS_PC32 is a GNU extension, its definition is available in glibc
> > > only since 2.39 (released in 2024), and not available in musl libc yet.
> > > Provide our own definition for R_MIPS_PC32 and use it if necessary to
> > > fix relocs tool building on musl and older glibc systems.
> > >
> > > Fixes: ff79d31eb536 ("mips: Add support for PC32 relocations in vmlinux")
> > > Signed-off-by: Yao Zi <me@ziyao.cc>
> > 
> > Thanks for fixing this.
> > 
> > It does imply that the subsequent kallsyms patch will result in 32-bit MIPS no longer being buildable with older toolchains if CONFIG_RELOCATABLE=y.
> 
> Doing a little research, it seems like R_MIPS_PC32 has been recognized
> by the toolchains for a long time, as I found these commits in binutils:
> 
>   https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=092dcd755dcdcf664b25a7011fd15957f124c29f
>   https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=b47468a6dbd1b54c44c2edc0f7db64a073d894ea
> 
> It seems like this relocation was not documented in glibc until
> recently, along with many other relocation types:
> 
>   https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=a6e8ceb3bb532236e1eecd0bb0ee8e4b7fd5ff7c
> 
> I interpret that to mean that the kallsyms patch should work fine since
> the toolchain can handle these relocations? It is just building the
> relocs tool against an older glibc or musl that does not have the
> R_MIPS_PC32 definition that is broken? Or am I misunderstanding
> something?

Yes, this patch is only meant to fix building of relocs tool. I don't
think there are problems about toolchain supporting since R_MIPS_PC32
has been in binutils for a long time, as Nathan found, since 2004. The
situation is that it's likely to have a toolchain supporting
R_MIPS_PC32, while elf.h on the build machine doesn't have its
definition. And after ff79d31eb536 ("mips: Add support for PC32
relocations in vmlinux"), the relocs tool started to require a
definition of R_MIPS_PC32 to build.

> If we get an obvious build breakage report down the road, we can always
> add another forward fix or back out of the changes altogether.
> 
> > Not sure if that is an issue, but it needs calling out. Nathan, any thoughts?
> > 

Best regards,
Yao Zi

> > > ---
> > >  arch/mips/boot/tools/relocs.h | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/arch/mips/boot/tools/relocs.h b/arch/mips/boot/tools/relocs.h
> > > index 607ff0103064..942981d9ce73 100644
> > > --- a/arch/mips/boot/tools/relocs.h
> > > +++ b/arch/mips/boot/tools/relocs.h
> > > @@ -29,6 +29,13 @@ void die(char *fmt, ...);
> > >  #define R_MIPS_PC26_S2		61
> > >  #endif
> > > 
> > > +/*
> > > + * GNU extension that available in glibc only since 2023, not 
> > > available on musl.
> > > + */
> > > +#ifndef R_MIPS_PC32
> > > +#define R_MIPS_PC32		248
> > > +#endif
> > > +
> > >  #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
> > > 
> > >  enum symtype {
> > > -- 
> > > 2.52.0

