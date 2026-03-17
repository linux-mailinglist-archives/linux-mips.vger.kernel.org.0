Return-Path: <linux-mips+bounces-13722-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LIXBIQ1uWmcvAEAu9opvQ
	(envelope-from <linux-mips+bounces-13722-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 12:05:40 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A74472A8737
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 12:05:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 79BF9301DF6D
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 10:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65751367F28;
	Tue, 17 Mar 2026 10:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="iND48iK6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="30b1C3x5"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E6C2EF652;
	Tue, 17 Mar 2026 10:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773745141; cv=none; b=ZeC7rpZOcSM0caPLMDniuIuCeMJsI9PYilH9At9VnHkR2A2Ale+52w7uEM/CsyVqIJJUDsBQ9rsZfBjXadlNY77w9zKI3huCRcOkbOx+OQ7zAI4/4VJS4hqLDwpBQ/HhJaQ1MBOEbsKJD2k5sKC5VmslLb8Cce6aVDfu5uc3kGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773745141; c=relaxed/simple;
	bh=YjLE7EFQzbquXWcgSlNziM+roKSAsGYnj25fQsDsYsg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZWSna//+Hc6fOmtXf6jOgjZ5W/lVkYJFotM4Fm7oDs3AswE5lxP8+ySZxbo7JCo/2xlm/98r3ONhlCm0Y0XIYqdeqg9D31UQIbD8GBO/Tv9jRmg5dFqfZGymiW83KsrY2NCt6Moyp0A/mmBCq7/bOvAiw5ttt91/vuqfMtSonzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=iND48iK6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=30b1C3x5; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 032A7EC00DC;
	Tue, 17 Mar 2026 06:58:59 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-03.internal (MEProxy); Tue, 17 Mar 2026 06:58:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1773745138;
	 x=1773831538; bh=njehBYHYzL72uKXd0Vm6pWsRSlHmIz/Zx7Ut5ZnUORo=; b=
	iND48iK6uULucntU4gM+qRh9IoQbKDPPf6JmXiOv92wkX1Ni5R79DmBzRZqdZMd8
	L5iHfqHVJBZaxvtGSR03zosqRYyGcYGPrsKXwsZxwf2FElvyKEtEPk89pWMj3TjL
	11xW0WviHOa+TA6ulyH0As+tyEmyboeW4TOEmM52mW2JFBgxEIA+DyeLpjWdY1/n
	kxbD0In93XxFTzp8NS8OVr5B3qJjMMJty6yU+YNaHT/G01iongOfLsAZQEUrYUsT
	PHiaK0COm7KHzo7IucU2+z5hL0fnQowgJlkQpQa5clQ98DnJJmUHlM5F/yQ1bOMU
	fI0T0JlRQ0c03B/ZSJt6WQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773745138; x=
	1773831538; bh=njehBYHYzL72uKXd0Vm6pWsRSlHmIz/Zx7Ut5ZnUORo=; b=3
	0b1C3x5xtxEpMFG1G+nshn1hKkabDFbOBfzbfjRRIEk8XyFdFtsGjRtpdhyo1ywG
	wjrHD0ssSPncRWVYppuOorRVkIvH1Cy2Vm8kjRIF5foGdx5+uM9MBfIGaOCR1JdP
	z6InJMae+s+1uY9FXMx6IK3RQBlDAj3l4TEsbThJN1uae9A8odsxbyLHQdrgth7T
	oCp3JU4lFSDldZB1/EGMkB7vX6MNLkDVZRsWdu9vR41AShAo6fLRkMjBEi2jAzK0
	QyaCYPKtH3HOml3dGyNJOOoQ+MxSSCxt19i3ynHYCWVgQHj4n6jiOL+hZrjf7Kow
	Dwzpbj7/ChW2bTru7uKIA==
X-ME-Sender: <xms:8TO5aZpH0FljMI7V5K8xd0soIo1wZ8TyBw6VKBhF-IGFRauZxsyUFA>
    <xme:8TO5aWesiccdguuwYxPB_wmi7T9QNBzSpEKcCXeAycLgwKtGy2xJouUbrheBHw698
    pi0cBC-yZwBOn8yuLFjTRO0BzZbA1WU-fRPtEmSkck9vdq-ZU5F7NI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftddutdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedflfhirgig
    uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhephfethfdutdeigeelueeitddtheehudevffejtedtkedvueei
    tddujeefieejieefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghp
    thhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhssghoghgvnhguse
    grlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehufihusehitggvnhhofiih
    rdhmvgdprhgtphhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprhhonhhgrhhonhhgsehoshhsrdgtihhpuhhnihhtvggurdgtohhmpdhrtghp
    thhtohepihesrhhonhhgrdhmohgvpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlse
    hvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhiphhssehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhtrggslhgvsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgvseiiihihrghordgttg
X-ME-Proxy: <xmx:8TO5aYXTY08mnwcyY60mTx0M4HIMF4QZ2BLu9gKQcoYsZf-J537vmw>
    <xmx:8TO5aSkFKas7DB4a38E2z2rSsX9kY7ZsRAx55UKemSQ5WebQO0LFow>
    <xmx:8TO5aXNxpp4I708oV6f0ftQkH8OMJatyoOPV79Ud3nuaHfLNswBEzA>
    <xmx:8TO5aaKwQSnuo4qdozyup3BSLLQqRWqQD4nHntTmAqRA6Q7KDXQLDw>
    <xmx:8jO5aW-pvgygPErbwH6cY1puwQVcRR3vb-YgivyvsSgDUUCk9kefrc_n>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9CEA42CE0072; Tue, 17 Mar 2026 06:58:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AbrjtIqzToA-
Date: Tue, 17 Mar 2026 10:58:37 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Rong Zhang" <rongrong@oss.cipunited.com>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Yao Zi" <me@ziyao.cc>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, "Icenowy Zheng" <uwu@icenowy.me>,
 "Rong Zhang" <i@rong.moe>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Message-Id: <55f5355f-3dc0-4ae8-812a-0eb07dcc25e6@app.fastmail.com>
In-Reply-To: <20260315172824.352412-1-rongrong@oss.cipunited.com>
References: <20260314211336.408561-1-rongrong@oss.cipunited.com>
 <20260315172824.352412-1-rongrong@oss.cipunited.com>
Subject: Re: [PATCH v2] MIPS: Loongson64: env: Check UARTs passed by LEFI cautiously
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [7.35 / 15.00];
	URIBL_BLACK(7.50)[ziyao.cc:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13722-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[flygoat.com:s=fm2,messagingengine.com:s=fm1];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiaxun.yang@flygoat.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[flygoat.com:+,messagingengine.com:+];
	TAGGED_RCPT(0.00)[linux-mips];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c09:e001:a7::/64:c];
	NEURAL_SPAM(0.00)[0.947];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,app.fastmail.com:mid,cipunited.com:email,flygoat.com:dkim,flygoat.com:email,ziyao.cc:email]
X-Rspamd-Queue-Id: A74472A8737
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes



On Sun, 15 Mar 2026, at 5:28 PM, Rong Zhang wrote:
> Some firmware does not set nr_uarts properly and passes empty items.
> Iterate at most min(system->nr_uarts, MAX_UARTS) items to prevent
> out-of-bounds access, and ignore UARTs with addr 0 silently.
>
> Meanwhile, our DT only works with UPIO_MEM but theoretically firmware
> may pass other IO types, so explicitly check against that.
>
> Tested on Loongson-LS3A4000-7A1000-NUC-SE.
>
> Fixes: 3989ed418483 ("MIPS: Loongson64: env: Fixup serial 
> clock-frequency when using LEFI")

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Sign, firmwares are always insane like this :-(

> Cc: stable@vger.kernel.org
> Reviewed-by: Yao Zi <me@ziyao.cc>
> Signed-off-by: Rong Zhang <rongrong@oss.cipunited.com>
> ---
> Changes in v2:
> - Sort new includes alphabetically (thanks Yao Zi)
> ---
>  arch/mips/loongson64/env.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/loongson64/env.c b/arch/mips/loongson64/env.c
> index 11ddf02d6a15..7abcca7ab4ed 100644
> --- a/arch/mips/loongson64/env.c
> +++ b/arch/mips/loongson64/env.c
> @@ -17,7 +17,9 @@
>  #include <linux/dma-map-ops.h>
>  #include <linux/export.h>
>  #include <linux/libfdt.h>
> +#include <linux/minmax.h>
>  #include <linux/pci_ids.h>
> +#include <linux/serial_core.h>
>  #include <linux/string_choices.h>
>  #include <asm/bootinfo.h>
>  #include <loongson.h>
> @@ -106,9 +108,23 @@ static void __init lefi_fixup_fdt(struct 
> system_loongson *system)
> 
>  	is_loongson64g = (read_c0_prid() & PRID_IMP_MASK) == PRID_IMP_LOONGSON_64G;
> 
> -	for (i = 0; i < system->nr_uarts; i++) {
> +	for (i = 0; i < min(system->nr_uarts, MAX_UARTS); i++) {
>  		uartdev = &system->uarts[i];
> 
> +		/*
> +		 * Some firmware does not set nr_uarts properly and passes empty
> +		 * items. Ignore them silently.
> +		 */
> +		if (uartdev->uart_base == 0)
> +			continue;
> +
> +		/* Our DT only works with UPIO_MEM. */
> +		if (uartdev->iotype != UPIO_MEM) {
> +			pr_warn("Ignore UART 0x%llx with iotype %u passed by firmware\n",
> +				uartdev->uart_base, uartdev->iotype);
> +			continue;
> +		}
> +
>  		ret = lefi_fixup_fdt_serial(fdt_buf, uartdev->uart_base,
>  					    uartdev->uartclk);
>  		/*
>
> base-commit: 267594792a71018788af69e836c52e34bb8054af
> -- 
> 2.53.0

-- 
- Jiaxun

