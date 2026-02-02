Return-Path: <linux-mips+bounces-13094-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBmXA0kwgWkMEwMAu9opvQ
	(envelope-from <linux-mips+bounces-13094-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 00:16:25 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 607A9D29EB
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 00:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC9A5300460A
	for <lists+linux-mips@lfdr.de>; Mon,  2 Feb 2026 23:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 556C738BF71;
	Mon,  2 Feb 2026 23:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X2XqYk+U"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02447389E09;
	Mon,  2 Feb 2026 23:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770073654; cv=none; b=m4ffD8qQ7yAIsTUvVDBR+5SVNHL14vhquiCC7DfAWlxDuCR7QisZVX0BiMWqZRiQ0gdGyMgGK2Tv8pbWiPXaeYDhvejzIv1yZPfXvNhaVRO0SYqJqV1jlx3ZDTXJoTxnGveKSPpYVNTkX9gAt2YDlOSx490t7AnCydRJWGL3NIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770073654; c=relaxed/simple;
	bh=1IUHMVSty+s0+RWRI820k88LE05ne3kBIcZvwwVNqLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jj77fhb9mL+oyTLpjD6op0++2tA/wfrfo0l0kUgc+MN1zZlLQIG4hTjEiSrQiA4NCyIScoKhVJzX64LN1wtb4FUWztdUXICfmu/C5cn+ZXkEQKHiWJZhnn79Zu2oI1Nl1ssgPqpmkyNMxkcaGUoCPvkEUxFhTAvmJ3VDcFNuuqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X2XqYk+U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479ACC116C6;
	Mon,  2 Feb 2026 23:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770073653;
	bh=1IUHMVSty+s0+RWRI820k88LE05ne3kBIcZvwwVNqLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X2XqYk+UvUQTANyJHngD9lE7mpiaSunu6OGkdZNlFmuDuxWAz+gRDuON1JAtRjKTe
	 vHL9tdEI4zzzCpAsI0xV/7p16nhBsEo5KAIn2Wg1jPEx72n3i5WJtET2JmnxH0sZkj
	 To5Cc9AyvFvNxkcPGj4Z7yhm87ODHCyh5mC2tM9AFC3I4gBo3a5DluYLX69w1ISWtw
	 9jSpj6lnrDgmvHz+gdnT8lHw85pUHQYpLDZcs1PiMlCwAwBv0AUWMo5xdBxpNdCBjt
	 9Sh9uaTbTBgsOso8MLqRRSnOdd6y7A4kVcCgN8DFdp2Wb6KvAzRY2suwc/PVXlarsJ
	 MNbdINN0pOY6w==
Date: Mon, 2 Feb 2026 16:07:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Yao Zi <me@ziyao.cc>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: tools: relocs: Ship a definition of R_MIPS_PC32
Message-ID: <20260202230729.GA2319189@ax162>
References: <20260202041610.61389-1-me@ziyao.cc>
 <99c54e93-fb8c-4bdb-ad40-a3161a42bb8b@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99c54e93-fb8c-4bdb-ad40-a3161a42bb8b@app.fastmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.84 / 15.00];
	URIBL_BLACK(7.50)[ziyao.cc:email];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13094-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	NEURAL_SPAM(0.00)[0.762];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sourceware.org:url,ziyao.cc:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 607A9D29EB
X-Rspamd-Action: add header
X-Spam: Yes

On Mon, Feb 02, 2026 at 10:17:53AM +0100, Ard Biesheuvel wrote:
> 
> On Mon, 2 Feb 2026, at 05:16, Yao Zi wrote:
> > R_MIPS_PC32 is a GNU extension, its definition is available in glibc
> > only since 2.39 (released in 2024), and not available in musl libc yet.
> > Provide our own definition for R_MIPS_PC32 and use it if necessary to
> > fix relocs tool building on musl and older glibc systems.
> >
> > Fixes: ff79d31eb536 ("mips: Add support for PC32 relocations in vmlinux")
> > Signed-off-by: Yao Zi <me@ziyao.cc>
> 
> Thanks for fixing this.
> 
> It does imply that the subsequent kallsyms patch will result in 32-bit MIPS no longer being buildable with older toolchains if CONFIG_RELOCATABLE=y.

Doing a little research, it seems like R_MIPS_PC32 has been recognized
by the toolchains for a long time, as I found these commits in binutils:

  https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=092dcd755dcdcf664b25a7011fd15957f124c29f
  https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=b47468a6dbd1b54c44c2edc0f7db64a073d894ea

It seems like this relocation was not documented in glibc until
recently, along with many other relocation types:

  https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=a6e8ceb3bb532236e1eecd0bb0ee8e4b7fd5ff7c

I interpret that to mean that the kallsyms patch should work fine since
the toolchain can handle these relocations? It is just building the
relocs tool against an older glibc or musl that does not have the
R_MIPS_PC32 definition that is broken? Or am I misunderstanding
something?

If we get an obvious build breakage report down the road, we can always
add another forward fix or back out of the changes altogether.

> Not sure if that is an issue, but it needs calling out. Nathan, any thoughts?
> 
> > ---
> >  arch/mips/boot/tools/relocs.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/mips/boot/tools/relocs.h b/arch/mips/boot/tools/relocs.h
> > index 607ff0103064..942981d9ce73 100644
> > --- a/arch/mips/boot/tools/relocs.h
> > +++ b/arch/mips/boot/tools/relocs.h
> > @@ -29,6 +29,13 @@ void die(char *fmt, ...);
> >  #define R_MIPS_PC26_S2		61
> >  #endif
> > 
> > +/*
> > + * GNU extension that available in glibc only since 2023, not 
> > available on musl.
> > + */
> > +#ifndef R_MIPS_PC32
> > +#define R_MIPS_PC32		248
> > +#endif
> > +
> >  #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
> > 
> >  enum symtype {
> > -- 
> > 2.52.0

