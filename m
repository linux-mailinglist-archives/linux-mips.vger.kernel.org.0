Return-Path: <linux-mips+bounces-5517-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E863974331
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 21:10:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C18801C2637D
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 19:10:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC67194C77;
	Tue, 10 Sep 2024 19:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="kvjM8o+6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hjk5M4vB"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B1516DC12;
	Tue, 10 Sep 2024 19:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725995447; cv=none; b=lKAeRftVVWoJbTPLa1VEMbldIjyYzkGLe1ffbXgFdFFGE4T2mFufQGFlO5BUHQ1ONiIvVgFHYCNdY33QEho9Qrcoi5jWq+xWwY3GCiOdID8xVpKPClcN/JCRFrNWu4kTgewI6DiJuC2+xFbn3EuW8yfATIcA4LM9N4WX9JYUCVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725995447; c=relaxed/simple;
	bh=P5sRma4w+7pE7R4/ajwlprJCgLRj4Zrf6BVqn7+1ouk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=T7wNkIKamMm+YTcmrZVa6WdzuYN8utwYso1chvNYqlvFc9oNLchtlsZRGTMAC0gZ/89BXHxzq1Hpgpatag4zSNbKONrlEoFbAWj7QAhyWkgTbNWn5I8Ihp7IH1eRKyXDD2B/zucB1tUg3HQ97iE1fq/Cf8hzLAJnEAx1iok/5tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=kvjM8o+6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hjk5M4vB; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5A56C11401B5;
	Tue, 10 Sep 2024 15:10:44 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Tue, 10 Sep 2024 15:10:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725995444;
	 x=1726081844; bh=FNJEbqHDmm333PfHWjstoI5ieSBYG/g5goi2tNqIxXY=; b=
	kvjM8o+6bbncpK3cXYqbiDr2LpeM9t394ULyngksEBwlJT3JCczmztDJsS8Kr9gm
	ev23x0OEFHWZgADiUvpFKPc+oRGdC3W8An/G7wugKUGwjiGClrh/UjgdKA477wht
	8ay5SmsINBw5Oficw1rquCHMWd7mx+3WDjRYfZJbmanXoRsbmYJV2vAUDvhil1pr
	we2EBn9Kc+6+1gjnacdoMfPI1fxZfKo6VcJbmMYKAmhrmt1ySB9YLgNllRheEnHq
	Q83FWomK9SU4MREXJPWZnOk7jet8hkQ9aXb+V4S0SnI0as2buXWyn8fX7AzcHLG7
	m1qFfUgI5Cjpzpxfzr2Rtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725995444; x=
	1726081844; bh=FNJEbqHDmm333PfHWjstoI5ieSBYG/g5goi2tNqIxXY=; b=h
	jk5M4vBni8n5RRMFJXm6D7kKRY6quapTntMY+8Hf8tq5e5F73YzNrWUqGmERweMs
	za8faKTpSiptSgEK+DjU4+QhMGio+hzYIoia/1AZR9FW6RYLMh5mdMYJjbC7QTdj
	GhfJnVgj8G+FtkCjkN+f63yJs8ksVDdQg5yWMeSG0JOp7leLt17g8J98doJPhyGh
	S2yQ4T3beZ9DtYkMPEMca3k5LrRymDnFGPrdFoCip5+hLJ4AjaDLeV0nCl0+Bb7N
	wvLZ6ov3Dj6wlzeReKz6xD+CMc7QOKlilL4tKo3i/zaDhidBEcJER2KD+Hcm4/JB
	7JUS4Zh4S0aCoXEz3HIfw==
X-ME-Sender: <xms:sZngZt1R-VlEsgJ_jmrz98cs294pNm1P6HG7D3WuS9dNspLXb41BgQ>
    <xme:sZngZkGFZrTl6aXGQwyw14x5_8DmTjzlcHEE5q-JohfDqdIY4K5lL0luimHh6LhUL
    RbgjKvMZx0KfXi7ip0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeiledguddvgecutefuodetggdotefrod
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
    gvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfigvughsohhnrghfsehgmhgrihhl
    rdgtohhm
X-ME-Proxy: <xmx:sZngZt56qxgs167WWpoy7AtKORMNuCLbRpYB8jgoceVUJ5PKwV72cw>
    <xmx:spngZq0w8p6RVGN640kHIOzKm6LFdSOnR-2wtuKoC2hq9-9VB9S3Dg>
    <xmx:spngZgHsmWZuoOUsyZiLl3RXgpYKStqqP_DuXuTJUoOlBEDGx5VFwA>
    <xmx:spngZr_-ZOluVaKogAA91d4r6wV1woz9nNQuaqIuudlbfRT7Vfu2DA>
    <xmx:tJngZonMksOX-edhvZNNn7z5uzc3i4VYtl4X5sD-g_rNEWIdfXmDPIOA>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D17861C20065; Tue, 10 Sep 2024 15:10:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 10 Sep 2024 20:10:21 +0100
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
Message-Id: <54ce7574-43fd-40ee-9ae9-dd72283d1040@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2409101643210.60835@angie.orcam.me.uk>
References: <20240905-mips-rust-v2-0-409d66819418@flygoat.com>
 <20240905-mips-rust-v2-3-409d66819418@flygoat.com>
 <alpine.DEB.2.21.2409082138160.60835@angie.orcam.me.uk>
 <035ccfe5-c368-4cd9-8e0d-34e0e355cb05@app.fastmail.com>
 <alpine.DEB.2.21.2409101643210.60835@angie.orcam.me.uk>
Subject: Re: [PATCH v2 3/3] rust: Enable for MIPS
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B49=E6=9C=8810=E6=97=A5=E4=B9=9D=E6=9C=88 =E4=B8=8B=E5=
=8D=885:03=EF=BC=8CMaciej W. Rozycki=E5=86=99=E9=81=93=EF=BC=9A
> On Mon, 9 Sep 2024, Jiaxun Yang wrote:
>

>> >  What's the consequence of using `mips2' rather than `mips1' here? =
 How=20
>> > about other ISA revisions, e.g. `mips4' (that also applies to the 6=
4BIT=20
>> > leg)?
>>=20
>> LLVM's mips1 backend is a little bit broken beyond repair, so I tried=
 to use mips2
>> as a baseline. I should probably let HAVE_RUST depend on !CPU_R3000 t=
o get it covered.
>
>  GCC works just fine I suppose, just as with the other language fronte=
nds,=20
> doesn't it?

Nah, currently we can only use rustc with LLVM backend. target.json file
we are generating here is also LLVM backend only for rustc.

gccrs is not usable for kernel yet.

>
>> We have no good way to tell ISA reversion prior to R1 just from Kconf=
ig TARGET_ISA_REV,
>> valid numbers for TARGET_ISA_REV are only 1, 2, 5, 6 from Kconfig.
>
>  This approach doesn't work for some MIPS architecture processor confi=
gs=20
> anyway, e.g. what ISA revision will CPU_P5600 imply here?

TARGET_ISA_REV will be set to 5 for CPU_P5600 (CPU_MIPSR5 will default t=
o y
on CPU_P5600, and CPU_MIPSR5 sets TARGET_ISA_REV to 5).=20
>
>  However if there's a need (and previously there wasn't), then I think=
 it=20
> can be sorted in a straightforward way.  We have just a bunch of CPU_*=20
> settings and we can define corresponding ISA_* settings to select, e.g=
.=20
> ISA_MIPS1, ISA_MIPS3, ISA_MIPS32_R1, ISA_MIPS64_R6, and so on, based o=
n=20
> information extracted from per-CPU_* `-march=3D' compilation flags fro=
m=20
> arch/mips/Makefile (possibly combined with ISA data obtained from=20
> GCC/binutils for said flags).
>
>  It could be a bit tedious to write, but not a big challenge really, j=
ust=20
> mechanical work.

TARGET_ISA_REV is guaranteed to be aligned with CPU's supported ISA for =
now,
so I see no reason to invent another set of symbols....

>
>> Given that mips 2 and 3 binaries (Rust object files) can link run fla=
wlessly on all pre-R6
>> (despite R3000) hardware with matching bitness, they were chosen as f=
allback here.
>
>  I'm fine with having a MIPS1/R3000 exception for broken LLVM, but I s=
ee=20
> no reason to disable it for GCC.

It actually reminds me that LLVM lacks R4000 and some other workarounds =
as well.
I shall fix those in Kconfig as well.

Thanks

>
>   Maciej

--=20
- Jiaxun

