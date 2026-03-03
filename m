Return-Path: <linux-mips+bounces-13338-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB1IIONUp2lsgwAAu9opvQ
	(envelope-from <linux-mips+bounces-13338-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 22:38:43 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB1F1F7A3E
	for <lists+linux-mips@lfdr.de>; Tue, 03 Mar 2026 22:38:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8E031303F5F3
	for <lists+linux-mips@lfdr.de>; Tue,  3 Mar 2026 21:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2363932EB;
	Tue,  3 Mar 2026 21:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LB3wcnKA"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CCC3932E1;
	Tue,  3 Mar 2026 21:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772573845; cv=none; b=Kf8ameX1uGxcnJFqJpH6Q10jdUFE6jGcxBjPa5ThSZmyaZW3XptHfgCC8wLVQIjMOu5d5qVBCxHld39WecAML9tbYGdnlujwpTna5abhWe23e7/cIzuU5h2yVZFM4Fy0nrDY+U3LZQGRZw/2tZC/kxzcLJCCTT+cRo4g+dJ++us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772573845; c=relaxed/simple;
	bh=M78l9HR2fJaBwC1AYnZPHhHEUHYVAhTg67OYlSD26Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=EnUKy0qSGE2aCeMsF4fvtUsLw6P5fAE8pNEC7gOrkhccmoEzkYHiSLMm5j1CKU6pDAP+rRt3uAH2yKBezJbSIaxZbdjFzEDjYHotMmCCfprSrzWSzIWI+4r5PRf8kRQk4asiEEnBp6wXvrbfwNz6iEr9JObBDuDGMD9PTEWhLjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LB3wcnKA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16850C116C6;
	Tue,  3 Mar 2026 21:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772573845;
	bh=M78l9HR2fJaBwC1AYnZPHhHEUHYVAhTg67OYlSD26Fg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=LB3wcnKAGww15fEsToiIVqeqsdTq+g32I0+Qg7uSECBZHRb37F2PVjMiJ06rx8CY3
	 cKTEXLVavlUWASAjzQK1XUWsJSBR2OCvi90rREZB+nZtBy2qchVeqFNXazeXLkWwtv
	 hWOZvVF8U0LL1MsXABPutxqriK0F40EtzFdMDyD0SNBD6vPMwGqLhh0UH82XLmvdR8
	 dgc/aFqS0YBn/wlnBi6cTRuGZlj25DywRIZwZ2WUhJzO7L9imj6k8E9OJP5751hh6E
	 D2V9E2ITwu83htBgYekdOnYr1kAwmVcwIjJBrihSE66lAnCiixaSuE3DBNoSfURZcN
	 X+MpsT9tg7C6w==
Date: Tue, 3 Mar 2026 15:37:23 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, tsbogend@alpha.franken.de,
	ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	bhelgaas@google.com, vkoul@kernel.org, neil.armstrong@linaro.org,
	p.zabel@pengutronix.de, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, nbd@nbd.name,
	ansuelsmth@gmail.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 7/8] PCI: Skip bridge window reads when window is not
 supported
Message-ID: <20260303213723.GA4075286@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303190948.694783-8-cjd@cjdns.fr>
X-Rspamd-Queue-Id: 8CB1F1F7A3E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13338-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,baylibre.com,kernel.org,alpha.franken.de,mediatek.com,google.com,linaro.org,pengutronix.de,collabora.com,nbd.name,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,cjdns.fr:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 07:09:47PM +0000, Caleb James DeLisle wrote:
> pci_read_bridge_io() and pci_read_bridge_mmio_pref() read bridge window
> registers unconditionally. If the registers are hardwired to zero
> (not implemented), both base and limit will be 0. Since (0 <= 0) is
> true, a bogus window [mem 0x00000000-0x000fffff] or [io 0x0000-0x0fff]
> gets created.
> 
> pci_read_bridge_windows() already detects unsupported windows by
> testing register writability and sets io_window/pref_window flags
> accordingly. Check these flags at the start of pci_read_bridge_io()
> and pci_read_bridge_mmio_pref() to skip reading registers when the
> window is not supported.

BTW, I'm still interested in the details of how we got here.  It
shouldn't be too unusual to have a bridge without an I/O window or
maybe even without a prefetchable (64-bit) memory window.

> Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  drivers/pci/probe.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index bccc7a4bdd79..4eacb741b4ec 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -395,6 +395,9 @@ static void pci_read_bridge_io(struct pci_dev *dev, struct resource *res,
>  	unsigned long io_mask, io_granularity, base, limit;
>  	struct pci_bus_region region;
>  
> +	if (!dev->io_window)
> +		return;
> +
>  	io_mask = PCI_IO_RANGE_MASK;
>  	io_granularity = 0x1000;
>  	if (dev->io_window_1k) {
> @@ -465,6 +468,9 @@ static void pci_read_bridge_mmio_pref(struct pci_dev *dev, struct resource *res,
>  	pci_bus_addr_t base, limit;
>  	struct pci_bus_region region;
>  
> +	if (!dev->pref_window)
> +		return;
> +
>  	pci_read_config_word(dev, PCI_PREF_MEMORY_BASE, &mem_base_lo);
>  	pci_read_config_word(dev, PCI_PREF_MEMORY_LIMIT, &mem_limit_lo);
>  	base64 = (mem_base_lo & PCI_PREF_RANGE_MASK) << 16;
> -- 
> 2.39.5
> 

