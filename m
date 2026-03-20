Return-Path: <linux-mips+bounces-13798-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGddMWcRvWlf6QIAu9opvQ
	(envelope-from <linux-mips+bounces-13798-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 10:20:39 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 746E12D7E88
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 10:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1E328300898B
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 09:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B372E889C;
	Fri, 20 Mar 2026 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tpFfH/74"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DFF2C11E8;
	Fri, 20 Mar 2026 09:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773998136; cv=none; b=pB282mUeQjKpwuU7DjRT9W62fDFBZsJiHlRDMVySLIIRr7a07tu9ZMRqfuJjwv1kNEBEzzztS03N6qC/J425efPWsiyNcshZZ7O8jgOe8Irg49ALsjq36sPULz+oqbHzXGIZnilMqp9D/gMoSOnk5UucQWY2aNcO2TXU2QEIktc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773998136; c=relaxed/simple;
	bh=xJh7m2LMjVO7VUQ40I3EyEanMDNS+YkXHOKQwi9q45E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=W+NZQWQZtSO/BlgJmFe1OIRuLHDlZvN5AqGYNfVcSWMS8wOqFoNfWgiqk9483OWJEaAIS29Xz66fBQBnsDjq5ptLfDL+Aal+zQLobsKCVwHJYmlEfPVJwVnMnGS7FPsDs/HrhymANhRQw54KguDLKWj43/0PQZowqur8Rlb/k/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tpFfH/74; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B6BC4CEF7;
	Fri, 20 Mar 2026 09:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773998135;
	bh=xJh7m2LMjVO7VUQ40I3EyEanMDNS+YkXHOKQwi9q45E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tpFfH/74qEGxvUjoTTTyszT4smO/unPyPfl/cEMRRcFBIT+JOjerJhde0/w/ONAOH
	 fA39AMK4EUZnItsv4z6drIGfWzggb+Lr0qJaVjnSDk2YCF1q+Ldqp25rRbvJBXgkrC
	 1ByDqjETvL25u9PuNM9eD1H6aqJVlIr5Dn7Ts7mxOBHqq3jMl+xvqzVaXmBVmom+nu
	 cx4zF7HHuOXbVqJO3IDxwX9p17tDhHvBU3wXDcacF8y+1vdR2u67uOIx6DFXL0lFyC
	 Lwxp/6IyD/O67Wm5QHC3vmvhpCkGfAOeR2i47Zq04IlPCHqaXbTeN7276Cybyw9PiN
	 Vg2cTau1I4rjw==
From: Thomas Gleixner <tglx@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, Yao Zi <me@ziyao.cc>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, Icenowy Zheng
 <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v3 4/8] irqchip/loongson-pch-lpc: extract
 non-ACPI-related code from ACPI init
In-Reply-To: <20260314162828.1055188-5-zhengxingda@iscas.ac.cn>
References: <20260314162828.1055188-1-zhengxingda@iscas.ac.cn>
 <20260314162828.1055188-5-zhengxingda@iscas.ac.cn>
Date: Fri, 20 Mar 2026 10:15:32 +0100
Message-ID: <877br6lv4b.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [4.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13798-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.388];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 746E12D7E88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15 2026 at 00:28, Icenowy Zheng wrote:

> A lot of code could be shared between the current ACPI init flow with

s/could/can/    s/current/existing/

> the possible OF init flow.

s/possible/upcoming/

> Extract it to a dedicated function.

s/to/into/

> +
> +int __init pch_lpc_acpi_init(struct irq_domain *parent, struct acpi_madt_lpc_pic *acpi_pchlpc)
> +{
> +	struct fwnode_handle *irq_handle;
> +	struct irq_fwspec fwspec;
> +	int parent_irq, ret;
> +
> +	irq_handle = irq_domain_alloc_named_fwnode("lpcintc");
> +	if (!irq_handle) {
> +		pr_err("Unable to allocate domain handle\n");
> +		return -ENOMEM;
> +	}
> +
> +	fwspec.fwnode = parent->fwnode;
> +	fwspec.param[0] = acpi_pchlpc->cascade + GSI_MIN_PCH_IRQ;
> +	fwspec.param[1] = IRQ_TYPE_LEVEL_HIGH;
> +	fwspec.param_count = 2;
> +	parent_irq = irq_create_fwspec_mapping(&fwspec);
> +
> +	ret = pch_lpc_init(acpi_pchlpc->address, acpi_pchlpc->size,
> +			   irq_handle, parent_irq);

No line break required. You have 100 characters per line.

Thanks,

        tglx

