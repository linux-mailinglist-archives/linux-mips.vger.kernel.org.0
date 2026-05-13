Return-Path: <linux-mips+bounces-14581-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wM0RAT/oBGqnQQIAu9opvQ
	(envelope-from <linux-mips+bounces-14581-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2026 23:08:15 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 734B153AD7B
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2026 23:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48F64302D0AD
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2026 21:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256013955DF;
	Wed, 13 May 2026 21:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTJrOW8p"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BB8363084;
	Wed, 13 May 2026 21:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778706481; cv=none; b=CwdjMHUpfJdmffC2lIx504FsXR6pLERbDoysZ+5gxu9eM13P9DFv9+I/yhEuji5EL34d9wHIefi0OVCjv1r0x0SoBjOaNWAc+doluZhTxtdZZTs3iG9ARRjZxS5FK0SmlcemF+YgA+Du6gMV5pFPuGHLxnK/JJvzS5XQPrWLitg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778706481; c=relaxed/simple;
	bh=oZWjXoMfghGHXHjku6nYK8etJGovo5hAboXQRgBbDiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ubr4KZfCjVwt020fceQ99hLhZXstMSSuJrp75UWC9N0HcTLOypCEXHnLVdZ+R7Da/ZLWzUmkrvZ59j1JIcxdZ984rbbrirXDrvld9kFJQFhvNGeDO3C9HV0RGYuxflRKnSDX9Y6YIBT+O8aZ8nsVLpo83STnxXnjaMpNOUBJWq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tTJrOW8p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57C8AC19425;
	Wed, 13 May 2026 21:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778706480;
	bh=oZWjXoMfghGHXHjku6nYK8etJGovo5hAboXQRgBbDiA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=tTJrOW8pBXpiXtwhfnE6UWwdLxO53d1pwvpe7uI7N4M7CX1Us1bPLq9hhLUtDSxAG
	 D+cZ6gVbRPfpAzHT6qorwXZlomfIKWPz2KMP0UDJXdly4bx5AG1orv4lolo3v3HT4Y
	 ryQU+fFjkkwZJ4qoISUSPRmvFuxNW2xu1pbIHs5+Hz6FqwEHYAZ8JuFB1eGAYXOt9m
	 3Js0oCfogVLgFCq7fjm8S8/UKFVpP1Rx2/y1DW9MKclsjbNYcl29PJZa53gRxVoP6T
	 IDATbx2MyIjaUp3bvIsI2TDVMfWPPWCu0PzMnHCmaLqwwJa4uHp25f9G4kRFuzetnM
	 /oDTdFgyJfpKw==
Date: Wed, 13 May 2026 16:07:59 -0500
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
Message-ID: <20260513210759.GA331283@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513191652.3200607-3-cjd@cjdns.fr>
X-Rspamd-Queue-Id: 734B153AD7B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14581-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 07:16:52PM +0000, Caleb James DeLisle wrote:
> Add support for the PCIe present on the EcoNet EN7528 (and EN751221) SoCs.
> 
> These SoCs have a mix of Gen1 and Gen2 capable ports, but the Gen2 ports
> require re-training after startup.

s/re-training/retraining/

> + * @MTK_PCIE_RETRAIN: Re-train link to bridge after startup because some
> + *                    Gen2-capable devices start as Gen1.

s/Re-train/Retrain/ to make this consistent and more greppable.
Also more instances below.

> + * as Gen1, and must be re-trained once after initial configuration in order to
> + * only Gen1 capable. Therefore it is most convenient to re-train every port

> +	return dev_err_probe(dev, ret, "root bridge not found\n");

"Root bridge" is not a term used by the specs, but in common usage it
refers to the host bridge, i.e., the RC.  In this case, you didn't
find a "Root Port".

> +found_port:
> +	if (!IS_BUILTIN(CONFIG_PCIE_MEDIATEK)) {
> +		/* Let it go because the device will work as Gen1 */
> +		dev_warn(dev, "module must be built-in to retrain to Gen2\n");

I suppose this will cause a warning even in cases where Gen2 is
impossible, e.g., the endpoint only supports Gen1?

