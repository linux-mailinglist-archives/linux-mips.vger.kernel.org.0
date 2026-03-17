Return-Path: <linux-mips+bounces-13743-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHHdMajHuWl/NgIAu9opvQ
	(envelope-from <linux-mips+bounces-13743-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 22:29:12 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7002B2B2B08
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 22:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D090C303872B
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 21:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 379F1391851;
	Tue, 17 Mar 2026 21:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNngK0/F"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136643914F6;
	Tue, 17 Mar 2026 21:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773782950; cv=none; b=HzpJ6UP/YIvPDmUj1dbbOjKZrKqSPEn7CqpwssmoUOn1OjiAf28sK4D7rDyVZOL3fyEPwRTwgWJKeVz2NoMnlnNoI3zpMTG8P6ySB7kwIhPBbATmw1To74laC9tLNoIoMCt+HQcJjLWUT3/0yJPMAk2WHPfrgWypjHB7F7wA8Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773782950; c=relaxed/simple;
	bh=EEPcdwfYA2i1wDNKfSw099Z5veH/DJsStfCV0MN+hNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=WsAoUbAQYy6KQn6zbIamEHg1F3c/knSqlxJilZB8sBsjoT4Zh/UuQd/43viMItNtgeKEP5p0Dg91SI+yWIjWMYkEUtqTHRCQYfwIX3XElYfArcj+eCbG1MTs5SCmPCkbfuFJsDtqQ39gzy/15aFbx0Q6tfiAL/aQRJxFscrtkpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNngK0/F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C6EC4CEF7;
	Tue, 17 Mar 2026 21:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773782949;
	bh=EEPcdwfYA2i1wDNKfSw099Z5veH/DJsStfCV0MN+hNM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=mNngK0/Fs/0IBKQ6aMEbV8XD37uWZwqxk9Xp1x3CSxJsS/UYuc7J+7WpeXQjIv9ec
	 X8EcEeWKHBjvgKMyu88CqnlBxL2FAWqBgqJ4ozol6/VeGTI5aw1QFR1zLgeXFDVjMj
	 Vh6uui+Fy6IJVUmetrS8GwD0rBJEg8lPlnZn8e78rGdrnEcwsHeuy895dwjCKj/iZe
	 dJo+fNqA/n+fe+zuUf5P+uyUVtuF5G2F5N53qMXibkbEQPNAYVaY1EcNuLb40V7IK+
	 bTXVtpbv+vjN6Jcthvxlff79woq7ce2WQMs/ChrloY0QQo6VedrOb7moFEJyJlBC9E
	 IM6wbxpicP85A==
Date: Tue, 17 Mar 2026 16:29:08 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
	naseefkm@gmail.com, ryder.lee@mediatek.com, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] PCI: Skip bridge window reads when window is not
 supported
Message-ID: <20260317212908.GA109023@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316155157.679533-4-cjd@cjdns.fr>
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
	TAGGED_FROM(0.00)[bounces-13743-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,google.com,kernel.org,collabora.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7002B2B2B08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 03:51:57PM +0000, Caleb James DeLisle wrote:
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

The fundamental problem here is that assigned space to a bridge window
that isn't implemented.  I wish we understood the connection between
this "read window" path and the assignment path.

Maybe this patch fixes it because we enter pci_read_bridge_mmio_pref()
with res->flags being NULL, and we set IORESOURCE_MEM |
IORESOURCE_PREFETCH again, which makes it look like we can assign
space for it?

If that's the case, I think it would improve the commit log to mention
the actual mechanism by which we avoid assigning space.

> Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> Link: https://lore.kernel.org/all/20260113210259.GA715789@bhelgaas/
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

