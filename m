Return-Path: <linux-mips+bounces-5492-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42874972E9E
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 11:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 006C3283C84
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 09:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1AED19049B;
	Tue, 10 Sep 2024 09:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="UMFN3vB1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fO06+uFg"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A997187325;
	Tue, 10 Sep 2024 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725961429; cv=none; b=jnqQZqwAurxLw1jGCBifzgpjbdoI3tr0rjKlizbYESZhuBzddo64gWsJj/opI02IGLJsmjiiFBMe1FVSPvfQCAU+3+qpUNSCw7NeYM/EtzYMYg3/SyBpNL2dwOatv5BLKEwe0/LakgOkjAB0nl7lOu5NpKG3ahUEGgqRenBp/qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725961429; c=relaxed/simple;
	bh=ui5wGhZUCRW5coT6WzLnjYhzoLrsRPWbFebz2dyA0FQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=aNh34MVkhKB45xiAijh1nStKkQ73qQSWdTB1Im+bRJZhiqcRfsPSpoP55DmI0+FCQxP6NTlFBzhNDr/HxYVdMMEk1p9WBdJ34ccB0Ot34JomspmHF4Tvg3RzkQxKwzHd0FPx7TmElHaOnNh+FC0E65vBNvzzGfKLCLP7HSKPz2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=UMFN3vB1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fO06+uFg; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2D7B31140308;
	Tue, 10 Sep 2024 05:43:46 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Tue, 10 Sep 2024 05:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725961426;
	 x=1726047826; bh=RC2tu5Bk5p0RtLEbaxphGTYXY7K+igsvyvD5mhKmwX4=; b=
	UMFN3vB1AQgxsh0w6VCKvqeKUzD8vaVVANYxejW+Zkg6/LhB1LvVR4EbNvmneNSV
	t1StvkhfHeR4G6+CVIodF2hxjsc0gpI94j+yNiC8P+LMBKkfkRfiPDcYmWO/KZOf
	HJSp4H8QymPIf5ahNRSiRO200y6xDYj2rcFPNdW3s+fUhobslprCO0Kul6RflsVY
	Fv/TaAgPP/YyBk+EFOsB6ZAZO1ue3LDmotfJDk2F0+X+9guxWdPtZ1L3cm8+Ze3z
	iFBezWhxYyZNRZcfDufen9agrKXQhppH5zu63tR2Y2lBRM/6i5qwuglpifm5RoGX
	MDUS0AojiSl332ktQEs2IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725961426; x=
	1726047826; bh=RC2tu5Bk5p0RtLEbaxphGTYXY7K+igsvyvD5mhKmwX4=; b=f
	O06+uFgJcNn994vqXf0joOlqM3mpq1FLsm0AEbABgKhiXjMd6/S6ViavexP0lAQ5
	ITSL+MIqV+/yFkM2zyJGkPB1GdAmgU8W2b2nGG8f/QdgOg7DxJ0YaWjdVvhyYfZr
	BXmxN1uYeckml1yrgUBKbJsa1Jmf1FDp8dSDcVWNEafhIpMuwSk71hh9Imkhw1rG
	7Z8169MVIRYv5SM7jSvRU65XVYzpjVX4RGxVuhyWdGsme47l059e9XSTHAqe8WQL
	pwBxd9EcXh6i1GLYcw68CukctT0dhQcJ3yzv/ZZQkphNN1Gjj9FiMwT5HNOHLU2/
	Exh9Lv8z9HD+k9m8J9zEw==
X-ME-Sender: <xms:0RTgZsNMtsu55CVV8aFbrOSxAh3lHJcroREJDMKEJDIaBHtFmeCTvw>
    <xme:0RTgZi_9T6tv56AP2PAiyHG1Y4bQPy5TT6VoKzDMsofb0153q7R_AEm35_8XT1fkf
    VXFR_p6xpaFGlx3gMM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeiledgudekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepffekveettdeuveefhfekhfdu
    gfegteejffejudeuheeujefgleduveekuddtueehnecuffhomhgrihhnpehkvghrnhgvlh
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphhtthhope
    egpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtshgsohhgvghnugesrghlphhh
    rgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepmhgrtghrohesohhrtggrmhdrmhgvrd
    hukhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:0hTgZjRfO--eqHjLJBMkkOEhPYv4-rOi_wJC6h78f3MXrDPzfEMmhA>
    <xmx:0hTgZkuto1SqVjj9TSmlBTauR7KFK703kUTOi6fOJhHfku7JSU55rQ>
    <xmx:0hTgZkfvyR7NMljYQAmOC3ib6vHnD5C7MIgC4wpmgEaBJT1byGTSNA>
    <xmx:0hTgZo1HTzFBi6cMlZoEusiLPKrH4g8tMPGcwT5Rb2WW51ZmRUOJbw>
    <xmx:0hTgZs4xsmiBfQ_ZjR_lGt0eluSnh3vUTY2T3OEgEiuzUnJqIeH82H9h>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DF0CB1C20065; Tue, 10 Sep 2024 05:43:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 10 Sep 2024 10:43:23 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <b4833f82-9e7e-4667-994b-c444ef935a9f@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2409092259110.60835@angie.orcam.me.uk>
References: <20240908-mips-chore-v1-0-9239c783f233@flygoat.com>
 <20240908-mips-chore-v1-2-9239c783f233@flygoat.com>
 <alpine.DEB.2.21.2409092259110.60835@angie.orcam.me.uk>
Subject: Re: [PATCH 2/2] MIPS: kprobes: Massage previous delay slot detection
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B49=E6=9C=889=E6=97=A5=E4=B9=9D=E6=9C=88 =E4=B8=8B=E5=
=8D=8811:02=EF=BC=8CMaciej W. Rozycki=E5=86=99=E9=81=93=EF=BC=9A
> On Sun, 8 Sep 2024, Jiaxun Yang wrote:
>
>> Expand the if condition into cascaded ifs to make code
>> readable.
>
>  Apart from broken formatting what's making original code unreadable?

For me it's confusing because wired layout, cascaded ifs are clearly
easier to format and has clear intention.

>
>> Also use sizeof(union mips_instruction) instead of
>> sizeof(mips_instruction) to match the code context.
>
>  That has to be a separate change.

Given that it's a tiny style change as well, it makes sense to combine
into same patch.

>
>> diff --git a/arch/mips/kernel/kprobes.c b/arch/mips/kernel/kprobes.c
>> index dc39f5b3fb83..96139adefad2 100644
>> --- a/arch/mips/kernel/kprobes.c
>> +++ b/arch/mips/kernel/kprobes.c
>> @@ -89,12 +89,12 @@ int arch_prepare_kprobe(struct kprobe *p)
>>  		goto out;
>>  	}
>> =20
>> -	if (copy_from_kernel_nofault(&prev_insn, p->addr - 1,
>> -			sizeof(mips_instruction)) =3D=3D 0 &&
>> -	    insn_has_delayslot(prev_insn)) {
>> -		pr_notice("Kprobes for branch delayslot are not supported\n");
>> -		ret =3D -EINVAL;
>> -		goto out;
>> +	if (!copy_from_kernel_nofault(&prev_insn, p->addr - 1, sizeof(union=
 mips_instruction))) {
>
>  Overlong line.

Nowadays, check-patch.pl is happy with 100 column line.

I used 100 column line in many subsystems and never receive any complain=
t.

>
>> +		if (insn_has_delayslot(prev_insn)) {
>> +			pr_notice("Kprobes for branch delayslot are not supported\n");
>
>  This now overruns 80 columns making code *less* readable.

I don't really agree, we are not in VGA display era any more, see Linus's
arguments on removal of 80 columns [1] and why long line are more readab=
le [2].


[1]: https://lore.kernel.org/lkml/CAHk-=3Dwj3iGQqjpvc+gf6+C29Jo4COj6OQQF=
zdY0h5qvYKTdCow@mail.gmail.com/
[2]: https://lore.kernel.org/lkml/CAHk-=3DwjR0H3+2ba0UUWwoYzYBH0GX9yTf5d=
j2MZyo0xvyzvJnA@mail.gmail.com/

Thanks
>
>   Maciej

--=20
- Jiaxun

