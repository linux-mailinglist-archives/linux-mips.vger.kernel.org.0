Return-Path: <linux-mips+bounces-13934-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB3CJ4DYw2lwuQQAu9opvQ
	(envelope-from <linux-mips+bounces-13934-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 13:43:44 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D49325149
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 13:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A0B8331B6ABF
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2026 12:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98BD53D0901;
	Wed, 25 Mar 2026 12:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7tmz/ea"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41FA3D1CC5;
	Wed, 25 Mar 2026 12:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774440258; cv=none; b=P2v1fyuvHYZEgeEF45LZM8trlPVOlnCrNUogC1rZR+1eJxH0WfTmpD6QIsG9kB9ra2utXZFv9aueys4pav7LpjR4Tm/JTToldnAWj4JnF6XAzA9AMbEFlu7waJ5Dxt/oeBpZE7i6g4d7Mjiex+ymRGJ1KsASSrNB3i/9c74GDl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774440258; c=relaxed/simple;
	bh=pthnvpb4bRgKrgjRM/7gqeUF0giUw3hMBAx3mtd0Tfk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FG/JBs0B+p2xp2vzHKLH5azwwM13MkXQQNND2K7ovQQiD4P8F2jYoHTByHSg9y20vt07ha5eTrHldBCv738CnXdVnzz1NOD+NJ12y7W5FbKHdW46Uhw0TjQaNbbNuizIXaymwXOQXw6u0Ju3/Hohxg0+KwBRFJ3mRhE9jHYBaYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7tmz/ea; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774440257; x=1805976257;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=pthnvpb4bRgKrgjRM/7gqeUF0giUw3hMBAx3mtd0Tfk=;
  b=J7tmz/eaTd05OL5Uk7c6f1Kz8pD8vJdRkgQWOqDIGV0pFDBcdRBCkn5L
   CHF0T6xDxbbPlkkMcFQ5srdSF3zl6wg/kncaLmsQAOzReECtzOOSn9tHA
   inEXGYEhqWoW7sxM7rBars5x1z7pJHS9y2ujTi3YG6RW47526m7HdSFNK
   uc0J5+6qPA05S8bFz5l0rUjFhsYQD3Q+EHHd1TdX9Z5/Rrb4XBiLBqEu/
   u5yJRH0WjjoSCRThOZjnWjA2bPXqdVGwbajeUIsS5WETRkPM/TElJxRS3
   1xKJJYjeyEjD9TvZy6SnkpcjaF94s7DRIOuUW23s462znQhMdhy7V+6hw
   g==;
X-CSE-ConnectionGUID: +a+RKR8dQuelGRD2RspvTQ==
X-CSE-MsgGUID: x8N4ddhjS82VENnpV3ctWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="79381329"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="79381329"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:04:15 -0700
X-CSE-ConnectionGUID: GDVCGG5yQPG4XMQBFBjvAw==
X-CSE-MsgGUID: 2mzDZ70tTHGJhYkLqZAkRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="255160046"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.125])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 05:04:07 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 25 Mar 2026 14:04:03 +0200 (EET)
To: linux-pci@vger.kernel.org
cc: Bjorn Helgaas <bhelgaas@google.com>, Guenter Roeck <linux@roeck-us.net>, 
    linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
    linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
    Russell King <linux@armlinux.org.uk>, 
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
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    Nicholas Piggin <npiggin@gmail.com>, 
    "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, x86@kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 09/10] PCI: Align head space better
In-Reply-To: <20260324165633.4583-10-ilpo.jarvinen@linux.intel.com>
Message-ID: <3a51ad39-558f-860d-4920-9f757b7d5131@linux.intel.com>
References: <20260324165633.4583-1-ilpo.jarvinen@linux.intel.com> <20260324165633.4583-10-ilpo.jarvinen@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1062646629-1774440243=:976"
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,roeck-us.net,vger.kernel.org,lists.infradead.org,lists.linux-m68k.org,lists.ozlabs.org,armlinux.org.uk,linux-m68k.org,alpha.franken.de,HansenPartnership.com,gmx.de,ellerman.id.au,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,zankel.net,gmail.com,linux.ibm.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de];
	TAGGED_FROM(0.00)[bounces-13934-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 01D49325149
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1062646629-1774440243=:976
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 24 Mar 2026, Ilpo J=C3=A4rvinen wrote:

> When a bridge window contains big and small resource(s), the small
> resource(s) may not amount to the half of the size of the big resource
> which would allow calculate_head_align() to shrink the head alignment.
> This results in always placing the small resource(s) after the big
> resource.
>=20
> In general, it would be good to be able to place the small resource(s)
> before the big resource to achieve better utilization of the address
> space. In the cases where the large resource can only fit at the end
> of the window, it is even required.
>=20
> However, carrying the information over from pbus_size_mem() and
> calculate_head_align() to __pci_assign_resource() and
> pcibios_align_resource() is not easy with the current data structures.
>=20
> A somewhat hacky way to move the non-aligning tail part to the head is
> possible within pcibios_align_resource(). The free space between the
> start of the free space span and the aligned start address can be
> compared with the non-aligning remainder of the size. If the free space
> is larger than the remainder, placing the remainder before the start
> address is possible. This relocation should generally work, because PCI
> resources consist only power-of-2 atoms.
>=20
> Various arch requirements may still need to override the relocation, so
> the relocation is only applied selectively in such cases.
>=20
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D221205
> Signed-off-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  arch/arm/kernel/bios32.c         |  3 +++
>  arch/m68k/kernel/pcibios.c       |  4 ++++
>  arch/mips/pci/pci-generic.c      |  3 +++
>  arch/mips/pci/pci-legacy.c       |  2 ++
>  arch/parisc/kernel/pci.c         |  3 +++
>  arch/powerpc/kernel/pci-common.c |  2 ++
>  arch/sh/drivers/pci/pci.c        |  2 ++
>  arch/x86/pci/i386.c              |  2 ++
>  arch/xtensa/kernel/pci.c         |  2 ++
>  drivers/pci/setup-res.c          | 39 +++++++++++++++++++++++++++++++-
>  include/linux/pci.h              |  5 ++++
>  kernel/resource.c                |  2 +-
>  12 files changed, 67 insertions(+), 2 deletions(-)

> diff --git a/arch/sh/drivers/pci/pci.c b/arch/sh/drivers/pci/pci.c
> index 7a0522316ee3..994c3bd36ef2 100644
> --- a/arch/sh/drivers/pci/pci.c
> +++ b/arch/sh/drivers/pci/pci.c
> @@ -185,6 +185,8 @@ resource_size_t pcibios_align_resource(void *data, co=
nst struct resource *res,
>  =09=09 */
>  =09=09if (start & 0x300)
>  =09=09=09start =3D (start + 0x3ff) & ~0x3ff;
> +=09} else (res->flags & IORESOURCE_MEM) {

I'll be adding the missing if into this in v2 (found by sashiko). It seems=
=20
lkp didn't test this so it was not caught earlier.

> +=09=09start =3D pci_align_resource(dev, res, empty_res, size, align);
>  =09}
> =20
>  =09return start;

--=20
 i.

--8323328-1062646629-1774440243=:976--

