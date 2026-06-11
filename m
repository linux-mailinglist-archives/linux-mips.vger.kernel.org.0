Return-Path: <linux-mips+bounces-15045-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g+6lKuhfKmqEoQMAu9opvQ
	(envelope-from <linux-mips+bounces-15045-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 09:12:40 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE5D66F483
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 09:12:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fiFBYq3P;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15045-lists+linux-mips=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-mips+bounces-15045-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF13530093A0
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jun 2026 07:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D023B530D;
	Thu, 11 Jun 2026 07:12:19 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8990D3B3C11;
	Thu, 11 Jun 2026 07:12:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781161939; cv=none; b=tYNb4B7M7BM1tD1TdVcL7UiWlHlou7E7dnMhuyXfaIiYsO00ItxJsu0KQFc7be8/o5HXFHX2b/6onkPv+lkKq8npJvKsMngUbEJFxdOkP1LZqE8C/MKl+tRyJe+Jy0xQnM7vd4JPVCTtCm705jiX0rx/nk08KViXDeQjVA2IA4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781161939; c=relaxed/simple;
	bh=EJEYQub8wlf0di/iU4ofyqbowmH56ypDX5pVy3n+lc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2sZrbZi90MM+PvuVoLi+XBpZFyupNuHoLmgshrsdcg72lEdc2T+jGzwl5EZMJhmP8NaMXYSCUIjnrT1uXcWPdh47zJdDUzYvOPbwPV5bZoCRsji3m1QZxRA4WsYLY3he1TewUeKSnOte/w/aK5HqiJLmkx4L5j9JmtSoU7WODk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fiFBYq3P; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF6551F00893;
	Thu, 11 Jun 2026 07:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781161938;
	bh=cb1adLE4OteerCSBk+VBYHwOKwVKIC0OX9Sh5Jg4D0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fiFBYq3PHbybtvQ0Ie7WxptQtEeUaCk6mxPymiXzx2z3zGvV4UAnunhiFpDcL+3ds
	 8T2iILHFOT5A0QEZ7fBhoMFfMu7p5pdP443UE44k4Op87dski55918WHX+SvKCTWH3
	 q+v+nE2/qmkjWRxh8ZAVFYaYRYvkSN6mmb8gnVGLWDqHg2r4kyfa74bFTSt+dKNj3Y
	 ASPKu70fz3eU/2+djxAYm/9Yxva6fleJpBa5FfW0yLlD6mJ1CqrEpgJTmgSLDT+aeB
	 8dP2VE/RzFF39igauJHUJwvKT1wdM6ivedxpLvfNDVSie0T1A1t0C/MU4X5FUZwHHm
	 v+w9+NxVjIkpQ==
Date: Thu, 11 Jun 2026 09:12:08 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, 
	naseefkm@gmail.com, ryder.lee@mediatek.com, helgaas@kernel.org, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 0/3] Add EcoNet EN7528 (and EN751221) PCIe support.
Message-ID: <qwjq6jt3akjk6m4qp4s7xpqf2kzc3tyhsrmcoqhc3canknauxh@leu5dbmv5ngl>
References: <20260521171951.1495781-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521171951.1495781-1-cjd@cjdns.fr>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:cjd@cjdns.fr,m:linux-pci@vger.kernel.org,m:linux-mips@vger.kernel.org,m:naseefkm@gmail.com,m:ryder.lee@mediatek.com,m:helgaas@kernel.org,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:ansuelsmth@gmail.com,m:linux-mediatek@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15045-lists,linux-mips=lfdr.de];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,mediatek.com,kernel.org,collabora.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[leu5dbmv5ngl:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCE5D66F483

On Thu, May 21, 2026 at 05:19:48PM +0000, Caleb James DeLisle wrote:
> Tested on TpLink Archer VR1200V-V2 (EN751221 with Gen2 device)
> 
> Changes since v8:
> * guard(rwsem_read)(&pci_bus_sem); in mtk_pcie_retrain
> * v8: https://lore.kernel.org/linux-mips/20260520183827.908243-1-cjd@cjdns.fr
> 
> Changes from v7:
> * mtk_pcie_retrain retrain all root ports not just first
> * Include fix from Manivannan Sadhasivam, wrong usage of virt_to_phys()
> * v7: https://lore.kernel.org/linux-mips/20260514151318.3444959-1-cjd@cjdns.fr
> 
> Changes from v6:
> * s/reset/resets/ in .yaml
> * s/re-train/retrain/g
> * s/Root bridge/Root port/
> * If module not builtin, log at mtk_pcie_startup_port_en7528()
> * Do not fail if error in mtk_pcie_retrain()
> * v6: https://lore.kernel.org/linux-mips/20260513191652.3200607-1-cjd@cjdns.fr
> 
> Changes from v5:
> * s/errno-base.h/errno.h/
> * Breakout mtk_pcie_retrain() into a function
> * Use for_each_pci_bridge() to find root bridge
> * v5: https://lore.kernel.org/linux-mips/20260413140339.16238-1-cjd@cjdns.fr/
> 
> Changes from v4:
> * Fixed missing Acked-by
> * Rebased to commit 66672af7a095 ("Add linux-next specific files for 20260410")
> * v4: https://lore.kernel.org/linux-mips/20260404182854.2183651-1-cjd@cjdns.fr/
> 
> Changes from v3:
> * s/initiallized/initialized/
> * Use PCIE_T_PVPERL_MS for sleep time
> * Use PCI_PM_D3COLD_WAIT for startup wait time
> * Clarify comment "Activate INTx interrupts"
> * Add MTK_PCIE_RETRAIN quirk for devices which require link re-train
> * Do not retrain *all* bridges, only root bridge
> * Better comments and logging in retraining logic
> * v3: https://lore.kernel.org/linux-mips/20260320094212.696671-1-cjd@cjdns.fr/
> 
> Changes from v2:
> * mediatek-pcie.yaml -> s/power-domain/power-domains/ and drop example
> * Patch 3 dropped as it has been applied (Thanks!)
> * v2: https://lore.kernel.org/linux-mips/20260316155157.679533-1-cjd@cjdns.fr/
> 
> Changes from v1:
> * mediatek-pcie.yaml slot0 needs device-type = "pci", fix dt_binding_check
> Link: https://lore.kernel.org/linux-mips/177334026016.3889069.9474337544951486443.robh@kernel.org
> * v1: https://lore.kernel.org/linux-mips/20260312165332.569772-1-cjd@cjdns.fr/
> 
> This was split from a larger PCIe patchset which crossed multiple
> subsystems. I'm not labeling this a v3 because it's a new patchset, but
> I'm keeping the historical record anyway.
> 
> Changes from econet-pcie v2:
> * mediatek-pcie.yaml add missing constraints to PCI node properties
> * econet-pcie v2: https://lore.kernel.org/linux-mips/20260309131818.74467-1-cjd@cjdns.fr
> 
> Changes from econet-pcie v1:
> * pcie-mediatek.c Exclude pcie_retrain_link() when building as a module
> * econet-pcie v1: https://lore.kernel.org/linux-mips/20260303190948.694783-1-cjd@cjdns.fr/
> 
> 
> Caleb James DeLisle (2):
>   dt-bindings: PCI: mediatek: Add support for EcoNet EN7528
>   PCI: mediatek: Add support for EcoNet EN7528 SoC

Patch 3 doesn't apply cleanly. So I applied patches 1 and 2. Please rebase patch
3 on top of pci/controller/mediatek branch and resend it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

