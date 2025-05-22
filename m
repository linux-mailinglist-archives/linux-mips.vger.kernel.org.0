Return-Path: <linux-mips+bounces-9070-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A39BAC0F4E
	for <lists+linux-mips@lfdr.de>; Thu, 22 May 2025 17:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1913188BF0E
	for <lists+linux-mips@lfdr.de>; Thu, 22 May 2025 15:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F1D12CDAE;
	Thu, 22 May 2025 15:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="C1QR/nsq"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D57290F;
	Thu, 22 May 2025 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926145; cv=none; b=LXJSHZPrOAplmkor228ptZdCH6xAlI7NGbqrJjjytns1u0IhmOcKK+QZhjGC258eNDDt8LsAIE83UB5dLKEwfbOKuu2yA/WkATrwCK8+lZ7kLwlyqIcIfA+sUxpzV7536vNUb2LtCmCfZNyz5cB8jjrG/KX/b+9ldYTQ5PYUK88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926145; c=relaxed/simple;
	bh=PCMNxXTp7vOl2U1UMU/ZCRxe7GFuxhIogfe0qyFPLBM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VPDFWj1iBVB/vwc31Uhv+IppaV1Js0s68ZTXBUhUIAgg3P5rIH/rLUOTDzYqzek+u0CeH0edaMcy6oBLPPV+2LwQGl+rtMLldlwx++KKUUmFuIdjkWG3q4REPVv8Ziw51Zb0svdAbcgqBlEhuq+QBv49el45WkdDmkaMdOqof8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=C1QR/nsq; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 315F843A2D;
	Thu, 22 May 2025 15:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747926135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PCMNxXTp7vOl2U1UMU/ZCRxe7GFuxhIogfe0qyFPLBM=;
	b=C1QR/nsqGLxAYxBT39V3iCTWUEnreo4cdH0an0sHwxvmtrm5dQGjYNnI/xJs19aIDIBO2n
	F4kFgyCeU9OaVkWgsTrfDtGopXWJoV9ihSH06MWWyRtpZrbgTTvRbsG0tBsrMsTQJpTIFw
	mXVTgey9Od/driaMoYfOjgJVOBMWcoCCJPmE5JNMudSx5+QP056xSajJgGIyHzYU/vM0H7
	27F6uPZTyWr4YOh79FdwcJx9Vm7NFy01+tLBQLXAPXAC7FV5jXmC7kSvCZPJxZxURWWAhN
	kt3EUGZ+qE7Dt5T5p1Yge2BgmcVWLmXkDe8+zyRydSq2NN+IPrgQ4BNcsmbzIQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Th?=
 =?utf-8?Q?=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: CPS: Optimise delay CPU calibration for SMP
In-Reply-To: <105ed884-9ee8-429a-9937-d8f58a221faa@app.fastmail.com>
References: <20250520-smp_calib-v1-1-cd04f0a78648@bootlin.com>
 <8c4ef90e-82db-4711-a5f3-446bcca00e9d@app.fastmail.com>
 <87ecwipfr2.fsf@BLaptop.bootlin.com>
 <105ed884-9ee8-429a-9937-d8f58a221faa@app.fastmail.com>
Date: Thu, 22 May 2025 17:02:14 +0200
Message-ID: <87iklsofih.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeivdeiucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhffkfggtgfgsehtqhertddttdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffhgedvhefgtdejvdethfdvieekgfetuefhueekteetgfdvueeutedttdekgeevnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfhgrfegrmeekvgefkeemjeelgedtmeefgeehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfhgrfegrmeekvgefkeemjeelgedtmeefgeehvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdpr
 hgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthgrfihfihhkrdgsrgihohhukhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: gregory.clement@bootlin.com

Hello Jiaxun Yang,

> =E5=9C=A82025=E5=B9=B45=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=
=E5=8D=888:47=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
>> Hello Jiaxun,
>>
>>> =E5=9C=A82025=E5=B9=B45=E6=9C=8820=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=
=E5=8D=884:21=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
>>> [...]
>>>>
>>>> This allows to implement calibrate_delay_is_known(), which will return
>>>> 0 (triggering calibration) only for the primary CPU of each
>>>> cluster. For other CPUs, we can simply reuse the value from their
>>>> cluster's primary CPU core.
>>>
>>> Is __cpu_primary_cluster_mask really necessary?
>>>
>>> Maybe we can just test if current CPU is the first powered up CPU
>>> in the cluster?
>>
>> That is exactly the point of __cpu_primary_cluster_mask: setting in an
>> efficient way the first powered-up CPU for each cluster. This adds only
>> a single variable (which is actually just a long) and allows for minimal
>> impact during boot time, by doing the minimum write and read operations
>>
>> I don't see a better alternative. What do you have in mind ?
>
> Maybe we can try mips_cps_first_online_in_cluster()?

I didn't notice this function initially, but upon closer inspection, it
appears that although the scan process is optimized, it still performs a
full scan for each CPU during boot. In contrast, with the mask, the
information is created only once and within an existing loop.

I believe this function would benefit from __cpu_primary_cluster_mask,
which is why I prefer my current implementation over using
mips_cps_first_online_in_cluster().

Regards,

Thanks

>
> [...]
>
> Thanks
>
> --=20
> - Jiaxun

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

