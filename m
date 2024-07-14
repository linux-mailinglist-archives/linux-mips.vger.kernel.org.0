Return-Path: <linux-mips+bounces-4319-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD507930860
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2024 05:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E6FE1F2163A
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2024 03:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55DEC9474;
	Sun, 14 Jul 2024 03:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="r3g81ryr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fX/sK69G"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF58525D;
	Sun, 14 Jul 2024 03:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720926200; cv=none; b=MUWrJXok42IY65td4n+znXIaTYy47uoC0IV9Snvf25y48XEW62FdqeQ+0/z2m3eWJKoSObbSshFPgCwaHys4Ia+YsYDd8JUHdK+6ZT4A7l9mOkPjkk0QPyU0KT61pF1oXVM2P94BceCbEHNVf4HTJTl4rMCoOWycy1oXY9NTPh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720926200; c=relaxed/simple;
	bh=HxauR58UZaVIjAqJUdo2q9eObUNQiVhVxTJ82MyF6no=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=qRbM/r+7LZxCN3jUKFj5ETQxuwuo368kijCWc6HFijWjuKWzz8CIUgDEyc+7rzgvvmbGqHSO3yVfapH2b+KVOxOQjbcHrQO2sRDi/A2aA7dC+G7JB4THucI/Vq9ea1oAz1bbkgFUkgIOpmrGI/QRl1Ty+dSG0HrnK3R4YcAxB3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=r3g81ryr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fX/sK69G; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id BB0CB1140E75;
	Sat, 13 Jul 2024 23:03:17 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Sat, 13 Jul 2024 23:03:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720926197;
	 x=1721012597; bh=HxauR58UZaVIjAqJUdo2q9eObUNQiVhVxTJ82MyF6no=; b=
	r3g81ryrQ8nwqkX1EauvnXOaDfwO+FyuHmNi9bYnSl1Xyyxjmlv/W7zxlUEH1rhE
	zF829edSxMSFkR8Q1KVyISx5DvTTla2t7O/WWmWsNhDz7qbSYc9g+Sav0kGzZF+o
	NcBjkWFmz8QS33l23Z9gTT5mEATaOe+wheuyKVYCFIish8hYPIulg9Fp9NEWWIKH
	gS4X1ZOyuv30/s0rt3kC+U1VtUZGeq7ZvkCb/F5GPTR3FYar31VzBRHyoit1n2NR
	9X8bwK6pVbGFzI8hIQAmoBBRdqVz1j0YRNVJNpqBFWwQraxlXmgBv8o8axjGgvhg
	1MPTfnOxYwdSpTXc6kbqxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720926197; x=
	1721012597; bh=HxauR58UZaVIjAqJUdo2q9eObUNQiVhVxTJ82MyF6no=; b=f
	X/sK69Gy2XsQmKaSjjJcjun0zVSbwSWOOiTBF46qXwMBbrxBXXVbrJr/djK3j3bz
	3ugi6hPNd637oO9UlGXqjs9OGki0sbsZKHipPaP9PgByrajmvb0P23xZlMI+iAzG
	UkVrepGbSt1yZDAWGT32hr0wgMfi0Y7GyPABxCdekAk2PLWj5IxkyBmyEWLydWdw
	QuMumVJxCskrV4NTgT5dlKwYabIzlwTXdFtYJkvw6hJp3FD84Ck81Rql4Tq9oxWB
	yyvgwusXKOXITxXyvg6v2aeeULv1l1YprKI/axN95AZt8idGf34lHmDqQaiho+Ia
	oQPS7ZCvF5ERVbc6Cyt9A==
X-ME-Sender: <xms:9D-TZoxdJHyQRqi59dKDOOvVFLdXds3CRorOoJQKIuSYqTEgoK_y7Q>
    <xme:9D-TZsS4jXRMej67TbURlklPeXzviENMYpdS7neZf7CKx9oVdI1uIYf5utV023XDO
    CiLWZUrK-aj3l4FoOE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeelgdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepkeelveffhedtiefgkeefhffftdduffdvueevtdffteeh
    ueeihffgteelkeelkeejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:9D-TZqUbaDht29KmYecOseFHrogOFoFWywLEnyOq-jaiG6X2ieUmXw>
    <xmx:9D-TZmhvKWRk4ivzzJVAKuc6QC-17jqGDj5pshFEen3zEs3K3xdD6g>
    <xmx:9D-TZqCj3_9_YI73AvC-6Db0lFTtwKZQSjKlowAGnIbjjZ7fzZNjFw>
    <xmx:9D-TZnIHofeMuWU14ylfbqeqgHywptowS2Yq1pcrdIfNJX-INCzWxw>
    <xmx:9T-TZlMphLbXlIInutquBYgN4OKkJBOC0iizyspHGHDp2n3Y7n6T5GJZ>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 89F8D36A0074; Sat, 13 Jul 2024 23:03:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <87209180-c09f-4536-b515-82e0ff260644@app.fastmail.com>
In-Reply-To: <8223b782-5325-4628-b688-293b7f16c931@app.fastmail.com>
References: <20240714-loongson64-cevt-r4k-v1-1-98afed7260aa@flygoat.com>
 <CAAhV-H7_QjjemjFYMGRBQck5gKRWhTMqvjXF=prcAGNam-MKGg@mail.gmail.com>
 <8223b782-5325-4628-b688-293b7f16c931@app.fastmail.com>
Date: Sun, 14 Jul 2024 11:02:55 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Huacai Chen" <chenhuacai@kernel.org>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Loongson64: Switch to SYNC_R4K
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B47=E6=9C=8814=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8A=E5=
=8D=8811:00=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> =E5=9C=A82024=E5=B9=B47=E6=9C=8814=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8A=
=E5=8D=8810:54=EF=BC=8CHuacai Chen=E5=86=99=E9=81=93=EF=BC=9A
>> On Sun, Jul 14, 2024 at 10:41=E2=80=AFAM Jiaxun Yang <jiaxun.yang@fly=
goat.com> wrote:
>>>
>>> Nowadays SYNC_R4K is performing better than Loongson64's
>>> custom sync mechanism.
>> Loongson64's preciseness is significantly better than SYNC_R4K.
>
> My updated implementation[1] uses a multi-pass regression methodology
> which can compensite communication overhead. I had measured delta
> with EJTAG DINT on Loongson-2K and it can be reduced to as low as 4
> cycles while ASK_C0_COUNT has ~50 cycles delta.
>
> [1]:=20
> https://lore.kernel.org/linux-mips/20240511-mips-clks-v1-0-ddb4a10ee9f=
9@flygoat.com/

This is currently in mips-next.

>
> Thanks
> - Jiaxun
>
>>
>> Huacai
>
>
> --=20
> - Jiaxun

--=20
- Jiaxun

