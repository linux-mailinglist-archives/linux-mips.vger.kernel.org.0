Return-Path: <linux-mips+bounces-4807-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E8F94B7F6
	for <lists+linux-mips@lfdr.de>; Thu,  8 Aug 2024 09:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 881951C243EF
	for <lists+linux-mips@lfdr.de>; Thu,  8 Aug 2024 07:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1CE1891A8;
	Thu,  8 Aug 2024 07:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="hVx2Exae";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RC+EEX+O"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E27C188CB0;
	Thu,  8 Aug 2024 07:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723102559; cv=none; b=c3IrqTifhdcW57Sio08H1Rxp0SrfLFgS5VJNDvehgPEK/d/hAMp027mYQZismkvfFoBITSsAqYxncHYD2jZ53877zaKNEr1UbhHpajCgcouu7miIkZtsaLdp3ObhC2nLWTtaUgY/xDRsTDkM6rjCIf37Rr3/GmjZ5nF2ylBdKOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723102559; c=relaxed/simple;
	bh=L6+YeIn/Vp1pbx3yet9x4syQyFrDr8NrjU/GSzGYsuc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bsTSnHdfVH07t9cwuILM/8xXRZKrIEmc5UglJS6S0IdnJhex82WwWUGvTq9L19LqGQ3LmHjTK5OLj8zHusu+HI0lfCn6cEMIUV0ZMowTUvkPs7Es/cvfbm5c2szGO/mLRFjkKoTRogRDut5RVsJLs/fuojhRT8ktKHNuXHLHEzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=hVx2Exae; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RC+EEX+O; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 84E171151BEF;
	Thu,  8 Aug 2024 03:35:56 -0400 (EDT)
Received: from wimap26 ([10.202.2.86])
  by compute5.internal (MEProxy); Thu, 08 Aug 2024 03:35:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1723102556;
	 x=1723188956; bh=fMFJm5IlFxBmEa62YMJEhbiKsIZQqiP31Px8V8AfdNY=; b=
	hVx2ExaejuSrIfGHB0X94CrBVfdkmsna7NDUz0c/QmuxRhZRxcHT2G54tYhw8XwD
	DAozKrOTgwEwcuiDp6xOUonyCN87fG2/itoNWCFmstTy1g0JTZoBEDXRUE8JYS7c
	SRVInd1ZbKwfPjHkxlIRr863cZuwDfgfqF+jXmbuOrgF74KAn8Gx+IBTgdzwN8+V
	prDWnEUskXOcmWcbJRH8nRFHPCX/higE9lFraUxHPbNEECZX2Rtp9ISiW5G2kCVA
	9aSBWmqtit3131ogn6s8wr9QDlSQBmFRkMs9nnu/Sht8StIKfkNllPFqsOD+LVUc
	BvfQ17hMlLTjOmiv30Hz1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1723102556; x=
	1723188956; bh=fMFJm5IlFxBmEa62YMJEhbiKsIZQqiP31Px8V8AfdNY=; b=R
	C+EEX+OBxAIDeqhr/KFfs+qCOQ23Q26BLOtA9xOS7swUsL33Db10vcgrKpg7mjk4
	4a40Li1H/CuYw5kCPnhI3aZSknYCgDBlTOaOL7lgupzAKz+uXuGJV3E+q+U2sVJ9
	7qMR5po+Sx3da4bd0W923GPoJ8qxgOJT4E7jTN9YWgss2KIz40eDKrwqhFLI5pLL
	wl42zqfFM16SW5LWvsgoiCutIPIzKGmcpDlW+E3EpDQ4PNOsPrr9a5gh26jD0uFT
	RtU9DS8Glt+h24t17/+FRHPcVgDG1tY2S3VOAvBI3kuR8Pc2A1yBz9gNfJNdUXkt
	KS43A0svI2/1TV4/np4Cw==
X-ME-Sender: <xms:W3W0ZkAQ_ohYCHduJH5FpYMFViVW5NfzXx68QX427308HoZgQHIi5Q>
    <xme:W3W0ZmiHvFnA4z-yDWSsVMJN16n1wKNFqNEflIPWK31ztvPodgglsbQRyeEOHPmq2
    Nd_iF0ElrVaPeBesjs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrledugdduvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeuueehudffkeeihefhgeeh
    veefffdugefhffeuffdvheeggeefkeefffeivdegnecuffhomhgrihhnpehkvghrnhgvlh
    htvghsthhsrdhorhhgpdhrohgvtghkqdhushdrnhgvthenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihgh
    horghtrdgtohhmpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpth
    htohepfhgrnhgtvghrrdhlrghntggvrhesghhmrghilhdrtghomhdprhgtphhtthhopegu
    rghnihgvlhdrlhgviigtrghnoheslhhinhgrrhhordhorhhgpdhrtghpthhtohepthhglh
    igsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoheprhgvghhrvghsshhiohhnshes
    lhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehmrggtrhhosehorhgtrghmrd
    hmvgdruhhkpdhrtghpthhtoheplhhinhhugiesrhhovggtkhdquhhsrdhnvghtpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:W3W0ZnlvLZIrKzF05cUbaXeRQUIpRV0_hRv6olwl7l6eEpnKf8jA1A>
    <xmx:W3W0ZqyY7gUxPb1YXZULdV-vUPwAqAbEjQq9MSHyZ4keb6-67k3Y_Q>
    <xmx:W3W0ZpRNlQaKNW4285SaRxbCxoy5r2NL21aWOkh1kstto4oVJYs6uQ>
    <xmx:W3W0Zlacm04dElUYnSJknRTeBMXNN65OKEzKSK9AuHdiK0NQfHOvxA>
    <xmx:XHW0ZkEo65KxlfY4YidS9vjfsDBWqWJ-m6NkB9UCHgwcBt2Sk2OFvulw>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B8A5619C0079; Thu,  8 Aug 2024 03:35:55 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 08 Aug 2024 08:35:35 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Serge Semin" <fancer.lancer@gmail.com>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Message-Id: <8d3abbdb-7574-486f-82dd-4213b806a6d8@app.fastmail.com>
In-Reply-To: <900ae60e-84f8-4300-87e7-7f35d16ad439@roeck-us.net>
References: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
 <20240612-mips-clks-v2-2-a57e6f49f3db@flygoat.com>
 <fbe92f1c-3c08-4b46-9d7a-e098ac1656a8@roeck-us.net>
 <97ad6c99-ca4e-463b-aee0-9a7e9455fea3@app.fastmail.com>
 <62e8056b-6a6c-42d1-89f6-7306bb2a528b@roeck-us.net>
 <900ae60e-84f8-4300-87e7-7f35d16ad439@roeck-us.net>
Subject: Re: [PATCH v2 2/7] MIPS: csrc-r4k: Apply verification clocksource flags
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B48=E6=9C=886=E6=97=A5=E5=85=AB=E6=9C=88 =E4=B8=8B=E5=
=8D=884:06=EF=BC=8CGuenter Roeck=E5=86=99=E9=81=93=EF=BC=9A
> On 8/5/24 22:13, Guenter Roeck wrote:
>> On 8/5/24 22:06, Jiaxun Yang wrote:
>>>
>>>
>>> =E5=9C=A82024=E5=B9=B48=E6=9C=886=E6=97=A5=E5=85=AB=E6=9C=88 =E4=B8=8B=
=E5=8D=8812:09=EF=BC=8CGuenter Roeck=E5=86=99=E9=81=93=EF=BC=9A
>>>> Hi,
>>>>
>>>> On Wed, Jun 12, 2024 at 09:54:29AM +0100, Jiaxun Yang wrote:
>>>>> CP0 counter suffers from various problems like SMP sync,
>>>>> behaviour on wait.
>>>>>
>>>>> Set CLOCK_SOURCE_MUST_VERIFY and CLOCK_SOURCE_VERIFY_PERCPU,
>>>>> as what x86 did to TSC, to let kernel test it before use.
>>>>>
>>>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>
>>> Hi Guenter,
>>>
>>> Thanks for the report, it makes no sense to me though....
>>>
>>> I can't reproduce it with QEMU git master, do you mind specifying yo=
ur QEMU
>>> version for me? Also is it possible to have a copy of dmesg when fai=
lure happens.
>>>
>>=20
>> I currently use v9.0.2. I'll try with some other versions tomorrow.
>> A complete log is at
>> https://kerneltests.org/builders/qemu-mips64-master/builds/241/steps/=
qemubuildcommand/logs/stdio
>>=20
>> Are you trying to instantiate an e1000 (or a variant of it) ? So far
>> I have only seen the problem with that controller. There is no specif=
ic
>> error message, the network interface just doesn't get an IP address.
>>=20
>
> I am able to reproduce the problem with qemu 6.2.0 (Debian build).
> http://server.roeck-us.net/qemu/mips64/ should have everything needed =
to
> reproduce it. "repeat.sh" repeats the test until it fails.

Thanks for the info, I'm able to reproduce that. It can be reproduced fa=
ster
on system with lower CPU performance.

So the actual failure is:

clocksource: timekeeping watchdog on CPU0: Marking clocksource 'MIPS' as=
 unstable because the skew is too large:
clocksource:                       'jiffies' wd_nsec: 500000000 wd_now: =
ffff8bde wd_last: ffff8bac mask: ffffffff
clocksource:                       'MIPS' cs_nsec: 940634468 cs_now: 310=
181c4 cs_last: 28090a09 mask: ffffffff
clocksource:                       Clocksource 'MIPS' skewed 440634468 n=
s (440 ms) over watchdog 'jiffies' interval of 500000000 ns (500 ms)
clocksource:                       'MIPS' is current clocksource.

Jiffies is not an ideal clocksource as watchdog base, really....
I guess clocksource selection process needs to be improved, let me think=
 about it.

>
> Hope this helps,
> Guenter

--=20
- Jiaxun

