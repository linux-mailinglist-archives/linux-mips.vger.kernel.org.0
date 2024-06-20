Return-Path: <linux-mips+bounces-3779-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A23910D13
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 18:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52E141C2405E
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 16:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54EB1B47AB;
	Thu, 20 Jun 2024 16:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="hNLxRoxR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VUGOWjv2"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh7-smtp.messagingengine.com (wfhigh7-smtp.messagingengine.com [64.147.123.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E1F1BA889;
	Thu, 20 Jun 2024 16:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718901070; cv=none; b=cXl4MyQjel5R8qicUw2p8pB/Ob8fsV/QaNgCphJdo6i8WHYBemjDNjBTgqnA/0R+2bVHHrIKK5w2+ioWf7Juqp861ooznx7l+FDydyrPQf0vF6dLWAiWIPIftUI74T1lDtc0DkRTNtFvQhov1+nNhU3gpl144VVNNnpAQo0Ds3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718901070; c=relaxed/simple;
	bh=xMb013uPEOBTWMmM5zBsJ8UlvQ2ArjFJ+gwip7i51Z0=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=qETYUKnZcpcQFLao7nIyov7P7Pf8ZmzthJqyo73PpN4EgWrVYahDqSqAyJpmWaTQR5IhQrTjMn5FaecNO3TJWnNda1k7lCrQrn1djC/Syn9f/xwUBaFVJjlHq19UfJdU3Z9tIvNEALJMAd5NYU5nE7Lo81mkvIvJymD70Ecbx+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=hNLxRoxR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VUGOWjv2; arc=none smtp.client-ip=64.147.123.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.west.internal (Postfix) with ESMTP id 5EF341800131;
	Thu, 20 Jun 2024 12:31:07 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Thu, 20 Jun 2024 12:31:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1718901066;
	 x=1718987466; bh=tvZfZePdD8ufJsjGr1KQrYgsonsCq0tGwrSVJY/6Mmc=; b=
	hNLxRoxRW4mVdw7y1u/WTiTWqNZ8+YhBwV57h6TpiXs0UMVlqAHZHukwDJQ5ZqZB
	SUIYCzxeDRYVeX3WwqSJDuMAlBxNTGKuI7hBRKBz5mqGPUT5rM0iK19n4QUV6B8f
	1Z7cQFBpvAGWTP04Zoh4SKyZRyGZi6OWAzj5s7R1h7mnjzoc5nSC3T2hMk+UmIkh
	pqJ7EQKFmkpOHiqkDdf78kWcTbWKpCXGrk8guXqWg9Vy0zoJlz5EIRNg3V+g4CKH
	xOpoffIs7DHSezlpodhM+UK6Bh08wnWcCca01swpxIBi7lUyuXOIxwpRzCBWo+Yt
	gCG6kKh3Z10zZ1sgeYL3pA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1718901066; x=
	1718987466; bh=tvZfZePdD8ufJsjGr1KQrYgsonsCq0tGwrSVJY/6Mmc=; b=V
	UGOWjv2PQpdAbjzA0oGq8n1vbOfXU4uuJ0KJLB0guPfMB+KtOqQoDKjBY5O3W5vT
	cAaXA7zbGUTF7ejntpwqUiJBD2EbJZ6KcpRIWVoOgCL4NRw4kYwH3hcghygPlXDJ
	EofeYKaRyAkg6DUUgVklSCOT29yVVIb5qNkH6PDs9G9yCfkUogjldBMVc4tvQa93
	QcAIfPZpmgkJUVNMkNN59miiKSLUQp0Kvww6G/VcZLudNYnRDkBY1mwr8J7CYHa1
	Ch2by9SAytnDVemv6DhvQsKVj/VK300fplqKwvmQ+XEf8D0fquMRHg6cupiSs94R
	RDPV5I7l5paqZHLkvTNYw==
X-ME-Sender: <xms:Sll0ZqRk_7TkioOfUiv1wHY7hUnazbtMGg4_aC8rXSFrwhetUjRe0A>
    <xme:Sll0ZvxNT8wZsnCesFH9tZ5s7tQMGTX2F1vuMyZVYosJ4XMhNI2N5bM8cF7wRA-YY
    g5YzK5lxGLkr7TNCvM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefvddguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    lfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtg
    homheqnecuggftrfgrthhtvghrnhepgeeitddvvdffheegleekudfffffgkeeiteffiedt
    keekkeevgfefleeijeelkefhnecuffhomhgrihhnpegtihhpuhhnihhtvggurdgtohhmne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgig
    uhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:Sll0Zn30hKE9zHofCAaDgDKnApMnpbcdq0BjV6zkRxLPC9asFxeslg>
    <xmx:Sll0ZmDTY0eyQ6SnDPl3tb1igIBK0Sk86k5FlKMF9aN-pAlbHdKdyA>
    <xmx:Sll0ZjgELW5NXBybaVFaH8ei6hsAL5YAI05ELIgqQiiAaxdh3JyV3g>
    <xmx:Sll0Ziq4e09G3NQVYjhIMFKGIePzGkSD82TdFjAxK7G7ZKZPuS-Abg>
    <xmx:Sll0ZjfLcpxT8lnGFUpi_bcy2Fbq1vqc7k9P_DmID4WBWltuf3IYipZ9>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5A9BE36A0074; Thu, 20 Jun 2024 12:31:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <743a2297-ff4a-4cb3-ae61-8cd4956aa565@app.fastmail.com>
In-Reply-To: <ZnRThFlqqyDEprGz@alpha.franken.de>
References: <20240612-mips-llsc-v2-0-a42bd5562bdb@flygoat.com>
 <20240612-mips-llsc-v2-2-a42bd5562bdb@flygoat.com>
 <ZnRThFlqqyDEprGz@alpha.franken.de>
Date: Thu, 20 Jun 2024 17:30:48 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Jonas Gorski" <jonas.gorski@gmail.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] MIPS: Introduce config options for LLSC availability
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8820=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=E5=
=8D=885:06=EF=BC=8CThomas Bogendoerfer=E5=86=99=E9=81=93=EF=BC=9A
[...]
> do you have an user manual stating that the R5k bug is fixed on this C=
PUs ?

I actually investigated R5500 a little bit.

There is no explicit document mentioned this bug is fixed on R5500, but =
it's not
mentioned on "VR Series 64-/32-Bit Microprocessor Programming Guide" [1]=
 either,
while some other hardware limitations are mentioned in that guide.

Plus EMMA platform, which was removed form the kernel, doesn't have
cpu-feature-overrides.h. This means that the platform was running with L=
LSC
enabled.

So I think this CPU is not affected.

[1]: https://repo.oss.cipunited.com/archives/docs/NEC/U10710EJ5V0AN00.pdf
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

