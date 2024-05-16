Return-Path: <linux-mips+bounces-3282-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC59A8C7635
	for <lists+linux-mips@lfdr.de>; Thu, 16 May 2024 14:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45E4B1F21728
	for <lists+linux-mips@lfdr.de>; Thu, 16 May 2024 12:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98432154450;
	Thu, 16 May 2024 12:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="ef1CKfoP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VB0i3Ao2"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh4-smtp.messagingengine.com (wfhigh4-smtp.messagingengine.com [64.147.123.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE71153BE6;
	Thu, 16 May 2024 12:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715862105; cv=none; b=lD2ubQl6Khx7ESEXxTjOlMCGVbDvZYf8S7/ap2XjG2qT4n6Ytv+s/Ch8lk/aU3/9QY1Htd5M+hHSZ130MvYxEmg0oFBgzFLCK5IbUJ9CE60PpD+D7+pcVliZNjmJtizIlJbHFhHNdY0KDekOwvzX4x1Ys3sScJvvxX2pLO0QGVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715862105; c=relaxed/simple;
	bh=+7BssTnv+68bOZ5q3ot0qiGsFLEAd90nuvdNZe0Rb0k=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=S1TmefupnZf+kSVITMDffB+oir1UrBGVnYtUenIUbWBqjg542/1W2JHGcL+/qx6nM4T2+T4zZUN7bl3PIoulvPgHVijq1NSElZfUmHH04sNgGAc8NV0/J1qgKubqlcp6T1p/WVtrBZwGxLjlGX/gu4HDvf71JzqErFR+gZktMGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=ef1CKfoP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VB0i3Ao2; arc=none smtp.client-ip=64.147.123.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.west.internal (Postfix) with ESMTP id 345B718000DC;
	Thu, 16 May 2024 08:21:42 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Thu, 16 May 2024 08:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715862101;
	 x=1715948501; bh=JB07t7U92/Km9cn+2ZZDcWR+tE9Cc5bAKmiQUlEOVO8=; b=
	ef1CKfoPHAZFHIER7HGdOtz5L2VPfBDiBBAxao3eZcx/EBeZ1tyiHW+swv8xljOB
	Z+ir3Icedkhgb+vTnVS9UK2/SaImNn+NWTrI4tV8gu8OvVh+ZBPwo3Oz4EZRZ+Yc
	WI7Lhpqz1MscSghkOxwVK9ro8OqDHyK8QACTCPGsMm5gj+gxDcnHpSCfKjwQMeAh
	D8kAfvu21KLLlpifCX745G0610rQq43ENWr8Bo/iOp8byI1CIEiDjDd+kfIsrOuy
	dGdcS2VLnHypIIhJIoin6udxCmo/xapAb3UtTdC8nStCWeJC48LX+6WoVtTXtI19
	aFDkJnzPQbDjzLKeJ7kjOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715862101; x=
	1715948501; bh=JB07t7U92/Km9cn+2ZZDcWR+tE9Cc5bAKmiQUlEOVO8=; b=V
	B0i3Ao2I/fonGzBEezRNwModrgAEfWc9we1yyKhn1v70JA1WiVvape/HlDrJPNia
	8WkLzd5DnkpPY8TFi9Nh5C6W8uY1auFY1Jpc0A7JpYTv1aXIX2/9tbRaWr7Gh8vG
	0fuPbLsulnFREXnvefYkMJvlE/wtTQWHPco85aKLRMgKVYfYDFJjq2YR71s3lPeJ
	X6Nnxz3QcZfgIEGnLj1FaI+KxyzhI7MeXUH7fxPdEq5MrECovUScj/smucb46gS5
	74KgfCwXYaqxVD0VHM7cDY/H8+PzD24klysiuuho7xC3oTalSGLpxixeJG1pJvzn
	wDTbMTOGQzpgJlwhANr6Q==
X-ME-Sender: <xms:VfpFZvvDYTyA8bI9a1dUTKheIHJ6636V5DFHwzFhsocJsYcorukb0A>
    <xme:VfpFZgcQDikCMnDGf1wE9imBHfKBN8AnuIeOuLraCXRgSyH5qMw6Xsq35Q0Oz4QDI
    0HNUZ3JgmHqs4PA2ys>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehuddggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeekleevffehtdeigfekfefhffdtudffvdeuvedtffet
    heeuiefhgfetleekleekjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdih
    rghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:VfpFZix1N-0j7uNInqGUkVdfa82zBRv_A_xpm6wyLSEx2toXkMI6Mg>
    <xmx:VfpFZuPXVUWdgQYTFEVj5gmo7Z9gB0lfFLXvIKqJWzagZ0U1RP3arw>
    <xmx:VfpFZv-hCsEh7LI2m7jKEwcaGTGDQUYkmSKjp2NcRuvrDXE7EamfaQ>
    <xmx:VfpFZuWvDLkxWV6GNcBkuaHZw4Y--L0BeOKpEO6_YDfo9rRosCYAWA>
    <xmx:VfpFZgOqR165Rzyw1NwC-D10rgIBRmuyyP_AyCNdjJFYssPlabB-QlQe>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E729636A0074; Thu, 16 May 2024 08:21:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-456-gcd147058c-fm-hotfix-20240509.001-g0aad06e4
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <e2611415-410d-4b0d-bc35-604d08601b45@app.fastmail.com>
In-Reply-To: <20240516115906.1224164-1-zhanggenjian@126.com>
References: <20240516115906.1224164-1-zhanggenjian@126.com>
Date: Thu, 16 May 2024 13:21:22 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: Genjian <zhanggenjian@126.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Huacai Chen" <chenhuacai@kernel.org>, ricardo@marliere.net
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, "Genjian Zhang" <zhanggenjian@kylinos.cn>,
 k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH 1/3] MIPS: Loongson64: include asm/bootinfo.h
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B45=E6=9C=8816=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8B=E5=
=8D=8812:59=EF=BC=8CGenjian=E5=86=99=E9=81=93=EF=BC=9A
> From: Genjian Zhang <zhanggenjian@kylinos.cn>
>
> build-warning is printed:
> arch/mips/loongson64/dma.c:25:13: error: no previous prototype for=20
> =E2=80=98plat_swiotlb_setup=E2=80=99 [-Werror=3Dmissing-prototypes]
>
> Include the header to fix it.

Duplicated with my patch[1], but thanks for the patch anyway.

Thanks
[1]: https://lore.kernel.org/linux-mips/20240507-loongson64-warnings-v1-=
2-2cad88344e9e@flygoat.com/
>
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: Genjian Zhang <zhanggenjian@kylinos.cn>
> ---
>  arch/mips/loongson64/dma.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/mips/loongson64/dma.c b/arch/mips/loongson64/dma.c
> index 8220a1bc0db6..5c5e524b9121 100644
> --- a/arch/mips/loongson64/dma.c
> +++ b/arch/mips/loongson64/dma.c
> @@ -3,6 +3,7 @@
>  #include <linux/init.h>
>  #include <linux/swiotlb.h>
>  #include <boot_param.h>
> +#include <asm/bootinfo.h>
>=20
>  dma_addr_t phys_to_dma(struct device *dev, phys_addr_t paddr)
>  {
> --=20
> 2.25.1

--=20
- Jiaxun

