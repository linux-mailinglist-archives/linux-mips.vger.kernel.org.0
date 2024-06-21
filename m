Return-Path: <linux-mips+bounces-3835-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4EC9122F9
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 13:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6F501C21558
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 11:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A925171E54;
	Fri, 21 Jun 2024 11:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="UMhZM4ev";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eu/ZJ/O3"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh3-smtp.messagingengine.com (wfhigh3-smtp.messagingengine.com [64.147.123.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD96A16C841;
	Fri, 21 Jun 2024 11:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718967895; cv=none; b=u4AQfr4N36p16ZcW768fThtLiii++b17Ll5XvBVFwCHSr/0aOfLSKu0h7cdnXZfOacs823FSbKuOlwdiiJIEnruxpUGXYuBtv079KUMsvrDSnuwu9gIxOHXWGZcSF518Ocidh3TwCtm7RGj5kKZf//H+7OqnJI3An6zNSYDHyDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718967895; c=relaxed/simple;
	bh=Dvl6H46jFeCW+DGyx4Y0OyUZ/HEvoRul4cNbU+tVke8=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=Nl9uRjKpsIKYq5Xpiaa5NW1miSkM7w0E4xZuq6xDJNEYo/7CbMXf14I27rRZbpRDxW0WIC/Y9BTxy7g81eUglTFRf1YHb1ps86ZXr6UMlOxDYl8EiSUa0TWvj21t5N0hojuq5m3VQDUSWhzDPWnH4o1qDBT2VhOjWe26ybipFqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=UMhZM4ev; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eu/ZJ/O3; arc=none smtp.client-ip=64.147.123.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.west.internal (Postfix) with ESMTP id D916A18000C0;
	Fri, 21 Jun 2024 07:04:51 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Fri, 21 Jun 2024 07:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718967891;
	 x=1719054291; bh=+4mawVHHYxsHrUFmP/eKSqPBJjxMmF/qeY0j0U2cW4E=; b=
	UMhZM4evlJnKXb3TMuLdm6YJGCy3vpVSl0zzRZOh+Sh/Ngj8PsDq2axmlNWM5Ng4
	5g6mObhwIIfsOQrccadvbe1nwkM5yrBjdEh8uWyXNfnWBhsJQv7rF/VXDPJouIpA
	GagGutD0TqvRLlvbaksNmUjKoqFRuPF0k/bCjnVWOkXDB1FX6LYFK/7f807eUrNi
	sqxwSdnpdl/iGsV5MGC36TUO5MfQSkd7+fM1Rc89GC+LbCLlY23MPzw/Pl5ep6Oo
	RZVsZLm4KMZM09CE1Z1AJ9VSvM2Wa2H2Bw91H/D3koTVWyoWhzX/BrKJ0ytbomNj
	11F7/IbLTeljRmCOwYA61g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718967891; x=
	1719054291; bh=+4mawVHHYxsHrUFmP/eKSqPBJjxMmF/qeY0j0U2cW4E=; b=e
	u/ZJ/O3W7FQSOPbxaSZe5H17letI4OVk3kOTIf+84H8TFTZa4T72RYEL1+chMlpc
	Xfi25od7YQlnojj3XVu54rhgCkY6RpW5cQ1FheMRrI6mctlpmU49t+N6g3NGP+5S
	eubvK4/eG7/b50mKTKDnQ/J/Sjar1HiVNuXNgKnVOCMcoddPF84B7G4sthj8+991
	iQSDJyCLVagzP8f9OiYU0I3v0Xg9D7M28lCxTJKOOHSrAH47tuTioSYnVmK/mcDx
	CxHSavA+AoE97hY263hPKEAbqpUwRXB6KI+f6qtTvrwLE70vz7jOrqMyntAvmX0s
	7tB8OYComBcuIXOR/TM9Q==
X-ME-Sender: <xms:Ul51Zqbq95Gop7NZPUGtl2JKjyqbORNifnQ1eb76gvAZ_5Kvw9oa3w>
    <xme:Ul51ZtYoXnDifZoJcXp_VOSP3_xslVPybbhsZyR_NTCrTZw1T0KCO9oqD-mX0IHrh
    cjEH8NM3j6o5VdU7Gw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefgedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:Ul51Zk__b6ELkqgfk2SsxTllgfXx2r2Urcb9WX7_0NYJvC7_iMhOLA>
    <xmx:Ul51ZsoayH-cbnpW_tsaUkKzbqKbGgtFfSukR5pCk7tdMhgIgkW_aA>
    <xmx:Ul51ZlqowEoljjm-1ENIKNmk3MvQcSF4-2e4PCi2SjIhy7E_GrseFA>
    <xmx:Ul51ZqQmJ6v0-AgWQglvlPp-xVbrWjEFk5sQfv40qqzoW1Xn8F5teg>
    <xmx:U151Zra_Mg46cIanT2eoEH8Q5PPliVsuLNRZlRG8-Ge21Jy80NQ0g9oM>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7777936A0074; Fri, 21 Jun 2024 07:04:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <9d64bd8d-e146-46e7-8526-e85192ee14ed@app.fastmail.com>
In-Reply-To: <ZnU3/c1T55k4WbYx@alpha.franken.de>
References: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
 <ZnRtYFr5HFffyK7E@alpha.franken.de>
 <ff6fe06d-6209-4e34-9cc8-eb516fa4ffae@app.fastmail.com>
 <ZnU3/c1T55k4WbYx@alpha.franken.de>
Date: Fri, 21 Jun 2024 12:04:30 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Aleksandar Rikalo" <aleksandar.rikalo@syrmia.com>,
 "Aleksandar Rikalo" <arikalo@gmail.com>, "Chao-ying Fu" <cfu@wavecomp.com>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Greg Ungerer" <gerg@kernel.org>, "Hauke Mehrtens" <hauke@hauke-m.de>,
 "Ilya Lipnitskiy" <ilya.lipnitskiy@gmail.com>, linux-kernel@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "Marc Zyngier" <maz@kernel.org>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Serge Semin" <fancer.lancer@gmail.com>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Tiezhu Yang" <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 00/14] MIPS: Support I6500 multi-cluster configuration
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8821=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8A=E5=
=8D=889:21=EF=BC=8CThomas Bogendoerfer=E5=86=99=E9=81=93=EF=BC=9A
> On Fri, Jun 21, 2024 at 12:05:32AM +0100, Jiaxun Yang wrote:
>>=20
>>=20
>> =E5=9C=A82024=E5=B9=B46=E6=9C=8820=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=
=E5=8D=886:56=EF=BC=8CThomas Bogendoerfer=E5=86=99=E9=81=93=EF=BC=9A
>> > On Sat, May 11, 2024 at 12:43:27PM +0200, Aleksandar Rikalo wrote:
>> >> Taken from Paul Burton MIPS repo with minor changes from Chao-ying=
 Fu.
>> >> Tested with 64r6el_defconfig on Boston board in 2 cluster/2 VPU and
>> >> 1 cluster/4 VPU configurations.
>> >
>> > which existing CPUs can use this ?
>>=20
>> Besides Boston are some multi cluster I6500 systems in wild, includin=
g Fungible F1,
>> which comes with 52 cores in data panel.
>>=20
>> Those vendors show no interest on mainline kernel support though.
>
> ok, so looking at the series it touches areas with different maintaine=
rs,
> I'm fine taking the MIPS parts, can I simply cherry-pick them out
> of the series ?

For irqchip part I think it must be taken together with MIPS arch part.
It's a part of MIPS CORE DRIVERS maintainers entry as well.

For FDC I think functionally it's not a prerequisite.

Thanks
>
> Thomas.
>
> --=20
> Crap can work. Given enough thrust pigs will fly, but it's not necessa=
rily a
> good idea.                                                [ RFC1925, 2=
.3 ]

--=20
- Jiaxun

