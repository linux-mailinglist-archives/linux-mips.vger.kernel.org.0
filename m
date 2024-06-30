Return-Path: <linux-mips+bounces-4041-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C0D91CFE1
	for <lists+linux-mips@lfdr.de>; Sun, 30 Jun 2024 05:01:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E7C01F21576
	for <lists+linux-mips@lfdr.de>; Sun, 30 Jun 2024 03:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30A0EEC6;
	Sun, 30 Jun 2024 03:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="IUCI/+03";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MI0sk3Fh"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF191EBE
	for <linux-mips@vger.kernel.org>; Sun, 30 Jun 2024 03:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719716492; cv=none; b=L7Iu+vEJEMMCbxdBzH6cbdJaCX7iChlO1W7ulBiP2koxN+Yu1CpgOc/Ao5Ni9njq//6nDnJdSmWUHjejr3O2PG1EoklzxLEYhm69qf0KVC8s3f0q+ketjkGkhckqPYT0Ko0m5Ixy9Fgx/nxcMHaRxpINU9i3A4JzChc20wiE/6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719716492; c=relaxed/simple;
	bh=usOyn7h4hRm1K69XYFpUmD6zK1B+tibsezonTqL1nGo=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=U1dgJGmnsX74qhaMn9N01/SFmbJBATjTikCFVD283WVp2FXlXxQGP3JYNsW5l0L9aT6R2mOd7wsVA0DSx12+GYSGhTaPgxd+txqCV2AFo/uYhdSByC69sTDW9YUy9S5L73QBLpxENYwLZpu6a+iHbQlJVgfAxYxK58DOzozpzwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=IUCI/+03; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MI0sk3Fh; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 02D8F11400FD;
	Sat, 29 Jun 2024 23:01:30 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Sat, 29 Jun 2024 23:01:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1719716489;
	 x=1719802889; bh=usOyn7h4hRm1K69XYFpUmD6zK1B+tibsezonTqL1nGo=; b=
	IUCI/+038FBJNnBwbhZMKE684GfBwQfrpV8GXv7t3N16YZbbo4IZF7G0svR/UvYS
	glQ4pvmE7aSrHXxH68dN1oa+6GYj/E0I9SFYI4PiBpQHyVz4UWDKWyx49gtTj9CF
	mirdg8Lqhjq/jLnS6/YbznVeOip1ImmCslm1VVtXR3WK/V9ceavdNhiWBXxOk6YH
	enOLS/G9eGr/sGOXrEuJLO47+j2fgh6N8PPLMyn/ggLpZ5cwOkqYE6Flckqm5rkw
	aArqs8pjdm4Igwp5lXZZCz2hq/JgLV7X8MrxaRtw31Bj6mxXSai5O1C24aUcXCbY
	hqGH9HEXNTwWgxn33wKwSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719716489; x=
	1719802889; bh=usOyn7h4hRm1K69XYFpUmD6zK1B+tibsezonTqL1nGo=; b=M
	I0sk3FhZe9v7TzBSpufpyJpl5RFi+QxtR23QHk33B39OKbmYUIdOd0vglYuiVIuw
	MoliTMo6jerI3pxriXiW8y981sLzbqXxufvVv0+U5ol6X4IvfXEhMK3KuLmHi0Yl
	NmjV7Ltfy3fKPfvp1zAJAsb0gQTO5locelo3FLTIxGe+84PnrrgtX6pu25dD5E5N
	Be/aJ473e5hJEYglqsH7IQd0gFNfKydpWi/BXKDHe+Vg8eoFqSQQrajOGpUVIqiv
	VCPojHgqPrI6xs3OKzXQFdlbyHlyZkRaWDANBO7QFyMO+ef9ppuEwlgdlfqqqJ3/
	RAaAUvXqnqH5cQ7H8MY6A==
X-ME-Sender: <xms:icqAZq5u6-OnHT4qcFOkY7XRz7r17gs9-VSdgPteOaBEPg7ZRjC-TA>
    <xme:icqAZj6QDMWcJXS_FihvsPF1ndWuqt3-dBkZAQXQw0gxa_1dnz4AR9ALHepAnh_ex
    EPqsysh0QzMeX6FXkU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddtgdeiiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepueduheegffdvvdeguefgledtueejffdtkefhuefhueff
    iedutdfhueehkeeuhfejnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvg
    hlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:icqAZpd2eeS_cUiJDc3-_H8-Fld8GyztWx2z9w9clyVj-oDDpYbEVg>
    <xmx:icqAZnKUWvLrMnX6jK8xm-JBV8XRkc7pu-dtjKNk17TANsrVVcnUmA>
    <xmx:icqAZuJkS4PbbvL9Et6F36G6abO6XpNK6BhOLbWHHKvAumO3p0O2WQ>
    <xmx:icqAZoyc-yCjx8kXIlRsOwJOXLSuaQ6_ONnXZQ02BTgL4tE3oFiPsw>
    <xmx:icqAZlVs1W83sh1hBpKjemnY-kTpb_vj39FyBtOD-H66eTPQVI8xOgi2>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9992C36A0074; Sat, 29 Jun 2024 23:01:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <92ab0d2b-cda9-4d69-8312-1e1c256cf900@app.fastmail.com>
In-Reply-To: <b8abe9ab-9fc9-4117-b4c4-728c99f46d88@app.fastmail.com>
References: 
 <CAOUHufac==iT7BD9_eWERNcpazV6KEaR3qupR9v5SrzC4GXYcg@mail.gmail.com>
 <b8abe9ab-9fc9-4117-b4c4-728c99f46d88@app.fastmail.com>
Date: Sun, 30 Jun 2024 04:01:13 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Yu Zhao" <yuzhao@google.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc: Linux-MM <linux-mm@kvack.org>
Subject: Re: MCEs on MIPS: multiple matching TLB entries
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8830=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8A=E5=
=8D=883:22=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> =E5=9C=A82024=E5=B9=B46=E6=9C=8828=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=
=E5=8D=886:57=EF=BC=8CYu Zhao=E5=86=99=E9=81=93=EF=BC=9A
>> Hi,
>>
>> OpenWrt folks ran into MCEs caused by multiple matching TLB entries
>> [1], after they updated their kernel from v6.1 to v6.6.
>>
>> I reported similar crashes previously [2], on v6.4. So they asked me
>> whether I'm aware of a fix from the mainline, which I am not.
>> on
>> I took a quick look from the MM's POV and found nothing obviously
>> wrong. I'm hoping they have better luck with the MIPS experts.
>
> Hi Yu,
>
> I never hit such problem on my (non-bcm) 74Kc systems.
>
> However a quick glance suggested it may be related to Wired TLB entries
> on your platform.
>
> Both duplicated TLB entries, Index 2 and 3, are all below "Wired" sett=
ing,
> which means they are not managed by mm, but platform code.

I just tried to dig into bcm47xx platform code and I think we should bla=
me
bcm47xx_prom_highmem_init, which created wired entry for high mem and may
conflict with kernel's mapping.

Nowadays, MIPS mm code can handle highmem on it's own, so there is no ne=
ed
to create such entry IMO.

>
> Thanks
> - Jiaxun
>
>>
>> Thanks!
>>
>> [1] https://github.com/openwrt/openwrt/pull/15635
>> [2]=20
>> https://lore.kernel.org/linux-mm/CAOUHufbAjZd4Mxkio9OGct-TZ=3DL0QRG+_=
6Xa7atQVFN_4ez86w@mail.gmail.com/
>>
> --=20
> - Jiaxun

--=20
- Jiaxun

