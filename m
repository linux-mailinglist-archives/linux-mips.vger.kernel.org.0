Return-Path: <linux-mips+bounces-4736-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BDE9488D9
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2024 07:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 685AC284F14
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2024 05:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D65E1BBBC9;
	Tue,  6 Aug 2024 05:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="tsn7+CR3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ksYDcuQB"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A871BB695;
	Tue,  6 Aug 2024 05:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722921244; cv=none; b=fat2Odt2fKCdsr1hn3PCDIzzK1sDRDCjrtdI29eHZa6iXjONLmXcEeXBUtccAXwEnPlEpijYWGcwS9oNdvoZZqJT9yUhP1uoOvT7FxjwO+bnzM7Un2gvarF+QLFuwowAYWuKz/YRCo0kGXgxmxbFsKrxDyYhUwIpjB72Ufx8Ado=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722921244; c=relaxed/simple;
	bh=QZOs8BBlIkSUUBhhHl+0vmSxOUGMFA7NbjQkvj+Bwmg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=X8+3Vo5cS19vt6QmGSyNa5pMzahYNIPg/gXwrn5QZOZe4KobG+Y+K2TTwZSIQOBR8J9Z4/3atmPx8gvUQ/rzG4y4ZAGqnZsu1Fr/nULr8Q4pg+wcteQTvymcGr3Zbu266czBqyh/jxzYnGuP7Oh42rvuhMi97ADBRvi34IHNHPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=tsn7+CR3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ksYDcuQB; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 4F4D61151ADD;
	Tue,  6 Aug 2024 01:14:01 -0400 (EDT)
Received: from wimap26 ([10.202.2.86])
  by compute5.internal (MEProxy); Tue, 06 Aug 2024 01:14:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1722921241;
	 x=1723007641; bh=rCJWAJzCZLrjURtB+l1gQRtFP29yFUUAlXPDm+aUA7w=; b=
	tsn7+CR3MbhrlzOIf0sryru74soR2RxVDNT3Mbp6iszpyqeHUq/tIlfM9dABQVw5
	11vErv9NPEVfyzIVjoeG5UwroOlsB8HXqw/8vD+fWqnenb60SfqAzjtsqjeMCCJ4
	d/i/jCi+qkvNtz/5CA556oGrRv7za46QGF79oVKcRB1a9Nr+rH1CvtBmnrFmZ8d3
	ld1qZQjzOpwbbn909KoEUHEoh6Qb6/Dra+XohFqTfxjP2Rxj2EROMDAM56en82hG
	aKBSbSs2RNI/ENMrqt7szERzCHzu7UXs3Jx2BpvCeJamvK9aVlhEKQdBzxEsDAnD
	a5I0F4y7KkUeHsvS4XMRvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1722921241; x=
	1723007641; bh=rCJWAJzCZLrjURtB+l1gQRtFP29yFUUAlXPDm+aUA7w=; b=k
	sYDcuQB3uX9ltxaVgPfi1b2oLwWSkKefdDTCBVJgEtTdJ/q0U8KAKWeafsIvC7ew
	u/CWb19JMU1DKQMzpykpYw7DG/86UQ0phO4pTse7dW+et8eu9/gbcE6rmxG+V1NN
	C/dZPtLB5AX1XwXuPTgOrJSsxcllT++J8kLLH14NXFyraP6SF8cpWF+HfONcCWb3
	FHqE4ikhYleqNdF+PIxhPHXShcQC+tO5Xy8n9ulFa7e+A58TT0VeYOTK2OjBU5U0
	7NhuX66xQOj3cj1MYo1tiV1CUncKypGLu5XsY51XzqKW9GEcuY+xscx+M9ggkp0E
	Mzf7ByJZ93z2TdWleMj4Q==
X-ME-Sender: <xms:GbGxZnkj1JRIdnmycwnYo1jqLAtn07up4HvivrDRL28nAIDXrS3TSg>
    <xme:GbGxZq3ss9-1RD2cuwg2y9qbeL00zheDVWXsn3ynvuYeNx_KKMpSOi_M4JoNAHEu0
    MgyVA0PopGX7wQqdCc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrkeejgdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdflihgr
    gihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeffkeevtedtueevfefhkefhudfggeetjeffjeduueehueej
    gfeludevkedutdeuheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomhdpnhgspghrtghpthhtoheptd
X-ME-Proxy: <xmx:GbGxZtqLGxNaDOpdvue8Zm4mYpWe7b6218hN-E4vUKKbi0N85afwJw>
    <xmx:GbGxZvnTOyDq9_xrZkqKHzuqvUyJNkhjZc9n3ZKGKZMoXe3QMvMbKg>
    <xmx:GbGxZl27ug1jbMC41AU316rMsL9d49yFy6fGpfyPqrOZq-QBAELS4g>
    <xmx:GbGxZuvweX3to77asxTVzx68XXhT4xXi6Lx7v_ijzkalNcyJwDkVmA>
    <xmx:GbGxZgRUmSlQiRpKxKltr3xKOLPepubaRLeGBm2TvvLZ1kptVO2tfnx2>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2330719C0079; Tue,  6 Aug 2024 01:14:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 06 Aug 2024 06:13:05 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc: "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Guenter Roeck" <linux@roeck-us.net>, regressions@lists.linux.dev
Message-Id: <b0d32b16-2def-48cf-84c1-3403f71c5b03@app.fastmail.com>
In-Reply-To: <314ee964-fe3f-4b4a-b83f-76ed6e6e16dd@roeck-us.net>
References: 
 <CAHk-=wh01xPAWUT_=J1TehFOu3SST12UTNuB=QQTeRw+1N4pDQ@mail.gmail.com>
 <378f3810-8b3f-416f-90ec-c81bb3f29123@roeck-us.net>
 <314ee964-fe3f-4b4a-b83f-76ed6e6e16dd@roeck-us.net>
Subject: [REGRESSION] QEMU malta MIPS64 network failure (was: Re: Linux 6.11-rc2)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B48=E6=9C=886=E6=97=A5=E5=85=AB=E6=9C=88 =E4=B8=8A=E5=
=8D=885:21=EF=BC=8CGuenter Roeck=E5=86=99=E9=81=93=EF=BC=9A
> On Mon, Aug 05, 2024 at 09:00:04AM -0700, Guenter Roeck wrote:
>> On Sun, Aug 04, 2024 at 02:00:57PM -0700, Linus Torvalds wrote:
>> > So rc1 had a fair number of annoying small build or test failures on
>> > Guenter's test matrix, which never looks good. But most of them see=
med
>> > to be of the "stupid and trivial" variety, which obviously doesn't
>> > instill confidence in the process, but also isn't exactly scary. Wh=
en
>> > the microblaze tinyconfig doesn't build cleanly, it may not be a gr=
eat
>> > look, but it's also probably not a showstopper for actual use.
>> >=20
>> > Hopefully we've gotten rid of the bulk of the silly noise here in r=
c2,
>> > and not added too much new noise, so that we can get on with the
>> > process of finding more meaningful issues.
>> >=20
>>=20
>> Build results:
>> 	total: 158 pass: 158 fail: 0
>> Qemu test results:
>> 	total: 539 pass: 516 fail: 23
>> Failed tests:
> ...
>> 	mips64:malta:malta_defconfig:nocd:smp:net=3De1000-82544gc:ide:ext2
> ...
>> The mips64 test failure is a networking interface failure. It started
>> happening a week or two ago. The problem is spurious and thus difficu=
lt
>> to bisect.

#regzbot introduced: 7190401fc56fb5f02ee3d04476778ab000bbaf32
#regzbot title: QEMU malta MIPS64 network failure

>>=20
>
> I managed to bisect this. Bisect results below. I didn't try to unders=
tand
> what is going on, but reverting the offending patch fixes the problem.
> It is seen with all variants of e1000 controllers.
>
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

