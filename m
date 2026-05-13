Return-Path: <linux-mips+bounces-14583-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HWQKNv1BGoTQwIAu9opvQ
	(envelope-from <linux-mips+bounces-14583-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 00:06:19 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CEF53B3F3
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2026 00:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2FD063019545
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2026 22:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3F13CA497;
	Wed, 13 May 2026 22:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iKlNtMsx"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D453B9943;
	Wed, 13 May 2026 22:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778709976; cv=none; b=kRimtMftjGotRCte1UcSk0ikIsuiSStdWOHNQYv96arMghYE34DV0fL1Zic+P6QDBtbfi4KztTo88po+6Y+b4kWJVdzqqomQ9iQ3QMxJYyViYn/jcbNs4IKwdmscvtfdXWZSSRvN3/Ncje55qNyMM3SeGRv4XuCl4YuhDEoJF5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778709976; c=relaxed/simple;
	bh=SLtUZuE6eCsfJ26y0lN0VMH2gCaWGCYQmYw6nlqF/tw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=byELvQ0u8fp9zfPiWS/YyttXi929rhsCVUzvMehzhX9fbbZcxMGg8g+zi7CMlF2Rq+/RkHit1eeTdompEm4zhWQR1RQq3AgzBWvdc/h4XhrjoBISsJ3OSkcuj649frvt9AoZJAkGxGlfEE6DdVmVUXHgaBVt/5coNCZoJtTqqPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iKlNtMsx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12129C19425;
	Wed, 13 May 2026 22:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778709976;
	bh=SLtUZuE6eCsfJ26y0lN0VMH2gCaWGCYQmYw6nlqF/tw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=iKlNtMsxO8YS65qWNkC+Igkes3nSBBPFNoNOGWHh1xmPes8LhvqktmDIQl6T7V1wd
	 F5DhkQSKsroXc4idKz4sjmjMtnLTTEECeQij+Pn+umz31TtVu8pXSLmnPNBjtandzc
	 KvV0w8drrLjeSHQ9v4/jwjHJHhRycEAABi8+thwgutnz1i8MQdBw7areXuJ28sYCCU
	 1Inr6U6FlQWOw3Rj/ZK82cEbX5DnYOgSc+sKH9yLl/DYi+MojvIXGzTt+vC7YKkDan
	 wZhGRHOMhUBxs7uouy2ojlPxZoAnvL45Chj5cPDTR7jeVTb6R1rnhHNJkFuNmW6Kl3
	 FWHC1Ts9Xi7kQ==
Date: Wed, 13 May 2026 17:06:10 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
	naseefkm@gmail.com, ryder.lee@mediatek.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] PCI: mediatek: Add support for EcoNet EN7528 SoC
Message-ID: <20260513220610.GA341225@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65792ada-5e9d-4e3f-aa79-bb4a8ffd9161@cjdns.fr>
X-Rspamd-Queue-Id: 42CEF53B3F3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14583-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,kernel.org,collabora.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 11:39:25PM +0200, Caleb James DeLisle wrote:
> On 13/05/2026 23:07, Bjorn Helgaas wrote:
> > On Wed, May 13, 2026 at 07:16:52PM +0000, Caleb James DeLisle wrote:
> > > Add support for the PCIe present on the EcoNet EN7528 (and EN751221) SoCs.
> > > 
> > > These SoCs have a mix of Gen1 and Gen2 capable ports, but the Gen2 ports
> > > require re-training after startup.

> > > +found_port:
> > > +	if (!IS_BUILTIN(CONFIG_PCIE_MEDIATEK)) {
> > > +		/* Let it go because the device will work as Gen1 */
> > > +		dev_warn(dev, "module must be built-in to retrain to Gen2\n");
> >
> > I suppose this will cause a warning even in cases where Gen2 is
> > impossible, e.g., the endpoint only supports Gen1?
> 
> Correct indeed.
> 
> I imagine in most cases, if the port is Gen1 only then board integrator uses
> a Gen1 card as well, so I could try being fancy and probe the card to see if
> it supports Gen2. In OpenWrt the PCI driver is always built-in so I didn't
> really consider this something to worry about.

Probing the downstream device sounds like overkill because it hasn't
been enumerated yet and there's no good place to check after it is
enumerated.  I would consider just logging one message as "info"
instead of "warn", maybe in mtk_pcie_startup_port_en7528()?

