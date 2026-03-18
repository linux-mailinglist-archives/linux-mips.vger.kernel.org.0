Return-Path: <linux-mips+bounces-13745-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGxXLZlFumlTTgIAu9opvQ
	(envelope-from <linux-mips+bounces-13745-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 07:26:33 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 341092B6514
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 07:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D70A33039F77
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2026 06:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2984364E9C;
	Wed, 18 Mar 2026 06:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fL1TFZbI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08653537C0
	for <linux-mips@vger.kernel.org>; Wed, 18 Mar 2026 06:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773815190; cv=none; b=QfmSFMFv7LV6JMOjeN1z4Zvis6ME4leZk5WREMzgUbTS8QoXAcydUzGXi70HyaF4ifAYwkXh+9qkqLt2PtXxEqYxq1vR/pb2yEHXfazDodoiXFJWfe7SQ6yBYGfVGrn9PnvEvBTg8IpfXscRYNQOIM57v7I1cyyzSMI5DB7W4FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773815190; c=relaxed/simple;
	bh=V4TiM2oQbQvMxOOzG5GrS/DX9Cy+c9AJCjl2pkunZKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SC8/rPAX6DIjQ29E3V0lgPCsxiQz/Z1S8I6vKj1Sxx1VMnHcst3xiln3l/Jc4cfEH8LKNUhnIUe1YvfnO9iTNAdcSzWvN5B3m96eNjZ1m/8HaNZc6MveGIlfnaZ9QCrad+d8d8MccoRiuN0vbD5XAQpZ1/3KA+yAbTrSfH7t/qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fL1TFZbI; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-356337f058aso4225069a91.2
        for <linux-mips@vger.kernel.org>; Tue, 17 Mar 2026 23:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773815189; x=1774419989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HpBW0wGm/rB3CXB45eRbxyqg2mwTYhAbVyKw2N1pJiY=;
        b=fL1TFZbIFtHG/nOvjZTiTJ6CnnVZsfl/hPnzvJIuKJE1Lspo1asmVSMkPh4WK2Wq6h
         Oo5/6/pZxjdqxEJ5r3Qjc8QOwq1E1ZknyncESJ4QcU5tMATg8T8734bf3n1Moj8Q4Swg
         dLuHiMz4x9whdHzEYwbeyTzhaMAiqwcvQ41G4xAvSpZ0ZuoOUFZ9V7+WCiCrGfq1avwb
         3Y2iTnYk/XVt+DPmTWrByWdfd7hjmikBRMDdt7N/++1xb4T5S4oZTu3d5n9Fkz2Ok0qp
         Pn6zBAlvUk54bkyDjBE6hkyN9k5Iz1AN6W5IVBjQma7XppmA1VbO7qEoT9kWBo1xNwKK
         SK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773815189; x=1774419989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpBW0wGm/rB3CXB45eRbxyqg2mwTYhAbVyKw2N1pJiY=;
        b=bH74rHcOd3DB5c04Oj5qnohbelELQWh5MGeFUrBnFp3I6X/azU4G6cH7arA2ZkAh/e
         8/ZKXNglCAhpHRphR4dWOHXUgL8j/+Lz3x/d25SxKFPRoG+8PMtU11aN7MgkZymwHpDZ
         NnKhwN3wk0DXMmJnnYPTL4p1/76hWlDp0S1FAdX3UpxhdFS+ux4A3jTE1wM9dY2qBT+o
         u37UL+mp/CTtaKAQyPL3Nt9xwI2bNVtLpEU2ylFigJ4IoLkK5CzAbODqup4Bk7HRGAW2
         lKwhUj0X1zkGrXUzwrNn6EPOpLDkCjH30NifFBbmkBq29kR1BbS53SsOso/NNLFqEO1Q
         9MAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRmAgeymW5HIhH+UUYtPkurnHb8rfHVQSTFvHSLMu7Kf4+MXFrtHgCq54AxspHVYjgC0w3/7LlH7RB@vger.kernel.org
X-Gm-Message-State: AOJu0YwmRWIa73OZjZNvknGKAYU+spKoHBTq9BMCdZ2AbCcMW3BnDf5I
	47oeExX0Zyhi9ELQV3yChnv5mZ05otnqjK4mugv9+7VomoRanu/IL6mm
X-Gm-Gg: ATEYQzywYNWABuSGsnicTvayWxseX0pgZ7gkGQmDxNVKCD+uj/wh7u3b7LmkftaURZQ
	zzsijKvQ3asM2x8xSSqZaUxoCnCjuHXfx/EG2WKD3VVeUBGcgjWQaCfFwTEyDkM07hSdr7g94t+
	lQqXUDfutWJEKC4+Tra1TWe4WKiceibMNSZjMmaIqUf22wcW4yNowVUk+4WllOGXa8X2sVZ80H0
	li2xOfx5Ja1DIZo22tY/XU7j2oe7lwhJmOBWoqFX4CvSCbok81m9kljnHBhg5v+7OpFk4hoDTUs
	7pNjfYIBviI5ynMFEDct0RSrfpPx52XzSFLWFPVMgGnH4gTnta0mFzc6iTDYif1aaC56AmNMTlx
	NYYjsuRHv7eVfNDFMbKZn9PBTjMdrFOuWTeJlHiu/hcgVKXMKQ/uHMZBxm6jGyEvYrrY+0J+fEL
	vbwgW5Ep52iY8E33j5uat98nT+GfifW8LR4fI5eC4=
X-Received: by 2002:a17:90b:2d10:b0:359:ff8a:ee3c with SMTP id 98e67ed59e1d1-35bb9f11dcbmr1891248a91.23.1773815188966;
        Tue, 17 Mar 2026 23:26:28 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.localdomain ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bada2bc3esm6193566a91.1.2026.03.17.23.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 23:26:28 -0700 (PDT)
Date: Wed, 18 Mar 2026 10:26:21 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Caleb James DeLisle <cjd@cjdns.fr>, linux-pci@vger.kernel.org,
	linux-mips@vger.kernel.org, ryder.lee@mediatek.com,
	bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] PCI: Skip bridge window reads when window is not
 supported
Message-ID: <abpFjQJ5RNcbzbmz@DESKTOP-TIT0J8O.localdomain>
References: <20260316155157.679533-4-cjd@cjdns.fr>
 <20260317212908.GA109023@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317212908.GA109023@bhelgaas>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13745-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[cjdns.fr,vger.kernel.org,mediatek.com,google.com,kernel.org,gmail.com,collabora.com,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[naseefkm@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[DESKTOP-TIT0J8O.localdomain:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 341092B6514
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 04:29:08PM -0500, Bjorn Helgaas wrote:
> On Mon, Mar 16, 2026 at 03:51:57PM +0000, Caleb James DeLisle wrote:
> > pci_read_bridge_io() and pci_read_bridge_mmio_pref() read bridge window
> > registers unconditionally. If the registers are hardwired to zero
> > (not implemented), both base and limit will be 0. Since (0 <= 0) is
> > true, a bogus window [mem 0x00000000-0x000fffff] or [io 0x0000-0x0fff]
> > gets created.
> > 
> > pci_read_bridge_windows() already detects unsupported windows by
> > testing register writability and sets io_window/pref_window flags
> > accordingly. Check these flags at the start of pci_read_bridge_io()
> > and pci_read_bridge_mmio_pref() to skip reading registers when the
> > window is not supported.
> 
> The fundamental problem here is that assigned space to a bridge window
> that isn't implemented.  I wish we understood the connection between
> this "read window" path and the assignment path.
> 
> Maybe this patch fixes it because we enter pci_read_bridge_mmio_pref()
> with res->flags being NULL, and we set IORESOURCE_MEM |
> IORESOURCE_PREFETCH again, which makes it look like we can assign
> space for it?

Yes, that's exactly right.

> 
> If that's the case, I think it would improve the commit log to mention
> the actual mechanism by which we avoid assigning space.
> 

How about this:

  pci_read_bridge_io() and pci_read_bridge_mmio_pref() read
  bridge window registers unconditionally. If the registers
  are hardwired to zero (not implemented), both base and limit
  will be 0. Since (0 <= 0) is true, these functions set
  IORESOURCE_IO or IORESOURCE_MEM | IORESOURCE_PREFETCH on
  the bridge resource. This causes the allocator to assign
  space for the window even though the hardware can't
  implement it.

  pci_read_bridge_windows() already detects unsupported windows
  by testing register writability and sets io_window/pref_window
  flags accordingly. Check these flags at the start of
  pci_read_bridge_io() and pci_read_bridge_mmio_pref() to skip
  reading registers when the window is not supported, so the
  resource flags remain clear and the allocator does not assign
  space for non-existent windows.


Ahmed Naseef

> > Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> > Link: https://lore.kernel.org/all/20260113210259.GA715789@bhelgaas/
> > Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
> > Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> > ---
> >  drivers/pci/probe.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index bccc7a4bdd79..4eacb741b4ec 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> > @@ -395,6 +395,9 @@ static void pci_read_bridge_io(struct pci_dev *dev, struct resource *res,
> >  	unsigned long io_mask, io_granularity, base, limit;
> >  	struct pci_bus_region region;
> >  
> > +	if (!dev->io_window)
> > +		return;
> > +
> >  	io_mask = PCI_IO_RANGE_MASK;
> >  	io_granularity = 0x1000;
> >  	if (dev->io_window_1k) {
> > @@ -465,6 +468,9 @@ static void pci_read_bridge_mmio_pref(struct pci_dev *dev, struct resource *res,
> >  	pci_bus_addr_t base, limit;
> >  	struct pci_bus_region region;
> >  
> > +	if (!dev->pref_window)
> > +		return;
> > +
> >  	pci_read_config_word(dev, PCI_PREF_MEMORY_BASE, &mem_base_lo);
> >  	pci_read_config_word(dev, PCI_PREF_MEMORY_LIMIT, &mem_limit_lo);
> >  	base64 = (mem_base_lo & PCI_PREF_RANGE_MASK) << 16;
> > -- 
> > 2.39.5
> > 

