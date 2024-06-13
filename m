Return-Path: <linux-mips+bounces-3670-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9443D907CC8
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 21:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C8A61F2536C
	for <lists+linux-mips@lfdr.de>; Thu, 13 Jun 2024 19:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDD914A4EA;
	Thu, 13 Jun 2024 19:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="50ngkzPY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nBQvVgh6"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52636134407;
	Thu, 13 Jun 2024 19:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718307640; cv=none; b=QTpvk1GCTg98nSdkTRRPNYnCNK2JaH6bK9pDPctekFvHt/DxaaN3n1Ajc/XxmhGFDjuhIaqA267TzdNaSpFspE7HrhR/xKLJb5oNZzfcopEvqRBoi4IzbYKNf16+ckY9Qq8gVhwLiJSkQP+7/EN8SiHMswBJFxzdQ57jaXcYuQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718307640; c=relaxed/simple;
	bh=7llpCOFgvcUxbS2cWK7Y5Znfoz9knmpfrFVXwGUPPzE=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=jC/p5a5JSpApDwB3QdNkDK31D1fgGfMcPnbWBC8gl6fSEsTg/WZt/duf6nU34Xto+/ctWsM77UtcUUgl+CzWlgmoDMwpTf/PyNHSCViDzfV88VjXQ0b2nc0GAu/O+vO9Jhgp2pzRSjNovYP/PzXy4uGYPT/KVbMsv3Ke3rVVJcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=50ngkzPY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nBQvVgh6; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 6DFA41380117;
	Thu, 13 Jun 2024 15:40:38 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Thu, 13 Jun 2024 15:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718307638;
	 x=1718394038; bh=oqDoiw11ZfKTk6wjqM+5gp30nptU4jTafY6bPs+rNiQ=; b=
	50ngkzPYg9dGn8qrvRm3e0z7cizqf7hqRoWfcVKtIKXzw5sERNQ9qXAj4jPIuTjA
	fYl5mpJ852dDx7HOfUnnRm9pDehlafCLWABp1UZuPJ4jLU6AEEEfU1Hgd9Lgzwa2
	avYvjWxQfiHJzCOjUb1ZvDVOGBgOVM7TXQooHsgK9njIVQ9KNobdqdwZprRXXCl3
	hv3uQWQOUB8hzbYtFcwXSxTnnhdN5nQ7ndi76iCS7Z0dZWqFt2OQzk3HQxldixzv
	iDTzrytSas//9gJ6CWMZHSM5iJSxjV6BvD7VEgUQQhDmOI0svR5BEhpgUJ4nUjh4
	+YxE3a7nbywKCqy2Q9BYYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718307638; x=
	1718394038; bh=oqDoiw11ZfKTk6wjqM+5gp30nptU4jTafY6bPs+rNiQ=; b=n
	BQvVgh6xgHey1y+NaXXiINyRF2PFaX8TWQ2Nkse8RfCEIHZsgcnNJ1qEp5hQmEXx
	qUI2hK3r/smoPOoOxobPdTk/JlBMk153QCCWyXOJ3qb8IbcKm5gCzwQRxZ8kIJgK
	8UbHYiL36T/HiSLTA13A+3WEvh+k2X3Af1p/3OZMDfaT4f3+L8TeRmxZZC3/r29c
	T+Q6reUKgYRqWEVMhZs0kNOV7h4ZhTBHwTwPos2UggSW/Q2tFOuoZBYTGbQsOaiZ
	4JqgUvsnvaHk9BAEWkwWKSe5ylQ/WsTduPOunZwieuFjPRDV7LdkKTRmFAbPLE84
	AJ7PggshK82cufoXOwbOA==
X-ME-Sender: <xms:NktrZlMmP2hDaaJYOys3ZPRvDqwDGPnTE4Oi6NCEeN-mXnQ_BaIv3w>
    <xme:NktrZn__y7Vp4MwAtuCyXJ3XapW_GmMaJ2NieYqWldcqDj6YFMZYxT5WLz8D6KbT3
    cE2yrhucCoyrimr0Zc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedujedgudefjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    lfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtg
    homheqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefh
    jeeugeevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:NktrZkQ73FG37jYU2gMIz8Q3KODzqfJ2rDG8aDp0nOpJHIK08DgSlg>
    <xmx:NktrZhvAl5flnedrEm7bMKTIg0uIHYseL1G1mkrWnpkaM5Pk9vIlvw>
    <xmx:NktrZtfRXKH8UerUl9l96hd0X9WLtmrGVQZtKcoslkE-wnrqUu-Dkg>
    <xmx:NktrZt0eJ34O60I1qAELCKVd8SgwlVJ_7gA2ItJDNnWVqpzzhC0MoQ>
    <xmx:NktrZp4dWfb1mVfXD8boMiCJJxFfcx_w-4REuCm4risjKayROIAXHH2F>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1440136A0074; Thu, 13 Jun 2024 15:40:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-515-g87b2bad5a-fm-20240604.001-g87b2bad5
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <dfb545a6-b8c2-4498-aa01-3e851fe0877f@app.fastmail.com>
In-Reply-To: <20240613185902.GB2286020-robh@kernel.org>
References: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
 <20240612-boston-syscon-v2-7-9f8e1a07fa63@flygoat.com>
 <20240612-unstuffed-figure-966c90af52bc@spud>
 <ddb36d6c-b54f-4982-b9ca-48c022ce6eb8@app.fastmail.com>
 <20240613185902.GB2286020-robh@kernel.org>
Date: Thu, 13 Jun 2024 20:40:18 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Rob Herring" <robh@kernel.org>
Cc: "Conor Dooley" <conor@kernel.org>, "Lee Jones" <lee@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 7/8] du-bindings: mips: cpu: Add img,mips compatible
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8813=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=E5=
=8D=887:59=EF=BC=8CRob Herring=E5=86=99=E9=81=93=EF=BC=9A
> On Wed, Jun 12, 2024 at 05:59:24PM +0100, Jiaxun Yang wrote:
>>=20
>>=20
>> =E5=9C=A82024=E5=B9=B46=E6=9C=8812=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=
=E5=8D=885:39=EF=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
>> > On Wed, Jun 12, 2024 at 12:56:26PM +0100, Jiaxun Yang wrote:
>> >> This compatible is used by boston.dts.
>> >>=20
>> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> >> ---
>> >> note: This is a wildcard compatible for all MIPS CPUs,
>> >>       I think we should use something like "riscv" for riscv.
>> >
>> > riscv systems, other than simulators etc are not meant to use the
>> > "riscv" compatible. All of the real CPUs use "vendor,cpu", "riscv".
>> > I'd suggest you add specific compatibles for your CPUs.
>>=20
>> Boston can be combined with many different CPUs, thus we need to have
>> such compatibles.
>
> Then you'll need different DTs. Different h/w, different DT.

The board have 9 CPU types in total, with hundreds of different possible
CPU topologies. Maintaining separate DT for them seems impossible in ker=
nel.

We can potentially patch this in bootloader, but for existing firmware i=
t's
being doing like this for years. I can see for RISC-V QEMU generated DTB=
 is
using a single "riscv" compatible and I do think it's a similar problem.

I think it's better to document it and warn people only to use it in lim=
ited
circumstances, instead of keeping such usage in grey area.

Thanks

>
> No way we're taking a generic compatible like this.
>
> Rob

--=20
- Jiaxun

