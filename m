Return-Path: <linux-mips+bounces-13797-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFDdCfkPvWlf6QIAu9opvQ
	(envelope-from <linux-mips+bounces-13797-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 10:14:33 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 291AD2D7D4E
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 10:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D472300AD78
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2026 09:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF9C3783DF;
	Fri, 20 Mar 2026 09:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUbGz2rE"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6EC3793CC;
	Fri, 20 Mar 2026 09:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773997756; cv=none; b=GSJPxTqama1wFwt9tsSZxVnSnUaeaFWbePSgwIaVN4cSWt9GjChFaBfKOA0uixZJcCsF9jhAgUFvDQsrN8rs+jcc1v9DVLBM2i3KWbJgommD8F8XM/dua2l9rd3encKbl7M43ZagQTFuOSGBgCIR7Zli1uhXd/pIRJVuATf7/gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773997756; c=relaxed/simple;
	bh=sdgC/KkwAU//GqwnfohFe3+blWfZ1LFGtORl/qFH1DQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XVKeBTku+ZcspvKdW6axpiVxHnOFVTRUxuhaq8Y4U257xXKPLcInLsqZTtwZqZUsXdlv6PnhY+Q/b1i/GeEQK5XcG4jfXJyA/AeWI91sLD+NevTzpmtaVdUQU/y03BAaokxeaONWJPcqZ3kVYc4ZmLuRBli8l4X/HvPR7fneUHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pUbGz2rE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6E8C4CEF7;
	Fri, 20 Mar 2026 09:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773997756;
	bh=sdgC/KkwAU//GqwnfohFe3+blWfZ1LFGtORl/qFH1DQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pUbGz2rE90r9tKAzl3vaQGbCiLDtAjpIab+to/8m+8g3i/bQFrTpa3MFHwCQOE6p6
	 Wo7GKo+Nk+pdmDjAJ2AzmhGuncBc4hNcen48r3q6b+yqqzj6djEE/z2zuAkL+SXbzk
	 P3ta7ru0QpQpEzx30qyjA/bvI8mRkNYYivAa1K9P7Jf2jzMljHZwJ+luZSyzQ7beTk
	 WyNncxu122uqcgu52Web8W3qOFgPnSb4N5g2J96JyyLz3iomTlDOSPWfTAQ9baxoLS
	 +QX6c2r3Bdn5P374ItW58T2ac1JMNud2RZyDyNvHJczVKS2765jHwm00cl/xw0OpDB
	 S7WI0ZwvyQ7vg==
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
Subject: Re: [PATCH v3 1/8] MIPS: Loongson64: Override
 arch_dynirq_lower_bound to reserve LPC IRQs
In-Reply-To: <20260314162828.1055188-2-zhengxingda@iscas.ac.cn>
References: <20260314162828.1055188-1-zhengxingda@iscas.ac.cn>
 <20260314162828.1055188-2-zhengxingda@iscas.ac.cn>
Date: Fri, 20 Mar 2026 10:09:10 +0100
Message-ID: <87a4w2lvex.ffs@tglx>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13797-lists,linux-mips=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.361];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 291AD2D7D4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15 2026 at 00:28, Icenowy Zheng wrote:
> On some Loongson 3A devices, a LPC bus is present and some legacy
> devices (e.g. 8259) on it expect hardcoded low IRQ numbers. However

s/IRQ/interrupt/ all over the place

Change log are supposed to be written in proper prose and not be riddled
with acronyms unless the acronym has a technical relevance like LPC or
ACPI. IRQ[s] does not qualify for that.

Thanks,

     tglx

