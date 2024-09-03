Return-Path: <linux-mips+bounces-5312-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1711196A697
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 20:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3F55287D0B
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 18:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714E5191477;
	Tue,  3 Sep 2024 18:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="g2r3JUtq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OaUDd5Ae"
X-Original-To: linux-mips@vger.kernel.org
Received: from pfout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927C318F2F6;
	Tue,  3 Sep 2024 18:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725388325; cv=none; b=CTPt/q2oSWDTSczQoODfjBuz4w9zKYxRk0m4PVqYP0PuHK1RolsK7lxWhP6XjJQMAt5DnT4u1XQACg1PnWDW/tDT/8GOUnvkdvWCJEcacEqzkDrPJAZSSmSJpL2B9znjpb1VLvU41qlCBzSJ8NmochTCY6lb7Rh2y/0JfH4YGNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725388325; c=relaxed/simple;
	bh=Pe4iUvpF1TfQms2sNV/3jMEmAPATMKQmGz1XeHPsR1o=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=KU3NJmpiAnKBVY7TscizHMK4qLUiyYkSY9VKLiFpvdrmryFTj0mcs52FSx07NDVOdP7MwxiOLNVDQtrueyHxpm9PUYYP9r8m4g4wT473B7xTxqJcWEM9mfnCOgWTdLLGbTMAlmmYLOsaUK4opQ/5QSJrWp7bQNfKcuJtU+NdOj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=g2r3JUtq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OaUDd5Ae; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 881F9138050C;
	Tue,  3 Sep 2024 14:32:02 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Tue, 03 Sep 2024 14:32:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725388322;
	 x=1725474722; bh=QTHNtCQXEbyRoEVNXRHOicO5bA9YYIgsZ2P/O0iUxhs=; b=
	g2r3JUtqSmrK0x0Yr/wvIsUmAYdPctkhGizPtq8K6kaAHLfwoXstTKAot1nGbrbP
	AgcpjcCYyXncT3na7LIANrlzdH1RzY9YdrRNJyEPL94YVVsUAY8QiEzqYRiCzNJp
	FskISg185NuOXXVtTkeqz8xJUQUaD0flMrRA1CvMAIqHdKQv8PP1S+pbGNpamvyV
	nTsQuG6tVSCkHFzeyC6b5jwoGQdozlrAdAu0L2Ml+sxN88gv7WLSeTePJDnD1686
	2lbaN8JrVjuExzZALZJGYWDVyGJbFYtkAPixHPTINl+4raStqJGRPj7f16/O9yyn
	kNy7srHtHEM1SxtE7jMXKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725388322; x=
	1725474722; bh=QTHNtCQXEbyRoEVNXRHOicO5bA9YYIgsZ2P/O0iUxhs=; b=O
	aUDd5AeVJ58TDfwcQH4W6wkvzPV2HnKXzAo5SrwzRzU9mNY0p/+iwK8u6k6Osm7e
	jLnBe/goCUZoS9RdDxU6YLOaPHGKMknGKdUu2S+BjXV4T7VaAe7lbbpzf7BuAALC
	+8MFhj9C85edOuZh5dCPQhmdALEm7+pMtBo9TvFGMuy4XoDNy77Y2x6eNoN7sZ3e
	lFRe5La0dInfmcopH6tz3A0bWz0/HTW+QmjI9T4JoLu1pJKo0PG0c8vfd3GKfIy3
	7h3mg4vsnWlokWi4b9P3cJHD/GUbE0TiMaZ4IGE5LTxl66iqJXIa4lfIb6AQ8kj4
	Ug52yDVLs9RJmnOpsqwjg==
X-ME-Sender: <xms:IFbXZmuzbetct1Potwb4I0CDHGtloUMmUWrdj5ITG0gEi6el2w26Hw>
    <xme:IFbXZreigUVEPuW0HjVGmy0VV4Ii7jyBTlLc3NtN9tvBsIqwJX2gvrgJazyoqoc69
    QpD7d2QQIsbWRmm70A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehhedguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdflihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgse
    hflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeeiiefhveegkefhledvheet
    vddugefglefhgefhheffgedvvefhveefhfefjeehgeenucffohhmrghinhepghhithhhuh
    gsrdgtohhmpdhtrghrghgvthgpfhgvrghtuhhrvghsrdhrshenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
    ihghhorghtrdgtohhmpdhnsggprhgtphhtthhopeegtddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepthhssghoghgvnh
    gusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehmrghrkhdrrhhuthhl
    rghnugesrghrmhdrtghomhdprhgtphhtthhopegrnhhtohhnrdhivhgrnhhovhestggrmh
    gsrhhiughgvghgrhgvhihsrdgtohhmpdhrtghpthhtohepnhhitgholhgrshesfhhjrghs
    lhgvrdgvuhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtth
    hopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghoqhhu
    nhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhighhuvghlrdhojhgvug
    grrdhsrghnughonhhishesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:IFbXZhwKd7rhNIrd_E3zxNavuN5QE1DDs9hYg1KQ618je_gf8MSmpw>
    <xmx:IFbXZhPidzb5GQEpud934zocMdlWmKV4aEMN2kuQbAsBcdh1b2IVYg>
    <xmx:IFbXZm8Y8AWeoZPpZIpEgiyeSCxJntt87dffXYm1IUfviK2F7klIpg>
    <xmx:IFbXZpW9aIYTEU5R1yu1hiTqFhEeHIF6F3xtsV5bFqCLArLCXWsI6g>
    <xmx:IlbXZn_mpE9ZkasXSwfonUIt6sg7L_yac9gMiwmFf56gNXqFn8jQQudl>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 05D991C207BB; Tue,  3 Sep 2024 14:32:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 03 Sep 2024 19:31:39 +0100
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
Message-Id: <6f6f04d7-55b3-4714-9bcd-cb4e1ae6c86a@app.fastmail.com>
In-Reply-To: 
 <CANiq72m5iFcqRU_qdUCZkoV8ayPhtQQq3TTEDRUYfMEsnNqTDg@mail.gmail.com>
References: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com>
 <20240903-mips-rust-v1-3-0fdf0b2fd58f@flygoat.com>
 <CANiq72=z1yJm-B_ie=GfueOF1qksaSD9txgFU1YQo2tZx0qQPg@mail.gmail.com>
 <d9591a84-9a0f-4046-9b2a-437061f6882b@app.fastmail.com>
 <CANiq72m5iFcqRU_qdUCZkoV8ayPhtQQq3TTEDRUYfMEsnNqTDg@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: Enable for MIPS
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B49=E6=9C=883=E6=97=A5=E4=B9=9D=E6=9C=88 =E4=B8=8B=E5=
=8D=887:17=EF=BC=8CMiguel Ojeda=E5=86=99=E9=81=93=EF=BC=9A
[...]
>
> I guess you mean you are getting the warning about the
> unknown/unstable feature passed to the backend? i.e. `rustc` knows
> about those LLVM ones and forwards them when enabled via
> `-Ctarget-feature` (with a warning):
>
>     rustc --target mips64-unknown-linux-gnuabi64 --print target-featur=
es
>
> So they would need to be added to the list at [1] (or targeted flags c=
reated).
>
> Until those do not emit a warning, it is fine using the `target.json`,
> but I wanted to understand if there is something else you may need,
> since we will need to eventually avoid the `target.json`, so it is
> best asking upstream as soon as possible.

Ahh thanks for the elaboration.

So there are some targets vs feature stuff which is still not clear for
rust upstream.

For example, on ISA level (things like +mips64r2, +mips3), currently for
rust upstream, it is handled by target name. (i.e. regular mips64-unknow=
n-linux-gnuabi64
triple would pass +mips64r2 to backend, mips64isar6-unknown-linux-gnuabi=
64
would pass +mips64r6).

However, kernel supports many ISA variants that are not defined by any r=
ust target
triple, I'm not really sure if it's appropriate to define them all in up=
stream.

The same applies to +soft-float and +noabicalls options as well. It seem=
s like
+soft-float and +noabicalls are only enabled by bare-metal toolchains as=
 rust
recognise them as a target defined features.

Thanks
>
> Thanks!
>
> [1]=20
> https://github.com/rust-lang/rust/blob/d6c8169c186ab16a3404cd0d0866674=
018e8a19e/compiler/rustc_target/src/target_features.rs#L368
>
> Cheers,
> Miguel

--=20
- Jiaxun

