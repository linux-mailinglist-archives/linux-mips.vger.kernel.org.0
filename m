Return-Path: <linux-mips+bounces-3810-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A1791164E
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 01:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 408AE1F22296
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 23:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02341514C9;
	Thu, 20 Jun 2024 23:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="amjSPbYL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qxjrTbV8"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F671514C1;
	Thu, 20 Jun 2024 23:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718924757; cv=none; b=JxIsfl2UVub7AQ4WgXZkEkI8j5kaDFm89J5NiVQSq74qs+fa765B5ouHpMFo6a4eR5rfXcZsX5352M+BiL5fET4uEUbMd4naE+zQM5SmsozGOC6FO/4z2gAoMC6FlNTxqUazvGQPI2+8FGxpxj4OOjm5UnX+eRhboFi2T0gIkFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718924757; c=relaxed/simple;
	bh=qBeP3zKgaUNajNc5TuQI9NMG9HHbRrv9VtA7XsDn+cM=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=NbwROaLST8X/R6qvCduJEon9suYxi6IeKATZh9Ne3RJpjtFAeUVEBULwysNx6aqBk0QQ9W7iSf52p2OS17y/JB2xDK5godgu4+i3Na/IcF3GQIw7Mfplruj40zcPJ6B1uZxs+oyRko/6a4T+YC9uSrLANcChUo27CB94elrMtnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=amjSPbYL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qxjrTbV8; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 261961380091;
	Thu, 20 Jun 2024 19:05:55 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Thu, 20 Jun 2024 19:05:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718924755;
	 x=1719011155; bh=lJvwRObkqepJ/eFRhDZJKsA8X9QNkeFY0zl3fB3CH4I=; b=
	amjSPbYLTKM/oFWdZLy/Di3z6NxyLlszXB3ZBeNZRRhi4VSkA4TCFmZLboYFaAxm
	ZTnw8+X3T66xdgF9R+EdwwHZtLl+V73itVYXtRLNsgvpM1Zd04g0OAi2zf3CP52E
	7GMN0tPSRwQoXMsrKS9zhX9XVEJ5B2aswk8Yk0WQpUkV3VqO5U6GYU8sbJvDymyp
	nVZK17byP5zW48YvR33KTghn93NzSxRHYWd1Fm3L2Ir6Z81QhE3DJuGB2YRG2d1D
	dIVxXdjXu/+iFM/sJsObNKQJOecFVzTO82yM3T308KX0B6WuAuzkXlotF5qbWv25
	MT0iefACeAPlNvDn1pSqFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718924755; x=
	1719011155; bh=lJvwRObkqepJ/eFRhDZJKsA8X9QNkeFY0zl3fB3CH4I=; b=q
	xjrTbV8Y0ni+q0sdR2/wZz48LCgvlvbSYhO6G17tX0iaHT7RunPTjKSRnxSMnqoE
	hgYtkT243+DgHSbOOwPhXem4Y/ALulQKBy6GfVdZdrHOjpgx1FmDDJntt8tJW7+V
	Dhb+qxUaLPae0VVGYxm9k3YdLqfYG0+jhMmCUyAU5OMU+yz0jXpCJ4XK4gR7TIjd
	NiLM/oXCN7Dz35xakfVFCOItbtCDWw7pk8hERCROgwavvT7iJ5ilpf7Qh9IXG1oT
	YF3BZl6Hj8iFksd38OjhI5gWSQ1DcF0LfkTmu66fsvypGT3hWsQHVZlHwT7E9dIo
	dTdFql+GaQlXtOYgiGylA==
X-ME-Sender: <xms:0rV0Zrwei8At13GjnKT69g2VROqzGGQbLepcG2Z6NczRndQopadHLA>
    <xme:0rV0ZjQaH55kH5MzhAqBUpN-r9TT9lM-rNkdGx42vP1Ru0pE6baUHhN7H32oLAOUo
    ITFuyEHSL47ecZeXaY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeffedgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:0rV0ZlU4GXy-Qh08Jpqzw3el2o6mY4J564OlimL14cSqDHrEHpYsHQ>
    <xmx:0rV0ZljGmGiz7FbIBtKTYeIvCcJxERG0z2FG14O8B66xnOMmEo4Nog>
    <xmx:0rV0ZtBHozD7EApxq9YHeGK_zX0tC-M5soXaB81e4txiOmSQdoGglg>
    <xmx:0rV0ZuIPsXzD8yDgoN_nQfYi597AyD4WzXs3hUuzlfH1IZx3T4CVTQ>
    <xmx:07V0ZvxQcD7qS6fhLOjfMn7RIol0lbIFDrYoYXicaL7Gk4pDz7rMF_E1>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1EF2136A0074; Thu, 20 Jun 2024 19:05:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <ff6fe06d-6209-4e34-9cc8-eb516fa4ffae@app.fastmail.com>
In-Reply-To: <ZnRtYFr5HFffyK7E@alpha.franken.de>
References: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
 <ZnRtYFr5HFffyK7E@alpha.franken.de>
Date: Fri, 21 Jun 2024 00:05:32 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Aleksandar Rikalo" <aleksandar.rikalo@syrmia.com>
Cc: "Aleksandar Rikalo" <arikalo@gmail.com>,
 "Chao-ying Fu" <cfu@wavecomp.com>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Greg Ungerer" <gerg@kernel.org>, "Hauke Mehrtens" <hauke@hauke-m.de>,
 "Ilya Lipnitskiy" <ilya.lipnitskiy@gmail.com>, linux-kernel@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "Marc Zyngier" <maz@kernel.org>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Serge Semin" <fancer.lancer@gmail.com>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Tiezhu Yang" <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 00/14] MIPS: Support I6500 multi-cluster configuration
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8820=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=E5=
=8D=886:56=EF=BC=8CThomas Bogendoerfer=E5=86=99=E9=81=93=EF=BC=9A
> On Sat, May 11, 2024 at 12:43:27PM +0200, Aleksandar Rikalo wrote:
>> Taken from Paul Burton MIPS repo with minor changes from Chao-ying Fu.
>> Tested with 64r6el_defconfig on Boston board in 2 cluster/2 VPU and
>> 1 cluster/4 VPU configurations.
>
> which existing CPUs can use this ?

Besides Boston are some multi cluster I6500 systems in wild, including F=
ungible F1,
which comes with 52 cores in data panel.

Those vendors show no interest on mainline kernel support though.

>
> Thomas.
>
> --=20
> Crap can work. Given enough thrust pigs will fly, but it's not necessa=
rily a
> good idea.                                                [ RFC1925, 2=
.3 ]

--=20
- Jiaxun

