Return-Path: <linux-mips+bounces-13927-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNWiI7/ZwmllmgQAu9opvQ
	(envelope-from <linux-mips+bounces-13927-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 19:36:47 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9167B31AF5B
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 19:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B8B23015172
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2383A2566;
	Tue, 24 Mar 2026 18:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="ROAR34qq"
X-Original-To: linux-mips@vger.kernel.org
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DE03502B8;
	Tue, 24 Mar 2026 18:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774377400; cv=none; b=OTtULeil9IspmJ8+Za1S6TgYjDju88XLPCxpBB6VpI6G777C30FxMrBgowZHEN5NPUqGuOjVCIEqV65H1uXTaSLcCgK3wLapL4GI86xVWmA/nCq2wNQu8NEynCoqi2QSvBeM1ATvt/+FhfQ2/GmVN426ZCBqU1KU65ibjao84Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774377400; c=relaxed/simple;
	bh=CR5/H6jk/spqZtGbl3vbbrLXD63pd8iURB3okeroTcY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TGST2GRVCyCuUT6OeCmbcsVmHH/9/E8099P22QPIhmHYmZh/U3M3rKhfuN0kFDBm+fMYHZjNHetV4hi/oWYaV67a9FXIhneNoJq8O31G1pFNzgqpC+vyLwTPBzoXaxnVsZTt2fbiJjNDANwu2GQyqPefcwyO11QmNBPr6xArBWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=ROAR34qq; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=TMacGYMUcDU/ZfxMzZ5qB4lAQfMCgWI9xYNANb/3NJE=; t=1774377398;
	x=1774982198; b=ROAR34qq8LtotAQ+z4eU9DUiOLRXMu1qt6BEJUtvAGwBMkEua9GWWTE8Nq5o1
	DQDO8gj44BlzhvHxqcy4Fe9Qd7jEPAM+JDU70D9BbWuGLXDbviVa8lb3VBc2aG8Hu4Jd7ZS85o1RL
	3vfS+JSQbjGL3IHDDFj0aSeoBe/qBt/lroiAaKfTUeug6ULI9EX3O146goonePpahvPga5SASG6kY
	eF3cOFQvyHiND9/QgwhG/QOJzIYDiRFC539PiJWx/m7F65i2JlBQAlBXLn6kfyEDffe8rvX2AL78p
	MiO0St9DBDptfiY+hHmBZdImb1jjrOvCQbqPST5EUo6SCXrjHw==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1w56c9-00000000BcZ-2HRb; Tue, 24 Mar 2026 19:36:29 +0100
Received: from p5dc55f29.dip0.t-ipconnect.de ([93.197.95.41] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1w56c9-00000001y8z-0w0E; Tue, 24 Mar 2026 19:36:29 +0100
Message-ID: <de9bf8fef8e311f37335507f0e715d113cd91bc5.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 05/10] am68k/PCI: Remove unnecessary second application
 of align
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Guenter
 Roeck <linux@roeck-us.net>, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, 	linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, Russell King	 <linux@armlinux.org.uk>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,  Helge Deller	 <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Thomas Gleixner	 <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,  Dave
 Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Chris Zankel <chris@zankel.net>,  Max Filippov <jcmvbkbc@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Yoshinori Sato	
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, LKML	
 <linux-kernel@vger.kernel.org>
Date: Tue, 24 Mar 2026 19:36:27 +0100
In-Reply-To: <1c08efcd-25e8-6436-52ab-ac3d50dcf58f@linux.intel.com>
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>
	  <20260324165633.4583-6-ilpo.jarvinen@linux.intel.com>
	 <5de97ed9556bfcc3b1f26bd71e09fa4016ae3ff8.camel@physik.fu-berlin.de>
	 <1c08efcd-25e8-6436-52ab-ac3d50dcf58f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fu-berlin.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[fu-berlin.de:s=fub01];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,roeck-us.net,lists.infradead.org,lists.linux-m68k.org,lists.ozlabs.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,HansenPartnership.com,gmx.de,ellerman.id.au,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,zankel.net,gmail.com,linux.ibm.com,users.sourceforge.jp,libc.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13927-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fu-berlin.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[glaubitz@physik.fu-berlin.de,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[physik.fu-berlin.de:mid,fu-berlin.de:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 9167B31AF5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 2026-03-24 at 19:55 +0200, Ilpo J=C3=A4rvinen wrote:
> On Tue, 24 Mar 2026, John Paul Adrian Glaubitz wrote:
>=20
> > Hi Ilpo,
> >=20
> > On Tue, 2026-03-24 at 18:56 +0200, Ilpo J=C3=A4rvinen wrote:
> > > Aligning res->start by align inside pcibios_align_resource() is
> > > unnecessary because caller of pcibios_align_resource() is
> > > __find_resource_space() that aligns res->start with align before
> > > calling pcibios_align_resource().
> > >=20
> > > Aligning by align in case of IORESOURCE_IO && start & 0x300 cannot ev=
er
> > > result in changing start either because 0x300 bits would have not
> > > survived the earlier alignment if align was large enough to have an
> > > impact.
> > >=20
> > > Thus, remove the duplicated aligning from pcibios_align_resource().
> > >=20
> > > Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > > ---
> > >  arch/m68k/kernel/pcibios.c | 2 --
> > >  1 file changed, 2 deletions(-)
> > >=20
> > > diff --git a/arch/m68k/kernel/pcibios.c b/arch/m68k/kernel/pcibios.c
> > > index 1415f6e4e5ce..7e286ee1976b 100644
> > > --- a/arch/m68k/kernel/pcibios.c
> > > +++ b/arch/m68k/kernel/pcibios.c
> > > @@ -36,8 +36,6 @@ resource_size_t pcibios_align_resource(void *data, =
const struct resource *res,
> > >  	if ((res->flags & IORESOURCE_IO) && (start & 0x300))
> > >  		start =3D (start + 0x3ff) & ~0x3ff;
> > > =20
> > > -	start =3D (start + align - 1) & ~(align - 1);
> > > -
> > >  	return start;
> > >  }
> > >=20
> >=20
> > Sorry if it's a stupid question, but what does "am68k" in the subject r=
efer to?
>=20
> The extra "a" is a typo. I'm sorry about that.

No worries, I just thought I missed something obvious and felt stupid to as=
k ;-).

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

