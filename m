Return-Path: <linux-mips+bounces-5003-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E1295B16F
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 11:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93FE5B21F3B
	for <lists+linux-mips@lfdr.de>; Thu, 22 Aug 2024 09:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39B6183CD3;
	Thu, 22 Aug 2024 09:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="7kggdDlB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JhhPKz+J"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC33183CB6;
	Thu, 22 Aug 2024 09:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724318436; cv=none; b=GyARj8OQVbBL9tUYHFJScbBH6szESD2cblpYc9W40dOTO+LwXZtf9nPgnWgC0bCXjI3f5GK110dLUrWbaAFnqN+IOkPbrLK7+l6ZtMAaKCuz2ee8Y/4QxbmIcyWPqNegeLUmP5z2IDe+iBQKEUNalXifZhgJJnN24f7FZMQU2nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724318436; c=relaxed/simple;
	bh=qv3s0CGi5ZNdpz6DyZ6n/g321A0Z/c9BiEcI2QfCxqs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=sxPhlvty0DOh3yP+dbAB8cAfLJSAH8sB13Haav7i3ZltUfbQ7/4KNC341YXowiOJmxdJc1ma6eaf6P44r23H6cf9Djc2pVw21sJIxhPBKzfSzlrVISiNgDW2hl0nfhaWFzNz63UebnUeghNcRGg+R1IgUzGIG8Q4WoUu8W7Qdco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=7kggdDlB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JhhPKz+J; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-05.internal (phl-compute-05.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id E62461151BC9;
	Thu, 22 Aug 2024 05:20:33 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Thu, 22 Aug 2024 05:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1724318433;
	 x=1724404833; bh=NqlevIU6Cve7LDsN6A1JYwfxKGffozPjIZqiNJCdjXU=; b=
	7kggdDlBoD4jBu6ZTyzc+Ih6UJ60zJXqJVdXpBq0yN71ikmoslDeIw3ufSLwtJe9
	DbZBxxywq5IGTv1cSoEJDjmTdz62aB4AiKER0ZOnNzGM8rWnvf+Ng0oovZkw9HqD
	XDX7UuJLkDQBiUse3TqQuU1X1bavRdJSOZF65wOLsB1x0S4qUtwFpH2QKeQNlOUI
	afmDwtaGs2mDHlJZsas/UNZ6G7drn56C5ilSWVaoNLhu1ZoLkg7dYnbfGD2AESSw
	JJGuJIgei3KbvW/v6W0/MASSNTaTN49kU3T52gMK7aaEYclJ90OT1KxLb92yIxqo
	xvomGOJtqiOBXSfYkQ6ejA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724318433; x=
	1724404833; bh=NqlevIU6Cve7LDsN6A1JYwfxKGffozPjIZqiNJCdjXU=; b=J
	hhPKz+JF1iiGaqS4+ZV3ohxu8xu0fv9wh6rOmUnXxQVthDRYToJmyw8TDIA8G0a6
	gSDdE3psDUMMFF47GsuoU9SeIgJoMFyA7i7vNF4J+rtu9biX5Ss6VNtDUer1oie+
	hOCufgDljU4kJohHE6c2QJr0sgACf0WIOT2nSVhBgXdPpZWb5EQr+CBFST2aIKi7
	6K0fCGg73sxQZkzUfoGYuctaw1wawgwndpGoKqYnit7LzpIMq5dGihxU4BZ+cTcG
	xFpdcLucc09VS3b9dNbSZqC1Vtiu1gVjuRmdgTTkO+8rj1ThXCm6pHHOYkFpzgrZ
	V9mgnMRP8nl6BdofHKDog==
X-ME-Sender: <xms:4QLHZvseH5wu33u2QREUJABRAwJqIzi6RRbVU-VUP8rVzfeP1Ez87g>
    <xme:4QLHZgfPb_A4WNYt18e31sZfWINX0U9aBaRDOLhjz1kQOhKvV-cJ-Ko1GmvgDdBSI
    pPl7FjnAuVNLqdDLqQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddvtddgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeehfeduvddtgffgvdffkeet
    hefhlefgvdevvdekuefffeekheehgeevhfevteejnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgr
    thdrtghomhdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthho
    pehphhhilhhmugeslhhinhgrrhhordhorhhgpdhrtghpthhtoheptghorhgsvghtsehlfi
    hnrdhnvghtpdhrtghpthhtohepmhgrtghrohesohhrtggrmhdrmhgvrdhukhdprhgtphht
    thhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:4QLHZizIb7dhEij1f49m7M_Y4e5B4zA5SJToAVR165wsPAufPjfU0A>
    <xmx:4QLHZuMu430_Er1Svca--cZas2jI1X92IrLT78XzmaxnLOh2ozO0QQ>
    <xmx:4QLHZv-sYgXfJGs8ceA2X6tiBHLpr6g5L2UNI_UaVmLsQs-oF6bKlg>
    <xmx:4QLHZuVeaxB_bDhusegdPd4xkeLQAdPm_ZuBdgq6HCo5ZfWHdJws0w>
    <xmx:4QLHZvw4TrcUuSKMgZZL-edFvUHNltxSB89P32XoLk4oKpVgb2shjLln>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 995B41C2005C; Thu, 22 Aug 2024 05:20:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 22 Aug 2024 10:20:13 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 "Jonathan Corbet" <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Message-Id: <b9396b1f-b2ea-4900-af81-b2c3d916be9c@app.fastmail.com>
In-Reply-To: <ZsbwhoTS+ji41FuW@alpha.franken.de>
References: <7797a7b2-1bb2-4c45-b65d-678f685dfa3d@app.fastmail.com>
 <Zo457UgAkhbAgm2R@alpha.franken.de>
 <alpine.DEB.2.21.2407101015120.38148@angie.orcam.me.uk>
 <a8741e38-837b-4fbb-8656-1e6d50bdfcc0@app.fastmail.com>
 <alpine.DEB.2.21.2407110315170.38148@angie.orcam.me.uk>
 <de07ff44-41ee-4158-b629-90a1835bd9cb@app.fastmail.com>
 <alpine.DEB.2.21.2407121250350.38148@angie.orcam.me.uk>
 <dad7b36f-2e37-44db-939e-cdb454875e2a@app.fastmail.com>
 <alpine.DEB.2.21.2407150225310.58077@angie.orcam.me.uk>
 <ac94941f-3ac3-4820-b94d-aeb72a7a7a5c@app.fastmail.com>
 <ZsbwhoTS+ji41FuW@alpha.franken.de>
Subject: Re: [PATCH v3] MIPS: Implement ieee754 NAN2008 emulation mode
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B48=E6=9C=8822=E6=97=A5=E5=85=AB=E6=9C=88 =E4=B8=8A=E5=
=8D=889:02=EF=BC=8CThomas Bogendoerfer=E5=86=99=E9=81=93=EF=BC=9A
> On Mon, Jul 15, 2024 at 08:35:21PM +0800, Jiaxun Yang wrote:
>> =E5=9C=A82024=E5=B9=B47=E6=9C=8815=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=
=E5=8D=888:15=EF=BC=8CMaciej W. Rozycki=E5=86=99=E9=81=93=EF=BC=9A
>> >  It's not much to do anyway, as I have prepared `ptrace_setfcr31' a=
lready=20
>> > to handle masking correctly, so all you have to do is to set the ma=
sk as=20
>> > required for the right thing to happen.  I shouldn't have needed to=
 point=20
>> > you at it though, as that code is easy to find.
>>=20
>> I think I got your point, will try to implement it.
>
> any news about this ?
Hi Thomas,

Sorry, I implemented it but was unsure that my test coverage was ideal a=
s I was
unable to access my usual switchable NaN hardware (FPGA based on interAp=
tiv MR3)
for testing.

Will post patch after gain access to that again. Hardware ETA 10 Sept.

Thanks
- Jiaxun

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

