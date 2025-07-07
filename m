Return-Path: <linux-mips+bounces-9650-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFD6AFB4CC
	for <lists+linux-mips@lfdr.de>; Mon,  7 Jul 2025 15:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 384E03BD724
	for <lists+linux-mips@lfdr.de>; Mon,  7 Jul 2025 13:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42B62BD5B6;
	Mon,  7 Jul 2025 13:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NAxQ9PCN"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A030B29CB3E;
	Mon,  7 Jul 2025 13:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751895649; cv=none; b=dVpCe4ZshQ8TylUGYbieDVZ07OEqEbH3rWzH2ltsAXQBB0tZkruM1T8QKlqnIzmD6ynl+m+enOPrVBGJtBK/yjLDtRtbkiw1okO6J0TSl2eSpiN2hpuTJ/TSdzQnMniijX8jNZYgVHdXDEnh/czVxmsviOBYl4SW9uuVFNysxcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751895649; c=relaxed/simple;
	bh=/X0ZP+cNnh5Q8n+OcF4lzhTGTx9HqGR+OxusKrEL+7E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pp8BVQe6v7OkfXzIC/4FcRGqQ3BVERsEXxMzJO/HCk8GnwAPgjBDRK7NE3mhnSI0vBqMZDtCAT2vF6+mf0eqmaAmTa/xRWF5KDjnSA3C5wTrZkz3R6l+MAKxTSycxjIYlu7Naj3Su3Darl9ZjNhCsdrDWI8/tCucHkW5KOKg8Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NAxQ9PCN; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 598DC204CF;
	Mon,  7 Jul 2025 13:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751895644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/X0ZP+cNnh5Q8n+OcF4lzhTGTx9HqGR+OxusKrEL+7E=;
	b=NAxQ9PCNCt+QtxEXrgd1O3wUw/F9QcI/7qcGtmXqHkgJvGK0feOXHk4eXpW9bi9vEsS2y8
	F0223UncwuuKPJnsJbdF60c63avxGrUbg3rLtHlzyrRkt4bkVtJ7nDFJDZw5j/NlcFkbU5
	rxVxCgepMpR/hIR2NyCxFqEMBIARPsxyEi50UG4Hbt+vk+GpntHM1DpWW1ZFY3xLkaaXK5
	AQqF2JnyNfiZ/GMRqXULtlAkTnK4aozssp1RSfEsYmwabK6ABBZQuzD1hWjX1eBzvRIFY7
	YSnXVPKOsLFDKqI8L7rRIq4w5PvcFrMMfLvHlXLpn0tbYTUEjvwOac03DRDYvg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Th?=
 =?utf-8?Q?=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] MIPS: CPS: Improve
 mips_cps_first_online_in_cluster()
In-Reply-To: <b3b3d5f5-e62f-4081-9fb0-a176a91361f2@app.fastmail.com>
References: <20250704-smp_calib-v2-0-bade7e9c0463@bootlin.com>
 <20250704-smp_calib-v2-1-bade7e9c0463@bootlin.com>
 <b3b3d5f5-e62f-4081-9fb0-a176a91361f2@app.fastmail.com>
Date: Mon, 07 Jul 2025 15:40:43 +0200
Message-ID: <8734b8glus.fsf@BLaptop.bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefudelgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffffkgggtgfesthhqredttddtjeenucfhrhhomhepifhrvghgohhrhicuvefngffogffpvfcuoehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefghfegvdehgfdtjedvtefhvdeikefgteeuhfeukeettefgvdeuueettddtkeegveenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeduudgujeemkeefieejmeeitgdtvdemsghfieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeduudgujeemkeefieejmeeitgdtvdemsghfieejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepvhhlrggui
 hhmihhrrdhkohhnughrrghtihgvvhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtohepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtrgiffhhikhdrsggrhihouhhksehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: gregory.clement@bootlin.com

Hello Jiaxun,

> =E5=9C=A82025=E5=B9=B47=E6=9C=884=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=
=8D=884:13=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
>> The initial implementation of this function goes through all the CPUs
>> in a cluster to determine if the current CPU is the only one
>> running. This process occurs every time the function is called.
>>
>> However, during boot, we already perform this task, so let's take
>> advantage of this opportunity to create and fill a CPU bitmask that
>> can be easily and efficiently used later.
>>
>> This requires creating a single CPU bitmask per cluster, which is why
>> it's essential to know how many clusters can be utilized. The default
>> setting is 4 clusters, but this value can be changed when configuring
>> the kernel or even customized for a given SoC family.
>
> Hmm, I think we should avoid this sort of random limitation.

It's not great, but it seemed like the best approach to keep optimized
boot times and memory consumption.

>
> You can actually store per cluster cpumask_var_t into `mips_cps_cluster_b=
ootcfg`,
> which is allocated in cps_prepare_cpus(), and generate cpumask just
> there.
>
> It should be pretty straightforward to handle.
>

The drawback of this option is that cps_prepare_cpus() is called after
the building of the topology. However, I am trying to see how to insert
this in the loop already used in cps_prepare_cpus().

Gregory

> Thanks!
>
>>
>> This patch modifies the function to allow providing the first
>> available online CPU when one already exists, which is necessary for
>> delay CPU calibration optimization.
>>
>> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
>> ---
> [...]
> --=20
> - Jiaxun

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

