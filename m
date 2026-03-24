Return-Path: <linux-mips+bounces-13926-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QK4lI0LQwmnRmQQAu9opvQ
	(envelope-from <linux-mips+bounces-13926-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:56:18 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA78B31A5BF
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 18:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B8AF2301E7E2
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2026 17:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F41B37BE6F;
	Tue, 24 Mar 2026 17:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YCQ9WpJE"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D913A1683;
	Tue, 24 Mar 2026 17:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774374976; cv=none; b=c7cbHsgfeIhhovVejV0H7b47h1FaIAUQkhyVhXN14YTNu28cmHb3rRYd1zwsLRwNV1bqEdlL7kmcewkZnrLfCPhulomfJVPUbtJNW9+kINdIXpdJ7RigDCqREwalHBHh1UFkBcHdlyKibfmF+ByK6FaXqiB+pHC614btocmshLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774374976; c=relaxed/simple;
	bh=NL1mcB9ozeqOSsqCkkguLMRCIYPAgFUo0JaJzh10URc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=eQK8uDYYOOG+oNgjW6JjFZrVr+qAOM+SK5GtZuIQFD/TZNeYzf37y8lXBcfRvFHA97OzyJqzN3roEFo23/mv154w/qCqiBLrCdDVaqesFZCG4Ns6QKE3BYDrFqWM5LCCVdxX1sT+7DLjoEaTjlnE7jcDbvt9iWSBaldH1fCYwY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YCQ9WpJE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774374974; x=1805910974;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NL1mcB9ozeqOSsqCkkguLMRCIYPAgFUo0JaJzh10URc=;
  b=YCQ9WpJEIuOh2fMNmwvSVP2FFRjdMjXdvqGUCZ4i9oGUX2X24Hg53oIp
   tdJ1rfQL8ZL8i9zKmj8XTH0M6Nroy7qZodrP32gmIEfBmtNeOmiLfP3r9
   Ex1OvzFyEaYV0uh+DUYUzWcMEihhQn69o3EwL8L2mX9TpMoFoDUlQ5WSa
   qoMbmuULpnZ4UqSxubwCj63JyW1lWPyyvmR9z+feNe2oBum+FJBMlUkRB
   Rf5uhizGwKpgoo4/E4Xwn35ysDE7t3y4dm/DTp8Zqk/i84b0UrbhU1n+b
   9koqJ1UVFZ+YVrpgGVHrvd0m5dDssLbHw95kDzTnSWJAWWj0MRhIBcVib
   g==;
X-CSE-ConnectionGUID: km9n6O3dReWAAI7LluP7OQ==
X-CSE-MsgGUID: cO/M3LExSC2grBUM/0Soxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75307419"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75307419"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:55:45 -0700
X-CSE-ConnectionGUID: mUXuAQFLRnadhyMeGmty4g==
X-CSE-MsgGUID: bujbx+8xS52CYl9LobjFjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="220002724"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 10:55:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Mar 2026 19:55:32 +0200 (EET)
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
    Guenter Roeck <linux@roeck-us.net>, linux-alpha@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
    linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
    linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
    Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
    Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, 
    Max Filippov <jcmvbkbc@gmail.com>, 
    Madhavan Srinivasan <maddy@linux.ibm.com>, 
    Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 05/10] am68k/PCI: Remove unnecessary second application
 of align
In-Reply-To: <5de97ed9556bfcc3b1f26bd71e09fa4016ae3ff8.camel@physik.fu-berlin.de>
Message-ID: <1c08efcd-25e8-6436-52ab-ac3d50dcf58f@linux.intel.com>
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com>  <20260324165633.4583-6-ilpo.jarvinen@linux.intel.com> <5de97ed9556bfcc3b1f26bd71e09fa4016ae3ff8.camel@physik.fu-berlin.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-641337346-1774374932=:1055"
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,roeck-us.net,lists.infradead.org,lists.linux-m68k.org,lists.ozlabs.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,HansenPartnership.com,gmx.de,ellerman.id.au,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,zankel.net,gmail.com,linux.ibm.com,users.sourceforge.jp,libc.org];
	TAGGED_FROM(0.00)[bounces-13926-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+,1:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: DA78B31A5BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-641337346-1774374932=:1055
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 24 Mar 2026, John Paul Adrian Glaubitz wrote:

> Hi Ilpo,
>=20
> On Tue, 2026-03-24 at 18:56 +0200, Ilpo J=C3=A4rvinen wrote:
> > Aligning res->start by align inside pcibios_align_resource() is
> > unnecessary because caller of pcibios_align_resource() is
> > __find_resource_space() that aligns res->start with align before
> > calling pcibios_align_resource().
> >=20
> > Aligning by align in case of IORESOURCE_IO && start & 0x300 cannot ever
> > result in changing start either because 0x300 bits would have not
> > survived the earlier alignment if align was large enough to have an
> > impact.
> >=20
> > Thus, remove the duplicated aligning from pcibios_align_resource().
> >=20
> > Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > ---
> >  arch/m68k/kernel/pcibios.c | 2 --
> >  1 file changed, 2 deletions(-)
> >=20
> > diff --git a/arch/m68k/kernel/pcibios.c b/arch/m68k/kernel/pcibios.c
> > index 1415f6e4e5ce..7e286ee1976b 100644
> > --- a/arch/m68k/kernel/pcibios.c
> > +++ b/arch/m68k/kernel/pcibios.c
> > @@ -36,8 +36,6 @@ resource_size_t pcibios_align_resource(void *data, co=
nst struct resource *res,
> >  =09if ((res->flags & IORESOURCE_IO) && (start & 0x300))
> >  =09=09start =3D (start + 0x3ff) & ~0x3ff;
> > =20
> > -=09start =3D (start + align - 1) & ~(align - 1);
> > -
> >  =09return start;
> >  }
> >=20
>=20
> Sorry if it's a stupid question, but what does "am68k" in the subject ref=
er to?

The extra "a" is a typo. I'm sorry about that.

--=20
 i.

--8323328-641337346-1774374932=:1055--

