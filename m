Return-Path: <linux-mips+bounces-13747-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YC7zNxyYumnSXgIAu9opvQ
	(envelope-from <linux-mips+bounces-13747-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 13:18:36 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6437A2BB558
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 13:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 378C7300FB75
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 12:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600613AE707;
	Wed, 18 Mar 2026 12:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XjtJVgL3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958BD34A79F;
	Wed, 18 Mar 2026 12:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773836313; cv=none; b=GaAPN6T6tnJHoE3dbz7GlXVC4Q9LFTw1KzSA5zufm+Yl0OGNXvncu2NSjYVoxns4WHclPgzpdBMVN8MqjVQyn0h0m/bAziH+hZxYHiWS26hbjbB5AngVo85YrlwEop1yGoIw4T70uZZ/ZblLELZOXcJQKis+8R9YDleGbxYsqT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773836313; c=relaxed/simple;
	bh=fKlAMln5+eXtPqBPuI/T7U2v223nK0zolTnYCh7Gbgk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=B/svvTMM3fDKPnoQNg/LpSo8J/JxmYPgU4dsc9kx6uiHPGGXwGk6dWiMoOlUGS5sImWBQztcyQNUf15r3KDmc9hfpMUs2+faE0QIm27Cu+DO+xPSSVyJInQ0Z4vQNZbqV0B3rgnVg1RLpY8fk79WqudhDUIgD6rbKesJ9WTCuPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XjtJVgL3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773836311; x=1805372311;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=fKlAMln5+eXtPqBPuI/T7U2v223nK0zolTnYCh7Gbgk=;
  b=XjtJVgL34cYErJOWixVLxheHS062vCqU1CRJc6rtIpG/S2ulXYXhwDka
   Cl3qHM5AgmsZOkAE3I83gThuZgw5Kl4A/bRTZLL6wvbQBvLW4xq8ziMV6
   yqh/KHTgxrqYQZ+slzvIy9HGIZe+BoTbd42Gguqm+mQBtMgFnTO1m8wei
   GTLaoMDdm7kvht1uSzTx9yfPZE+HJzG1cY5SVSrPoomF6hl2asyHMpBTe
   lmjvvgzpxEYr7dYBSsM9WKPd1VUvlrlHweBhSutJwd/bfvd145WFK3KtL
   D303+pgfc9BmASkuT0wGjX3RqgL7QowGu/BBlISNw/lIrqysNmjDmk8TN
   w==;
X-CSE-ConnectionGUID: 3NBllwkVQUmhXnM7mLOu4A==
X-CSE-MsgGUID: HPzdxXUyTAWnK3M5rSSUWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85965481"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="85965481"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 05:18:31 -0700
X-CSE-ConnectionGUID: P+Z6F1F5RT+Evho1irfuLQ==
X-CSE-MsgGUID: Ista6+2aT3yV+XUX6UohtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="222822818"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.55])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 05:18:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 18 Mar 2026 14:18:22 +0200 (EET)
To: Ahmed Naseef <naseefkm@gmail.com>
cc: Bjorn Helgaas <helgaas@kernel.org>, Caleb James DeLisle <cjd@cjdns.fr>, 
    linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, 
    ryder.lee@mediatek.com, bhelgaas@google.com, lpieralisi@kernel.org, 
    kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, 
    krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
    angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com, 
    linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] PCI: Skip bridge window reads when window is not
 supported
In-Reply-To: <fc927b7f-a820-d3c2-581c-ab6db562bcfb@linux.intel.com>
Message-ID: <2d47f78f-22cf-78c8-8312-3ffb095d2693@linux.intel.com>
References: <20260316155157.679533-4-cjd@cjdns.fr> <20260317212908.GA109023@bhelgaas> <abpFjQJ5RNcbzbmz@DESKTOP-TIT0J8O.localdomain> <fc927b7f-a820-d3c2-581c-ab6db562bcfb@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1311157423-1773836302=:971"
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,cjdns.fr,vger.kernel.org,mediatek.com,google.com,gmail.com,collabora.com,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-13747-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 6437A2BB558
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1311157423-1773836302=:971
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 18 Mar 2026, Ilpo J=E4rvinen wrote:

> On Wed, 18 Mar 2026, Ahmed Naseef wrote:
>=20
> > On Tue, Mar 17, 2026 at 04:29:08PM -0500, Bjorn Helgaas wrote:
> > > On Mon, Mar 16, 2026 at 03:51:57PM +0000, Caleb James DeLisle wrote:
> > > > pci_read_bridge_io() and pci_read_bridge_mmio_pref() read bridge wi=
ndow
> > > > registers unconditionally. If the registers are hardwired to zero
> > > > (not implemented), both base and limit will be 0. Since (0 <=3D 0) =
is
> > > > true, a bogus window [mem 0x00000000-0x000fffff] or [io 0x0000-0x0f=
ff]
> > > > gets created.
> > > >=20
> > > > pci_read_bridge_windows() already detects unsupported windows by
> > > > testing register writability and sets io_window/pref_window flags
> > > > accordingly. Check these flags at the start of pci_read_bridge_io()
> > > > and pci_read_bridge_mmio_pref() to skip reading registers when the
> > > > window is not supported.
> > >=20
> > > The fundamental problem here is that assigned space to a bridge windo=
w
> > > that isn't implemented.  I wish we understood the connection between
> > > this "read window" path and the assignment path.
> > >=20
> > > Maybe this patch fixes it because we enter pci_read_bridge_mmio_pref(=
)
> > > with res->flags being NULL, and we set IORESOURCE_MEM |
> > > IORESOURCE_PREFETCH again, which makes it look like we can assign
> > > space for it?
> >=20
> > Yes, that's exactly right.
> >=20
> > >=20
> > > If that's the case, I think it would improve the commit log to mentio=
n
> > > the actual mechanism by which we avoid assigning space.
> > >=20
> >=20
> > How about this:
> >=20
> >   pci_read_bridge_io() and pci_read_bridge_mmio_pref() read
> >   bridge window registers unconditionally. If the registers
> >   are hardwired to zero (not implemented), both base and limit
> >   will be 0. Since (0 <=3D 0) is true, these functions set
> >   IORESOURCE_IO or IORESOURCE_MEM | IORESOURCE_PREFETCH on
> >   the bridge resource. This causes the allocator to assign
> >   space for the window even though the hardware can't
> >   implement it.
> >=20
> >   pci_read_bridge_windows() already detects unsupported windows
> >   by testing register writability and sets io_window/pref_window
> >   flags accordingly. Check these flags at the start of
> >   pci_read_bridge_io() and pci_read_bridge_mmio_pref() to skip
> >   reading registers when the window is not supported, so the
> >   resource flags remain clear and the allocator does not assign
> >   space for non-existent windows.
>=20
> At least to me the proposed text reads much better than the original.
> The original text required reading between the lines to connect the dots,=
=20
> whereas this new one clearly explains what causes what.

Hi again,

Reading the code I think the entire 0 <=3D 0 part is a red herring=20
when it comes to the current code, the flags are always set by the=20
functions!

The code would only add IORESOURCE_UNSET | IORESOURCE_DISABLED if the=20
base <=3D limit check fails but that's still wrong because it says to the=
=20
resource allocation code that it can enable that bridge window if it needs=
=20
to.

Prior to the commit 8278c6914306 ("PCI: Preserve bridge window resource=20
type flags") the base <=3D limit check did play some role (maybe the=20
original commit message was based on some older tree than the most current=
=20
one).

--=20
 i.

--8323328-1311157423-1773836302=:971--

