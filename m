Return-Path: <linux-mips+bounces-4318-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD3193085E
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2024 05:00:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88294B21110
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2024 03:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5140879CE;
	Sun, 14 Jul 2024 03:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="pXYQf9W4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jP1LbT+4"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74941113;
	Sun, 14 Jul 2024 03:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720926047; cv=none; b=fOwMYY6oFxXCY8cun8PDVwXNrd8BfMqBaPCnR7k2LhyXmuonT/mBgjNiv3AkpGx1yk8ewYCQQcfzknkfGRbirfTj1Ek9zygatBk3TLP+h7sztZi9JdKaBMlEjxI7Cu11LM3QRzmFxhcK+yhSEiSdgMspZsDNAhKREmIFIe1uzE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720926047; c=relaxed/simple;
	bh=uYC1BAhCJR+FbZe7rjLGpvcm5VggXeNwChvIIiH5vjY=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=QdGyN4OPJsF3xeugPxVj8V31Z6L5NYGg4gRhybmO6M6GxXCWSea4PjKDrhRn0YCCQ++qaZ0qGRAhI44pMRG0uib8/VBbYzRAlGAFWHuQtL+6ctBCd1ssQbuI2J7ZJfpzjZ1W1dJZTLw7OYFAbpWGj/m9lLRKwLJw+cSJXj6rJ/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=pXYQf9W4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jP1LbT+4; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id B5D86114119D;
	Sat, 13 Jul 2024 23:00:44 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Sat, 13 Jul 2024 23:00:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720926044;
	 x=1721012444; bh=uYC1BAhCJR+FbZe7rjLGpvcm5VggXeNwChvIIiH5vjY=; b=
	pXYQf9W4aWkkmVtAodhKUlVLVoO+n0UBbLfrTDslp5iYElG+Dci75Zb286rtQtaS
	H4rJwOgjnycG8lX/4Wk1U+wmwgRzni23D3Kw69i3nS5MaT2guJ0fND5X++oWZwmv
	ApciPhPBrRfg0+GdwMoSxmUAep5rpgk3TrU6thEBSb78MqyPMMCSow+Ls6J9Bnn+
	nOJJgIJbIqNP9AJF7TgHvLCOwKEQl+x+Pnuieb1Ix+q6l3vGaTIHf5CeuKf0Ktly
	4RP3fO6lXn++NQ0n77o15pJjMDn6DdR0l1tN5RzXfI0NfTyAinWuEUwz9fLZPxaK
	Xvpw/NbVEnTrLojiqqFt9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720926044; x=
	1721012444; bh=uYC1BAhCJR+FbZe7rjLGpvcm5VggXeNwChvIIiH5vjY=; b=j
	P1LbT+4sHdz6qX0zZ/3xlRmz2apQEawgwyOXy4q1DuWRReZGQOA6y7IATeSCVZ2f
	VleWGzVOzzaRlmZprEGrBlr4hNAHASmZCwlEdOP+ikolRecSJlec6jnNb4C5wKnn
	dMu2aWRVTz83GEPzLcCpv4RNJoQUe+MH/XtPWNqapdvz9Xr2rxZluBkM7XiFm+6a
	7Tfl1pWLolT39aXB4cM5u6IvWqJ6Az5MJsK2CAZa0B6nSZwJhzuB0h11parVXfuB
	AGKRvNxP5HqW6PaRaGCerd2AODEEyURFi3wxAjYfevtZM7YzsUVx3rNJvF+2xW0m
	SxB5zFSl/e/R6Dp5f6HQg==
X-ME-Sender: <xms:XD-TZn-pwWnybWzPa3UeqMDfSs_5zS1viLF6Cfo0If-g006TKlJNyg>
    <xme:XD-TZjthx7AdVTK1Hfpjj09Y9FBcSuIrMOedzVIsgz12Ci9ajYFuDK4E98YoM3jjO
    Q7_FJ_CtDfM_CmUpy8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeelgdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepkeelveffhedtiefgkeefhffftdduffdvueevtdffteeh
    ueeihffgteelkeelkeejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:XD-TZlDAAyrFNGoQrVgCH9yFS3LfVMY2c74xPd2d7GfL-P2tOK15yg>
    <xmx:XD-TZjcuBDGzFH56l7dHEgnwmhcEAN6gzteK41RH8nKtZ0e_b9AZcQ>
    <xmx:XD-TZsPbRCk9_7105iBbXTjBeop3knwxwDF4BhOhcv2hsA8dHk-jcQ>
    <xmx:XD-TZllgbaJ10oBXb7h7r1HBtmxs4_YHNCQnGR8nC0kMTADti4b2PQ>
    <xmx:XD-TZhoYdvi5qLZvM7ToDyK0OXAn55Vlny4ffDmXd09S1zG_VGmqiZ93>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id F29C536A0074; Sat, 13 Jul 2024 23:00:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <8223b782-5325-4628-b688-293b7f16c931@app.fastmail.com>
In-Reply-To: 
 <CAAhV-H7_QjjemjFYMGRBQck5gKRWhTMqvjXF=prcAGNam-MKGg@mail.gmail.com>
References: <20240714-loongson64-cevt-r4k-v1-1-98afed7260aa@flygoat.com>
 <CAAhV-H7_QjjemjFYMGRBQck5gKRWhTMqvjXF=prcAGNam-MKGg@mail.gmail.com>
Date: Sun, 14 Jul 2024 11:00:23 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Huacai Chen" <chenhuacai@kernel.org>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Loongson64: Switch to SYNC_R4K
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B47=E6=9C=8814=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8A=E5=
=8D=8810:54=EF=BC=8CHuacai Chen=E5=86=99=E9=81=93=EF=BC=9A
> On Sun, Jul 14, 2024 at 10:41=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flyg=
oat.com> wrote:
>>
>> Nowadays SYNC_R4K is performing better than Loongson64's
>> custom sync mechanism.
> Loongson64's preciseness is significantly better than SYNC_R4K.

My updated implementation[1] uses a multi-pass regression methodology
which can compensite communication overhead. I had measured delta
with EJTAG DINT on Loongson-2K and it can be reduced to as low as 4
cycles while ASK_C0_COUNT has ~50 cycles delta.

[1]: https://lore.kernel.org/linux-mips/20240511-mips-clks-v1-0-ddb4a10e=
e9f9@flygoat.com/

Thanks
- Jiaxun

>
> Huacai


--=20
- Jiaxun

