Return-Path: <linux-mips+bounces-4195-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B6C92ADEC
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jul 2024 03:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFCFA282F78
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jul 2024 01:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577C12772A;
	Tue,  9 Jul 2024 01:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="S2NKIXNJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mvP2IR0C"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C5A4A05;
	Tue,  9 Jul 2024 01:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720489698; cv=none; b=ECPJfA6KLGvD6VeRnlQuOKSW+BmajRpNdwxHDKGGZW7lYYe96CUeBx4D/42WgI/SjrjpNmj3ZTgePnw/bbxen/fcwgItbFBvbBQYDTOjllfKajdNIBkjh3KxgqARVP5WL21tXVZhMPRIXcZyJvTHUCwX1dqpaTQQXLiYNsS6+w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720489698; c=relaxed/simple;
	bh=tWmMORJjkXCPhgGExjKNNSz+oKMKLdgNLeVQ3Sypff0=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=D0G5y2B32o/R4ydTDBmH/YndrVlhwtpTUpBKU5JpZVHCPSPV/ebDcn/Urj976Uxw5cT/5oZ2+gTK1CHdIK8qnZ8MGY2VtBHbY7h/yeK1mrq+ZhT56e3wZFz3qDWWY2QW/Z5DQ2iu3jf4iO7rp9uLtO/1oV4F8Hsanutuy6SYj9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=S2NKIXNJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mvP2IR0C; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 6435B13817D3;
	Mon,  8 Jul 2024 21:48:15 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Mon, 08 Jul 2024 21:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720489695;
	 x=1720576095; bh=KkoNZKgLSWOB21EpAw1j1tTKaSMp7ExFBUBl+fhzi0I=; b=
	S2NKIXNJyjfsNkzHO/EDM6aWSXH11uAM00bZi/qcPXZ2gtir/NTkHoZq8ybAqbn+
	6YhWgjYBCfVj/29f4ekDjz1Yro1WkrBZ8GjsPOHHJ745yQqCedElPL0YskPPO8Og
	8qpEUuigArTkYNFQOvIjjYWWbHiC0l4TAsX5NS0PBFq/mTLxXQdj8fwP6WtaTek+
	MRRm2MAUCOQyCL3eHl+BFQr8NxQKqOBwObVNrWIZHP78nD3gquRhdWsl47SDMDVS
	gENCAcQOnE/OQOO0zo02kEKdOv+5aWMYNhL0tT8JLtnuwS1u5bUXYmOtK5Vbcjwz
	E8ct9m1FZ7sBDS5flEK88w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720489695; x=
	1720576095; bh=KkoNZKgLSWOB21EpAw1j1tTKaSMp7ExFBUBl+fhzi0I=; b=m
	vP2IR0CLXIv9Y6x4/gu6NeBCYo4HvVtIN5Qlo106nFp7D4dYt1eO1SJ29uCfH+xK
	O7M7Z+7m6T4XjORyxkmEQYUJq6wnO+4Y3iaCLJqw9/WU0xlbVkR+Nrs7VTSSt1q3
	xS92Kucj9b8jngTH+HxsM/F0p+sA+baqFFLhWaTY3JXQlRnjJdVgxhnkLZh6dNct
	r0eFjb37Miou/z329cWt3dJa6G7zhkJnpoe3QqA2L1uIjNwchXcjR4uos/9AwOeY
	HWut7+jucj+4sgW5jcurSFr2GjZasbKI6EoJF7+BVvGZ32i25sfj3AQmgX97pZOF
	H7W3Q98BhtT4rvr3nZ46w==
X-ME-Sender: <xms:3ZaMZrItiO-vUTfSzUwhZPZfqf0N0uA13Gg9EGw5CBE2SYPnoQrJww>
    <xme:3ZaMZvJ8Fxp_3dkOxdDLBMOMdE8MGKyVx2ClJA3KpnENfBLQPTAgtg0CIfU0Fz5Zp
    6WiMwAuCGT-QNEW9rw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepfeeggedvkeelvdfgleeglefhvefhleefieduvedvjefg
    keehvdevffdvkeevuddunecuffhomhgrihhnpehlihhnrghrohdrohhrghdpfhgrtggvsg
    hoohhkrdgtohhmpdhtfihithhtvghrrdgtohhmnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrth
    drtghomh
X-ME-Proxy: <xmx:3ZaMZjv3uTjufo49l53P4g8kzF5mu9KjRZgUw7EU--C5_9XRG1DX6A>
    <xmx:3ZaMZkaylJRCMAqjFcWfeNg4M6An4dfvXkWujrwjVb4IPe_t_27cLg>
    <xmx:3ZaMZiaQRiQiAFSr_9Q1i3KRupH705c9sRuCn-NFq3ONTkpG95eDlw>
    <xmx:3ZaMZoAgfC8qqYkZlyq2G4tn3qFHfJcLqphDZ1c1pl9vhJfJYsYtSQ>
    <xmx:35aMZiJ8-JbYH-uxoPd-FOdcj6DOTvkGHKbq4uydWLUopZIsYJ_cs12U>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E7A2636A0074; Mon,  8 Jul 2024 21:48:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <8b133053-247f-414b-9c01-e0e5291e347d@app.fastmail.com>
In-Reply-To: <bf4a45e9-4ed3-4d3b-bb96-add20a71b04c@linaro.org>
References: <20240511104341.151550-1-aleksandar.rikalo@syrmia.com>
 <20240511104341.151550-8-aleksandar.rikalo@syrmia.com>
 <bf4a45e9-4ed3-4d3b-bb96-add20a71b04c@linaro.org>
Date: Tue, 09 Jul 2024 09:47:52 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Aleksandar Rikalo" <aleksandar.rikalo@syrmia.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Aleksandar Rikalo" <arikalo@gmail.com>,
 "Chao-ying Fu" <cfu@wavecomp.com>,
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
Subject: Re: [PATCH v4 07/14] clocksource: mips-gic-timer: Always use cluster 0 counter
 as clocksource
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B47=E6=9C=889=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8A=E5=
=8D=8812:36=EF=BC=8CDaniel Lezcano=E5=86=99=E9=81=93=EF=BC=9A
> On 11/05/2024 12:43, Aleksandar Rikalo wrote:
>> From: Paul Burton <paulburton@kernel.org>
>>=20
>> In a multi-cluster MIPS system we have multiple GICs - one in each
>> cluster - each of which has its own independent counter. The counters=
 in
>> each GIC are not synchronised in any way, so they can drift relative =
to
>> one another through the lifetime of the system. This is problematic f=
or
>> a clocksource which ought to be global.
>>=20
>> Avoid problems by always accessing cluster 0's counter, using
>> cross-cluster register access. This adds overhead so we only do so on
>> systems where we actually have CPUs present in multiple clusters.
>> For now, be extra conservative and don't use gic counter for vdso or
>> sched_clock in this case.
>>=20
>> Signed-off-by: Paul Burton <paulburton@kernel.org>
>> Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
>> Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
>> Signed-off-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
>> ---
>
> Applied patch 7 and 8

I think it won't compile without patch 1 being applid.

Thomas, do you mind to apply patch 1 for now? Given that it's just some =
extra
function definitions.

Thanks
- Jiaxun

>
> Thanks
>
> --=20
> <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog

--=20
- Jiaxun

