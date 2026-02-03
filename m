Return-Path: <linux-mips+bounces-13101-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOQAI3zwgWlAMwMAu9opvQ
	(envelope-from <linux-mips+bounces-13101-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 13:56:28 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B1DD973E
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 13:56:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3B70310DBCA
	for <lists+linux-mips@lfdr.de>; Tue,  3 Feb 2026 12:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91C63446CA;
	Tue,  3 Feb 2026 12:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1fH615x"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AE6340A57
	for <linux-mips@vger.kernel.org>; Tue,  3 Feb 2026 12:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770121931; cv=none; b=WBdh0GxMYKqNYWeoH3rVoX36eq9+h+WGOTGMZJkkC0o+9NIqthuoySChf1Ruwh7SzEIIpCGcmBq0v0NwuLMXSwNC8snQUz8Nc8qp+O1R+DAC9Q5YLfAbxeB7FHT8atPR9V8dWa89gXnzwkhMBje4ljUyNU3p8bRaM+LTui7RzMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770121931; c=relaxed/simple;
	bh=QST511wQ21zjJWktvSqUpl7l53NcCuAZYCXZsPCIGpw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=H4enRU214+TeLBPUxNv6X5MFRG3IL783FrguIRSBlq/EWR94DZvvz3cP/NQ4j0CGo9meG6K6/mrBlPm/5Y8Bu/lF+cRctOo9kbejS8KS9t9vGPnq8I19Psg7Rq+uj+zTyRvcLTxjUuC6egkSXmQi8//qzr31QtBJ2DE0ynxGYp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1fH615x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D555C19421
	for <linux-mips@vger.kernel.org>; Tue,  3 Feb 2026 12:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770121931;
	bh=QST511wQ21zjJWktvSqUpl7l53NcCuAZYCXZsPCIGpw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=D1fH615xn68N8WNaLvieZ8KVEp7iOiXKcyp2ni69RBq7mTZAyC/IVQcjhLOn+o2qr
	 9BgfIxzDqN23+VhURvuh5l1Ti5Ib6lKTG77O4nFYiPkJgMpzfSQ+MUdUmk5TBE1R5t
	 ZiK0pVnDSjet+bWW81Pb76b5prgGb7Eokr22WbOw0YECBuSO6dtPBzRup7KOm2YaO4
	 wPxCIlmvbnubWe3M/D1Rn1viAJw2F6IE/+yRGEJe7nkaXBcpTCzZfTweGpS3p6LnPl
	 msIFZOfg7W+xljanhcGwSUkpU1G683ahIorQPrnkcepkbWZiKuynPEBqnJ8NP7iOSd
	 Zj14ZQBGbcZ4Q==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 2AC5FF4006A;
	Tue,  3 Feb 2026 07:32:10 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 03 Feb 2026 07:32:10 -0500
X-ME-Sender: <xms:yuqBafaJRXubEgY_S_1yT7rR5bxRrVOtXQWOfU5bseC0P0-yr65QGQ>
    <xme:yuqBaZOV5VQbg8Ske7mlDZkKWu0FqEkomzXJLg9Xqt6OBVWn0fkybdAbGlTRDXREE
    3RCRFPBxrd7cq6Mm79Wu3o38yuGEpr6vyGwrDGdVSv6RD_m40ogJyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedttdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpefhhfeguedtgffgkeeigedvieegffeilefgleeftedtkeehudetiefhvefg
    fedtteenucffohhmrghinhepshhouhhrtggvfigrrhgvrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghu
    thhhphgvrhhsohhnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrh
    gusgeppehkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghp
    thhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhssghoghgvnhguse
    grlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehnrghthhgrnheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtohepmhgvseiiihihrghordgttg
X-ME-Proxy: <xmx:yuqBaWOggf-WC5xrnjcAc8bolrep0nT0flywBS4AFfSG_IUs_J-d6g>
    <xmx:yuqBaYp9_-w2fsgFpqPbKCL5F61P_bgNd_osMGzUIGyqbY74RR-oSw>
    <xmx:yuqBaXHKjSNQ9PdfUBrJO8qDHusj7sM1Yl5ZfqlU8NnG_Qz2X-Lobg>
    <xmx:yuqBadonWgms5uSTks_0wOSbBYtXnOznraQeYGd0oegfr5iU9ww8MA>
    <xmx:yuqBaQajnir2Z8N3vU4yz-UhWblOh2wwZHQEmRu9F3ykkhJoC_NapAUu>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 02C56700065; Tue,  3 Feb 2026 07:32:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A8lqlFeQHG57
Date: Tue, 03 Feb 2026 13:31:48 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Yao Zi" <me@ziyao.cc>, "Nathan Chancellor" <nathan@kernel.org>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <aeca11fb-aa31-4fb2-b937-189626a81f81@app.fastmail.com>
In-Reply-To: <aYFx5L2xC_u9t0IN@pie>
References: <20260202041610.61389-1-me@ziyao.cc>
 <99c54e93-fb8c-4bdb-ad40-a3161a42bb8b@app.fastmail.com>
 <20260202230729.GA2319189@ax162> <aYFx5L2xC_u9t0IN@pie>
Subject: Re: [PATCH] MIPS: tools: relocs: Ship a definition of R_MIPS_PC32
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.35 / 15.00];
	URIBL_BLACK(7.50)[ziyao.cc:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sourceware.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ziyao.cc:email,app.fastmail.com:mid];
	TAGGED_FROM(0.00)[bounces-13101-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FROM_NEQ_ENVFROM(0.00)[ardb@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c0a:e001:db::/64:c];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F3B1DD973E
X-Rspamd-Action: add header
X-Spam: Yes



On Tue, 3 Feb 2026, at 04:56, Yao Zi wrote:
> On Mon, Feb 02, 2026 at 04:07:29PM -0700, Nathan Chancellor wrote:
>> On Mon, Feb 02, 2026 at 10:17:53AM +0100, Ard Biesheuvel wrote:
>> > 
>> > On Mon, 2 Feb 2026, at 05:16, Yao Zi wrote:
>> > > R_MIPS_PC32 is a GNU extension, its definition is available in glibc
>> > > only since 2.39 (released in 2024), and not available in musl libc yet.
>> > > Provide our own definition for R_MIPS_PC32 and use it if necessary to
>> > > fix relocs tool building on musl and older glibc systems.
>> > >
>> > > Fixes: ff79d31eb536 ("mips: Add support for PC32 relocations in vmlinux")
>> > > Signed-off-by: Yao Zi <me@ziyao.cc>
>> > 
>> > Thanks for fixing this.
>> > 
>> > It does imply that the subsequent kallsyms patch will result in 32-bit MIPS no longer being buildable with older toolchains if CONFIG_RELOCATABLE=y.
>> 
>> Doing a little research, it seems like R_MIPS_PC32 has been recognized
>> by the toolchains for a long time, as I found these commits in binutils:
>> 
>>   https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=092dcd755dcdcf664b25a7011fd15957f124c29f
>>   https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=b47468a6dbd1b54c44c2edc0f7db64a073d894ea
>> 
>> It seems like this relocation was not documented in glibc until
>> recently, along with many other relocation types:
>> 
>>   https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=a6e8ceb3bb532236e1eecd0bb0ee8e4b7fd5ff7c
>> 
>> I interpret that to mean that the kallsyms patch should work fine since
>> the toolchain can handle these relocations? It is just building the
>> relocs tool against an older glibc or musl that does not have the
>> R_MIPS_PC32 definition that is broken? Or am I misunderstanding
>> something?
>
> Yes, this patch is only meant to fix building of relocs tool. I don't
> think there are problems about toolchain supporting since R_MIPS_PC32
> has been in binutils for a long time, as Nathan found, since 2004. The
> situation is that it's likely to have a toolchain supporting
> R_MIPS_PC32, while elf.h on the build machine doesn't have its
> definition. And after ff79d31eb536 ("mips: Add support for PC32
> relocations in vmlinux"), the relocs tool started to require a
> definition of R_MIPS_PC32 to build.
>

OK, thanks for the clarification.

