Return-Path: <linux-mips+bounces-13965-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JIOIFlcxmm+JAUAu9opvQ
	(envelope-from <linux-mips+bounces-13965-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2026 11:30:49 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 226953428E5
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2026 11:30:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 085AF300B444
	for <lists+linux-mips@lfdr.de>; Fri, 27 Mar 2026 10:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C37C3B2FC2;
	Fri, 27 Mar 2026 10:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SX0nzWlZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A443AA1B2;
	Fri, 27 Mar 2026 10:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607354; cv=none; b=keG8S0eKOtsDy0M2UMRN9cCH5OcCbjOkusojCHtgdeKcW9FhoH+u0IPEBCsJqhHaAv7amQ9xRm2zpXgk/+9+fSyfA4TzzY/NuPwhj+n/DSykYbUyTunllF5QF5vzAQYZQjuRoVllfnAwPsr+yX6KVyp6JdEV1ZixPBetu9pYYeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607354; c=relaxed/simple;
	bh=AQrZsYS87uRLSAUzR2yt6e8HOvPMEsktxMC+0rqw0oY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nVuYhg6gY5IMwE6tnlqy3yOoA4E2e+6tsyvnzitFBWc03tx1m2so0L45gAxs8Zxl1htN/84Xhr/YxkkpcsfiaD8d361Cf0Y3qlcWJ8tyr7BV1N+GDH5FpD7d1TrGotUtEoLjDsijTUnJx6ZXbBSUx3FxUSGSvKEnY6dvn/TuKW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SX0nzWlZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774607353; x=1806143353;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=AQrZsYS87uRLSAUzR2yt6e8HOvPMEsktxMC+0rqw0oY=;
  b=SX0nzWlZIY0Lg4fyXJy1hem2uUevSvI1nbx91bp0jZYYqRr93GaLksaE
   L6XLJWuLACGbs/Obo0LLfiusLKSxmX5HOfj2BR/OfzI5RUmPnAEbJxWGx
   H8arvWKQ7iOn+koxe3/GEJt4fFT8S6HWH9xg10wBXdgqPJanVKkEt1Qyx
   /7B2xb2jl7faADXEGMBpdI28tH79/++kh/ol8X0TPBLWYG1sA2mCqBcZa
   QJQsSA1iMaFdyaMsTkz2wpp39pZGfRPODNn6QqAM5cXjkgXj8CJ1e7gn9
   0Li0W7WV2EDfk6lWNjEzVO4kFjsRIUYdrV6xXvg6gkCesf5RAzv+5UkW8
   Q==;
X-CSE-ConnectionGUID: +KbLwjXESSqMmEPH1Yg2iA==
X-CSE-MsgGUID: k3BStIGXSgiyo9+iueWvgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="93259306"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="93259306"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 03:29:11 -0700
X-CSE-ConnectionGUID: tBARr7F7SaCXrVZYlacT+g==
X-CSE-MsgGUID: 6iZuzsYWQBOngO/GpRvA3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="263218208"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.186])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 03:29:01 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 27 Mar 2026 12:28:56 +0200 (EET)
To: Bjorn Helgaas <helgaas@kernel.org>
cc: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, 
    Guenter Roeck <linux@roeck-us.net>, linux-alpha@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
    linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
    linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
    Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
    Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, 
    Max Filippov <jcmvbkbc@gmail.com>, 
    Madhavan Srinivasan <maddy@linux.ibm.com>, 
    Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    LKML <linux-kernel@vger.kernel.org>, Xifer <xiferdev@gmail.com>
Subject: Re: [PATCH 00/10] PCI: Improve head free space usage
In-Reply-To: <20260326192520.GA1337681@bhelgaas>
Message-ID: <7207cde7-d47e-f79c-afe9-9b1daa79140c@linux.intel.com>
References: <20260326192520.GA1337681@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-307680389-1774607336=:1037"
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,roeck-us.net,lists.infradead.org,lists.linux-m68k.org,lists.ozlabs.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,hansenpartnership.com,gmx.de,ellerman.id.au,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,zankel.net,gmail.com,linux.ibm.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de];
	TAGGED_FROM(0.00)[bounces-13965-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux.intel.com:mid,intel.com:dkim]
X-Rspamd-Queue-Id: 226953428E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-307680389-1774607336=:1037
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 26 Mar 2026, Bjorn Helgaas wrote:

> [+cc Xifer; thanks very much for reporting and testing!]
>=20
> On Tue, Mar 24, 2026 at 06:56:23PM +0200, Ilpo J=C3=A4rvinen wrote:
> > Hi all,
> >=20
> > This series attempts to take advantage of free head space (the free
> > space before the aligned start address) in order to generally produce a
> > tighter packing of the resources/bridge windows.
> >=20
> > The recent changes to the resource fitting algorithm caused resource
> > allocation failures in some cases where a bridge window that is sized
> > to be gapless could no longer be assigned. The previous algorithm left
> > a huge gaps which allowed it to place the remainder (non-aligning part
> > of the size) before the start address of used for the gapless fit,
> > whereas the new gapless approach always had to place the remainder
> > after the aligning part of the resources. There is not always space
> > for the remainder triggering those failures (e.g., when the aligning
> > part must be placed at the top of the window).
> >=20
> > This series attempts to allow placing the remainder once again before
> > the aligning part, but now without leaving huge gaps to retain the
> > benefits of the gapless bridge windows. The approach is somewhat hacky
> > but should work thanks to PCI resources fundamentally consisting only
> > power-of-two atoms.
> >=20
> > There maybe cases where architecture would not want to do such
> > relocation. This series adds the relocation to arch
> > pcibios_align_resource() functions to allow all of them taking
> > advantage of the better resource packing but if somebody objects doing
> > this relocation for a particular arch, I can remove it, please just let
> > me know (this relocation doesn't seem critical unless there are
> > regressions).
> >=20
> > Ilpo J=C3=A4rvinen (10):
> >   resource: Add __resource_contains_unbound() for internal contains
> >     checks
> >   resource: Pass full extent of empty space to resource_alignf CB
> >   resource: Rename 'tmp' variable to 'full_avail'
> >   ARM/PCI: Remove unnecessary second application of align
> >   am68k/PCI: Remove unnecessary second application of align
> >   MIPS: PCI: Remove unnecessary second application of align
> >   parisc/PCI: Cleanup align handling
> >   PCI: Rename window_alignment() to pci_min_window_alignment()
> >   PCI: Align head space better
> >   PCI: Fix alignment calculation for resource size larger than align
> >=20
> >  arch/alpha/kernel/pci.c          |  1 +
> >  arch/arm/kernel/bios32.c         |  9 ++++---
> >  arch/m68k/kernel/pcibios.c       |  8 +++++--
> >  arch/mips/pci/pci-generic.c      |  8 ++++---
> >  arch/mips/pci/pci-legacy.c       |  3 +++
> >  arch/parisc/kernel/pci.c         | 17 ++++++++------
> >  arch/powerpc/kernel/pci-common.c |  6 ++++-
> >  arch/s390/pci/pci.c              |  1 +
> >  arch/sh/drivers/pci/pci.c        |  6 ++++-
> >  arch/x86/pci/i386.c              |  5 +++-
> >  arch/xtensa/kernel/pci.c         |  3 +++
> >  drivers/pci/pci.h                |  3 +++
> >  drivers/pci/setup-bus.c          | 15 ++++++++----
> >  drivers/pci/setup-res.c          | 40 +++++++++++++++++++++++++++++++-
> >  drivers/pcmcia/rsrc_nonstatic.c  |  3 ++-
> >  include/linux/ioport.h           | 22 +++++++++++++++---
> >  include/linux/pci.h              | 12 +++++++---
> >  kernel/resource.c                | 33 +++++++++++++-------------
> >  18 files changed, 149 insertions(+), 46 deletions(-)
>=20
> I added Xifer's tested-by, fixed the "am68k" and missing "if"
> typos, and applied these to pci/resource for v7.1.
>=20
> Ilpo, if you post a v2 with more changes, I'll update to it.  I
> applied the series now to get a head start on 0-day building and into
> next.

Thanks.

I don't have anything in addition to those.

--=20
 i.

--8323328-307680389-1774607336=:1037--

