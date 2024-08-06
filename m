Return-Path: <linux-mips+bounces-4734-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A88B59488D0
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2024 07:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB4841C2214E
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2024 05:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B837C1BB684;
	Tue,  6 Aug 2024 05:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="D2QoG28i";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NZtpEaaw"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C701B9B57;
	Tue,  6 Aug 2024 05:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722920841; cv=none; b=CxVxr1zfWvjxvrKLXs5OtCF38eINKqdseHkTmrTyc3N3MNvvwqcnCO20VLYBvWJq06z0XM+/EUdjWLxggSIoy6ANEMiEm0xpFT54C4kYaflwHDhKA4wdrnhGwhjLCKDcCXSmuD1BR5pZwvOn+kItMODlkQj15vnvuk1iJrsL/mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722920841; c=relaxed/simple;
	bh=apDWX41hzTvepTsaor7Otn5/Ivr3hjk1x5Lq8kdkbQo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=eaz5CO9WTSXysIyrx+cepa+OYTcrQogmdLfe2Ub2iAgpA5y9hvmhGz3rGpslIff9EeqFAWwgEA+Keoex6BijzADtuHq3brcwvNLma080coZe8gNeAHm5fC+IGlosD8We/785mnLjSeboVh/d6WFkON4qrq0QKOfLvwMKj2sY9yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=D2QoG28i; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NZtpEaaw; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id B4BC4115184B;
	Tue,  6 Aug 2024 01:07:17 -0400 (EDT)
Received: from wimap26 ([10.202.2.86])
  by compute5.internal (MEProxy); Tue, 06 Aug 2024 01:07:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1722920837;
	 x=1723007237; bh=BgnfkzSExE/qxu88/0KK7QSWgDm/YVsejCE1GRTeWMQ=; b=
	D2QoG28iZfuj6HVD2ACxzTeTPStEIrdqFSWIkc8/5CmOQwIg4eVniMGB1lXxV2vO
	n6HGWjHlhuNsSX2Msb73Zlvw+OO8W5xJx0QYY7ETOX/uVZbEN9mfvFkPPm9SxZlP
	YnP1By9Hvqg7RCt43znDt2VMEcfr0RHgmbYgdPEUh8C/DirM2VGwzciTUimfKhq/
	JNH4emj3d5tVqubeTI09n+4LN/S0REuwAO96DfdnMwLrVzld8axWuneyCaHuijgJ
	1nRNszvpMJZV7UvK7Lvna/3u9bxfQ3lkXRNeJwOduiQ/fZyj+rkTSAaCXK8IV30v
	ENjWYfCU+NQSUEl+/gFn5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1722920837; x=
	1723007237; bh=BgnfkzSExE/qxu88/0KK7QSWgDm/YVsejCE1GRTeWMQ=; b=N
	ZtpEaawHsVkrXwlydpyeNoZrmDQzwaPtDWibrL4CSC8CuE51QYHmynaUuW+QB6sc
	D3ZRr2qXQKl3SzGCXcjFJfaJgdFscolNrhbMB5wDADGlSgoINwXYAXDK1PGB/DMA
	JrC+5bmJRaPdht7moV7Hucqb0wxyBIlFvbO4jIEKYMWDyWO0TLcwZcmcX2ncDzE9
	/MiWfaIw9I2p4h3hBYWBOBuhDYEmMPvESOxJm3i9f7HMQPdU40dhIrEx3y5db9Lm
	j7JO3LoSyxOPBYUsIyno9is3x8KQvLvKPZAVkj/3i3w1ig+ljs1OIU8DtALAU6y/
	b6kqgVo5bJDfwHhxgvu8A==
X-ME-Sender: <xms:hK-xZsPuwW7Y3wlUfLkNlNFh76UKOl5oSVi9J40pGmJLrLXYLCv_og>
    <xme:hK-xZi_3z-L5Lc9V_YHAGUJ4bCgeEZ4-QF3CljHKduS9BOQC-PVRR5q3esrnJi4DT
    ypKR6DlBl9pKxIYRjU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrkeejgdelvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdflihgr
    gihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeffkeevtedtueevfefhkefhudfggeetjeffjeduueehueej
    gfeludevkedutdeuheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomhdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:ha-xZjTRVAObh7Uv0wtlJQT-LCXPIBcBDlQtrlwILzCa2ByRvApwrQ>
    <xmx:ha-xZks35dc82f9GsuY0rcK_gN9nERwkjYZLG029PLh2mfFQbdAs-g>
    <xmx:ha-xZkexrRstUjfb15YI24IlQwjKqalVZGC3RzrmK3xihn5jPnMaEw>
    <xmx:ha-xZo3hlFYLDmdrEtWPl79KGIi5OdKwd1tOgGBtl726jk6DUcVy-g>
    <xmx:ha-xZrxuagU7lHBLOfOx0Nq2bfYelBgdGaphPrdL5GpuLA8HIzDkkJI8>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DA53219C0079; Tue,  6 Aug 2024 01:07:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 06 Aug 2024 06:06:56 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Serge Semin" <fancer.lancer@gmail.com>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Message-Id: <97ad6c99-ca4e-463b-aee0-9a7e9455fea3@app.fastmail.com>
In-Reply-To: <fbe92f1c-3c08-4b46-9d7a-e098ac1656a8@roeck-us.net>
References: <20240612-mips-clks-v2-0-a57e6f49f3db@flygoat.com>
 <20240612-mips-clks-v2-2-a57e6f49f3db@flygoat.com>
 <fbe92f1c-3c08-4b46-9d7a-e098ac1656a8@roeck-us.net>
Subject: Re: [PATCH v2 2/7] MIPS: csrc-r4k: Apply verification clocksource flags
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B48=E6=9C=886=E6=97=A5=E5=85=AB=E6=9C=88 =E4=B8=8B=E5=
=8D=8812:09=EF=BC=8CGuenter Roeck=E5=86=99=E9=81=93=EF=BC=9A
> Hi,
>
> On Wed, Jun 12, 2024 at 09:54:29AM +0100, Jiaxun Yang wrote:
>> CP0 counter suffers from various problems like SMP sync,
>> behaviour on wait.
>>=20
>> Set CLOCK_SOURCE_MUST_VERIFY and CLOCK_SOURCE_VERIFY_PERCPU,
>> as what x86 did to TSC, to let kernel test it before use.
>>=20
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Hi Guenter,

Thanks for the report, it makes no sense to me though....

I can't reproduce it with QEMU git master, do you mind specifying your Q=
EMU
version for me? Also is it possible to have a copy of dmesg when failure=
 happens.

If I'm unable to resolve it in a couple of days, I'll send a patch to re=
vert this change.

Thanks

>
> With this patch in the mainline kernel, about one in five qemu
> boot attempts with e1000 Ethernet controller fail to activate
> the network interface (specifically, the dhcp client is unable to
> get an IP address for the interface). Bisect log is attached below.
>
> For reference, here is an example command line.
>
> qemu-system-mips64 -kernel vmlinux -M malta -cpu 5KEc \
> 	-initrd rootfs-n32.cpio \
> 	-device e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 \
> 	-vga cirrus -no-reboot -m 256 \
> 	--append "rdinit=3D/sbin/init mem=3D256M console=3DttyS0 console=3Dtt=
y " \
> 	-nographic
>
> Reverting this patch fixes the probem.
>
> Thanks,
> Guenter
>
> ---
> # bad: [de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed] Linux 6.11-rc2
> # good: [0c3836482481200ead7b416ca80c68a29cfdaabd] Linux 6.10
> git bisect start 'HEAD' 'v6.10'
> # good: [280e36f0d5b997173d014c07484c03a7f7750668] nsfs: use cleanup=20
> guard
> git bisect good 280e36f0d5b997173d014c07484c03a7f7750668
> # good: [a4f9285520584977127946a22eab2adfbc87d1bf] Merge tag=20
> 'clk-for-linus' of=20
> git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux
> git bisect good a4f9285520584977127946a22eab2adfbc87d1bf
> # bad: [8e313211f7d46d42b6aa7601b972fe89dcc4a076] Merge tag=20
> 'pinctrl-v6.11-1' of=20
> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl
> git bisect bad 8e313211f7d46d42b6aa7601b972fe89dcc4a076
> # good: [acc5965b9ff8a1889f5b51466562896d59c6e1b9] Merge tag=20
> 'char-misc-6.11-rc1' of=20
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
> git bisect good acc5965b9ff8a1889f5b51466562896d59c6e1b9
> # bad: [d2be38b9a5514dbc7dc0c96a2a7f619fcddce00d] Merge tag 'mips_6.11=
'=20
> of git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux
> git bisect bad d2be38b9a5514dbc7dc0c96a2a7f619fcddce00d
> # good: [45659274e60864f9acabba844468e405362bdc8c] Merge branch=20
> 'pci/misc'
> git bisect good 45659274e60864f9acabba844468e405362bdc8c
> # good: [8e5c0abfa02d85b9cd2419567ad2d73ed8fe4b74] Merge tag=20
> 'input-for-v6.11-rc0' of=20
> git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input
> git bisect good 8e5c0abfa02d85b9cd2419567ad2d73ed8fe4b74
> # good: [3c3ff7be9729959699eb6cbc7fd7303566d74069] Merge tag=20
> 'powerpc-6.11-1' of=20
> git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux
> git bisect good 3c3ff7be9729959699eb6cbc7fd7303566d74069
> # good: [3de96d810ffd712b7ad2bd764c1390fac2436551] dt-bindings: mips:=20
> brcm: Document brcm,bmips-cbr-reg property
> git bisect good 3de96d810ffd712b7ad2bd764c1390fac2436551
> # bad: [9c7a86c935074525f24cc20e78a7d5150e4600e3] MIPS: lantiq: improv=
e=20
> USB initialization
> git bisect bad 9c7a86c935074525f24cc20e78a7d5150e4600e3
> # bad: [580724fce27f2b71b3e4d58bbe6d83b671929b33] MIPS: sync-r4k:=20
> Rework based on x86 tsc_sync
> git bisect bad 580724fce27f2b71b3e4d58bbe6d83b671929b33
> # good: [c171186c177970d3ec22dd814f2693f1f7fc1e7d] MIPS: csrc-r4k:=20
> Refine rating computation
> git bisect good c171186c177970d3ec22dd814f2693f1f7fc1e7d
> # bad: [426fa8e4fe7bb914b5977cbce453a9926bf5b2e6] MIPS: csrc-r4k:=20
> Select HAVE_UNSTABLE_SCHED_CLOCK if SMP && 64BIT
> git bisect bad 426fa8e4fe7bb914b5977cbce453a9926bf5b2e6
> # bad: [7190401fc56fb5f02ee3d04476778ab000bbaf32] MIPS: csrc-r4k: Appl=
y=20
> verification clocksource flags
> git bisect bad 7190401fc56fb5f02ee3d04476778ab000bbaf32
> # first bad commit: [7190401fc56fb5f02ee3d04476778ab000bbaf32] MIPS:=20
> csrc-r4k: Apply verification clocksource flags

--=20
- Jiaxun

