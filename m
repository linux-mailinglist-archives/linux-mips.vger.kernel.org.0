Return-Path: <linux-mips+bounces-6560-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 871E59B61F4
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2024 12:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45D2628176E
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2024 11:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A561F1E765D;
	Wed, 30 Oct 2024 11:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="b3mMI8Ei";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q6f4hN1U"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137E71E503D;
	Wed, 30 Oct 2024 11:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730288137; cv=none; b=e9WaVRL5FGs0tyReLPmuqDgYSvN97Y/nR2PgEUeKg22FctbSmZvAFrsfZe3lf4TRXjM8Iviy6uZO6FM3kwk0TTmejdnl38PMol/5hxbt575EMD2TR0KXK6O5kArDwdiPgMwLhiSxWo7Dt4pmH+3hquJadJ1oHocEOj/27ywiQyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730288137; c=relaxed/simple;
	bh=4/HKLoMnJL8VA9tvsnVG9JT+o9c8eutbm9zGxEnDrZg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=HDinVZ8dGIUt+jFmfcMwn8F1cZQTClfEpSnzHJc7zsUPap03Dshoe0edtlfvP4zWr0YuRCPl59nQBPqWOCm+lrA5nXPOErnnhPhjsKSWvx5f4XlJF+0LdDwhJQz3KtLuA1JpIbjluFW3t0Tw1Ybcu+Pi3DhYkBj+jWEDVuEGunw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=b3mMI8Ei; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q6f4hN1U; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E1E2811401C0;
	Wed, 30 Oct 2024 07:35:33 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Wed, 30 Oct 2024 07:35:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1730288133;
	 x=1730374533; bh=4/HKLoMnJL8VA9tvsnVG9JT+o9c8eutbm9zGxEnDrZg=; b=
	b3mMI8EiwX1EQSUDrhzYECAeYrO2osrE/TNW54w7UpUvuTsv8X7zs6tsb46nWGFQ
	dWbySYriIN4A7XpJJSmWlin1Q8VT2qoqJz5vX2xzlDVU298VQEjxT1cbRSwW3zrS
	zcufY1SrmCCImxx3su8zUnWmtgS60H29lebOg7WovjHiMIx2pLUR1uSvU1nIZ3BV
	rKg5/oTf242FAlLUGggg8ayTm0hcPHz8cZJ9vk2nP6FxkeF+4EzN67EZ3TLY+Y0S
	EDQhzVG/rLFUSLp5ftqp3kMGFm/fOer5XwnXe/LN0ZyvicILn9D8/4XXuzikSGBQ
	fGrq0XS/lAdZLGWfkgKR0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730288133; x=
	1730374533; bh=4/HKLoMnJL8VA9tvsnVG9JT+o9c8eutbm9zGxEnDrZg=; b=Q
	6f4hN1UjYgw2oVuViUqZXOJzUYY2vojdL1spPgO4UZQ7dRGlcf99nzefijQ55pLk
	X8bXoixmF4c9I8nZG5ySWcWlRRCTqYdr6xWqR3fn6w4fXg3oaCdamtvIHVIg3E2P
	O+92T5Fx+kwE7FWUBvVbrkhSMruuCH8NUiNROcaCwSxgnxszObd9ffpyEu7z6Cv+
	o4vw05b9ot/v0VzPCV/ipoyFyC7IDz8EyRwKWqX79lh6ydyn32c0CEwn9DkGtqAk
	lImWz5ZZR5QI4RREoTRJdbSkIxQjUn3s77xQcdEnUvZnM7TvffCU1lB/9zA9glGC
	FJpkB9yf5w/7NahL2fjAQ==
X-ME-Sender: <xms:BBoiZw4V106WuRGLxj6HHDFCr0ZbY51jWHrNvxbRzpphg9YCNa5C_Q>
    <xme:BBoiZx6nXKP8hJMAd1haSnLETrQ2XCXrajk-OEprdELnBux_BOpnXkPG_geAZE7oT
    9VOQ9SxsOjBnAtokNU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekfedgvdelucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:BBoiZ_dzoNfBS8LQKXBGKSZygeTWuvrWcWmovj9208UCgP3DQ7Jhvg>
    <xmx:BBoiZ1K2GFZd9yXr7GlynTS02fhYVF41S6f3Sh63wZCOrWm986paJQ>
    <xmx:BBoiZ0IRL0ga6IujUSv3jlO7W7NI2X1WDwxxEadcs2Oz02kgDd_vtg>
    <xmx:BBoiZ2xBSquYgNtrXL4Q8o3mhep5l_9y8q6HzcWTzLU9c8jhnb2RGQ>
    <xmx:BRoiZxZ-SfabdBvmD9Nsm-zY4i02rCtKGXDpcrC_xWiIxUXzdCGjuRUn>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A884A1C20066; Wed, 30 Oct 2024 07:35:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 30 Oct 2024 11:35:09 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Aleksandar Rikalo" <arikalo@gmail.com>,
 "Gregory CLEMENT" <gregory.clement@bootlin.com>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 "Gregory CLEMENT" <gregory.clement@bootlin.com>,
 "Theo Lebrun" <theo.lebrun@bootlin.com>, "Arnd Bergmann" <arnd@arndb.de>,
 devicetree@vger.kernel.org,
 "Djordje Todorovic" <djordje.todorovic@htecgroup.com>,
 "Chao-ying Fu" <cfu@wavecomp.com>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Greg Ungerer" <gerg@kernel.org>, "Hauke Mehrtens" <hauke@hauke-m.de>,
 "Ilya Lipnitskiy" <ilya.lipnitskiy@gmail.com>,
 linux-kernel@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "Marc Zyngier" <maz@kernel.org>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Serge Semin" <fancer.lancer@gmail.com>,
 "Tiezhu Yang" <yangtiezhu@loongson.cn>
Message-Id: <378f8b70-12d9-4ec3-a1e5-35bd992bfc90@app.fastmail.com>
In-Reply-To: <29d7688e-5fac-4821-8764-bdc760112370@app.fastmail.com>
References: <20241028175935.51250-1-arikalo@gmail.com>
 <20241028175935.51250-11-arikalo@gmail.com>
 <avz4crm2yrk3fg7r4qxkgkt3ka5hmk54v2wtcms453tsnewu5w@jzjxmyd4b7yg>
 <CAGQJe6p6QgSQKByVQ8G+HpWbdEHnfNb8vRureOrS2VZa6Lk74A@mail.gmail.com>
 <29d7688e-5fac-4821-8764-bdc760112370@app.fastmail.com>
Subject: Re: [PATCH v8 10/13] dt-bindings: mips: cpu: Add property for broken HCI
 information
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B410=E6=9C=8829=E6=97=A5=E5=8D=81=E6=9C=88 =E4=B8=8B=
=E5=8D=884:11=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> =E5=9C=A82024=E5=B9=B410=E6=9C=8829=E6=97=A5=E5=8D=81=E6=9C=88 =E4=B8=8B=
=E5=8D=8812:21=EF=BC=8CAleksandar Rikalo=E5=86=99=E9=81=93=EF=BC=9A
> [...]
>>
>>> Is this property applicable for all MIPS vendors? There is no vendor
>>> prefix here, so this is generic for this architecture, right?
>
> I'd say the best vendor prefix is mti in this case.
>
> CM3 IP block is supplied by MIPS Technology, it is not a part of MIPS
> architecture spec.

I just tried to revise this problem and I think a better approach would
be picking my CM binding [1] patch and add this as a property to CM bind=
ing.

You don't need to pick rest of that series, this binding alone is suffic=
ient,
and it's already being reviewed.

Thanks
[1]: https://lore.kernel.org/all/20240612-cm_probe-v2-5-a5b55440563c@fly=
goat.com/
>
> Thanks
> --=20
> - Jiaxun

--=20
- Jiaxun

