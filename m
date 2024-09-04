Return-Path: <linux-mips+bounces-5324-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B5896B306
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 09:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ADA6282372
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2024 07:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9906B146A79;
	Wed,  4 Sep 2024 07:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="rfNHq06S";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BiFOEq1s"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90CA14659C;
	Wed,  4 Sep 2024 07:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725435509; cv=none; b=FDYdh3eSf3QPKKhzAruijVNNtB8cc5d0aiAYg8BcpNWLmo6DYLy1J5HsQCiWDs76dyoL8vpKDcvUCBxu3nJcCb30IpGF5ltHYZ3xvDotm5SDPBLhT/1tV5PoegGseJm7nR/LNk5Y8cMOFc1nZUhPiYrppC7Y/FBE/Dg4uw+k6LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725435509; c=relaxed/simple;
	bh=sz6ZXnptgCPAXnQbA/qYwtmPVRCJO0RfwwN0oTEtnVE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=MyFLEMH8RJc7DVnProzw3BT7FSOGNuGXAa+vAPgUKSKPNU3YqXyzxnccFpBIsCtyHjt1xlNC29MyfzhOXBzcVNUsoF7rVkyLgV8um0hDafb+O4A28oN3SgtVS3jEM4+AKYViMON1vqGZSdmXiuEM/yfhwYJfl+u9/jCY8zfQFZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=rfNHq06S; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BiFOEq1s; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id CA46F138017F;
	Wed,  4 Sep 2024 03:38:26 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Wed, 04 Sep 2024 03:38:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725435506;
	 x=1725521906; bh=sz6ZXnptgCPAXnQbA/qYwtmPVRCJO0RfwwN0oTEtnVE=; b=
	rfNHq06S+/FbiJrjcoOAISVrJY1dv8k4g+acB71qeIe0yoy8tEYuiuX6duhHot0X
	pnl4Iv+jSo1NbgXY27Sm6bOV4qZGIbsxcYq1KA6O7qp3Gv/QXwLbfO8thQJHWS3Q
	4cLKRt7uqNAaIKrt2TBz5bcums1IZHW3zWq2AysZvWT1FXBRMTYO6Ug7R8MAVuoB
	3rWV9jPuGkruOmjZMEU/e+2OAMc/GE9oK8kvjNfq6TMiuw5V9pqid8KdfeXQEG0s
	Y1tdgKvxCvK0hle8lBgZUObKDBQqSNtQDQJN6p+CK2QxAVMDWch6RSMqs0CL2BEM
	99k/hnes1guZnUoy8uSlpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725435506; x=
	1725521906; bh=sz6ZXnptgCPAXnQbA/qYwtmPVRCJO0RfwwN0oTEtnVE=; b=B
	iFOEq1sVqpbBj1w9LMAEZgDjMzrAxYO5IHVpeDFFhntFPf128oUA/18aSRhUV9lt
	SjTwO1VpWlAVLcHFnIK53Uh65HRATfjliGXh4mjrwEVBt7ypXoKoq7z6ztq4VmKS
	j9oWFRgn4sfUWeeZbX7j/P4W3nU0xEzcO4z3m0NAdClE47/ikZ0WlI1KHqSqrgiy
	STUHs83TLL2fjm39nos9JCPme3s5LawmO/KM9/Q2AQZakvZ67FNHsfftPHcObHoz
	MmaLCMTA2TfvqKjTLC+pmp68EZbbIoTFXuDQWfGlk09BUpDTn4jOwgURKst5b4IF
	p5c/y86CfrkJwoV8fqdTg==
X-ME-Sender: <xms:cA7YZpsfXod5rMH1QTlm0kTIPWxJqwPiszVY5eBC46ewJFhh3iw5CQ>
    <xme:cA7YZifTUghUpf-WKUM0pFh-ulBKmpAalims9KaeyULKphrFiIFxxqcDgax3OHQUi
    ywmBY4QNB45dm8KCc0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehiedguddvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdflihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgse
    hflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeevueffteefkeehhfdthfel
    feffjedvffekgfeiuedugeekgeejvedtffeiledtueenucffohhmrghinhepghhithhhuh
    gsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghpthhtoh
    epgedtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdgu
    vgdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpd
    hrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtohep
    rghnthhonhdrihhvrghnohhvsegtrghmsghrihgughgvghhrvgihshdrtghomhdprhgtph
    htthhopehnihgtohhlrghssehfjhgrshhlvgdrvghupdhrtghpthhtohepghgrrhihsehg
    rghrhihguhhordhnvghtpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilh
    drtghomhdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgt
    phhtthhopehmihhguhgvlhdrohhjvggurgdrshgrnhguohhnihhssehgmhgrihhlrdgtoh
    hm
X-ME-Proxy: <xmx:cA7YZsxJTWa516B1amj6UWURaphYpQG7A_CZANJjeHUVSV9pyNfcWg>
    <xmx:cA7YZgMgKTSMs2eNfwkAsPGl3QfC0ElKD-WFY0SQxWw9BMzetozcJQ>
    <xmx:cA7YZp8XTYFkwebvCNZsdfsBNO62gvaU4g82IG_p09N7BGZtG4pzAA>
    <xmx:cA7YZgWFhnrDB95x5DNuYD5ky5Bo6vtbXwU8siGEdfpJ0b4-IAyzCQ>
    <xmx:cg7YZu8KItrX9IUQjFOMUxdHGLKL6ymyzV556PeKCfMCW0g4shDq4p8v>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 680AD1C207BB; Wed,  4 Sep 2024 03:38:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 04 Sep 2024 08:38:04 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
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
Message-Id: <a6959bc0-f0bb-425b-b3b1-3123d3b809b5@app.fastmail.com>
In-Reply-To: 
 <CANiq72mvTTgyTjDCWBz_kOdY1f4gopAtWxyC4P4c+Lr0YVkzLA@mail.gmail.com>
References: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com>
 <20240903-mips-rust-v1-3-0fdf0b2fd58f@flygoat.com>
 <CANiq72=z1yJm-B_ie=GfueOF1qksaSD9txgFU1YQo2tZx0qQPg@mail.gmail.com>
 <d9591a84-9a0f-4046-9b2a-437061f6882b@app.fastmail.com>
 <CANiq72m5iFcqRU_qdUCZkoV8ayPhtQQq3TTEDRUYfMEsnNqTDg@mail.gmail.com>
 <6f6f04d7-55b3-4714-9bcd-cb4e1ae6c86a@app.fastmail.com>
 <CANiq72mvTTgyTjDCWBz_kOdY1f4gopAtWxyC4P4c+Lr0YVkzLA@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: Enable for MIPS
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B49=E6=9C=883=E6=97=A5=E4=B9=9D=E6=9C=88 =E4=B8=8B=E5=
=8D=888:01=EF=BC=8CMiguel Ojeda=E5=86=99=E9=81=93=EF=BC=9A
> On Tue, Sep 3, 2024 at 8:32=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoa=
t.com> wrote:
>>
>> Ahh thanks for the elaboration.
>
> You're welcome!
>
>> However, kernel supports many ISA variants that are not defined by an=
y rust target
>> triple, I'm not really sure if it's appropriate to define them all in=
 upstream.
>
> They need to be in upstream Rust somehow, because upstream Rust does
> not want to stabilize `target.json` since it is too tied to LLVM (as
> far as we have been told). Whether that is via `-Ctarget-feature`, or a
> new `-Cglobal-target-feature`, or specific flags like `-Zfixed-x18`
> (originally `-Ctarget-feature=3D+reserve-x18`), or (many) new target
> triples for different combinations, or something else, it depends on
> the case and what upstream Rust wants to do.
>
> That is why we should tell them what is needed, ideally in a new issue
> in upstream Rust, and link it in
> https://github.com/Rust-for-Linux/linux/issues/355 (please see that
> list for similar examples).

Seems like this topic is covered by an existing issue

Reported at:
https://github.com/rust-embedded/wg/issues/792#issuecomment-2328133517

Thanks!
>
> I hope that explains a bit more the context.
>
> Cheers,
> Miguel

--=20
- Jiaxun

