Return-Path: <linux-mips+bounces-4099-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 344B79252D5
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 07:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDC61283516
	for <lists+linux-mips@lfdr.de>; Wed,  3 Jul 2024 05:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5DD3AC2B;
	Wed,  3 Jul 2024 05:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="JXqJSW/1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ninvqosg"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588FA2A1BB
	for <linux-mips@vger.kernel.org>; Wed,  3 Jul 2024 05:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719983627; cv=none; b=q2XJtHVgnpniUJEB0hrUNwbM3wa3JTS4O2q+/I4KSLwuHFFTmdUgLmk+CHR1ragozNLHQNwg1rO8elv+xVzU3FIs8OtJSPL3EzkdxjjXKlyCx585APdtJxVy0P6L0r9RgcyvUsi9B+im2H6wVEEQ1b81rIiVQTfxq6RAKzXE4ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719983627; c=relaxed/simple;
	bh=g0FHqSmB+GZ2t6rJ/xC6XHjD7SaGRF+folL3VYMCsjI=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=tZyKllgD9/moR4vadPbIuGpwHPOnsf8iIRIqlfI0LvXWMo+i9q1vSlvIL3kJmZiehZNWbx4rcVrLTsGwDJc2tNc4NHIvYUty5OCQbzrFhkqAbSmjt1e1yDtSdAxkTds0lTfqSp6IpDaUfAJdLwr10GjfA3L6lqW9+XjKTC4PF6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=JXqJSW/1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ninvqosg; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 5D96B1380591;
	Wed,  3 Jul 2024 01:13:45 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 03 Jul 2024 01:13:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1719983625;
	 x=1720070025; bh=g0FHqSmB+GZ2t6rJ/xC6XHjD7SaGRF+folL3VYMCsjI=; b=
	JXqJSW/130j5geBnADpLVkyS2XCw+iyl7khU8F9fAu2Mm4m9s3o+oiFclsGLGOFT
	abKW6nguJs9it+E8ROe3P9cMgV5U6iMRJ9qMQOd3pnzu2ChANLrIFUXaz6dfOVVJ
	4hUYegXJlJvlIiwG78NTLGK1tCJhdFcBqcCPPhmkxjR3d6dDTUda4H0N72dr6WIP
	XEJgPEoN8MSbLmW3zlclJuIBwMGrHDO1g0uMrNvelfQT2wJwz8JiFI0z9Lh5Bd+b
	WLr2loriHQgkul7nj3Fp6wTguwKsMj0w89QDi5LzDJAFL+s1xPMzGJDWyBXUY0rF
	sTLYU3q1nQVPWFIB0WmG7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719983625; x=
	1720070025; bh=g0FHqSmB+GZ2t6rJ/xC6XHjD7SaGRF+folL3VYMCsjI=; b=N
	invqosgonb1qgWGazYSAonGZ2ThnHDNFZSb15poAzMKEOvWAicrU2htKk4GmqWzx
	NjrvPAsvanpLodxxszWqQi7HOb1Lfuyq7jdkvx5xVzIp6rHP+uYxql7jC/uHT5p1
	3kdf3zGgqvu5QioQwq4RQf83qK5bCJ2iI/rM8u5jfMtFMmXgDavM9KPx81wRrDLE
	lU4zC/kP2/rg4JxVwqr3sITVJfBrEGPTfJJijfZNeTq9glHI//gQZUQVxux+dcn6
	lIhCJleuxvhBqaLod7N4YNnUwQ64pcqcwkmD/D8b18yUsk61Om4cAfhHfyOOENkR
	0uEWZIOr47hkqLTx3gWxA==
X-ME-Sender: <xms:Cd6EZhWXNCM0TJaCRFafXymp_ifOzCKH9qubtL6E8S6GrINcNI0abw>
    <xme:Cd6EZhlOcwItq18bzf_pBNzVrMn8PznZVgRXXCfj9fxgJIVnJWfFT23AhUZqcbY3t
    ueiVvDdq5E9mBurjcc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeigdeludcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepfeethfekfeffveevjedtkeeigfeuhfevteejtdevfeel
    heetueffieejkeejgfefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:Cd6EZtYOr0fW5xRQoqHmgCPYzjkbdqEsJ9bB1ThFkppRuW8I2JBGbQ>
    <xmx:Cd6EZkUBCVPHyjy9vBtp0i8Kd3eXYT1TdZ9ZbcXJxiCRXgPhaQ8a8Q>
    <xmx:Cd6EZrlM2a8FPxdbrpbrguCav9XobKL9HDTSRfGw6yv1Qs6ap0NfmQ>
    <xmx:Cd6EZhd95sMyLrPYVNNPsK0YRc13c9fp08QcJjnbdHydhHOSkyFcZA>
    <xmx:Cd6EZgzYMVyMNPAcIQMy5vPmeQClh08ccTkCUZh69I1gou4M0GGfCKC9>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 04FD836A0074; Wed,  3 Jul 2024 01:13:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-566-g3812ddbbc-fm-20240627.001-g3812ddbb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <2815c608-a921-476a-92c1-c4d648f95a3c@app.fastmail.com>
In-Reply-To: 
 <CAOUHufbR6sFguZ0r6NvGRH1mO542BkLaE7vzdFq2LArMNj9qfg@mail.gmail.com>
References: 
 <CAOUHufac==iT7BD9_eWERNcpazV6KEaR3qupR9v5SrzC4GXYcg@mail.gmail.com>
 <b8abe9ab-9fc9-4117-b4c4-728c99f46d88@app.fastmail.com>
 <92ab0d2b-cda9-4d69-8312-1e1c256cf900@app.fastmail.com>
 <03a8b78d-5643-4711-a57f-47f87b8bd566@app.fastmail.com>
 <CAOUHufbR6sFguZ0r6NvGRH1mO542BkLaE7vzdFq2LArMNj9qfg@mail.gmail.com>
Date: Wed, 03 Jul 2024 13:13:23 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Yu Zhao" <yuzhao@google.com>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>
Subject: Re: MCEs on MIPS: multiple matching TLB entries
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B47=E6=9C=881=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8A=E5=
=8D=882:23=EF=BC=8CYu Zhao=E5=86=99=E9=81=93=EF=BC=9A
> On Sun, Jun 30, 2024 at 11:25=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flyg=
oat.com> wrote:
>>
>>
>>
>> =E5=9C=A82024=E5=B9=B46=E6=9C=8830=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8A=
=E5=8D=884:01=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
>> > =E5=9C=A82024=E5=B9=B46=E6=9C=8830=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=
=8A=E5=8D=883:22=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
>> >> =E5=9C=A82024=E5=B9=B46=E6=9C=8828=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=
=8B=E5=8D=886:57=EF=BC=8CYu Zhao=E5=86=99=E9=81=93=EF=BC=9A
>> >>> Hi,
>> >>>
>> >>> OpenWrt folks ran into MCEs caused by multiple matching TLB entri=
es
>> >>> [1], after they updated their kernel from v6.1 to v6.6.
>> >>>
>> >>> I reported similar crashes previously [2], on v6.4. So they asked=
 me
>> >>> whether I'm aware of a fix from the mainline, which I am not.
>> >>> on
>> >>> I took a quick look from the MM's POV and found nothing obviously
>> >>> wrong. I'm hoping they have better luck with the MIPS experts.
>> >>
>> >> Hi Yu,
>> >>
>> >> I never hit such problem on my (non-bcm) 74Kc systems.
>> >>
>> >> However a quick glance suggested it may be related to Wired TLB en=
tries
>> >> on your platform.
>> >>
>> >> Both duplicated TLB entries, Index 2 and 3, are all below "Wired" =
setting,
>> >> which means they are not managed by mm, but platform code.
>> >
>> > I just tried to dig into bcm47xx platform code and I think we shoul=
d blame
>> > bcm47xx_prom_highmem_init, which created wired entry for high mem a=
nd may
>> > conflict with kernel's mapping.
>> >
>> > Nowadays, MIPS mm code can handle highmem on it's own, so there is =
no need
>> > to create such entry IMO.
>>
>> Sorry, I think I made a wrong diagnoses, it's actually a problem in o=
ur cache
>> alias code.
>>
>> Will try to fix.
>
> Thanks for looking into this!

So it's a problem incurred by OpenWRT's down stream patch rather than up=
stream code.

This is sorted at: https://github.com/openwrt/openwrt/pull/15635=20

No further action required :-)

Thanks
--=20
- Jiaxun

