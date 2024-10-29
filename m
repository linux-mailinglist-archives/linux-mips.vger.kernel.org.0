Return-Path: <linux-mips+bounces-6549-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B28D39B4EFE
	for <lists+linux-mips@lfdr.de>; Tue, 29 Oct 2024 17:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EE3CB22380
	for <lists+linux-mips@lfdr.de>; Tue, 29 Oct 2024 16:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB741196455;
	Tue, 29 Oct 2024 16:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="CDfsBoEK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kJbvswg/"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871C8195B18;
	Tue, 29 Oct 2024 16:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730218332; cv=none; b=Vt1DYh2SiQhNwCI7gtqhRoEjqCwvqtGIgc8cWRlQI1FVH4nwGexVMSC8hizQjbE55o9OyaJ3nr16qYQSZ/FSG7IG7TgsFv0EqMivVKOxXAz+6tyrnE3qcf9Hs45/YPFz7j5yJc2R+pLZYpD5jgejJEfKrrLf/fZ+7sAzVmgkAhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730218332; c=relaxed/simple;
	bh=TpJp6p7V3SNnKwBuLypm4oC1yStqNcTqr9TaOaspTLo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=R3DQR1ObpN8HLcLj/9UJepbJAExNQAuIFPBQtWHiNU4bEb5rM+oMYw95GC9AMH5IQCiEnhU2J/L2bd4I4mrHddjdj3F2vHeuSb2IZmubk/FIG4Y6LiM4Kd8oRkdGjW13poze9WzBXPc3oSDUFE8Bg740R4Rbz5x9Hni8wFQ7usQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=CDfsBoEK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kJbvswg/; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 7D0F41380456;
	Tue, 29 Oct 2024 12:12:09 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Tue, 29 Oct 2024 12:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1730218329;
	 x=1730304729; bh=TpJp6p7V3SNnKwBuLypm4oC1yStqNcTqr9TaOaspTLo=; b=
	CDfsBoEK8nkuKoEHcgtArT8WMkS33qVYIUmUdUbL/T3e3o+5ytXmmdke0G86Nkyb
	XfZdNLDwGfCDB7sRiKsjj25nKRiEW3Bgc15VYp2K+FXc9f5Jw7pM63uQxw1eBjED
	Rg/KQoDAVB9aOEOCk8MbNlJ4t0/3GVShqJmFSmQYHa5nvE/Ggz1XJCGa/FHNiId0
	hdi80dnlk7duRR3WNotlvLMf5eIB7VtWApJpZKui2chkY+nmYzmN9UOzAdLfKOY1
	U9PS8izWvYi7xzAcp5U8EtTjWfwAwahZVpvScDR4hUWZ0u0r0I+jBPz6JubeW82X
	0HGiprSGENPRwG3hlnTDUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730218329; x=
	1730304729; bh=TpJp6p7V3SNnKwBuLypm4oC1yStqNcTqr9TaOaspTLo=; b=k
	Jbvswg/piM/vErB87Ot7hdCZvZhadBYeE28QxBP5SZpnpzveKu7ljAvZ55xpjeXV
	QV3IzLxqibuXOMDdsNVyOsIcv5WyBrQGmzJ5Fuy42y2fUMOvpa9gM5jDlTVN0bhQ
	3FvHm+0BoCEJiJdGXdzcW4YTmO5UBHVufYdzfm7FjjgWm6WdZ2Omn0M7oU4byEFN
	BLHtb0sAkn2BUt7ketAunHHCUfE6PtzOKEVZmSHsPrK4YzGcPwNblojbjKqiIPJx
	ADztp42nN+R3fVMUMwvlu9lGOWyF1TsKLrelJI5WapAius9pLNaY1zmPpaE5e1N5
	BmdKFKvnNuQLNIU/8n91Q==
X-ME-Sender: <xms:VwkhZ7PKbKHcKF1d1-nkIZrxrVDPu_NVtuxO9b2o-Usl5oIg4XM28g>
    <xme:VwkhZ188adgnhyHmTkN5Rd4w70hxQLUS93smtGp8gGQW_2GFe6v9YtOmVFqYxfMIW
    i_o84-oDR_1eLqf0YM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekuddgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeehfeduvddtgffgvdffkeet
    hefhlefgvdevvdekuefffeekheehgeevhfevteejnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgr
    thdrtghomhdpnhgspghrtghpthhtohepvdehpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthht
    oheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmh
    gvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhvghordhlvggsrhhunhes
    sghoohhtlhhinhdrtghomhdprhgtphhtthhopegrrhhikhgrlhhosehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepfhgrnhgtvghrrdhlrghntggvrhesghhmrghilhdrtghomhdprhgt
    phhtthhopehilhihrgdrlhhiphhnihhtshhkihihsehgmhgrihhlrdgtohhmpdhrtghpth
    htohephhgruhhkvgeshhgruhhkvgdqmhdruggvpdhrtghpthhtohepughjohhrughjvgdr
    thhoughorhhovhhitgeshhhtvggtghhrohhuphdrtghomh
X-ME-Proxy: <xmx:VwkhZ6RmALLj5oeFhWf4mQVJnfbwcaApljN0Uy4Vmo8VR_6LPoKIfA>
    <xmx:VwkhZ_t3dkJ_xV8QJ-7tKzBB-V0K2tXHiRPrLhjQ8I8xWrJjqvuM8w>
    <xmx:VwkhZzdc5D1u2s8dRfYU9apdXURBCWvSm9vrpVSDH0e51L0u6pymZw>
    <xmx:VwkhZ71Jr7rTxi5TE6A8NBqKbC-XFTxfMNq_SZmEh5PKraB8TfNMPA>
    <xmx:WQkhZ8tq829LAHj7w0wBBte-M359hxF8FTwj0F-Vjy1uc_ZZSf-37-qR>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 707BD1C20067; Tue, 29 Oct 2024 12:12:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 29 Oct 2024 16:11:47 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Aleksandar Rikalo" <arikalo@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
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
Message-Id: <29d7688e-5fac-4821-8764-bdc760112370@app.fastmail.com>
In-Reply-To: 
 <CAGQJe6p6QgSQKByVQ8G+HpWbdEHnfNb8vRureOrS2VZa6Lk74A@mail.gmail.com>
References: <20241028175935.51250-1-arikalo@gmail.com>
 <20241028175935.51250-11-arikalo@gmail.com>
 <avz4crm2yrk3fg7r4qxkgkt3ka5hmk54v2wtcms453tsnewu5w@jzjxmyd4b7yg>
 <CAGQJe6p6QgSQKByVQ8G+HpWbdEHnfNb8vRureOrS2VZa6Lk74A@mail.gmail.com>
Subject: Re: [PATCH v8 10/13] dt-bindings: mips: cpu: Add property for broken HCI
 information
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B410=E6=9C=8829=E6=97=A5=E5=8D=81=E6=9C=88 =E4=B8=8B=
=E5=8D=8812:21=EF=BC=8CAleksandar Rikalo=E5=86=99=E9=81=93=EF=BC=9A
[...]
>
>> Is this property applicable for all MIPS vendors? There is no vendor
>> prefix here, so this is generic for this architecture, right?

I'd say the best vendor prefix is mti in this case.

CM3 IP block is supplied by MIPS Technology, it is not a part of MIPS
architecture spec.

Thanks
--=20
- Jiaxun

