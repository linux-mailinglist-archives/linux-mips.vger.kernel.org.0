Return-Path: <linux-mips+bounces-3631-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D11AF905954
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 18:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64CF9284B5C
	for <lists+linux-mips@lfdr.de>; Wed, 12 Jun 2024 16:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52EFB181D1D;
	Wed, 12 Jun 2024 16:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="ivlepZVa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Zf5UuWr0"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C531617B437;
	Wed, 12 Jun 2024 16:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718211588; cv=none; b=QUjeelqce253XdeqIMkO+E7109om1Aiom7WSJi7DZbhfskmgfH3BULLuOxDVTHPp7dsi2IBex9G5r2ijtsc4xHkeKHB1EsjAB+ZGukkliAd+7FVznlIZSp/0juT3PAN8AUMN+RsTZNTg4ddCyohKHeRlo7sr9qjElp3CBtDlfpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718211588; c=relaxed/simple;
	bh=wC5RCTev5WQ9LiPQGRHBt+kEUELHELC57T6uyWsR3qo=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=Y3F5tyRgESL5wP1+8ndhcydGYBh4IaugLzUtR+f2mxhOqDxrx61XVNnRBayA36FwwI2f+nk1RkeaSL4ghEVbUQYoWyiTm2RemoB+TVXRkR5CTBdCIzgnnWEtwiCKFGtqzWWFV+nKVsdOdliCmOvjFDMxEM/1TgOvxoW80r949Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=ivlepZVa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Zf5UuWr0; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 0081111401DB;
	Wed, 12 Jun 2024 12:59:45 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 12 Jun 2024 12:59:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718211584;
	 x=1718297984; bh=Hv2WcLKXLnlZB4pxKAJHjjIuxbBLU4HHysJ2zfIjCN0=; b=
	ivlepZVaDUCcS8PTqt42BfLAwK+KSzZeCtB+sva593ZHXtw9wc6KEFFOGv2yMdnk
	eelhnPbGrMIOD3QoN0/HoUCyNL3xUJ0eQDVuaT4qfLeDjSh/WrhNB00elmNOcktJ
	hJzc1+gDZu8W7kEonLCExkSEgswKPfmDPGMARb5gsUWebyhWCw2Bt/TcMq5C6Yue
	TobOKhRm6uVQBOlqcDbygEQCNsDRyBoAdniAapxu9d5ohKc2jNjljLJG4zoo6O7u
	B8NVKjRArktwxV2d45fSMjGWhlwnOxGPlNnAyjkpTGg1zE99WFMhgIb/3UKsZMFA
	Se85pPyeE3eQbB9dxWLB3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718211584; x=
	1718297984; bh=Hv2WcLKXLnlZB4pxKAJHjjIuxbBLU4HHysJ2zfIjCN0=; b=Z
	f5UuWr0wqIZAE8BMSl4VlSUs5mJhElVRuMDYdbrzSO81aXO55BwHPV2Q3SSdG0R9
	EMH4lHLJ4D/9Raf9srD1yQe4d2WuXpnoQbE1VAxZCydNws7R9MytKIjbloXKuYtE
	cJlLqGS6JnqFnzssjD6/9mRYz6lmmWcFE5esRVItMCRvHVAEqX0EDy/M3kWD+Uth
	KQzTlLUDF4LQRJrhHZ8mYg/tgE9D7qn8DL1cuKwbbCi7u6Z8pVUBa0AbAYLmtJr9
	adGHhljbKGDAzSAlLiuUHWfDx66WrEdTUBVaPDokEYcA1CsXEpMsBisYDVIk284j
	QedFhsX5nKyvmuEr6MZEQ==
X-ME-Sender: <xms:ANRpZma_V6G4s4hQYqIhpS_3Vt4YJCTVx1ZRBVJCnTO_TCvfwtiQLQ>
    <xme:ANRpZpY-ULZoILlHQNvhFTgfDlD0kYqzKYonRlw77nRzv2_huLatkuMllzrX2h0Va
    qRy5IMvYo_bRHO5MlQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedugedguddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    lfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtg
    homheqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefh
    jeeugeevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:ANRpZg_CDXY4Lwo2CSLo8-U0p0in5jDg7z_6wC7m6WwnKI9K29AYCw>
    <xmx:ANRpZoqG7MzZn68QzDkL0-bcpPdedsEe00XwsQKYl1icWv63nWnfXQ>
    <xmx:ANRpZhoJEbHWJHGeD6XdNMs_0By0tBdjt76i0ki-yQzsw5OdrtrBkw>
    <xmx:ANRpZmTYTCOUAueQ_GgU-2EPpJBTMOCN2ksBKVua7SDkNoZ9b2Bnew>
    <xmx:ANRpZs1duLR81V24HuuyW4SmMnUsrZoDpmySND0vgJ3YQl74nN03hxFm>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AB9DF36A0074; Wed, 12 Jun 2024 12:59:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-515-g87b2bad5a-fm-20240604.001-g87b2bad5
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <ddb36d6c-b54f-4982-b9ca-48c022ce6eb8@app.fastmail.com>
In-Reply-To: <20240612-unstuffed-figure-966c90af52bc@spud>
References: <20240612-boston-syscon-v2-0-9f8e1a07fa63@flygoat.com>
 <20240612-boston-syscon-v2-7-9f8e1a07fa63@flygoat.com>
 <20240612-unstuffed-figure-966c90af52bc@spud>
Date: Wed, 12 Jun 2024 17:59:24 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Conor Dooley" <conor@kernel.org>
Cc: "Lee Jones" <lee@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 7/8] du-bindings: mips: cpu: Add img,mips compatible
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8812=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=E5=
=8D=885:39=EF=BC=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> On Wed, Jun 12, 2024 at 12:56:26PM +0100, Jiaxun Yang wrote:
>> This compatible is used by boston.dts.
>>=20
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>> note: This is a wildcard compatible for all MIPS CPUs,
>>       I think we should use something like "riscv" for riscv.
>
> riscv systems, other than simulators etc are not meant to use the
> "riscv" compatible. All of the real CPUs use "vendor,cpu", "riscv".
> I'd suggest you add specific compatibles for your CPUs.

Boston can be combined with many different CPUs, thus we need to have
such compatibles.

Thanks
>
> Thanks
> Conor.
>
[...]

--=20
- Jiaxun

