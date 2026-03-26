Return-Path: <linux-mips+bounces-13960-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDqVIf+nxWlUAQUAu9opvQ
	(envelope-from <linux-mips+bounces-13960-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2026 22:41:19 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F31833C0AC
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2026 22:41:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C8257304051D
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2026 21:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43CC73FEB22;
	Thu, 26 Mar 2026 21:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Q3UaVvdH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vldQ95RZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D5D3FEB1D;
	Thu, 26 Mar 2026 21:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774561239; cv=none; b=JkdUHjv5QLVDE4Kf4FUK47CBScGHSeisQrAmG5W480O4kaP8mNEbESiuvivtUSAyM/xgOqmLWIzorYSTuzp9/VA/D6rpFeAZtEaP3KwyUMMHlAtXWLm/em921bU6H8f8L2PmQ78ttgCcVONuAJsJiljIsBIDsdl3QJbPcQ1NYXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774561239; c=relaxed/simple;
	bh=Yk5ElyoUqD59NqrI+Foi14c0QkBGwkvf9Lpl4xfDuUs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=n8H86WgPC9wW74m0hw60MJM1usG/lffdofsSEFHSJ+VYnpPkeI+uZOXOdxIl79u49oJrBQ/F2CBnoa4JdGnSTZXg2262CByYKnuQbPYMhYVDP6bqsvouo3I8FEs3x9Jhw/gUWhsHmpCZhUel8FNz8h104eL5RSslJZ7mwpFeRu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=Q3UaVvdH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vldQ95RZ; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 77A477A026B;
	Thu, 26 Mar 2026 17:40:32 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-03.internal (MEProxy); Thu, 26 Mar 2026 17:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1774561232;
	 x=1774647632; bh=53kzqvS35Tfpdk+d6POicHdXAb503grGqmPn4kNmz+8=; b=
	Q3UaVvdHTUK/SfHgTAp+Sc9vyJYZXDqk3D7bsHIa0bH4pBJzszB39Ztg8JAGjheT
	lZi8iyI6XS1wkN4Sl6Y67K2sfuK/3U6l8VL2Qzn3+bIhELKs73CTIaBKIu7evB4a
	SEXrXMyAGn7U9YMPKCHTvrtJewA0x7T8TiRQ+qXzWrxPg1OtisaYJEimD7MsHbA8
	RBrvKrkdzkgfYHKNnekBJrB0IvwABIoHbGCkK4L7cU+bCpqEbIZtvkgZ7JwLQeRi
	DWDHnBEh9TT/p05J8gbIMZ0mysUjTCXb7VUVF4cQm3jWnCNirKX5Pj3PVnHLiyB2
	vkPPM851+MZSgR9C2kc8Zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774561232; x=
	1774647632; bh=53kzqvS35Tfpdk+d6POicHdXAb503grGqmPn4kNmz+8=; b=v
	ldQ95RZ4lBty++sb/ZWl2ojEEzXeI5Vzno2Fp1dkf8h8WNjm/a7rX+RNFxMUoZRY
	/syfUCtfa+oRXVDwRh+c3HRm9lMQYDK4J+V2oH4PZrgnKjTPMC7LeTMhn40TwSI/
	MW8GC3Y738o9xQw71WDy1vl06U3TRVsiq/t3S49ICqw5LTv5MExb5Odx11doi0GB
	JrODFz+HTnlj7b51vyl6Pi1H51NFCtO0C/S6j9Ni6hOiMpqGvc52RLXp9lRD6rUF
	msNQj3k66me3b7/ih6m82jDX9eEx/QVzcgAP6r4k78QCr/hqU/KI6PnzAY8S6Zfm
	z6BOjmhwpoJ1vwMxUYU/Q==
X-ME-Sender: <xms:zqfFaXvb6PMhn0-OiY5cd0lalVAmd064Fp25RLQYlElTFlBNgTt_Jg>
    <xme:zqfFaTTJSOoN_iu6alYqfc8eqoOusWfwCefTWQRN8mZhIEg9r-97Mc5kRGDRt9twS
    CSPVGuuLQCFSzyfPjpq1Ni6MTMAC3V-AbrliDdS-n5nYKIG_WRXyy8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdekgeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedflfhirgig
    uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhephfethfdutdeigeelueeitddtheehudevffejtedtkedvueei
    tddujeefieejieefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghp
    thhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtshgsohhgvghnug
    esrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepuhifuhesihgtvghnohif
    hidrmhgvpdhrtghpthhtohepiihhvghnghigihhnghgurgesihhstggrshdrrggtrdgtnh
    dprhgtphhtthhopegthhgvnhhhuhgrtggriheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoug
    htsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepthhglhigsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlohhonh
    hgrghrtghhsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:zqfFaTNkgBJRd4mDe8-QGTvCcbuls3msixJEA1P3aHQdduZBGVPYcA>
    <xmx:zqfFaenrlzTkFQci_KmFnGYOfaii1ZRCAneiXWTK9GskKjAiw5QwZQ>
    <xmx:zqfFadaXAMK5jAPsCyMdzuRC2l5TR6GGT6npzpltIpwNalaih1uUKA>
    <xmx:zqfFacT0ncrPkbsMLKcyjComvjY60tNFpJgIpCRc-KwEXZSP5C9bJg>
    <xmx:0KfFadVOFyBuTlfIqnZw3TUxdjjo5ccBMs3kbSmqPEGLetrF5r6LxhTe>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 53D312CE0072; Thu, 26 Mar 2026 17:40:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ABKrElPPawS7
Date: Thu, 26 Mar 2026 21:40:09 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Icenowy Zheng" <uwu@icenowy.me>, "Yao Zi" <me@ziyao.cc>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 loongarch@lists.linux.dev,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "Xuerui Wang" <kernel@xen0n.name>, "Thomas Gleixner" <tglx@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Huacai Chen" <chenhuacai@kernel.org>
Message-Id: <a8cb7352-2d1e-46e9-b526-de4d4dd7b460@app.fastmail.com>
In-Reply-To: <20260321092032.3502701-2-zhengxingda@iscas.ac.cn>
References: <20260321092032.3502701-1-zhengxingda@iscas.ac.cn>
 <20260321092032.3502701-2-zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v4 1/6] MIPS: loongson64: Override arch_dynirq_lower_bound to
 reserve LPC IRQs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flygoat.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[flygoat.com:s=fm2,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13960-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiaxun.yang@flygoat.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[flygoat.com:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,app.fastmail.com:mid,messagingengine.com:dkim,flygoat.com:dkim,flygoat.com:email,iscas.ac.cn:email]
X-Rspamd-Queue-Id: 0F31833C0AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On Sat, 21 Mar 2026, at 9:20 AM, Icenowy Zheng wrote:
> On some Loongson 3A devices, a LPC bus is present and some legacy
> devices (e.g. 8259) on it expect hardcoded low interrupt numbers. However
> currently the expected low range interrupt numbers are not exempted from
> the dynamic allocation, which leads to confliction when registering LPC
> interrupts in the fixed range.
>
> Override arch_dynirq_lower_bound() to reserve these low range interrupt
> numbers and prevent them from being dynamically allocated.
>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

@Thomas Bogendoerfer, do you mind picking this over MIPS tree?

Thanks
Jiaxun

> ---
>  arch/mips/loongson64/init.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/mips/loongson64/init.c b/arch/mips/loongson64/init.c
> index 5f73f8663ab2d..c7cc5a3d7817f 100644
> --- a/arch/mips/loongson64/init.c
> +++ b/arch/mips/loongson64/init.c
> @@ -7,6 +7,7 @@
>  #include <linux/irqchip.h>
>  #include <linux/logic_pio.h>
>  #include <linux/memblock.h>
> +#include <linux/minmax.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <asm/bootinfo.h>
> @@ -227,3 +228,8 @@ void __init arch_init_irq(void)
>  	reserve_pio_range();
>  	irqchip_init();
>  }
> +
> +unsigned int arch_dynirq_lower_bound(unsigned int from)
> +{
> +	return MAX(from, NR_IRQS_LEGACY);
> +}
> -- 
> 2.52.0

-- 
- Jiaxun

