Return-Path: <linux-mips+bounces-6563-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDED99B6266
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2024 12:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BA51B210CD
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2024 11:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE2B1E5738;
	Wed, 30 Oct 2024 11:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="IcIPpn6c";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DUUBPMLT"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE2579D2
	for <linux-mips@vger.kernel.org>; Wed, 30 Oct 2024 11:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730289593; cv=none; b=dxTsyPtmxQHd7tkOhX8aPv/aFsVuUMVYcXNG6Qg5ClkQzDLSbqrBbMRUqJRxbpGE90E5Jg0/nmG69EJFKBQC6LgDP+DF+6+Y0KEui3OMid/sqvzsZOctT+h+e7TpnCGGJAYbKkxivx+rzvvgchhw2L+PKIMZTb9GJf2tk0oBv1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730289593; c=relaxed/simple;
	bh=caO4PS8NGOvOs8my2/EeuBKgRGEW2rlnuecsIaea8+Y=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=aNjldW03SFR7lRQAoLhZ94QvUPDVCFzdA2BxfPUKhAZAgWnzvR61Yo4NdFzMEk57VWrLcm0dZBHTRrcGk4oXweLQtm7+X31LcPiE5kXradsQvgTwWO/wW8N238KEb5K+hr3EWMIxpKH1y0REQjaOUjRYLdLo/t7gvCE6jyVvLTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=IcIPpn6c; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DUUBPMLT; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 423BA1140182;
	Wed, 30 Oct 2024 07:59:49 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Wed, 30 Oct 2024 07:59:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1730289589;
	 x=1730375989; bh=caO4PS8NGOvOs8my2/EeuBKgRGEW2rlnuecsIaea8+Y=; b=
	IcIPpn6c/naoZa2+q0P7ltAmlFjpCJXaOp0bkW1mVi/RfI702aMW+lyBnNTyXpUj
	8aZkDANZ9IP8xro4PGrGn5bH7zlXmcvtLWjFNDVxPvBEa2D2GjIvqdekBC8d19mG
	S3FPLHKAs0nfhYM6Al+P6yEuHfBZm2rtTUEOewtXKTXAQrpDP8xxq/hE2c95Somj
	3exUpijrbVX200oJ5lPv6xb6Obj7LakyRn3niuTDUvQxIhNdI1bdsMZ8Dla3MckU
	wzqVuyWNvvhDytfSFoWWPUtNu/Nh3Iry+z0OXFjQX+Hjno2PBQpMYFhKK5cDS/ag
	AOgud9/MiwF26QHkSEmX+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1730289589; x=1730375989; bh=c
	aO4PS8NGOvOs8my2/EeuBKgRGEW2rlnuecsIaea8+Y=; b=DUUBPMLTEaJHit6MR
	9Jt1G6m8+N5wr7ual0S/nc3u3V5BK+W6T8jS6QRpXzl0QX72jAH9Lpa3VEZ2oSCC
	VxFxHDunBDgDNeTxHErQABZgdHn4SFHliiZZlryEv7MTZqAWiyauh/vQLz57D0ui
	2SVFsnJIH/3HNHboHudfywwHivK+fbVvblzhdHkREiSSNUSHJqlaOdgUdekHBzQA
	NrFyYvGUnmFMvR6zqmER1WHdtyDYCvSAHJoL2yo8rEEgYYqRkUObKmfAOOH0+/jI
	ivYH0I1XQqP6TE1KwmMJDLvUtqUx02MukraF2PpfvRCq6GecbF9o7AJmsRpTfkC5
	tC6ww==
X-ME-Sender: <xms:tR8iZ4CMWsjDO_Jtr9hWHmnRBLd0zRfNcFVfRGYlcNwS4ThzOjjGzQ>
    <xme:tR8iZ6juvnZxyyFk94V2_9IquM-vn6A1AxLrgGjTdBlkSirKdwaCy5fXGuvWf4oDb
    HBrtevxc_JHMpMQZqs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekfedgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvffkjghfufgtgfesthhqredtredtjeen
    ucfhrhhomhepfdflihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflh
    ihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeekheeuudffhedtgfekgfelvdek
    teeuleevvdfhleehuedufeevieeiueejtedtieenucffohhmrghinhepshhouhhrtggvfi
    grrhgvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghpth
    htohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepughofihnihhnthhhvggs
    uhhnnhihhhholhgvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhiph
    hssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:tR8iZ7nl9sNpzFwUVT87OgL3SG1imq-sitB5Utn18XRV6gUFZro5WA>
    <xmx:tR8iZ-xx87vThnFkS1JW0yUipHvLb14XZZZmON4UnrMj0FwjrzPYcw>
    <xmx:tR8iZ9RN1ajV9Dp2haM4oEMRj5ZaY5GVs2OhSnGMMgKzqmIWh90nDw>
    <xmx:tR8iZ5Y3FZ_oKx_YMnRvKNZihSCCOzgTzTcaSr8gepbsfLYMuXF4aA>
    <xmx:tR8iZ8JOlpSwWGemItlpL_vD_CvppuTAZibTo9JKYG6WhD0nhQJwo1Q0>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 044FD1C20066; Wed, 30 Oct 2024 07:59:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 30 Oct 2024 11:59:24 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "DiTBho Down in The Bunny hole" <downinthebunnyhole@gmail.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Message-Id: <c90da3b6-4c13-4d52-a0e7-b2247beddc09@app.fastmail.com>
In-Reply-To: <3105ecf0-f00c-4d36-8813-ec7aeb1dfd08@app.fastmail.com>
References: 
 <CAAZ8i80GGmwy5u1dPoG+f43PxGgD_pFhOrQkEr=5bhmLfn6sSQ@mail.gmail.com>
 <3105ecf0-f00c-4d36-8813-ec7aeb1dfd08@app.fastmail.com>
Subject: Re: SGI MIPS, Speculative Execution issue
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B410=E6=9C=8829=E6=97=A5=E5=8D=81=E6=9C=88 =E4=B8=8B=
=E5=8D=888:56=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
[...]
>> Worse still, if the speculative approach involved a Conditional Store
>> (SC): will it be restored? No, because - the manual says - if the
>> cache is involved, then it won't be restored, so this is a real mess
>> that needs at least a sw barrier.
>
> I don't really know R10k implementation details, but IMHO since SC can
> only change a cacheline between two exclusive states, it doesn't matter
> that much....

For LLSC I'm wrong.

See: https://inbox.sourceware.org/gcc-patches/490A90F4.6040601@gentoo.or=
g/

Thanks

--=20
- Jiaxun

