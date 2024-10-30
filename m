Return-Path: <linux-mips+bounces-6561-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BBF9B6205
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2024 12:39:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5944281B67
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2024 11:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B65B1E4929;
	Wed, 30 Oct 2024 11:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="YYZcYeYV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YlrwvEXJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4491E49B;
	Wed, 30 Oct 2024 11:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730288373; cv=none; b=SuYDI8ymXbBRwk3t+PuMgvN8mRQABd5FOq7XJZAb0A7LJDpuVjJ80vschUHIS/ItbQm8SwKCwR0yheD67ueq+k8i/wtIh5YqKjogLMQxk0egaQZW4HbAtz2vFRSEktULHV/3NDH9iSiHNHWhAPYNsmRKdIYeTW1AdicIhp8Ii3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730288373; c=relaxed/simple;
	bh=gmCi/uZwYnkiFUs2WMFdnKPraNTsLgf2OR97nVEfTTI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=b6FoZ46XWD9+QfL2SwYlx5MlT+ufns7aE6mq/VQBcYwb3vf1Qk2CYNvmnxWsdJqxTiW3EBmYKsP90UFdwJ2Dl6//Kq8xpiL8+WiHjJ/DWat9WQr4o2MCbV6upa54tAMfyFWrTk9S0iAufc0H9FTvDOWVvYpxXTSiSU+Smz01AUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=YYZcYeYV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YlrwvEXJ; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id B002C1380180;
	Wed, 30 Oct 2024 07:39:29 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Wed, 30 Oct 2024 07:39:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1730288369;
	 x=1730374769; bh=vJ+XVhVHplg9ttgUYa3oL3Gxnr7G8gm3S+I6W1k4b7M=; b=
	YYZcYeYVOlFiQ+M7zg32jmt9WxD6PJ1Ra3fNAJ3a0rvEO4KaMYthdJqmtqB/bMOe
	GO+DpVlJZi/TZS0J4o8HvI4OysXUYIGVc2ugfL0mW2A2ZjZlRLh+MdpEVY04eJhf
	0HOZ5yrU0T2eUODriMwsOc9O47dyQTdzEqdxwJhwdG/XVcCYz0bDAeBqdoabc4CM
	S9u7BCHbc01/AkMGb57C6ZV1XK9nRT/MyyeIwhA3sl1TjJJuCtoQ9rEp3EJDA2lx
	3+zVtRsyDg9o52cmwmdKPLvk0/BpoEMnQik3iNGkee2UmzdCtDN55ckTv8GrK+7A
	G+rMSpcSSi+R2vHsnk8O+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730288369; x=
	1730374769; bh=vJ+XVhVHplg9ttgUYa3oL3Gxnr7G8gm3S+I6W1k4b7M=; b=Y
	lrwvEXJlrCTmOZK0/7iWWI5YZhE7K14ErlkHE/gixbXOmcDZ33dNl4hWeMC9jJ4F
	2MLkEm310aoc4Q7wRdJ9PgdJ+EqLIQ/Bnxz4VzB8TYyBhJeXLkzr8/el7axRRKB/
	YC8FCtJ0r0RUXEDYT686XSI52Sr/jTef9CneLubSOf7vteLAYJJ8dKibtS0lfRQu
	oozUZRnXxGvN0Ebd+jyKJgpa7G3yII2upnzQequltDgYjrx7WWjD2R0A962OApQU
	lJHJ6PJWngROrNZT/Hr3ce+F0Nw3D8aCNjU5LVik1rOULdRaEuIjsqIxxZfRPJN3
	0jWkqjuKLGgprKDBTYHNg==
X-ME-Sender: <xms:8BoiZ1kU6xE6iphMe_o85FZqC57SKME9R6LlfdHHinK4LIT2vA3JEg>
    <xme:8BoiZw28YQ3CA0PWzLl1wGXtck4Rmjvq1qOGtbifAIaybB7yzf7hcZJpQAMn_yWOh
    YlLfNJrd57t0_f8Kkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekfedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeehfeduvddtgffgvdffkeet
    hefhlefgvdevvdekuefffeekheehgeevhfevteejnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgr
    thdrtghomhdpnhgspghrtghpthhtohepvdegpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthht
    oheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmh
    gvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhvghordhlvggsrhhunhes
    sghoohhtlhhinhdrtghomhdprhgtphhtthhopegrrhhikhgrlhhosehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepfhgrnhgtvghrrdhlrghntggvrhesghhmrghilhdrtghomhdprhgt
    phhtthhopehilhihrgdrlhhiphhnihhtshhkihihsehgmhgrihhlrdgtohhmpdhrtghpth
    htohephhgruhhkvgeshhgruhhkvgdqmhdruggvpdhrtghpthhtohepughjohhrughjvgdr
    thhoughorhhovhhitgeshhhtvggtghhrohhuphdrtghomh
X-ME-Proxy: <xmx:8RoiZ7oX7RopTdG4yxmzrwlUNKsruFgAYit8FwWxfF-cgU-UddnnOg>
    <xmx:8RoiZ1min-qbMZiuRJ8POMX0DqIfFowADcIpEBK2BPRrO1PDV1tsPg>
    <xmx:8RoiZz3aI2au3szQk3vxFq6oYnCsb9pY_mua3Z3w7u6-H65Vl3h_6Q>
    <xmx:8RoiZ0tWeUqdJ-md42IZPUgMjiknD2kBlQCQa09RYpGvDkHMRNeJqQ>
    <xmx:8RoiZ4W2vr8jfFROwbyYelTjuv9Xfdh1mWzj_kJArnsXq6u7MsE1wY_h>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E7B771C20067; Wed, 30 Oct 2024 07:39:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 30 Oct 2024 11:39:07 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Aleksandar Rikalo" <arikalo@gmail.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 "Gregory CLEMENT" <gregory.clement@bootlin.com>,
 "Theo Lebrun" <theo.lebrun@bootlin.com>, "Arnd Bergmann" <arnd@arndb.de>,
 devicetree@vger.kernel.org,
 "Djordje Todorovic" <djordje.todorovic@htecgroup.com>,
 "Chao-ying Fu" <cfu@wavecomp.com>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Greg Ungerer" <gerg@kernel.org>, "Hauke Mehrtens" <hauke@hauke-m.de>,
 "Ilya Lipnitskiy" <ilya.lipnitskiy@gmail.com>, linux-kernel@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "Marc Zyngier" <maz@kernel.org>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Serge Semin" <fancer.lancer@gmail.com>,
 "Tiezhu Yang" <yangtiezhu@loongson.cn>
Message-Id: <c7d5a4e9-f080-46dd-9b96-07eb08d361f4@app.fastmail.com>
In-Reply-To: <20241028175935.51250-1-arikalo@gmail.com>
References: <20241028175935.51250-1-arikalo@gmail.com>
Subject: Re: [PATCH v8 00/13] MIPS: Support I6500 multi-cluster configuration
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B410=E6=9C=8828=E6=97=A5=E5=8D=81=E6=9C=88 =E4=B8=8B=
=E5=8D=885:59=EF=BC=8CAleksandar Rikalo=E5=86=99=E9=81=93=EF=BC=9A
> Taken from Paul Burton MIPS repo with minor changes from Chao-ying Fu.
> Tested with 64r6el_defconfig on Boston board in 2 cluster/2 VPU and
> 1 cluster/4 VPU configurations.

For the whole series (despite pending dt-binding discussion):

Reviewd-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com> # Single cluster I6500

Thanks.
- Jiaxun

>
> v8:
>  - irqchip: mips-gic: Handle case with cluster without CPU cores.
>  - Add Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com> for th=
e=20
> entire series.
>  - Re-base onto the master branch, with no functionality impact.
>
> v7:
>  - Add fixes for specific CM3.5 which is used in EyeQ6H SoCs, suggeste=
d=20
> by Gregory Clement.
>  - Re-base onto the master branch, with no functionality impact.
>
> v6:
>  - Re-base onto the master branch, with no functionality impact.
>  - Correct the issue reported by the kernel test robot.
>
> v5:
>  - Drop FDC related changes (patches 12, 13, and 14).
>  - Apply changes suggested by Thomas Gleixner (patches 3 and 4).
>  - Add #include <linux/cpumask.h> to patch 1, suggested by Thomas=20
> Bogendoerfer.
>  - Add Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> fo=
r the=20
> patch 08/11.
>  - Add Tested-by: Serge Semin <fancer.lancer@gmail.com> for the entire=20
> series.
>  - Correct some commit messages.
>
> v4:
>  - Re-base onto the master branch, with no functionality impact.
>  - Refactor MIPS FDC driver in the context of multicluster support.
>
> v3:
>  - Add Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com> for the patc=
h 02/12.
>  - Add the changes requested by Marc Zyngier for the 3/12 patch.
>  - Remove the patch 11/12 (a consequence of a discussion between Jiaxu=
n Yang
>    and Marc Zyngier.
>  - Re-base onto the master branch, with no functionality impact.
>
> v2:
>  - Apply correct Signed-off-by to avoid confusion.
>
> Chao-ying Fu (1):
>   irqchip/mips-gic: Setup defaults in each cluster
>
> Gregory CLEMENT (4):
>   dt-bindings: mips: cpu: Add property for broken HCI information
>   MIPS: CPS: Support broken HCI for multicluster
>   MIPS: mobileye: dts: eyeq6h: Enable cluster support
>   irqchip: mips-gic: Handle case with cluster without CPU cores
>
> Paul Burton (8):
>   irqchip/mips-gic: Introduce for_each_online_cpu_gic()
>   irqchip/mips-gic: Support multi-cluster in for_each_online_cpu_gic()
>   irqchip/mips-gic: Multi-cluster support
>   clocksource: mips-gic-timer: Always use cluster 0 counter as
>     clocksource
>   clocksource: mips-gic-timer: Enable counter when CPUs start
>   MIPS: pm-cps: Use per-CPU variables as per-CPU, not per-core
>   MIPS: CPS: Introduce struct cluster_boot_config
>   MIPS: CPS: Boot CPUs in secondary clusters
>
>  .../devicetree/bindings/mips/cpus.yaml        |   6 +
>  arch/mips/boot/dts/mobileye/eyeq6h.dtsi       |   1 +
>  arch/mips/include/asm/mips-cm.h               |  18 ++
>  arch/mips/include/asm/smp-cps.h               |   7 +-
>  arch/mips/kernel/asm-offsets.c                |   3 +
>  arch/mips/kernel/cps-vec.S                    |  19 +-
>  arch/mips/kernel/mips-cm.c                    |   4 +-
>  arch/mips/kernel/pm-cps.c                     |  35 +-
>  arch/mips/kernel/smp-cps.c                    | 305 +++++++++++++++---
>  drivers/clocksource/mips-gic-timer.c          |  45 ++-
>  drivers/irqchip/Kconfig                       |   1 +
>  drivers/irqchip/irq-mips-gic.c                | 269 ++++++++++++---
>  12 files changed, 599 insertions(+), 114 deletions(-)
>
> --=20
> 2.25.1

--=20
- Jiaxun

