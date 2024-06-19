Return-Path: <linux-mips+bounces-3741-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2200390E9EA
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jun 2024 13:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF4251F23133
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jun 2024 11:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15C76137747;
	Wed, 19 Jun 2024 11:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="aR9PdGSe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PDnsSNyz"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587EF13C90D;
	Wed, 19 Jun 2024 11:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718797090; cv=none; b=coYRVfHGQ2nxT1lPJO4nZY3a3zbdhShDNdXpJ//pPxOVz/o8UhRj0pBLxJupjrUBjE2FSC7+Be1r669qZNbFvs7E6ha2x4Zy9rXmYeYGG9nLEe9oauCCDGDQh4qEdJC/fPJ6HidTmKmmjEucTFdBqRDi19ckTJbyghKoDHH3a60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718797090; c=relaxed/simple;
	bh=yZudgVwFrbAD24ua3ncZF3ujIAa6PJAdt/LLy341WBo=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=KCdGdZpuBSpS5qrPPlZvATszPyjaP5BqXsHQOHT6JfGZjjPN1gNtWTvZCx9PRpm7nvU3Cmcol+qKW4B8iYlVN11hYq9boCd2+UklO8ZLhnIZCEA3VzqZYh+0VTH2mRnNnwHzCiswiah6Onqno6WT/RxKpgujrxGdbWHJknT6qcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=aR9PdGSe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PDnsSNyz; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 70BFE138046D;
	Wed, 19 Jun 2024 07:38:07 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 19 Jun 2024 07:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718797087;
	 x=1718883487; bh=B3TFD3iuYOcL5vn75+BRuI7pktVxWxvqZ1gMwULHmhA=; b=
	aR9PdGSe/AR82h0xlUVY6CbjmZ8LJPKG7Jh40x0KdL919kyhcUS9EIIR2UY+QywN
	JgYeQuUJF6eYo+aSqVg4YM37Y1NRqrxvFu8vgPtSSMcOxcwSJqUXIWcORmZX4pkk
	AsrbbN6mUb7vXQmU+L9gG0TYv7Ce/y0Ag7STDvfdiEJ8qn+CIkw6lf5+WOfC7pVB
	EO8OS3VM47hpaIzcs4P+s4S3AARqA/m8NCmlX3xLGiFvqFLMc7XjqUWw37yMu/7t
	mxkxPw/yVLjsEeCMP6/Xf/7Mhkd9QZzxiTwF+f9b2CgcAbM7kf/DjrLBT3578SBO
	e06A32dXO1O15CGAxGCVcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718797087; x=
	1718883487; bh=B3TFD3iuYOcL5vn75+BRuI7pktVxWxvqZ1gMwULHmhA=; b=P
	DnsSNyzaAqa2dp5JlEGxdxvXeCR+TgbUIVYu4Gl9icKiY1PRwYWzYF6L2PLSZ7Rn
	1bMB3HUUg93fCU42W8d5bbM6lyBZ5ukTLzkkwfaEQ58EHEHGYnOssL8+CCrnr7K7
	WAF9IURNOzl5V8Q6XNlA7tvop0ZbL8hN99u9/F5QutqyMkbrP6CFD+S6/1NPbM95
	shOW2JmPLxGhMCPRC6OU209UOPoS6m78Te9FHMEUGPbYPzDm/7K/yefGZN9WPX3w
	R8W9Eg+/GUyCxNjbDnRmN3jjj0E0kH5jGpIelH/YpyA4bK6DWKn1csomqCgw1efp
	SHPz8laiaOW7ryguc1wxQ==
X-ME-Sender: <xms:H8NyZhxfJ5Oh1k1hGQoyPbey7Vmdqk6iYvSlcr8xuOseJIXIEcuOjQ>
    <xme:H8NyZhTD_ESsYoPGarf1ffGtEeQo09fTft7FiYxeS94jcIh054i6FZaBBKYi6hMco
    U_zk-msAPA-7lDjbIo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeeftddggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
    ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:H8NyZrVfs5yRFkM9j-bs-EYB1SFT2Fyc1P6IYkATPsKBS7VjYvDcUQ>
    <xmx:H8NyZjjKG1YMT9Gb1V8Ij7XtWoqMa8MR4wGUfcAjD_2V0d1XKpQz2g>
    <xmx:H8NyZjAuZ9kdQAAP7c5KCwIYMfQeh7Mt8u4i_sPEzqzq-F2yz3Uvuw>
    <xmx:H8NyZsJmlPl33XFzaZ5RG8hJQmUMT_htPKXxpTs36dNpmjS8toCnNw>
    <xmx:H8NyZqMippUOMbfKwJoEdproHmBkyNV8SR8MB5gtDMwbfwUVhXI1EyM9>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0B78F36A0074; Wed, 19 Jun 2024 07:38:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <14cc8572-406e-47c4-a590-540d6c69466b@app.fastmail.com>
In-Reply-To: <859402a6-4e31-4029-a6ad-87c3be4d3fdd@app.fastmail.com>
References: <20240616-mips-mt-fixes-v1-0-83913e0e60fc@flygoat.com>
 <20240616-mips-mt-fixes-v1-1-83913e0e60fc@flygoat.com>
 <859402a6-4e31-4029-a6ad-87c3be4d3fdd@app.fastmail.com>
Date: Wed, 19 Jun 2024 12:37:48 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH fixes 1/4] MIPS: mipsmtregs: Fix target register for MFTC0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8819=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=E5=
=8D=8812:32=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> =E5=9C=A82024=E5=B9=B46=E6=9C=8816=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=
=E5=8D=882:25=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
>> Target register of mftc0 should be __res instead of $1, this is
>> a leftover from old .insn code.
>>
>> Fixes: dd6d29a61489 ("MIPS: Implement microMIPS MT ASE helpers")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> Hi Thomas,
>
> I saw you sent mips-fixes_6.10_1 pull request but this series is
> not included in that PR while one of my later patch is included.
>
> If you think the whole series is not fit for fixes tree then please
> at least let this series go through fixes tree. There are many MT
                    ^ Sorry I meant patch.

[...]
--=20
- Jiaxun

