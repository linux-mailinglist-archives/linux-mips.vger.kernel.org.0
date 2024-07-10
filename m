Return-Path: <linux-mips+bounces-4244-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E573092CCAD
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 10:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1D5C2813E4
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 08:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B042B83A17;
	Wed, 10 Jul 2024 08:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Fk1q5DKi";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cerv/Z1O"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45812B9DD;
	Wed, 10 Jul 2024 08:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720599420; cv=none; b=FC2ncxwXsm9NrWnHXeZxEEAlkuaDRfX+bgKNxiU3OxX2QE3gSj82DQUItEdxZrKIyKbrceLlIddQByTeSPK8DORvsglebzH74OZjOKPW+OdqRYBVQuuYLaENkMJbS1VrBXRGoBN7lHHp4MAgQJHjFx98kLkHFID0Z2cbaHiaydE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720599420; c=relaxed/simple;
	bh=YVOYrOUdAG0yCyezEv5KVfhsqpixj5PK7ckXenYiwtg=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=PrJ9dPzo9vHP8WIySyiKzapzaHsxdMrybFetCu51LQRjWofYUl4wZ2xIWQ9z0gqA4ESLfFUFXsfXep81qII3lgyKFcCYB8tqqXFtILDGS37hs4hkwYh/uRmLDjhbBTb30CJ60f6GdPV00ow2VH4uZDYIXzPKR6tmU0T+GJF4ilQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=Fk1q5DKi; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cerv/Z1O; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id B1896138178F;
	Wed, 10 Jul 2024 04:16:57 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 10 Jul 2024 04:16:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720599417;
	 x=1720685817; bh=s22kjwU0cnfVL2BKVRlgz6gXF5KilH6UEmuBEYcBH14=; b=
	Fk1q5DKiVtzKnKcgnlSzFriMCEb4xL7w1eF3Gr3XJuagS5fVRC96gX42yhuvRp/w
	GoENRMJCgHTnVe8uo95W++q5YqK4DJLUt2PbNBxgGaJfp45/YbNvdMzfIm53HtCs
	Tj82aT7KzUQxPlSSLEJ7mAiqvT2yB98UbqxIInfNYUuOu4VvXCqQ23zL4E/l5uXc
	7fNICtD5jWTsHfx2xvcen5LfZZytN4fAY6JCszO3C4M0f0rOh5hL5/8d0+AsZgXF
	Buq0kJzNeKrQja8Gs5ushz9PbPfygCVx7Im4mnVUScA43dY7OWVEjag/iIewTTqB
	pOZusW4YnzQ5vgpPn96H6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720599417; x=
	1720685817; bh=s22kjwU0cnfVL2BKVRlgz6gXF5KilH6UEmuBEYcBH14=; b=c
	erv/Z1OAPp6buK2OAt2vjGDXXPDNVFWARqxi7dgydzEqS7le/jNeZ3XDsMgiUlq9
	j3NM4C2fisfFq43RI+gU7LJGPlKrqxZP4zOk8lGLhvuExhBhDVfN7y+wLQcv2U8/
	ojhqt0mh37YBYmKgRWEj66nSPFlFW40tDPUgUzjM8EbAabI4sWQqwrDDtX4bk7BI
	0nZfNcIvoPK8tpylTwhYRAaFNglESqRlQPYDBex3uve+xnxuUMX3l4a0CVOJn2K8
	eyUfbGLOzmUMlwT19ZBOTH1ERfo//U8YC4c5u3Q/0UUfsvz5EaTbouaTD7omp5HE
	f5+UtAmtlMm+skX4HTiFw==
X-ME-Sender: <xms:eEOOZtfhpZiBB14QptCu22J8yZNbal8KovHP_wDko2s3f8sKkjGvOQ>
    <xme:eEOOZrNusvN_AjDmAHBaG4122RMuwlB1i3gcYKlfKi5qZZRZ2Dm0GSEFXKpSncq-X
    gItnv0uIB8z-pOVQ_M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfedugddtvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefhjeeu
    geevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:eEOOZmhM0lCKo1OPg0O6lBxYisCsc4SKVR1NpyDbzq7q76v4EkFmYg>
    <xmx:eEOOZm9k8z7UHDkRqxxCN1lqc0axKiJxKhFKPzHQ_qQlZAidY4TXDw>
    <xmx:eEOOZptBdY4kiPlmdhQInpAJ-BGC5GdKbvRvvqILKlI2xRCbuy7CFg>
    <xmx:eEOOZlHNqGaQ4IWOBGXDFN7f7vQRHKXwql8iO_4j3hKaJnpPigcpOw>
    <xmx:eUOOZthqu65b2LCHo3qynGBJZu3NNkS_xgsia4mENwi9bdJMV_ubx7vd>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8F49D36A0075; Wed, 10 Jul 2024 04:16:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <daf23c57-9058-479c-aab1-c9d9d172edc0@app.fastmail.com>
In-Reply-To: <Zo457UgAkhbAgm2R@alpha.franken.de>
References: <20240612-mips_ieee754_emul-v3-1-2c21b450abdb@flygoat.com>
 <Zn1FuxNw2CUttzdg@alpha.franken.de>
 <9cc26415-9cbc-47fa-a132-7d8c000874a4@app.fastmail.com>
 <alpine.DEB.2.21.2406272053180.43454@angie.orcam.me.uk>
 <fbd421a6-cf37-49ab-bdbe-6128a7cae8be@app.fastmail.com>
 <Zoz6+YmUk7CBsNFw@alpha.franken.de>
 <7797a7b2-1bb2-4c45-b65d-678f685dfa3d@app.fastmail.com>
 <Zo457UgAkhbAgm2R@alpha.franken.de>
Date: Wed, 10 Jul 2024 16:16:35 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 "Jonathan Corbet" <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3] MIPS: Implement ieee754 NAN2008 emulation mode
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B47=E6=9C=8810=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=E5=
=8D=883:36=EF=BC=8CThomas Bogendoerfer=E5=86=99=E9=81=93=EF=BC=9A
[...]
>> It has been tested against Debian rootfs. There is no need to test ag=
aint special binary,
>> but you need NaN2008 hardware such as Loongson 3A4000.
>
> that's just one case, what about NaN2008 binaries on a legacy MIPS CPU=
 ?

Never checked that, as we don't have any NaN2008 distro.

Will try and report.

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

