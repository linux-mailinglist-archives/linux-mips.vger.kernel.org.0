Return-Path: <linux-mips+bounces-5437-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D37EB970BB4
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2024 04:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D8601F2223D
	for <lists+linux-mips@lfdr.de>; Mon,  9 Sep 2024 02:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3FDF134AB;
	Mon,  9 Sep 2024 02:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Bk5lpu29";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="AiMcD2ed"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0BD4C81;
	Mon,  9 Sep 2024 02:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725847423; cv=none; b=K++CqWaoKgwhPewL7DTAScqb0qR9LeBR0CwCeBA0E6rmDg0CYqjHSe2o6RY/FZJqEeyld9qSVZlVdqrY/ciH0DclYbY2hYMKizF15fsYd21KEtF6DTshDFvKvojl3rksgDb3v95bE2qBTVgxm0sb/kkZNatgIsVWmDH0DxGj7tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725847423; c=relaxed/simple;
	bh=iq3nvBmfllRTiJyTA94ksSdjaG4lbdwMfupgOFpV+nk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=QspLAUOXl2hRilSQCmnoKoX9K+egiv5UrL3GSeey4urTkDnWQ8/6Zsbs4Ri3UYEBo1qEWCtO2M1Vz8YQc5bg4WSIAKYBt1Gn+rGDSYoiD2+4qFGuRbHEEvEz81x0SAJPAu5wdjwxRsavo01Pkrhp1FgNz68aD+7yTWVURJjaMco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=Bk5lpu29; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=AiMcD2ed; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id AA4701380204;
	Sun,  8 Sep 2024 22:03:40 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Sun, 08 Sep 2024 22:03:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725847420;
	 x=1725933820; bh=q7tWMu/BR29AlMFdHva1ZVq5cMfk2jme775waWAHW4I=; b=
	Bk5lpu29vUgR/3Yn+f0b5v7DMMh0IzJ/nuAymzxv9M6NlzFcmgIQSk4PHOfdnGI0
	5YDNexb9uJJl0C9xYm3R0A1Own2HWMHuacJRBynPJ/vc1pxEBB6YWDv1hERcSNFu
	YD3RJmNUAHLOMeuJx/mYmLdI05rqDslLRSrZNN73CaEW7Jqchs0qvzNXOzVXJRYc
	HFMtM12CTC2svJYGvroc3YHDCRsIFWwHw036986plVOpUFBH075vrz9stlx6uI9Z
	Ye30mY4T2D4Ahf79p9IbuQT9PB4/kXjtyeX9H2wgcxHpiqA5C1E6tp6ZOwBVcoZT
	h0p+uSjlwrBL0u51wAzlRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725847420; x=
	1725933820; bh=q7tWMu/BR29AlMFdHva1ZVq5cMfk2jme775waWAHW4I=; b=A
	iMcD2edf/MFm2reD7Pe+RDelZuG6Af9igc3mlePjx6rRBlIP720RhVqIrLm5goo2
	0sDpFNUPjTcPk6jvO+rHmWookXLeBF40nhmGTUVWbTbj0ppFyIBkkeQ8ZM4rJ0CO
	OrSkoa1M69vVOwbVQO5dRRyoQKg1t4qFG9py/KOUjC7KvbTzN2Qd+NTql/atqMLo
	zK+xRokwW36er0DVdFNWPBKEc2v2Se+kDzQ7MJ6c4PUw8GXuhnL1+4Q9m/WpN86r
	kUp3Vf3+lQj2dKf1uzqbRMPVZ+7+UbLGAFQ6YWtVLOw21zW+HpZKbx26ggHGadsQ
	TukFb3B2I+I0jcrcy9z5g==
X-ME-Sender: <xms:eVfeZga7McnadKJCaQQWsb2eJcqBlYfKCjYh9WXuqj4pFtNXHIfy9A>
    <xme:eVfeZrYhsj0Kpuysh4j38emYhQh2PihN-Pt_4hoycuAN625NgrynsstYDZRWrbSKr
    65R7PfRgQjMqLiY4_E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeiiedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeehfeduvddtgffgvdffkeet
    hefhlefgvdevvdekuefffeekheehgeevhfevteejnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgr
    thdrtghomhdpnhgspghrtghpthhtohepgedtpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehtshgsohhgvghnugesrghl
    phhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhguse
    grrhhmrdgtohhmpdhrtghpthhtoheprghnthhonhdrihhvrghnohhvsegtrghmsghrihgu
    ghgvghhrvgihshdrtghomhdprhgtphhtthhopehnihgtohhlrghssehfjhgrshhlvgdrvg
    hupdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheprghl
    vgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopegsohhquhhnrdhfvg
    hnghesghhmrghilhdrtghomhdprhgtphhtthhopeifvggushhonhgrfhesghhmrghilhdr
    tghomh
X-ME-Proxy: <xmx:eVfeZq82Si7Ov1P0ceKc9b73LdRBt8tM9bl11ajO0H9HMSey8fBmew>
    <xmx:eVfeZqru8dIgbxqlpz6eU85vngqVk1J42POs9tLH2koG0mcEdAphlw>
    <xmx:eVfeZroea9p-6eaSAdAFy43eTiDrsJXCZGdRMaWD7ztowxSVvv0I9A>
    <xmx:eVfeZoTNlV0UHz4H3XGfD6_2zkin4Y6FcnMzKZjcMDfcQ0AoycKivQ>
    <xmx:fFfeZr5uL035KrNYQjYTCr3GGysD5Rwts1Yq1o6WsVSlM70w6h-BuAyR>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CAC1D1C20065; Sun,  8 Sep 2024 22:03:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 09 Sep 2024 03:01:45 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>,
 "Richard Weinberger" <richard@nod.at>,
 "Anton Ivanov" <anton.ivanov@cambridgegreys.com>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Wedson Almeida Filho" <wedsonaf@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@samsung.com>,
 "Alice Ryhl" <aliceryhl@google.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Jonathan Corbet" <corbet@lwn.net>, "Alex Shi" <alexs@kernel.org>,
 "Yanteng Si" <siyanteng@loongson.cn>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-um@lists.infradead.org,
 rust-for-linux@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 llvm@lists.linux.dev
Message-Id: <035ccfe5-c368-4cd9-8e0d-34e0e355cb05@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2409082138160.60835@angie.orcam.me.uk>
References: <20240905-mips-rust-v2-0-409d66819418@flygoat.com>
 <20240905-mips-rust-v2-3-409d66819418@flygoat.com>
 <alpine.DEB.2.21.2409082138160.60835@angie.orcam.me.uk>
Subject: Re: [PATCH v2 3/3] rust: Enable for MIPS
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B49=E6=9C=888=E6=97=A5=E4=B9=9D=E6=9C=88 =E4=B8=8B=E5=
=8D=889:43=EF=BC=8CMaciej W. Rozycki=E5=86=99=E9=81=93=EF=BC=9A
> On Thu, 5 Sep 2024, Jiaxun Yang wrote:
>
>> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_=
target.rs
>> index 863720777313..bbdf8a4dd169 100644
>> --- a/scripts/generate_rust_target.rs
>> +++ b/scripts/generate_rust_target.rs
> [...]
>> +        } else {
>> +            ts.push("arch", "mips");
>> +            cfg.get("TARGET_ISA_REV").map(|isa_rev| {
>> +                let feature =3D match isa_rev.as_str() {
>> +                    "1" =3D> ",+mips32",
>> +                    "2" =3D> ",+mips32r2",
>> +                    "5" =3D> ",+mips32r5",
>> +                    "6" =3D> ",+mips32r6",
>> +                    _ =3D> ",+mips2",
>
>  What's the consequence of using `mips2' rather than `mips1' here?  Ho=
w=20
> about other ISA revisions, e.g. `mips4' (that also applies to the 64BI=
T=20
> leg)?

LLVM's mips1 backend is a little bit broken beyond repair, so I tried to=
 use mips2
as a baseline. I should probably let HAVE_RUST depend on !CPU_R3000 to g=
et it covered.

We have no good way to tell ISA reversion prior to R1 just from Kconfig =
TARGET_ISA_REV,
valid numbers for TARGET_ISA_REV are only 1, 2, 5, 6 from Kconfig.

Given that mips 2 and 3 binaries (Rust object files) can link run flawle=
ssly on all pre-R6
(despite R3000) hardware with matching bitness, they were chosen as fall=
back here.

Thanks
>
>   Maciej

--=20
- Jiaxun

