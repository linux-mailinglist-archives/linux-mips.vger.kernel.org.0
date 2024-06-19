Return-Path: <linux-mips+bounces-3740-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D0890E980
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jun 2024 13:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F0EA2868DA
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jun 2024 11:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1149C137747;
	Wed, 19 Jun 2024 11:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="hb1uWTXz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CSb5RTRB"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A88713B583;
	Wed, 19 Jun 2024 11:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718796809; cv=none; b=FC8FK6zh4tCieYtCWbV5o7kHydsPZ1DzUvJ/hdRFS5Af2vRmR2XmPXF/8pESLvWAAxY/Nzy0/Bsf5Js5FnEO5sHC5RXYyivOVeoQ3doUDmq/c53tQWheqoy+rwajhPCJIULSoF5vo7PNJxG+ksCfwh71HQ+ROxnJ8b80kURyuRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718796809; c=relaxed/simple;
	bh=VWvnmoFIlOj6btiz8Jh00kSCgZVAlN2H0RXQfJabBmo=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=JkpugQmr9IhAqVaE/NUYSdxdsU6Y1ALx7TJ4M18CvXpqiu7hs6DpEe6VSZs9rquRtDxVBWdcestRxoygr3kP60F/bwQ4pendUFws6Zixh8c4HDlJ6NF6/cUmUdPF7NIJjqS2iXG4HL0MVm1KGD9P/p3r23PNyfU3JJysEl3ziWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=hb1uWTXz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CSb5RTRB; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 656A8114010E;
	Wed, 19 Jun 2024 07:33:27 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 19 Jun 2024 07:33:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718796807;
	 x=1718883207; bh=kDIE2Hn4BfwvhYLdbxICkDPcyzDjOxJr9UO616nJz2I=; b=
	hb1uWTXzGe4fI8RqXGly3ydCZUfjdDuyz3YTqPYyiDZopvsqvv3MuwuyHmf4NfV+
	HJAreFvaYQwlMBGuCpQMAWxmFuB6B1x//V+UHvw/HNoFu/Au7E06+fS9kd+DquvH
	3I7JhhrxuBuCT5DHO17Ppobhg/oQoSUObeDV4FqfVW1kUTQRRszOOzmHosG5Utde
	Ak5u1IrxavqTtdU66llP3N57rLYyF9I3wwB4nsSR36AHgcXibBP1mrtUZQ/v7t2f
	ClZpsgUZohCSe/jygsdXbHP7Am4foiInfb6T8jprTiBoiqomkXuQyuPu6AdlPZQw
	ntdHG6N4Q0oVNx2B3M5EOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718796807; x=
	1718883207; bh=kDIE2Hn4BfwvhYLdbxICkDPcyzDjOxJr9UO616nJz2I=; b=C
	Sb5RTRB+vSDqHmDYf96iPx0UWbFzJRUNyYuVSFX0NxdT5kv7B7S86a0xfg/p6LYj
	avPW9YMttvLXaEzbl9uCIEAViEvN6c3odmUsqESuwZtiAS0Docp8FGTtiWnaew42
	TMa+4rwV3kYS4VZrZx4myQKIJu7+xj5QKulqaaHjtZnVtmTscQ3KxGscjC7PAT93
	0xKcscbYckxgqJhISJuruy2Tt3QVKjGb0qk8MndEl4RP1Yh2Jw25MvrzKHrES1CV
	x/Ws6SHhKOnNYhyNRdobuO0qoLvxT41wnsoa54p+tG6y9P/fPIK9OucNxquM38oQ
	JDWNOzVHjZcc37JCFQLeA==
X-ME-Sender: <xms:B8JyZqVwt7lbl9ejfvBpfBKYLdKWhrvCUPgDMr8r78DiLkGNjo_h1Q>
    <xme:B8JyZmlQYRh_jTTGM0LV4PCd3PIAvzb3gALhZygMy7loQGhk6HBbsPyp5IKCMb2fy
    fEI4qYzIcVWFzMqTH4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeftddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:B8JyZubq2fXNzQxjs4OrhA01ZziFUZShK-rGoSnmw5wPX6tWCNgRuw>
    <xmx:B8JyZhUUv7s8w5PdIcnkRi5xP7qePglLICpUU86RV0BPvCN8-BIo7A>
    <xmx:B8JyZkkvBpJ9aNJ871R4sK2SHIRoZ3UBz3RW9NRP9V6ekR-HMXlKeg>
    <xmx:B8JyZmdUUCFatZSQ00_9-3n93yFf5xLVfWxf8kDupuVZJ6fcovpDHg>
    <xmx:B8JyZug_UkH9xDFNumR3Te0Gb9YnFVd1_Gvs2vqnXgdy_WbUU-yfgEwX>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1B53036A0074; Wed, 19 Jun 2024 07:33:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <859402a6-4e31-4029-a6ad-87c3be4d3fdd@app.fastmail.com>
In-Reply-To: <20240616-mips-mt-fixes-v1-1-83913e0e60fc@flygoat.com>
References: <20240616-mips-mt-fixes-v1-0-83913e0e60fc@flygoat.com>
 <20240616-mips-mt-fixes-v1-1-83913e0e60fc@flygoat.com>
Date: Wed, 19 Jun 2024 12:32:50 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH fixes 1/4] MIPS: mipsmtregs: Fix target register for MFTC0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8816=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=E5=
=8D=882:25=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> Target register of mftc0 should be __res instead of $1, this is
> a leftover from old .insn code.
>
> Fixes: dd6d29a61489 ("MIPS: Implement microMIPS MT ASE helpers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Hi Thomas,

I saw you sent mips-fixes_6.10_1 pull request but this series is
not included in that PR while one of my later patch is included.

If you think the whole series is not fit for fixes tree then please
at least let this series go through fixes tree. There are many MT
users for routers etc and I don't want to risk break things for them
in linus tree for too long.

The patch itself is obvious.

Thanks
- Jiaxun

> ---
>  arch/mips/include/asm/mipsmtregs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/mips/include/asm/mipsmtregs.h=20
> b/arch/mips/include/asm/mipsmtregs.h
> index 30e86861c206..b1ee3c48e84b 100644
> --- a/arch/mips/include/asm/mipsmtregs.h
> +++ b/arch/mips/include/asm/mipsmtregs.h
> @@ -322,7 +322,7 @@ static inline void ehb(void)
>  	"	.set	push				\n"	\
>  	"	.set	"MIPS_ISA_LEVEL"		\n"	\
>  	_ASM_SET_MFTC0							\
> -	"	mftc0	$1, " #rt ", " #sel "		\n"	\
> +	"	mftc0	%0, " #rt ", " #sel "		\n"	\
>  	_ASM_UNSET_MFTC0						\
>  	"	.set	pop				\n"	\
>  	: "=3Dr" (__res));						\
>
> --=20
> 2.43.0

--=20
- Jiaxun

