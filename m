Return-Path: <linux-mips+bounces-13645-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id v3mZHXuctmlvEQEAu9opvQ
	(envelope-from <linux-mips+bounces-13645-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 12:48:11 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCDF2908E3
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 12:48:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 05123301545C
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2026 11:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963FD3368B1;
	Sun, 15 Mar 2026 11:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="Dh0ycOU+"
X-Original-To: linux-mips@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B9526AAAB;
	Sun, 15 Mar 2026 11:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773574913; cv=pass; b=cF7JXS8/rf26zSLQElqccoKU3G6elKdYKtM/Lr+vbxajLPWt0iVryJQx62SKKUeK0h2RRh24fJa6cO/ZGzMq6NXtXiZPA40aU8xootM2eZ7KoP7QOonXf1uv6SvbckbEUx5MNRd91O/IPZlmzeo/IuvRX1snBcefOS8F7aORB6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773574913; c=relaxed/simple;
	bh=YSmRuxKBO2kw+E3WKTHsuieuLjI2IbFdsM0DVKohbQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEPLusw9NjWi9QDJFjB/JzNOqGKFcrcnM27OtxTjQioOYaxstmMI6T+TR1oM4crgrPiWThTlUpiMUqGb8tKtViplDI5QxH2xxc3n6BhPF++13dhQl1YAKsKg1l710yuk2HmNOV12aDIIO0u6b7OlCiHXH1HqBF91jGwK1tbRVoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=Dh0ycOU+; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
ARC-Seal: i=1; a=rsa-sha256; t=1773574888; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=F8Ovw6IWDaW4TdQr4veQWCP9nnOMBUf3aabZZP0I4uPKehETDqinip9tkU4gjDtvKrNqAHp9plySAUYuB3iMg45e5lqAHcxILc8nbPY4cGKzmb7W9g8MJsGMenxJ3m7lobgxkzdFpO3APXPCaJ+3wPNeQ5xrahkVbQEEXHFmhgQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773574888; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uN8w1OeE6HEvMiWwhvg2LiJ/nLSS/nbJhI/YzLpKiTA=; 
	b=H6zdgdlFhUMsaNNbu6UXpSS8BnZGLrs47dPaSGMptIC6U8nvaMS8regzhpPRMcuW7OixZlQZ7pnQLNi49mIf4NyYYVPatJTh/faxw0VmQJ+hWRkRNyL4n93b2/fsIejVvUdIKMd+JV2FLaYGzNFCpz89EQ3CR5S6tv2M4SCYrGs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773574888;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=uN8w1OeE6HEvMiWwhvg2LiJ/nLSS/nbJhI/YzLpKiTA=;
	b=Dh0ycOU+kMmTiXKP7rMt5W1VyD/yZcNTmLN0qbGxwFjIJw/sH6Bg7Gfnpc+8ctpq
	BMU568G6xLDKMC0gA1ael0PGbfaaklyK1JaLbzvo0RGxkWZYWn4zWIv7/W3uFudBefM
	2CJpJBMGF1lJYc35IH0t/2GD58h546huyJIdvJ3c=
Received: by mx.zohomail.com with SMTPS id 1773574884580662.9489585086674;
	Sun, 15 Mar 2026 04:41:24 -0700 (PDT)
Date: Sun, 15 Mar 2026 11:41:16 +0000
From: Yao Zi <me@ziyao.cc>
To: "Rong Zhang" <rongrong@oss.cipunited.com>,
	"Huacai Chen" <chenhuacai@kernel.org>,
	"Jiaxun Yang" <jiaxun.yang@flygoat.com>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	"Icenowy Zheng" <uwu@icenowy.me>, "Rong Zhang" <i@rong.moe>,
	<stable@vger.kernel.org>
Subject: Re: [PATCH] MIPS: Loongson64: env: Check UARTs passed by LEFI
 cautiously
Message-ID: <abaa3Nb5P_6wUtxL@pie>
References: <20260314211336.408561-1-rongrong@oss.cipunited.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314211336.408561-1-rongrong@oss.cipunited.com>
X-ZohoMailClient: External
X-ZohoMail-Owner: <abaa3Nb5P_6wUtxL@pie>+zmo_0_me@ziyao.cc
X-Spamd-Result: default: False [7.84 / 15.00];
	URIBL_BLACK(7.50)[ziyao.cc:dkim,ziyao.cc:email];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13645-lists,linux-mips=lfdr.de];
	R_DKIM_ALLOW(0.00)[ziyao.cc:s=zmail];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,body];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[ziyao.cc,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.875];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[me@ziyao.cc,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[ziyao.cc:+];
	TAGGED_RCPT(0.00)[linux-mips];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cipunited.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ziyao.cc:dkim,ziyao.cc:email]
X-Rspamd-Queue-Id: BFCDF2908E3
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

On Sun, Mar 15, 2026 at 05:13:29AM +0800, Rong Zhang wrote:
> Some firmware does not set nr_uarts properly and passes empty items.
> Iterate at most min(system->nr_uarts, MAX_UARTS) items to prevent
> out-of-bounds access, and ignore UARTs with addr 0 silently.
> 
> Meanwhile, our DT only works with UPIO_MEM but theoretically firmware
> may pass other IO types, so explicitly check against that.
> 
> Tested on Loongson-LS3A4000-7A1000-NUC-SE.
> 
> Fixes: 3989ed418483 ("MIPS: Loongson64: env: Fixup serial clock-frequency when using LEFI")
> Cc: stable@vger.kernel.org
> Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
> ---
>  arch/mips/loongson64/env.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
> index 11ddf02d6a15..c6b99b3740ea 100644
> --- a/arch/mips/loongson64/env.c
> +++ b/arch/mips/loongson64/env.c
> @@ -17,8 +17,10 @@
>  #include <linux/dma-map-ops.h>
>  #include <linux/export.h>
>  #include <linux/libfdt.h>
> +#include <linux/minmax.h>
>  #include <linux/pci_ids.h>
>  #include <linux/string_choices.h>
> +#include <linux/serial_core.h>

Maybe putting this before string_choices.h to keep the headers sorted
at least locally? Though the order is already broken, this may minimize
the diff if someone is willing to sort them later.

>  #include <asm/bootinfo.h>
>  #include <loongson.h>
>  #include <boot_param.h>

Reviewed-by: Yao Zi <me@ziyao.cc>

Thanks,
Yao Zi

