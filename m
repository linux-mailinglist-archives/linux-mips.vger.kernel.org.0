Return-Path: <linux-mips+bounces-13858-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN5ILAiFvmn4RwMAu9opvQ
	(envelope-from <linux-mips+bounces-13858-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 12:46:16 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A4C2E50A3
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 12:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 418773014657
	for <lists+linux-mips@lfdr.de>; Sat, 21 Mar 2026 11:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E8F38B133;
	Sat, 21 Mar 2026 11:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="K1a515Zh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OPgaxy6h"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D449D387361;
	Sat, 21 Mar 2026 11:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774093571; cv=none; b=Pyt9xDSU3ugR0dg8Fpqokl0Okz1/Rgvr04PjU5C6ctgUI/HokV3hWIaGcYJWGHaJ5/N4OsSNW3ddL76Q6ZM5QZlgoyM6pR3CK3tTwLrl+fAR7tzpfhjSRtUsB/QXzr8UM3SK041pjUIGJKg0AF0ZZEAUKbUMbJXqnLQoBliyAMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774093571; c=relaxed/simple;
	bh=j2X8V42jI3uHij840eVENzhXIp17wQc4eC7ExQiMyIU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ahh6TochhA1eo+fS4OgKY75Ltc3TwhCUZRHk0c+x/M1cJMXSxZ0F5bbXBWu3qbvVawbOiJwjKN0LAoexeQmqn3ygHQEArKvofsLFuJ3Bhc92I0MKxAKLoXf4eruOdM+eZjKvn8wN8yDtJMngzt3wQnzMCeWLVRNMsvNspg5udkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=K1a515Zh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OPgaxy6h; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A047D7A01C1;
	Sat, 21 Mar 2026 07:46:08 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-03.internal (MEProxy); Sat, 21 Mar 2026 07:46:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1774093568;
	 x=1774179968; bh=3Gyti2s6Snp4vYhyWt75xflsRXpAiah/grbQZ4HvZHk=; b=
	K1a515ZhUE/H0HBD+V4dAICepoXUkZNBS8OlxVfx1HvcJxS5xbf9y5E6ueDTnsqU
	ct/PwFhzYLDAsQBnyPySihfErT0WiZCrKzQjwPZ4sBXzreWoHqxcR78rPmu1AKtA
	VuKEHmEEudDb7taZBIx/1HhCjKQZuufI149/mZ0mjmGMh+gcPaBMZiMdc5AkN+Nv
	9bya3wBEGXeUD5PMaJObIbHrFpLgBFy0JapOnGu1YymOGTPpXhxLhGdcywPAZFPM
	/orG4cQJbIyfj2fQ+eF/zAsBUZKfoFbnoIDcgKSQDdxq5h6HbxvjcaZ1G4YzvIex
	muxBKatxy/uRl6mdUyW9NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774093568; x=
	1774179968; bh=3Gyti2s6Snp4vYhyWt75xflsRXpAiah/grbQZ4HvZHk=; b=O
	Pgaxy6htIPA33tPfQh/HZch2/1MgeEc7WUuEMecLiJwKxp/FEPrOwIMaBoPxR/s9
	9peKXgYG1LM7kY6hDne7OuzWm/btiBiuSx/iG6GUjmFKdBLBAge0uU/qzMrK1YYH
	WAQB218itLpfDtbquETj4u6m9ZAZyl8JSfxmLsTDu7/AdGq2rU/0Y1gxr0PMaWNw
	PXb32UVDGI2ZE6pHAVxXojPkU39gV6uaL77wBQV23P8vvu7XuV69OcP7Ah4VsmXX
	SwMNVpfNHvoDVX0pPJWcPtdnkeRaP3cQUwMvfgRo1rDTh7hcZ6PQ4NMjxGTNiLPj
	dCbY760ngZxpdJ3O5VNNg==
X-ME-Sender: <xms:_4S-acuvwGAJ1IBARbaFdM-6DuuN5b-iRfGBUAZXuq26kArJ9QRBRQ>
    <xme:_4S-aUQPrkQgvQgpbJHBhv7nfyc3ULgWvq45jG2B41fGWOu2Kr--otP9SjSBcDM_A
    70xHLpdouY7UuAg89n76M-jaeVMfFf5PZcysdzyUTrivSatL-JyBfk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefuddvjeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedflfhirgig
    uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepffeljeegffduueekffejhfefgfevieeludfgiefhlefhheel
    uedvhfefgefgveeinecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdr
    higrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphhtthhopedugedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhk
    vghnrdguvgdprhgtphhtthhopehufihusehitggvnhhofiihrdhmvgdprhgtphhtthhope
    iihhgvnhhggihinhhguggrsehishgtrghsrdgrtgdrtghnpdhrtghpthhtoheptghhvghn
    hhhurggtrghisehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgi
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhoohhnghgrrhgthheslhhishhtshdr
    lhhinhhugidruggvvh
X-ME-Proxy: <xmx:_4S-aWSPhOepeDRHyFslkNnvvrxUpX0YRhAlX0QkYOIaWuFZm4sfhg>
    <xmx:_4S-acNYH8jPz2nbp8Xd8SzNphbDbnZK85m-c2FitxyqBMNswHtoPw>
    <xmx:_4S-aTltv63YecSFIK9ctTwv9FUUioEqPL5IultvUBejmXhZjXFu0Q>
    <xmx:_4S-aeaGwGvxJJ_9XJ7o7wqmxdu5fz4d0k-vLl75Vnpz4s8OIle-iw>
    <xmx:AIW-aaVzdJ0JPaEZD25Z7-sNQ1RoeXYSDWvB7qP6THn2I6cXU7oUY2Tf>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7C0802CE0072; Sat, 21 Mar 2026 07:46:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A5OMFqkhvUAJ
Date: Sat, 21 Mar 2026 11:45:47 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>,
 "Thomas Gleixner" <tglx@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Xuerui Wang" <kernel@xen0n.name>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Icenowy Zheng" <uwu@icenowy.me>, "Yao Zi" <me@ziyao.cc>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 loongarch@lists.linux.dev,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Message-Id: <6754565e-df4d-4cb5-ae65-e195f6a78f08@app.fastmail.com>
In-Reply-To: <20260321092032.3502701-4-zhengxingda@iscas.ac.cn>
References: <20260321092032.3502701-1-zhengxingda@iscas.ac.cn>
 <20260321092032.3502701-4-zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v4 3/6] dt-bindings: interrupt-controller: add LS7A PCH LPC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flygoat.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[flygoat.com:s=fm2,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-13858-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[flygoat.com:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiaxun.yang@flygoat.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.998];
	DBL_PROHIBIT(0.00)[0.152.158.80:email];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,flygoat.com:dkim,flygoat.com:email,devicetree.org:url]
X-Rspamd-Queue-Id: D3A4C2E50A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On Sat, 21 Mar 2026, at 9:20 AM, Icenowy Zheng wrote:
> Loongson 7A series PCH contains an LPC controller with an interrupt
> controller.
>
> Add the device tree binding for the interrupt controller.
>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
>  .../loongson,pch-lpc.yaml                     | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 
> Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml
>
> diff --git 
> a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml 
> b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml
> new file mode 100644
> index 0000000000000..ff2a425b6f0b8
> --- /dev/null
> +++ 
> b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-lpc.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: 
> http://devicetree.org/schemas/interrupt-controller/loongson,pch-lpc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Loongson PCH LPC Controller
> +
> +maintainers:
> +  - Jiaxun Yang <jiaxun.yang@flygoat.com>
> +
> +description:
> +  This interrupt controller is found in the Loongson LS7A family of 
> PCH for
> +  accepting interrupts sent by LPC-connected peripherals and 
> signalling PIC
> +  via a single interrupt line when interrupts are available.
> +
> +properties:
> +  compatible:
> +    const: loongson,ls7a-lpc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - interrupts
> +  - '#interrupt-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    lpc: interrupt-controller@10002000 {
> +      compatible = "loongson,ls7a-lpc";
> +      reg = <0x10002000 0x400>;
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +      interrupt-parent = <&pic>;
> +      interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
> +    };
> +...
> -- 
> 2.52.0

-- 
- Jiaxun

