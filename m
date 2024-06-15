Return-Path: <linux-mips+bounces-3689-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6D49099B1
	for <lists+linux-mips@lfdr.de>; Sat, 15 Jun 2024 21:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 979E11F21D6D
	for <lists+linux-mips@lfdr.de>; Sat, 15 Jun 2024 19:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839EE45030;
	Sat, 15 Jun 2024 19:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="bKU2C1yv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jfV2cU1b"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB661E893;
	Sat, 15 Jun 2024 19:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718478993; cv=none; b=fXwb2LivZd0De4On57/R2kX2w5RRhv/xbjbsaPLOINb1ZZYV8ltY7oDY2LBHUjBh/4DjF5exCs+CO9RPlpCODzz6sgkrID6NwKM7trhsjsLZLg6mfMGf7zGL4D4nwXXqvDPokAVt+CeEGO7Qjmz/gyRFDV/G7am8I7UTdJWNuPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718478993; c=relaxed/simple;
	bh=WQP8mprcyLxGHGBHYbPGtfzxDeaNVpjMuekoyimHnZc=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=jgSHwSUv/tTpK2SRzE9xZmE1cAWVqIADtI+OhFhhkGA1g172CHf3yqTJZV9SDrEirvCieBZdpJgnVMaGnG3jgZbEhPHw+ZyGdokwCHrJ+y4WAnxYWnuG/YlHxKQNJVGCoejNQWkB2Sd1SGwx2RHKvjtOgeASFjpOTVl7aQgZJLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=bKU2C1yv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jfV2cU1b; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 1A4661380168;
	Sat, 15 Jun 2024 15:16:30 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Sat, 15 Jun 2024 15:16:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718478990;
	 x=1718565390; bh=uDjXBaIK+32v64wqSd7tcZ5KQ7Sd9TTZs2lStMzn7j4=; b=
	bKU2C1yvQUHbUHrO6iOVmej7jVhqHJ/MPyCo0HCvKNB8A1E+WEppaTvdOKEyahS4
	COys1M7XQhI3z5JM57zVkNexwlbay18mO+Iz2JS/1PGxZjhNdJkJ0j4oudsqyeBh
	L3gBjm9Msv6U0N+icXF9ByjBtzX4TfenAu/FycQMz+IEPqSHC9dyH20bBewcIfsL
	ls4m8nF4hevxVBKDDmZLNHDq83HdmqLxcqhhrUYjDvHLGDgKogPM/OHA54p1+CfX
	9kqpqtN29buM2tMj+dB/ymy2Geq+HnZgd5xYaCVgN5HTmEjC0212dGokgbZvhLSi
	ZE0b34jHyNJjixVTcLa+mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718478990; x=
	1718565390; bh=uDjXBaIK+32v64wqSd7tcZ5KQ7Sd9TTZs2lStMzn7j4=; b=j
	fV2cU1bRg5KLo/bjr88qyR9PTAewAEjoPJGnWOuAwJq7+gONOFfCtppvH+niXSTb
	W3Xn0WWHcpHysRuZabDcziQ2eE6ui5vBi1isAtZqxDk9ABMASyVR6CPlWVVUXMls
	H6pRUwXOe7XHrRTecdgCjZlbWHv6OAbx+M4t7p566ANGU7aFnSJ4mzuw5Op/v8pz
	WVdkGksiy1JLHbcP2P1XCaY7UM18I3KDJIY494oR5li/NqESB1vISR/A1AH9s9MN
	TvKAtGbdfYaQx1WL78RttM9fYx9Q8CxJ3PNol/+Je7eTnmyvH4Yb5o8Z4BlYu2nA
	IfSv0mLC3EiYLcu8di3yw==
X-ME-Sender: <xms:jehtZp1265ZsIvz7cHLgwFLphpP2kprOtnvoI6HZd4LNSOuA3UrpCg>
    <xme:jehtZgGrhJV_hdHFGhmoJs1XU2oldJdea7XJ5_0qN2jJX8FFWkpfaojTw1JAq0NhB
    wO-8zuyDQFKK8fpGbE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedvuddgudefgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    lfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtg
    homheqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefh
    jeeugeevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:jehtZp4NbFXmuSGX73U3p_g9Hex93Z5HUT9ZJ1mqcy-NOraHzeYGrw>
    <xmx:jehtZm0syUk9cVZrWZFYtCc6Upcnww2sGKp8JuUI7WSHTvulSYcLmA>
    <xmx:jehtZsGcUd-ML6iThrv18UWlLcXqjD8Ng6va9o2AcasbV4CJIRuFow>
    <xmx:jehtZn_AZ8kbb-NIgS_qge5oFj-GB6I0l-veAH7rOu8wWEeX2wZZwQ>
    <xmx:juhtZnBC5mxJ9ouhFIgDildNpY_9Wh09YS_Uwd3onBq1jnVss8uqFiLq>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9411F36A0074; Sat, 15 Jun 2024 15:16:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-515-g87b2bad5a-fm-20240604.001-g87b2bad5
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <5c51085b-6e6c-47f8-a68a-829ddc7ba74d@app.fastmail.com>
In-Reply-To: <20240615-reaction-movie-b4c21f2c7d91@spud>
References: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
 <20240612-boston-syscon-v2-7-9f8e1a07fa63@flygoat.com>
 <20240612-unstuffed-figure-966c90af52bc@spud>
 <ddb36d6c-b54f-4982-b9ca-48c022ce6eb8@app.fastmail.com>
 <20240613185902.GB2286020-robh@kernel.org>
 <dfb545a6-b8c2-4498-aa01-3e851fe0877f@app.fastmail.com>
 <20240615-reaction-movie-b4c21f2c7d91@spud>
Date: Sat, 15 Jun 2024 20:16:11 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Conor Dooley" <conor@kernel.org>
Cc: "Rob Herring" <robh@kernel.org>, "Lee Jones" <lee@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 7/8] du-bindings: mips: cpu: Add img,mips compatible
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8815=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=E5=
=8D=881:28=EF=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> On Thu, Jun 13, 2024 at 08:40:18PM +0100, Jiaxun Yang wrote:
>>=20
>>=20
>> =E5=9C=A82024=E5=B9=B46=E6=9C=8813=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=
=E5=8D=887:59=EF=BC=8CRob Herring=E5=86=99=E9=81=93=EF=BC=9A
>> > On Wed, Jun 12, 2024 at 05:59:24PM +0100, Jiaxun Yang wrote:
>> >>=20
>> >>=20
>> >> =E5=9C=A82024=E5=B9=B46=E6=9C=8812=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=
=8B=E5=8D=885:39=EF=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
>> >> > On Wed, Jun 12, 2024 at 12:56:26PM +0100, Jiaxun Yang wrote:
>> >> >> This compatible is used by boston.dts.
>> >> >>=20
>> >> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> >> >> ---
>> >> >> note: This is a wildcard compatible for all MIPS CPUs,
>> >> >>       I think we should use something like "riscv" for riscv.
>> >> >
>> >> > riscv systems, other than simulators etc are not meant to use the
>> >> > "riscv" compatible. All of the real CPUs use "vendor,cpu", "risc=
v".
>> >> > I'd suggest you add specific compatibles for your CPUs.
>> >>=20
>> >> Boston can be combined with many different CPUs, thus we need to h=
ave
>> >> such compatibles.
>> >
>> > Then you'll need different DTs. Different h/w, different DT.
>>=20
>> The board have 9 CPU types in total, with hundreds of different possi=
ble
>> CPU topologies. Maintaining separate DT for them seems impossible in =
kernel.
>
> But you could definitely add 9 different compatibles for each of these
> different CPUs.

They are already in current bindings, but we need a default one to fill
in kernel dts.

>
>> We can potentially patch this in bootloader, but for existing firmwar=
e it's
>> being doing like this for years. I can see for RISC-V QEMU generated =
DTB is
>> using a single "riscv" compatible and I do think it's a similar probl=
em.
>
> That "riscv" compatible is only supposed to be used for
> simulators/software models. Real CPUs are not meant to use it. AFAICT,
> your boston is a real platform, even if the CPUs are implemented on an
> FPGA they should still have one. If you take the OpenC906 RISC-V CPU a=
nd
> put it on an FPGA, you're still meant to put "thead,c906" in your DT.
>

And sadly, boston is also the platform used by MIPS internal emulators :=
-(

Thanks
- Jiaxun
>
> =E9=99=84=E4=BB=B6:
> * signature.asc

--=20
- Jiaxun

