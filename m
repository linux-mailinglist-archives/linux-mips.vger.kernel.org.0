Return-Path: <linux-mips+bounces-5308-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8426F96A5EA
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 19:53:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EAC2B267F5
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2024 17:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE7618F2C3;
	Tue,  3 Sep 2024 17:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="U+bGjh8m";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="S+xtKE2O"
X-Original-To: linux-mips@vger.kernel.org
Received: from pfhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5557A18DF7F;
	Tue,  3 Sep 2024 17:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725386030; cv=none; b=U0xHc7ged7dmsgp4oTaU8/LFe7EDiAgxkeWr5TSrjSO91n8+bczeHnFQOl26fWV/ET+Dmjiywv9+MZxp5Buskad4S/PNrN+Eo3ksbz7SozzS2ywmnEJvb5YV0xfN0UaowVhfdrF+d79quRBrcMcBrI7QcSbogTuag8SBD0IyPK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725386030; c=relaxed/simple;
	bh=y+arkmin7IrtnrxC716PfKvGm9iZOGIbnIg+bOi+aIo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=kxJAPXL1c4wk1qPUk4TlLXS5AmrQU5wwvc4ecJdWa1Ha0Fenyjnq/Cms9NQDn1/d8RaNciqLWc/nXttKDst00z0LquyLWHStuk0nTBvkcXvHZ6YSQwGRN1BIPQi0Sgk7iQf81DVXTg7Y4Y4vcQGEbtEzS8JbzSJjoLnJvGXHepU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=U+bGjh8m; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=S+xtKE2O; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 68C06114042B;
	Tue,  3 Sep 2024 13:53:47 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Tue, 03 Sep 2024 13:53:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725386027;
	 x=1725472427; bh=y+arkmin7IrtnrxC716PfKvGm9iZOGIbnIg+bOi+aIo=; b=
	U+bGjh8mdTAX1nzhGvj+0KSvst8EoKfRs6jE51nKSJ8fkXSgx2kHZ3QK1Ji+Ac8/
	ArbK1e9Vfs8kGh46HonmvHicVv0kEP4lKf8z2wVt01W/5TCkLLRt8l2Mmc6lMjm9
	DnB/OdIA3kif5lUsipJuR9vqueuoC00VsOQO3+i+hADNrRzxMbyxd3DGpKLQzLCF
	SisJDuebPSoUIjmAc6IAH562bAmn23yKHYAzwYhTsyJlgG/jlrTkxLcAwCJU/a2i
	yJKz+dwOyr2qnqixnHOokSgSbXqJDenulQTE7nSYV9Ru4usRF/kQIwFyBPYwGsXo
	eud5c2qjisMXQ5UHCnJ8WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725386027; x=
	1725472427; bh=y+arkmin7IrtnrxC716PfKvGm9iZOGIbnIg+bOi+aIo=; b=S
	+xtKE2Ou84B1JGoS6guNadUxWhMtdy9byp9zUGNukT0bBdhu07nlbFl6CmOVfJVb
	XLMCprHFkIJtSA+nXcy8+6OIBdZsIPZ0Rqw5bKXfouXGPool0WXZYU/y1VA7mvMr
	K9rL0vR8jHn2cYOzRnLvDAo4FJEVzb3Rq5eScHDnrUVzO/fHEELIwPp/3WeDQ2hl
	0HHrkkvNM6awC4098fJeKQdhKvdbsASH+e6AZ60i+Q3ZKm14ltpW4h7fTvCLcZpH
	n7YKxr881Z0amsmyOrk31GNF5WlsYUhL23pH54hLYkokGG1G4qLV4C1/72EMEizg
	QS1181wTlQ+Vs4xkdefPQ==
X-ME-Sender: <xms:KU3XZjw3f-PUZ0bP3mhPNMXw-gBRMSSIGMI7Tr1-4XfgdIVSRzX_ZQ>
    <xme:KU3XZrSIEGQfYSJb7elFqAkxFuHNzFHfudWXvdf8MkzZG8rcuRTzS6uVJSUSinQEP
    9M3pom12jE7N6RoX7s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehhedguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdflihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgse
    hflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeejheefuddvtdfggfdvffek
    teehhfelgfdvvedvkeeuffefkeehheegvefhveetjeenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghho
    rghtrdgtohhmpdhnsggprhgtphhtthhopeegtddpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtohepthhssghoghgvnhgusegr
    lhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehmrghrkhdrrhhuthhlrghnug
    esrghrmhdrtghomhdprhgtphhtthhopegrnhhtohhnrdhivhgrnhhovhestggrmhgsrhhi
    ughgvghgrhgvhihsrdgtohhmpdhrtghpthhtohepnhhitgholhgrshesfhhjrghslhgvrd
    gvuhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegr
    lhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghoqhhunhdrfh
    gvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhighhuvghlrdhojhgvuggrrdhs
    rghnughonhhishesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:KU3XZtVELIuUWCjB_H51B0bfjCfgu0bPZJNxAqTK5EhbY3OFeiqxjw>
    <xmx:KU3XZtgY8HYJZDlDu4TDqyiRptkB-pOCwWZqRgwlAtOvEes_JE0qZw>
    <xmx:KU3XZlBo8M38s5af9pRPjW4nmajpsAzHjwYsdoxHt222G_HSj4EoKg>
    <xmx:KU3XZmLmureBvPCrTZgXFqiC3sV5NVBZM_zU_QQfewZk2c6CmcovtA>
    <xmx:K03XZjyodlcgDb3CrMYIhVRYNxMGQUVulZi4axGDqisfa6lJe-qC8_s1>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id ACD5B1C207BB; Tue,  3 Sep 2024 13:53:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 03 Sep 2024 18:53:25 +0100
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
Message-Id: <d9591a84-9a0f-4046-9b2a-437061f6882b@app.fastmail.com>
In-Reply-To: 
 <CANiq72=z1yJm-B_ie=GfueOF1qksaSD9txgFU1YQo2tZx0qQPg@mail.gmail.com>
References: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com>
 <20240903-mips-rust-v1-3-0fdf0b2fd58f@flygoat.com>
 <CANiq72=z1yJm-B_ie=GfueOF1qksaSD9txgFU1YQo2tZx0qQPg@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: Enable for MIPS
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B49=E6=9C=883=E6=97=A5=E4=B9=9D=E6=9C=88 =E4=B8=8B=E5=
=8D=886:44=EF=BC=8CMiguel Ojeda=E5=86=99=E9=81=93=EF=BC=9A
> On Tue, Sep 3, 2024 at 7:15=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoa=
t.com> wrote:
>>
>> We don't use builtin target as there is no sutiable baremetal
>> target for us that can cover all ISA variants supported by kernel.
>
> Since we should try to go away from using `target.json`: what was not
> possible to enable via e.g. `-Ctarget-features` or other flags? i.e. I
> see the `+mips*` features there in the supported list, and from a
> quick test the data layout also seems to match, but I assume I missed
> something.
>
> If it is not possible, then we should definitely ping upstream Rust ab=
out it. :)
Hi Miguel,

Thanks for your review!

Triples defined for MIPS bare-metal target is surprisingly lacking, we d=
o have
little-endian 32-bit bare-metal target mipsel-unknown-none but big-endia=
n and
64 bit variants are missing.

Also, those triples all assumed +mips32r2 as baseline ISA, but kernel ac=
tually needs
some other ISA variant features.

Thanks
>
> Cheers,
> Miguel

--=20
- Jiaxun

