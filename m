Return-Path: <linux-mips+bounces-12138-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 560C4C4170D
	for <lists+linux-mips@lfdr.de>; Fri, 07 Nov 2025 20:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE5573A9012
	for <lists+linux-mips@lfdr.de>; Fri,  7 Nov 2025 19:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D6B3009F5;
	Fri,  7 Nov 2025 19:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="DvEh0tB5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xCoannFY"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B733C221FD0;
	Fri,  7 Nov 2025 19:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762543789; cv=none; b=UZ8wm3EhBPg51unzY+ok+LmtNoKk4a8BYc5WaF6vonGfMspIw9Y/Vr7Km5nRot093yCeVnGwu4f6Ac+bxX1JuDxzoPXdLCOQLAC3fSm+alDOazKzwxOVpL/74m019gBmJ5lTnDueG37J2f/F1+cnNRLZ4nrbbS+FXJT+SZnTfA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762543789; c=relaxed/simple;
	bh=v4+AN5rCF0WTHHGwiE3dw4ta/4S0WRMWYUuIPTbqaOs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=bsm6mZ6r2QiQLKV9on9R0orJzuNUEqNqDKdm/5CwKC4N+JWr6fZ+jWlLR1gN745Oz/tsDNRCxv+UhwIjg5Dp0Ao2r9ec+Jpaf/Yfds3bxuZvkwDYzrEzhSAFGi22bIckJHN6ESkcRd3YkJ0Ha3RymBXPJkasjScilHcRgHrqxG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=DvEh0tB5; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xCoannFY; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 005F01D00175;
	Fri,  7 Nov 2025 14:29:46 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-03.internal (MEProxy); Fri, 07 Nov 2025 14:29:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1762543786;
	 x=1762630186; bh=uK64V1RHABwDYWcBrcO7CIMo6gQ+hXw+tDq5ENDDMdI=; b=
	DvEh0tB5C5uwlHUN5cAgVxrM5wA8MyRL3Vg50sqnsSNlv6jU16A6OxCrqK3uKdsV
	Xsft9Ng1z5raNgmeFMD2DNE3Z1Nn2asdG8Heo5ra40HHUuPaZQSoj+hzIyqldBJZ
	A3kWsbYgfj3B873H4JfLFFZqqEfKwWNEKMnGk/Q2XQ2p2bYE7VTLtuuqijk/tnPE
	vIpNHZFLysFwbmDnvBurv/B/Ws+O+GhRR5SoSGtQd5K8pVd4dZj/Er/xOAaIKe4x
	pC6yv3Sa448czQNXTuVodxy+dkQr8+g7RbLKXsmD/JWeDUxti7r9SxMYGgibkcZb
	BbfYBQwp1uzpOmI+ttVIeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762543786; x=
	1762630186; bh=uK64V1RHABwDYWcBrcO7CIMo6gQ+hXw+tDq5ENDDMdI=; b=x
	CoannFYs5aZkDngyO/cGGTS9agZ5KL+s7dYIm74+qFkWp/kxNMVs6Vw5Z78+vFvi
	rIQ8deTJH3UxW3QgWDABin3WxV/aVoz3gMaHhsjqMR1hsPPnm1lfiYjxflaRDhxU
	8IahSaDnv1ynzUrkX4MF16frrj1KM80U5pjVKcOaWaAWE0U9oN2La0LANplpS9PP
	2La2+T5Kcr0rU7LBhkGlPv7Buee11wzEAy8zi0zch1OaSnNHLl0WcEYImVzU8AUF
	+SUFX2EucZyROZ7a9Jzrk9JSHLbRgTklp385aZMpWE87PAgdcu6rdIYt3ygwryMm
	z+z42ccU5gOqNnBGfw5mA==
X-ME-Sender: <xms:qkgOaQVWyrtJzFwWoX4r7UAg5bJr5Z6w9jLlYzXfQItcPBsxCIYQrQ>
    <xme:qkgOafbxmTy71v9Zx1jxrd5Dv-8khYNupjwibHetSxoPUNYgqp0x4rbS_4y-bSt6Q
    B6t7ZU4HzfdASVQ-74kp0sYnnU0Kx6ae-rt6cRQE8mGdvMGODCiMNKs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduledthedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedflfhirgig
    uhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhephfethfdutdeigeelueeitddtheehudevffejtedtkedvueei
    tddujeefieejieefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghp
    thhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhgsohiflhgvrhesug
    hrrggtohhngidrtggrpdhrtghpthhtoheprhgvghhrvghsshhiohhnsheslhhishhtshdr
    lhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlh
    drohhrgh
X-ME-Proxy: <xmx:qkgOaeCMkX94klJR4Q6_76loyWJRnLr4vcazdF0HdgPm-FTxqdZk9Q>
    <xmx:qkgOaR2r9xdAMRyKZ6HrI_MiBh5zsXVyNxTGxWfsyV3oIJl_bx2WPA>
    <xmx:qkgOaY24YQObLI1sWl67QG5H72otGIfCwBtDBu1kPtCQQhpStHar2g>
    <xmx:qkgOaeBgljORvxCmrM9LeCEdeqj7ZiwZZz9nxVScqlrtAwIb7BkEVg>
    <xmx:qkgOacJhPZa5eNwnwgA7AWvX8_32TOYnESs8E_A9CZ1gUOVlL9pcVTfU>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 85BF72CE0067; Fri,  7 Nov 2025 14:29:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AIEMUPQi-EY-
Date: Fri, 07 Nov 2025 19:29:25 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Nick Bowler" <nbowler@draconx.ca>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>
Message-Id: <e4ed75c7-b108-437f-b44b-69a9b340c085@app.fastmail.com>
In-Reply-To: 
 <g3scb7mfjbsohdszieqkappslj6m7qu3ou766nckt2remg3ide@izgvehzcdbsu>
References: <g3scb7mfjbsohdszieqkappslj6m7qu3ou766nckt2remg3ide@izgvehzcdbsu>
Subject: Re: PROBLEM: boot hang on Indy R4400SC (regression)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Fri, 7 Nov 2025, at 7:04 AM, Nick Bowler wrote:
> Hi,

Hi Nick,

Many thanks for the issue report! It's pretty rare to get reports from
hardware that old.

Unfortunately my Indy won't go over ARCS prom so I'm not in a position
to debug this on my side. I have inspected the code again and I can't
see anything preventing it to work on R4000 family.

Maybe we can revert this for non-MIPS64R1 system only so we can get something
working for both old and new systems.

#regzbot introduced: 35ad7e181541aa5757f9f316768d3e64403ec843

Thanks

>
> After a recent 6.1.y stable kernel update, my Indy (mips64 R4400SC) now
> just stops booting early, just before when I would normally see the
> kernel messages about mounting the root filesystem.
>
> There are no further messages of any kind, and the boot process does not
> appear to ever complete.  However, the kernel is not fully crashed, as
> it does respond to sysrq commands from the keyboard (and I do get output
> on the console from these).
>
> I bisected to the following:
>  
>     794b679a28bb59a4533ae39a7cf945b9d5bbe336 is the first bad commit
>     commit 794b679a28bb59a4533ae39a7cf945b9d5bbe336
>     Author: Jiaxun Yang <jiaxun.yang@flygoat.com>
>     Date:   Sat Jun 7 13:43:56 2025 +0100
>    
>         MIPS: mm: tlb-r4k: Uniquify TLB entries on init
>    
>         commit 35ad7e181541aa5757f9f316768d3e64403ec843 upstream.
>
> This reverts cleanly on top of 6.1.158 and the resulting kernel boots
> normally.  I then reproduced this failure on 6.18-rc4.  Reverting
> 35ad7e181541 on top of 6.18-rc4 also results in a normal boot.
>
> Let me know if you need any more info!
>
> Thanks,
>   Nick

-- 
- Jiaxun

