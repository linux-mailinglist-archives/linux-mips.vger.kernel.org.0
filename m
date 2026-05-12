Return-Path: <linux-mips+bounces-14566-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB+5MjNfA2r55QEAu9opvQ
	(envelope-from <linux-mips+bounces-14566-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2026 19:11:15 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D08AA52584F
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2026 19:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9DC513047962
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2026 16:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88F83D7A14;
	Tue, 12 May 2026 16:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gv4pzI/u"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27BA3D5C32;
	Tue, 12 May 2026 16:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778604932; cv=none; b=dV1eaiVCXsR20PFgJpMYZe/XYdCANK4Prd9QqZzdB5T8f2DWNiFYmUiNXmX6jGW1Pmfcn5Uzsjew+F7p7pD09bZsc9X24G6MiOr26ipk0ZPhZ2RmtGKnKaWgJrYo5em96gVrEXxukBBaS34/I/jcfg6Yk/0c8ceTeFE3/yyKYLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778604932; c=relaxed/simple;
	bh=pguv4GSXU7BP/JNG5kiQEzdZlyeJ+Sv9kgdzi0t0K8c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=RM9KTFK/nFYACVsY9NsD+0duk+Qzpa8ftBxYDcRkaKOudiYRbC2D7vd3rJeFvQKqKkJdh7pk/HfkvHpRqhF30j5el7moiLhzi3wZE+1aRgDdP1/EcEWpIuXX+6KrLc6/14UO9GQpmXeZBgeKwH2d/I8hd2Gc4M76Qf9f9xtKFsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gv4pzI/u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C933C2BCB0;
	Tue, 12 May 2026 16:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778604932;
	bh=pguv4GSXU7BP/JNG5kiQEzdZlyeJ+Sv9kgdzi0t0K8c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Gv4pzI/uNym+Mv45u+BRyY2N9xKTgbdjxcyZjvn8rG4ReH2QmMXQVZ6MI1RU676iI
	 J+s+z/ek2a/IJjaf5BoQajRQOwcORVvDihPWbsuKv7303mNp71iDtshM3MUgFYtu7m
	 HabnrAW2Oo7BaHUwYznx83HEVd1TToxW6zlTjFshhPqHxTngQJuNQ5mWR2e/6GzVjW
	 CQZCq0UtMDJ0+vPX1cMQeGbujB9aK4xUhWPM7t1qciYK4BMhqJBqGw7liVa/vUYWpr
	 q+vcOzPxZxWcIpIpWHg+jM2ckyFU7m/NZ51xg6QrwwBPhFcsyeI1C+XLG3JYHnJJ+l
	 13jZHuoAKBI0w==
Date: Tue, 12 May 2026 11:55:30 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
	naseefkm@gmail.com, ryder.lee@mediatek.com, lpieralisi@kernel.org,
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] PCI: mediatek: Add support for EcoNet EN7528 SoC
Message-ID: <20260512165530.GA228087@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413140339.16238-3-cjd@cjdns.fr>
X-Rspamd-Queue-Id: D08AA52584F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14566-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, Apr 13, 2026 at 02:03:39PM +0000, Caleb James DeLisle wrote:
> Add support for the PCIe present on the EcoNet EN7528 (and EN751221) SoCs.
> 
> These SoCs have a mix of Gen1 and Gen2 capable ports, but the Gen2 ports
> require re-training after startup.

> +#include <asm-generic/errno-base.h>

Looks odd; why is this here?  There are basically no other drivers
that do this.

> @@ -1149,6 +1234,46 @@ static int mtk_pcie_probe(struct platform_device *pdev)
>  	if (err)
>  		goto put_resources;
>  
> +	/* EN7528 PCIe initially comes up as Gen1 even if Gen2 is supported.
> +	 * The cannonical way to achieve Gen2 is to re-train the link
> +	 * immediately after setup. However, to save a lot of duplicated code
> +	 * we use pcie_retrain_link() which is usable once we have the pci_dev
> +	 * struct for the bridge, i.e. after pci_host_probe(). */

s/cannonical/canonical/

> +	if (pcie->soc->quirks & MTK_PCIE_RETRAIN) {
> +		int slot = of_get_pci_domain_nr(dev->of_node);

I suppose of_get_pci_domain_nr() is sort of an implicit way to
identify the Gen2 ports?  Worth at least a comment about this DT
connection.  Maybe it could be replaced by using
pcie_get_supported_speeds() or similar?

> +		struct pci_dev *rc = NULL;

s/rc/rp/ to avoid confusing "root port" for "return code" or "root
complex".

> +		int ret = -ENOENT;
> +
> +		if (slot >= 0)
> +			rc = pci_get_slot(host->bus, PCI_DEVFN(slot, 0));

Instead of fiddling with pci_get_slot(), which adds refcount issues
and artificial device/function number dependencies, I think it would
be better to iterate over the devices on host->bus, e.g., with
"for_each_pci_bridge(dev, host->bus)" as in iproc_pcie_setup().

> +		if (rc) {
> +			ret = -EOPNOTSUPP;
> +
> +			/* pcie_retrain_link() is not an exported symbol but
> +			 * this driver supports being built as a loadable
> +			 * module. Someone using this on an EN7528 should make
> +			 * it builtin, or accept Gen1 PCI. */
> +#if IS_BUILTIN(CONFIG_PCIE_MEDIATEK)
> +			ret = pcie_retrain_link(rc, true);
> +#endif

This looks like a confusing user experience if built as a module, with
no hint to the user about why the link is slower than it should be.
I guess "failed to retrain" is a bit of a hint, but it's not really a
clue about how to fix it.

> +		}
> +
> +		if (ret) {
> +			dev_info(dev, "port%d failed to retrain %pe\n", slot,
> +				 ERR_PTR(ret));

This is basically an error path and there's nothing else to do, so if
you return directly here (especially if you factor this to a separate
function), the "normal" path below can be unindented.

> +		} else {
> +			u16 lnksta;
> +			u32 speed;
> +
> +			pcie_capability_read_word(rc, PCI_EXP_LNKSTA, &lnksta);
> +			speed = lnksta & PCI_EXP_LNKSTA_CLS;
> +
> +			dev_info(dev, "port%d link retrained, speed %s\n", slot,
> +				 pci_speed_string(pcie_link_speed[speed]));
> +		}
> +	}

Maybe factor the retrain block into a helper function.

I'm sort of squinting at this whole link retrain thing to begin with.
After the controller is configured correctly, the hardware is supposed
to train the link automatically by itself.

Did something change between mtk_pcie_startup_port_en7528() and now
that means the link will train at Gen2?  Whatever that change is,
could it be done in mtk_pcie_startup_port_en7528()?

What happens when the downstream device is put in D3cold and the link
retrains after power is restored?  Does it train at Gen2 then, without
assistance like this?

