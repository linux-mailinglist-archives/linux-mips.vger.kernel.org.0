Return-Path: <linux-mips+bounces-9634-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9C3AF9A47
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 20:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72B321C84828
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 18:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E05413D8A4;
	Fri,  4 Jul 2025 18:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="rC04Xutj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gFyv8Bwl"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AEA1EEE6;
	Fri,  4 Jul 2025 18:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751652208; cv=none; b=f6vL7oSppfd0KudXSt7JBqMRWZfwEORN/YTW29HlzaIl1cJV6ZfnBivjetIJ1o2a1BPAIq3sf98SvgpF5QNT7GnTS5cnKbIPtEuOWGBf6fbcvtTFzVrYHmA1waang35Yr6ZzG14Tv0pxnobEj8dT9o489Natg+Wv/rZnyCIavvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751652208; c=relaxed/simple;
	bh=G8Qj9F6EZiq4JxP9DDsjqE6w0WEHME3ipPB7dIojzWU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=unaThePbkiMyUKtTotHaYSXkbkApMk+3E1JSEBRUDAcdHtkaxd3/lYRMlhoMZlwCJEONJao6khuiZdW1sM3QdfOr8K7bSCfOWafJIXkyI5Fg86LBnxZRafcrWrsJ/ZpX/fDqdaA3HDp36WAsF1KY6ORhZP+dlXZUVI6G1Jxr1mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=rC04Xutj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gFyv8Bwl; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id AC75B1D00166;
	Fri,  4 Jul 2025 14:03:25 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-06.internal (MEProxy); Fri, 04 Jul 2025 14:03:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1751652205;
	 x=1751738605; bh=G8Qj9F6EZiq4JxP9DDsjqE6w0WEHME3ipPB7dIojzWU=; b=
	rC04XutjfArNnUtb0KDI4ai52rPYIgyqHGLI1Q8o8ZZ2Ph+tFx2Mf/DmHKr7tzsn
	O4amZZeI7gaCu2pGBSDvdqkm0tb3bX/xZvby581r1xevYvcrXkcZn07dr5sFLV+F
	H0HNM/I6sS4ZT4QtD5RAu03dlVHsSRWvSaWz2I9KMEHY4cZ+En7hCPvD7A7XEP09
	OGlEGdw/qsAgJkokUlyH3vr9fdrMU99GmjfCFC/wiWLOIX7nsIK6greJmZyp3jkp
	0Z8nhQcCUA1i+PCkWOJDmkZEm7qxqp73A/DzOxrqglvljIJZ2viE/Z0mKwsPKnI9
	Dpo9uLxzJ4xfPufpSQWTXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751652205; x=
	1751738605; bh=G8Qj9F6EZiq4JxP9DDsjqE6w0WEHME3ipPB7dIojzWU=; b=g
	Fyv8BwlJ9ZtvLRhHApGBUodg6op7sWiXVL7OTFHLcfYZNJbgP72UxfUTDJr8h3zt
	ET4qRuTWWme4MwNF9h9/pp/mTRtFo8Zsdc+CsC/XTWGrvbC4TV3gME8cdSXRD9rC
	PomSVYmfMDTFx2AlCD118QdT2jd1cdvyWNErLStlXyob82NOKroCRKhH9QfbSGlo
	pqI1LCSZO/zFwStkkQ8yzhEGEcQEoaYy6vrvZA/nzqKeeFnj3XY7EOqP5XreFbZ7
	lk60gGW/GVu3vuCxemhi19P0RO62EadEF1qzTYr8EEfcBhSZGMJoubRm98xyGHPo
	K6awqVjC4GNpf42Wqs6yQ==
X-ME-Sender: <xms:bRdoaDmL_q1OPilNLx6ltKSPs0aSYIBBERCEo-P7TAIhmLU4oVEq6Q>
    <xme:bRdoaG2Z-NQ_NAjYPKtZf7RtFU06xYucHqXLwjNJfzs3ObBKFCbhoEqIHMcbQPEnt
    lMAJE51MpCyh0-qUBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfeekfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdflihgrgihu
    nhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeejheefuddvtdfggfdvffekteehhfelgfdvvedvkeeuffefkeeh
    heegvefhveetjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphht
    thhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtshgsohhgvghnugesrg
    hlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepghhrvghgohhrhidrtghlvghm
    vghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnse
    gsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhi
    segsohhothhlihhnrdgtohhmpdhrtghpthhtohepthgrfihfihhkrdgsrgihohhukhesmh
    hosghilhgvhigvrdgtohhmpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrght
    ihgvvhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvg
    hlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhiphhs
    sehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:bRdoaJqZjfXJElEKZvUSkQ9T2eQpniMzO03btbowxuwF2PJBP0xhqg>
    <xmx:bRdoaLkuJjAt4fbn2P6XndtKGH25AxU7MCgPMs2TEh0GYlMa1LUSAw>
    <xmx:bRdoaB3fC4sSReWP6sJKRkqoyYAcpM_3Ik7-IeHzELEvzKS1zrhgPg>
    <xmx:bRdoaKupJDRJo4_iND5FP4rhIJZZgFborNCtX6uUEsSHuPhdjatEGA>
    <xmx:bRdoaLPQDDG3aWkHt3fQH3JQB6HmfN3jXvtZ-LHRasy5v_lPd4kunGAs>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0D1F12CE0071; Fri,  4 Jul 2025 14:03:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T331b60e36de611f7
Date: Fri, 04 Jul 2025 19:03:04 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <b3b3d5f5-e62f-4081-9fb0-a176a91361f2@app.fastmail.com>
In-Reply-To: <20250704-smp_calib-v2-1-bade7e9c0463@bootlin.com>
References: <20250704-smp_calib-v2-0-bade7e9c0463@bootlin.com>
 <20250704-smp_calib-v2-1-bade7e9c0463@bootlin.com>
Subject: Re: [PATCH v2 1/3] MIPS: CPS: Improve mips_cps_first_online_in_cluster()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B47=E6=9C=884=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=
=8D=884:13=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
> The initial implementation of this function goes through all the CPUs
> in a cluster to determine if the current CPU is the only one
> running. This process occurs every time the function is called.
>
> However, during boot, we already perform this task, so let's take
> advantage of this opportunity to create and fill a CPU bitmask that
> can be easily and efficiently used later.
>
> This requires creating a single CPU bitmask per cluster, which is why
> it's essential to know how many clusters can be utilized. The default
> setting is 4 clusters, but this value can be changed when configuring
> the kernel or even customized for a given SoC family.

Hmm, I think we should avoid this sort of random limitation.

You can actually store per cluster cpumask_var_t into `mips_cps_cluster_=
bootcfg`,
which is allocated in cps_prepare_cpus(), and generate cpumask just ther=
e.

It should be pretty straightforward to handle.

Thanks!

>
> This patch modifies the function to allow providing the first
> available online CPU when one already exists, which is necessary for
> delay CPU calibration optimization.
>
> Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
> ---
[...]
--=20
- Jiaxun

