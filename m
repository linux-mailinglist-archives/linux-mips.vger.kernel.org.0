Return-Path: <linux-mips+bounces-13723-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8J8iG200uWnpugEAu9opvQ
	(envelope-from <linux-mips+bounces-13723-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 12:01:01 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A952A865C
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 12:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B78193050D53
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 10:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C498F3A6B7E;
	Tue, 17 Mar 2026 10:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="bpX3gXy4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ud8CrpcH"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9303A4F5C;
	Tue, 17 Mar 2026 10:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773745178; cv=none; b=XQYliA22ZafRtcI2Vr76WsBw9IFPDfp6RUzeamIUbvEkFEMWMMfvdNnnumR8MXsQ6pGuL2RcqeTWVGQURS7Sx3vaxantuILkeoizcdfktDq+gNuYE5mv5GVCaVgWVUcAqiscWCDCPX2zSdWSNoATOpHAIdn4np8qv/jGEk0p/fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773745178; c=relaxed/simple;
	bh=+e8JfM71dQwYV+Ugz4DCHT434PKU18m81dafvJE81Xw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Sz8a9DMO3XHhzo0j9zV6AelXqvsgd2UW2tREmLs6DY6wflHzOQjvlXECiPeRFxOeutzknLG+s/7CAtjrc+rjOqY3TFxaDFMigOUwBa+TeKVtTDGlOhmjrSxVwXpzAMewVetoJdeCmzPK2xtGVsLxS81iHG0BoiI+OaKUAd+N+CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=bpX3gXy4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ud8CrpcH; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id AB2B7EC00CF;
	Tue, 17 Mar 2026 06:59:36 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-03.internal (MEProxy); Tue, 17 Mar 2026 06:59:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1773745176;
	 x=1773831576; bh=1Yc7uQk1TNITRG0SQZtaBpWL1O6m4P0+FIGGSDnrE+4=; b=
	bpX3gXy4nR3DJz3hrVf7XAdjYuBRw9x7o9kj0IZeIYUC5Xk58QWNTxttkBJnSc5C
	B6vwTRlintpHMqG25Nv/Edx+lN8/CZ5T/l3ea9Li3QqsyA39S1DhFsY4LAt6+OC0
	yDH44y1B5s9GmF8F5fo1VnbjXcwfPKthqVtCSsMNle8uX8+RPHvHk+16qmGU3zaK
	MqmtZzqj9m9oXPxobFw6nJaKHLhxYFLXFDwdFd4FotD30LnGk1mPzM9LP5LPwBwE
	mLuNvz3FDiQDGA1b+399FEgcX1cHxxSng62O8nvIz+W6qUQ+hJM+ivXUi5uuX/CX
	cPMEQJz7K8lV9wBoJ3eR3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773745176; x=
	1773831576; bh=1Yc7uQk1TNITRG0SQZtaBpWL1O6m4P0+FIGGSDnrE+4=; b=U
	d8CrpcHVzF44ytfNPw8VN40MI+1Fqg1AakHHvNeaT+DBpM5bqj3s02mvb4phNwc1
	NIBVwVw5fgLS0DfqLfuMokM+lxJyhqRVO8QDhF1J7/kG7BJ/BCJFl9er9LV9AYAc
	ls1fxHhLyocBHO2JwqIFYxyV+o8Mdo524m0CmovGDcXatQz8cP8ozQ1lKRCnOzcz
	Rw6bskWpSrOANP4u2Qh7apAJxCdtq77ecZm+LRoZeV+AZKCCUwveKNA8WXUYWRrg
	2s/QnOCDRvEfS4kokgHhg6bcHO81VFVwso3t0IACZgYYOoK9lsxaHpGDPYLwGADg
	Dp5j+7YHT/Eylej6YubLg==
X-ME-Sender: <xms:FzS5aUqMxLaKpMysvbx14jF5JPs9X6BLsJoERJKXZEtIzp9ZRZILyw>
    <xme:FzS5aVcLgcOue-UxqqEfd6nM-okRuvtCjdnG-7oEJGCsS8Qmru2bQkfnM4ZeR2TnB
    iSrReVTEsqigh-CIzBdddIpnfsaTHteOTaw7Z7ib5awmfOvqSbQaygH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftddutdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedflfhirgig
    uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepgfduteegvdfhtdeffeetuddvieelgffgheelkeegffeiudej
    heeiiefgvedvvdefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhg
    sehflhihghhorghtrdgtohhmpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdgu
    vgdprhgtphhtthhopehufihusehitggvnhhofiihrdhmvgdprhgtphhtthhopegtohhnoh
    hrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhirhhishhlrggshieskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhk
    hheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegthhgvnhhhuh
    grtggriheslhhoohhnghhsohhnrdgtnhdprhgtphhtthhopehrohhnghhrohhnghesohhs
    shdrtghiphhunhhithgvugdrtghomh
X-ME-Proxy: <xmx:GDS5aWVK2Oi44C9qQ_RK3CY4_WpcvDoepOne0Erp_zHJ8fkaAkIrqQ>
    <xmx:GDS5aRGpkIHjPAmnL4Ib23eU1rYINhPFZUu2lrKRPOeSndTwC0GQLg>
    <xmx:GDS5aRNeJTLIANzrLvOkj0dUWKV5tGoQfSUPfJ61suPeEdeiSHgP3g>
    <xmx:GDS5adVrWPEUsNCpVF1YYEXegh-ndVolK6kC3Djh7diIA-DubcQIIA>
    <xmx:GDS5aXtgsAMd7vWHOyA5_Xb0E3WPEvaTZWDQePcHFfaBKVFADAeFKHTl>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DC39A2CE0072; Tue, 17 Mar 2026 06:59:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AcMa5Labo19-
Date: Tue, 17 Mar 2026 10:59:15 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Rong Zhang" <rongrong@oss.cipunited.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Huacai Chen" <chenhuacai@loongson.cn>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 devicetree@vger.kernel.org, "Yao Zi" <me@ziyao.cc>,
 "Icenowy Zheng" <uwu@icenowy.me>, "Rong Zhang" <i@rong.moe>
Message-Id: <f6887aca-9a79-442d-8f3a-e98ae45e488c@app.fastmail.com>
In-Reply-To: <20260315184301.412844-1-rongrong@oss.cipunited.com>
References: <20260315184301.412844-1-rongrong@oss.cipunited.com>
Subject: Re: [PATCH v2 0/2] serial: 8250: loongson: Add support for MIPS-based Loongson
 3A4000
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
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13723-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiaxun.yang@flygoat.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[flygoat.com:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[flygoat.com:dkim,flygoat.com:email,messagingengine.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,app.fastmail.com:mid]
X-Rspamd-Queue-Id: 11A952A865C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On Sun, 15 Mar 2026, at 6:42 PM, Rong Zhang wrote:
> This series targets the serial tree.
>
> The UART controller on Loongson 3A4000 is compatible with Loongson
> 2K1500, which is NS16550A-compatible with an additional fractional
> frequency divisor register.
>
> Patch 1 adds loongson,ls3a4000-uart as compatible with
> loongson,ls2k1500-uart.
>
> Patch 2 enables building 8250_loongson (loongson-uart) on MIPS
> Loongson64.
>
> Tested on Loongson-LS3A4000-7A1000-NUC-SE with a 25MHz UART clock.
> Without fractional frequency divisor, the actual baud rate was 111607
> (25MHz / 16 / 14, measured value: 111545) and some USB-to-UART
> converters couldn't work with it at all. With fractional frequency
> divisor, the measured baud rate becomes 115207, which is quite accurate.
>
> The patch for the MIPS tree to update the compatible strings in the
> loongson64g-package DTS is sent separately, as it's independant of this
> series and can be applied in any order (the compatible strings there
> still contain "ns16550a", so no regression will be introduced).
>
> Changes in v2:
> - Separated from v1 (patch 1,2): 
> https://lore.kernel.org/r/20260314234143.651298-1-rongrong@oss.cipunited.com/
> (thanks Krzysztof Kozlowski)

For the series:

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks!

>
> Rong Zhang (2):
>   dt-bindings: serial: 8250: Add Loongson 3A4000 uart compatible
>   serial: 8250: loongson: Enable building on MIPS Loongson64
>
>  Documentation/devicetree/bindings/serial/8250.yaml | 1 +
>  drivers/tty/serial/8250/Kconfig                    | 9 +++++----
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
>
> base-commit: 267594792a71018788af69e836c52e34bb8054af
> -- 
> 2.53.0

-- 
- Jiaxun

