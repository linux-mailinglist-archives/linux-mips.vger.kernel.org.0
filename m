Return-Path: <linux-mips+bounces-7616-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1F3A202EA
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2025 02:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9916A164507
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2025 01:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689D32561D;
	Tue, 28 Jan 2025 01:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="nNPqoa6X";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G/jEQ5zr"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652503BBF0;
	Tue, 28 Jan 2025 01:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738027006; cv=none; b=Z4ucZmFokbK5ZVHSaBGaR2VRHX42YhlRhdZhmw9Iui9+O4JulwI9I98RBG8nr4U8+Ob1qlnJUeVmy0pAEdyTp4W14lkSm6Tu2dLle8BI5QV9anwNRi628uzfOTyXRVJaBYWZ7CMpwQD/FGW5OBK2AdXCIUSBtvwwr5pAKIx6QYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738027006; c=relaxed/simple;
	bh=cvEi3ugjLpGaxNqNHplqEf1s1AHw0uGGNZCujPELn6U=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=rJkLJCySTganWQF7AYVK10A+nAgs9PSAoApgR79G0MDK2aeL9FFdjZMaDhmyrKm5n41srT5wxccdKsgP0jJhyjY+bGJi4dVhG1PvvWfgWrIh2nlWnQtrskpDP6OhPl5h9o6PrNhUBvTm+rDU7Es3c5S+pmUsqTjMIuZGnxq3O3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=nNPqoa6X; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G/jEQ5zr; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 665A41380847;
	Mon, 27 Jan 2025 20:16:43 -0500 (EST)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Mon, 27 Jan 2025 20:16:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1738027003;
	 x=1738113403; bh=EJr9YwHqVSdiJ6heQ3v1l56gv80JW7+pzyAQy3ggJAw=; b=
	nNPqoa6XnmK/OvQFroNoo6zsLQLffHUK9G6pIZt4gFqkN+EAYUl6aFgHK7IBofpH
	fbTb5pwNiWmXmI2wfB0Sa3EjgeSq6utFvrwb0emz2bFQvJW1XUGyFX3YN0BbL7rM
	rpvDaJfboeX5ctdiDWqKOXKtYck5YiHlCNf4qvLhktzH45XRpKFaytYeMu/salSM
	Z03Po2ASyok/lCtcycAl3wDDQf1FuARNJzsXlC5PTiYlagHQccMl026oAgDNAF6j
	IFcmj1OIu6UThU6dL7m60mSb2q7L9AYUMHrbOyVJalFFqeLTA3Qx1FNiKvpYdqB9
	u3y0D5DfbKBWBSu2nqEkZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738027003; x=
	1738113403; bh=EJr9YwHqVSdiJ6heQ3v1l56gv80JW7+pzyAQy3ggJAw=; b=G
	/jEQ5zrWvRfFybpMTHUF6Q6rBqUcgPjSAVxql4d7/qcQF+XX9DtQOLF5/c1ijKtg
	W2Tbk/KrtHMEf1oQTHYkVYxe2TB2M+XW5HKjPDpHHhk8mi+wuAeqcoSTjUJYsQQv
	K0YwaqLetCrz7t/BN1aoFMUFdOLVa6gPElcqmsGu1SGkOy2+SKaddMq9VTH4CqlU
	qwsJQjgHJ8PP2a7dwvWeL35oUhgxr7H6Az7cEMHPvO0Y3jewve74B5dcPDCuyGbe
	guVSV4mbtU05cNMHffUZbTcS27tzPQDfgn55v3RHpFx8/XZCdajQk0l7phnqSPCO
	iu0WxLybIe8l+D1gTANaQ==
X-ME-Sender: <xms:-S-YZ8ezlA1_6wBE5BWKJmB_8FUIld-Thh2DMtTbntKVSuSpEuW8pw>
    <xme:-S-YZ-NxP_cm6yKGaca1yigBdkkgCCM6wArBZmf7CeepGfGPjq409ijph7QGDQDDM
    KZfbRdUa2fzP8dHPb4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgudegjeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghngh
    esfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeehfeduvddtgffgvdff
    keethefhlefgvdevvdekuefffeekheehgeevhfevteejnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihg
    ohgrthdrtghomhdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghp
    thhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtph
    htthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohep
    thhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoh
    eprghrihhkrghlohesghhmrghilhdrtghomhdprhgtphhtthhopegtohhnohhrodguthes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtrgif
    fhhikhdrsggrhihouhhksehmohgsihhlvgihvgdrtghomh
X-ME-Proxy: <xmx:-S-YZ9jH-RQvOSeQVP78Ui42IQkQKB5SH5IzzbJIL2iLRvv1H7cuew>
    <xmx:-S-YZx-T6SfkpIT_OGStZO61x-WwJdSj6kzH8ydFNOZhSdSJ3WfFFw>
    <xmx:-S-YZ4tCeZcNTPO_uiPlVO9-7PGT2HhOLXEQ7ZV61DWQweF_-4xEGg>
    <xmx:-S-YZ4HTdNOZMpgi_TNsZ7vPi6GdnPrEwxXdoMFhSs2x0gNltqvMow>
    <xmx:-y-YZ5HIgbcmzYH5DDf-x9r41mDhkcB5OXlPlPJF6nMqgfrzYrKLvFRU>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BB3F61C20066; Mon, 27 Jan 2025 20:16:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 28 Jan 2025 01:16:20 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Rob Herring" <robh@kernel.org>
Cc: "Gregory CLEMENT" <gregory.clement@bootlin.com>,
 "Aleksandar Rikalo" <arikalo@gmail.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <bf08785b-9963-4539-92ef-b73c3abe8c19@app.fastmail.com>
In-Reply-To: 
 <CAL_JsqKXYruNn+MtxbvCCWU2OmqeV-uAyyzN+F-ppSJVscr91w@mail.gmail.com>
References: <20250123-cluster-hci-broken-v3-0-8a7ec57cbf68@bootlin.com>
 <20250123-cluster-hci-broken-v3-2-8a7ec57cbf68@bootlin.com>
 <afa2e874-c078-4c3e-b485-d948a0bb6a6f@app.fastmail.com>
 <CAL_JsqKXYruNn+MtxbvCCWU2OmqeV-uAyyzN+F-ppSJVscr91w@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: mips: mips-cm: Add a new compatible string for
 EyeQ6
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B41=E6=9C=8827=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8B=E5=
=8D=8810:07=EF=BC=8CRob Herring=E5=86=99=E9=81=93=EF=BC=9A
> On Mon, Jan 27, 2025 at 3:43=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygo=
at.com> wrote:
>>
>>
>>
>> =E5=9C=A82025=E5=B9=B41=E6=9C=8823=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8A=
=E5=8D=8811:01=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
>> > The CM3.5 used on EyeQ6 reports that Hardware Cache Initialization =
is
>> > complete, but in reality it's not the case. It also incorrectly
>> > indicates that Hardware Cache Initialization is supported. This new
>> > compatible string allows warning about this broken feature that can=
not
>> > be detected at runtime.
>> >
>> > Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> > ---
>> >  Documentation/devicetree/bindings/mips/mti,mips-cm.yaml | 12 +++++=
++++++-
>> >  1 file changed, 11 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
>> > b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
>> > index
>> > 4324b2306535f1bf66c44b1f96be9094ee282041..d129d6382847768dc026336d8=
d2c7328b6b81f9b
>> > 100644
>> > --- a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
>> > +++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
>> > @@ -19,7 +19,12 @@ maintainers:
>> >
>> >  properties:
>> >    compatible:
>> > -    const: mti,mips-cm
>> > +    oneOf:
>> > +      - const: mti,mips-cm
>> > +      - const: mobileye,eyeq6-cm
>> > +        description:
>> > +          On EyeQ6 the HCI (Hardware Cache Initialization) informa=
tion for
>> > +          the L2 cache in multi-cluster configuration is broken.
>> >
>> >    reg:
>> >      description:
>> > @@ -44,4 +49,9 @@ examples:
>> >        compatible =3D "mti,mips-cm";
>> >        reg =3D <0x1bde8000 0x8000>;
>> >      };
>> > +
>> > +  - |
>> > +    coherency-manager {
>> > +      compatible =3D "mobileye,eyeq6-cm";
>>
>> I think =E2=80=9Cmobileye,eyeq6-cm=E2=80=9D, =E2=80=9Cmti,mips-cm=E2=80=
=9D would describe the hardware better as eyeq6=E2=80=99s CM is just a s=
pecial variant of mips-cm.
>
> Is s/w that only understands =E2=80=9Cmti,mips-cm=E2=80=9D useful on e=
yeq6 chip? If
> so, I agree. If not, then a fallback compatible is not useful.

Yes, mobileye,eyeq6-cm only enable an additional bug workaround in softw=
are.

The programming interfaces and so on remains unchanged.

Also other firmware components like U-Boot doesn=E2=80=99t need to be aw=
are of eyeq6 variant.

Thanks

>
> Rob

--=20
- Jiaxun

