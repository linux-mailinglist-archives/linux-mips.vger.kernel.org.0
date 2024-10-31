Return-Path: <linux-mips+bounces-6582-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDDF9B7E78
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 16:30:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C22D4B20BBE
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 15:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775081AD3E2;
	Thu, 31 Oct 2024 15:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="mfATYHeA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WNkWd6CZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A9D1AA78A;
	Thu, 31 Oct 2024 15:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730388481; cv=none; b=N+1vtredhwYOZFM5v99aQkLT9iQhcL0FyfDoLQ0doIW+Xr9hFnEKWrTPqCwPtj46w4bFWxHrIrS4eyd8RxoHKl33kiC5F51QkK3zVsX/ipewe3iUkgoAXA46GfJA7/d/630dBA4xHftFl3mbtr7vt+L/UM6Jd0IMKb39Fstc6xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730388481; c=relaxed/simple;
	bh=FFnkpUkeYDOwZzYiHo/XaNcW7ZzaQbeq1qc6E1nWVfI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=JocUsnu0a9ikf9vnO7dKLjzPCzuGHDg3n60vJii0Bxmu9aKzXm51H1ooeT8PypWsebHl6lOY2eHIkPqCL+0iDIiVqVQUCmQPOtUsdB/cRRQHw5/fx+gwFKpgu0iooPe7Mfi8ZjkI1rUnCYI5cyifOesYIwIZq3wa68huDTFQKmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=mfATYHeA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WNkWd6CZ; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 5E99A1140150;
	Thu, 31 Oct 2024 11:27:57 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Thu, 31 Oct 2024 11:27:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1730388477;
	 x=1730474877; bh=8NT/zeipVJAQ1j6Mvgvp7SYDePxtzffTJM/cWBWgyy0=; b=
	mfATYHeAH8Fo6MMm7bXXyA5YCG9TP7FSRrbYQu/qTgzzivGbJ10Q5ImrDcas2RsW
	AgD1YqrdhxpDWj0DjUOXNr4MKLaY1ZSJfdBYUm2AZMg+GuTEH5LYFg4m3efBJCqG
	V+T8N/RbENutbkOZ2Dveqy64iWlVYY9kAZGGNtD/RnQEQYAarcc+zfoltUZHcaxh
	IN80gQgEr3vszx54wkK1IQYiiNQVqP4aC/5JLodkGAM/MNb8WLInTVpUfM+jHAWH
	KitdflPXQlWw7lhQ87Ab0k1C4WJg7NNnEBqHUoWDTm9VQ7RGlmvVUpoyZq6CqyEQ
	ybo1qydAx9Qnm6XT9HTV7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730388477; x=
	1730474877; bh=8NT/zeipVJAQ1j6Mvgvp7SYDePxtzffTJM/cWBWgyy0=; b=W
	NkWd6CZ/EuJsOhIBNnJY8uDfsAFsUciijS20SsuML1TaCFdg/uYZPZdmUeXq37QD
	ooTRNhRFLVNSQxOu+k3Bx/B9Q35TP7H3NY9oKmfTyYnLQ8Hf9/YMVg9h4SN4/WLr
	Q988WvNA1copXWeB/MW+COABp7k5G4P7RWDTFUbeRT2tYzUU/9XfYGyk0VeC/i+L
	hEQN9dYCTNrHP1gsPoj0pp/UY3nS4+L9Qrf0f7jVyWEUJgqeOqzA3RI4/SmTRKoN
	9+r2dlsBCwConlk7ThwW5QwSy3pUalDS6uVCPagw8q9UW759ZavDMdsZT8xyYiie
	hDgfEjkK9+yVTlWEEW2Cg==
X-ME-Sender: <xms:_KEjZ1cnbEdWQVKLaAEU1elqmh-pibWTiFSgHpVCjcFeQhHZlnIQEg>
    <xme:_KEjZzMGj5JKLYpCdB0Hh-cQuwBxETYtP7d3VJ6mwpeMtik73gXAoaP0-773CDAfk
    bemQAO1JIG5JIaHVLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekiedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepffekveettdeuveefhfekhfdu
    gfegteejffejudeuheeujefgleduveekuddtueehnecuffhomhgrihhnpehkvghrnhgvlh
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphhtthhope
    dvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhssghoghgvnhgusegrlhhp
    hhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpd
    hrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdp
    rhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpth
    htoheprghrihhkrghlohesghhmrghilhdrtghomhdprhgtphhtthhopehfrghntggvrhdr
    lhgrnhgtvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhlhigrrdhlihhpnhhith
    hskhhihiesghhmrghilhdrtghomhdprhgtphhtthhopehhrghukhgvsehhrghukhgvqdhm
    rdguvgdprhgtphhtthhopegujhhorhgujhgvrdhtohguohhrohhvihgtsehhthgvtghgrh
    houhhprdgtohhm
X-ME-Proxy: <xmx:_KEjZ-jN287K8_mGWNFYobwgKKjENA0HK-zzQjV9PRwgE5brak6ISA>
    <xmx:_KEjZ--HWNVs5tgbG2sJS5F9jw448ySHEHjzqhcRNEtH0u19xc7cJA>
    <xmx:_KEjZxtfai82L7U_DXNBS3zOOjGbpa1_RM1Nx-K2OfShd4IpXWvI9w>
    <xmx:_KEjZ9Fch1nR_iDKExnzJ34o97HTsuAiOGZi0Npjb6SQfmeEp_3yjA>
    <xmx:_aEjZ6sLigazsfbiNRfRwCWpm2sO7OR_nY6fcQtc0NnWQpTVB55Fdbvp>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 475381C20066; Thu, 31 Oct 2024 11:27:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 31 Oct 2024 15:27:36 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Gregory CLEMENT" <gregory.clement@bootlin.com>
Cc: "Aleksandar Rikalo" <arikalo@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 "Theo Lebrun" <theo.lebrun@bootlin.com>, "Arnd Bergmann" <arnd@arndb.de>,
 devicetree@vger.kernel.org,
 "Djordje Todorovic" <djordje.todorovic@htecgroup.com>,
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
 "Tiezhu Yang" <yangtiezhu@loongson.cn>
Message-Id: <edd455ae-a5f5-4898-ba42-23526a27ec62@app.fastmail.com>
In-Reply-To: <ZyOXcrS/7txCQU3B@alpha.franken.de>
References: <20241028175935.51250-1-arikalo@gmail.com>
 <20241028175935.51250-11-arikalo@gmail.com>
 <avz4crm2yrk3fg7r4qxkgkt3ka5hmk54v2wtcms453tsnewu5w@jzjxmyd4b7yg>
 <CAGQJe6p6QgSQKByVQ8G+HpWbdEHnfNb8vRureOrS2VZa6Lk74A@mail.gmail.com>
 <29d7688e-5fac-4821-8764-bdc760112370@app.fastmail.com>
 <378f8b70-12d9-4ec3-a1e5-35bd992bfc90@app.fastmail.com>
 <87jzdoadve.fsf@BLaptop.bootlin.com> <ZyOXcrS/7txCQU3B@alpha.franken.de>
Subject: Re: [PATCH v8 10/13] dt-bindings: mips: cpu: Add property for broken HCI
 information
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B410=E6=9C=8831=E6=97=A5=E5=8D=81=E6=9C=88 =E4=B8=8B=
=E5=8D=882:42=EF=BC=8CThomas Bogendoerfer=E5=86=99=E9=81=93=EF=BC=9A
> On Thu, Oct 31, 2024 at 09:13:57AM +0100, Gregory CLEMENT wrote:
>> Hi Jiaxun,
>>=20
>> > =E5=9C=A82024=E5=B9=B410=E6=9C=8829=E6=97=A5=E5=8D=81=E6=9C=88 =E4=B8=
=8B=E5=8D=884:11=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
>> >> =E5=9C=A82024=E5=B9=B410=E6=9C=8829=E6=97=A5=E5=8D=81=E6=9C=88 =E4=
=B8=8B=E5=8D=8812:21=EF=BC=8CAleksandar Rikalo=E5=86=99=E9=81=93=EF=BC=9A
>> >> [...]
>> >>>
>> >>>> Is this property applicable for all MIPS vendors? There is no ve=
ndor
>> >>>> prefix here, so this is generic for this architecture, right?
>> >>
>> >> I'd say the best vendor prefix is mti in this case.
>> >>
>> >> CM3 IP block is supplied by MIPS Technology, it is not a part of M=
IPS
>> >> architecture spec.
>> >
>> > I just tried to revise this problem and I think a better approach w=
ould
>> > be picking my CM binding [1] patch and add this as a property to CM=
 binding.
>> >
>> > You don't need to pick rest of that series, this binding alone is s=
ufficient,
>> > and it's already being reviewed.
>> >
>> > Thanks
>> > [1]:
>> > https://lore.kernel.org/all/20240612-cm_probe-v2-5-a5b55440563c@fly=
goat.com/
>>=20
>> I had a look at your series and it seems that all the issues raised w=
ere
>> solved, so why wasn't it merged?
>
> https://lore.kernel.org/all/2xkut5pyzk4b4ugl4ku72y4rfqrfsoxj4aww2jwlgk=
c3lmd464@zwf773fr7fpq/

Yes this is still pending.

My FPGA boards are constantly breaking down so I=E2=80=99m on radio sile=
nce recently.

Sorry for the confusion.

Thanks

>
> so it's still unclear to me, whether there is something to fix or not.
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

