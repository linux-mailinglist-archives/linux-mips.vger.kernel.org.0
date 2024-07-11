Return-Path: <linux-mips+bounces-4270-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B0392DE28
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 03:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A43DA1F218BE
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 01:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B744D8BFC;
	Thu, 11 Jul 2024 01:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="bIzmUleh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IrUfFWem"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E058801;
	Thu, 11 Jul 2024 01:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720662834; cv=none; b=Ba5x5lFSlW7PZHMMVyqUGGvu4TFcckt8TcsvhZeHZY+Pb6GNs0gh1+9xApLOU+zyYagNDcrlc46b9lGmEc5R7G0vOaQ85uIxRSMqbvqM7yemwCdmvxnDXIN9kPvBdrM8l4fFcOVSRBYbfMLbYFWxZP79VD/Tg6eg9FH10PJ4fiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720662834; c=relaxed/simple;
	bh=V0su/2TVwxm7ML1o7WKw5VLN0Yqb3uJ2r3KKs/Mko04=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=RwyQK9Y9ZvMM1UnvTFnKIPhTePQqVRc2C4x3Z6I6r8IkusdNZqaYUe/NMOdNJrIOZj8XZ3oae8aGhEy0hOU8xDJEkwXT2vtWPAI5Ras5hLaKW5oLi0UHT20QTnDSNJgzAYoQy72Pu4XVMGwxtXu2uSFQyB8cPa/g3c2y+Kx8AWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=bIzmUleh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IrUfFWem; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 240B81140C0B;
	Wed, 10 Jul 2024 21:53:52 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 10 Jul 2024 21:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720662832;
	 x=1720749232; bh=blYGdh72QWxBvqFvSyMrnSkviyCQU3tEmPuUaU4E6Tc=; b=
	bIzmUleh48on1QgxG+ZuzhrpJAeYJ/kbOcUPCiGo4dIAf5rnMxS2iseRZ6MDsMJk
	i52NmQXfJHFeihqlghPgG9etJvRfCJxyW9PyRNTirvvb9UDPZvHB6BldDeVkemsz
	f1g07ids4dd5gAd6grKGiQrb/T6cbY/gzQt/5D31Cv/g5nC4Y1tuW2ngojv+Kv7/
	WWOLUeJvhWcGnzSkKmXrjRCTRNMp0e4bbXCspQ5wPxY+5njtQYvn0Ed/WEx5eYLy
	mDDYZaRm+Ty6l7EkMCzX5nBB1/7s39KckghwW9p31DqGyUXd2NiZ2NYUQMzMkZ5+
	MtBWqhV5vN0Ek12DE8N1eQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720662832; x=
	1720749232; bh=blYGdh72QWxBvqFvSyMrnSkviyCQU3tEmPuUaU4E6Tc=; b=I
	rUfFWem8XnqFRRqjqo/UDmUFkDnDNxf3jzyOUWLE06VIqceIOobQEFdf52OXGoS7
	g1/Ip/IJw51aONCKCT/jHPC9zx/GvNKu2ZLI/cWlml2ipNtEvFWVbupYx29X0pWp
	OUrRyPWy+PSrB76iy5sIriOlCSpIa0z8x0tWlMhrsBrVt+lF8WOVX4ZFPlgACvMz
	kKsmdyRi0L3Mjk/i/nYyYHn1tO5KGxPzVGqaBR8L8bolY6ukTuJ68dyXdMLBA3wM
	vCgiLkV1rQ6T+37sanPEXxeCnlx6dsKkqxZUCeO4Cf4GUGC5AuC/yGgtEm1/E4xP
	qMM1oZjyZzyombBBuXssQ==
X-ME-Sender: <xms:LjuPZsHoNiCaX2K7bdug5uYm-7FMWD8pyc0FabfSifBRdaSHisu8Eg>
    <xme:LjuPZlWcYETmflykB6ZZRJNh5BoPHe3sA2DfDNo60O3gBzzj8uqG2sdcLpdi7wLY9
    4kN6KGNQ_5n2XcMHX0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeefgdehfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefhjeeu
    geevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:LzuPZmJGU7Xj4JwVgAsOMedQx2RGSk1eLkCNiCpX7A3UX4NZwnOL_w>
    <xmx:LzuPZuFv7ChyOVk8h10Bkt9MhLlUDQZUSw0lHOdoUdcSPAj1Yckl2A>
    <xmx:LzuPZiWN31a3zsnRpU_SRQA6lcsjqzrsB24DXwz6PbYoWCPRkr4JiA>
    <xmx:LzuPZhPzAIvZmpSw7CVR44Bvq2FmVzpF1Lm_nAkaJYZu_Rx0Cf1Q3Q>
    <xmx:MDuPZkIApB6PeRPf7sMNFo96_LJpq-_AIPoUQswEwMCbzEI1B-iM94SG>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DE20E36A0074; Wed, 10 Jul 2024 21:53:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <a8741e38-837b-4fbb-8656-1e6d50bdfcc0@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2407101015120.38148@angie.orcam.me.uk>
References: <20240612-mips_ieee754_emul-v3-1-2c21b450abdb@flygoat.com>
 <Zn1FuxNw2CUttzdg@alpha.franken.de>
 <9cc26415-9cbc-47fa-a132-7d8c000874a4@app.fastmail.com>
 <alpine.DEB.2.21.2406272053180.43454@angie.orcam.me.uk>
 <fbd421a6-cf37-49ab-bdbe-6128a7cae8be@app.fastmail.com>
 <Zoz6+YmUk7CBsNFw@alpha.franken.de>
 <7797a7b2-1bb2-4c45-b65d-678f685dfa3d@app.fastmail.com>
 <Zo457UgAkhbAgm2R@alpha.franken.de>
 <alpine.DEB.2.21.2407101015120.38148@angie.orcam.me.uk>
Date: Thu, 11 Jul 2024 09:53:30 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Jonathan Corbet" <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3] MIPS: Implement ieee754 NAN2008 emulation mode
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B47=E6=9C=8810=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=E5=
=8D=885:21=EF=BC=8CMaciej W. Rozycki=E5=86=99=E9=81=93=EF=BC=9A
> On Wed, 10 Jul 2024, Thomas Bogendoerfer wrote:
>
>> > > I'm considering to apply your patch, how much testing/verificatio=
n did
>> > > this patch see ? Do have some test binaries ?
>> >=20
>> > It has been tested against Debian rootfs. There is no need to test =
againt special binary,
>> > but you need NaN2008 hardware such as Loongson 3A4000.
>>=20
>> that's just one case, what about NaN2008 binaries on a legacy MIPS CP=
U ?
>
>  It would be good to check with hard-float QEMU configured for writabl=
e=20
> FCSR.NAN2008 (which is one way original code was verified) that things=20
> have not regressed.  And also what happens if once our emulation has=20
> triggered for the unsupported FCSR.NAN2008 mode, an attempt is made to=20
> flip the mode bit via ptrace(2), e.g. under GDB, which I reckon our=20
> emulation permits for non-legacy CPUs (and which I think should not be=20
> allowed under the new setting).

PTrace is working as expected (reflects emulated value).

The actual switchable NaN hardware (M5150, P5600) uses a dedicated Confi=
g7
bit rather than writable FCSR.NAN2008 to control NaN2008 mode. This is u=
ndocumented
and not present on some RTL releases. FCSR.NAN2008 is R/O as per The MIP=
S32 Instruction
Set Manual. This renders the purposed test pointless.

That being said, I'll catch some time later to test behaviour with purpo=
sed QEMU modification
but I think it's good to go now.=20

Thanks
- Jiaxun

>
>   Maciej

--=20
- Jiaxun

