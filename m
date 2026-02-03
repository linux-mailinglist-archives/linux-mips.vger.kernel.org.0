Return-Path: <linux-mips+bounces-13102-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJ0aJB4VgmmZPAMAu9opvQ
	(envelope-from <linux-mips+bounces-13102-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 16:32:46 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B195EDB512
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 16:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B899A30FDD5D
	for <lists+linux-mips@lfdr.de>; Tue,  3 Feb 2026 15:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 907083B8D4D;
	Tue,  3 Feb 2026 15:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="e01qNo4r";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VrR00ejl"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096643B8BD9
	for <linux-mips@vger.kernel.org>; Tue,  3 Feb 2026 15:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770132521; cv=none; b=c3MBna+64TbDv0bvfOLXP8ej7BCY7c8qXJnH8v2AY3Z+eS546nVVWVY6D23ZrVTR7xjZoS+4fo//wEFa2tRJazqwEkKzaBEKqGv6fChONTmevjgVjsnJws9DSCT3EqyRp/aGeaW6QL3PkEhOxzyVbcGNuoA58pWY662lVuy2o2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770132521; c=relaxed/simple;
	bh=30vQMzXBU4V1GPKBgdGb2+JJvuZ/jvEXZ9DIlaOvP/M=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=HxK9jMoUCWj4p1HkO9VYhm3bpsvtrpS/J8og4w+1e4aKXEIdtVqiFJVf6CfIDwNqe7OpWxr9gFNS/JQDpGHQqJsEQmPHQlPUc8PfCxC6N9deYk7SNX4TNGMzNlVmELsGaQEPN5IT8Q47utsm21eYy/yT6DYZzXhFLlRD17QKWHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=e01qNo4r; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VrR00ejl; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 512921D0009A;
	Tue,  3 Feb 2026 10:28:39 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-03.internal (MEProxy); Tue, 03 Feb 2026 10:28:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1770132519;
	 x=1770218919; bh=xzI+mVBJS8NXcwBBA86E/hqOK5/oybE4GLxEX7cZOlQ=; b=
	e01qNo4rywhIgDeMlhlUAQ4sjBoUjGY3SnUi6G2X7AuRg7x4DxWJCEhkL0PSmJGY
	hNlXAleYzfj8yfKlJ3uWAalgUBh3ppnHKAuT+fwx3jlALKW2ZnuQ93nIJS8UY0fk
	qoeLIi29Wy4cXV6gwNGRXd41xPD9OxqBLuzwSIdY16XszPckXyqXoV/bSm+AVKmX
	KO/p9bK91Yu2EUd3MiE9yr+7eMtp0xHZnqcftFKliJSlEX6GOSTafhX4WlMH1ScE
	IFEWkj0kCAoQW936cRRYlbWJMb7paWfAluRR6aaLXVXWkiYmL5uipNe/C1QgeUl1
	8F1KNc8ySiBvplqtxLmp/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1770132519; x=1770218919; bh=x
	zI+mVBJS8NXcwBBA86E/hqOK5/oybE4GLxEX7cZOlQ=; b=VrR00ejl94gjkBknl
	PGR4Ras04HdKZkPdl6G7GFXIkoBru0HR3xhWIBONyDKAgrvDgmL5heMWpp6N8ZQz
	yjlbt5uT9/SlVp81whRrv7/LVBxjKHbPGQRCsc0Y+YRyOXq94yfL+zciv0znZ4eF
	pN5xfFykbEPxPfsHGXWF5UtKuligSBObHbcHsMirb8VVBu7t6Mb3t3QsFWUyA2Oo
	m5Met1E3jiDaefx8sujfOGElwL5E1odcEomB3Wpf4mqH4w9odVk++WCbnXjZ6vIf
	RhVIWnxZB3py0QkKSAvqeHDosiGTJVmECcGgyc5AoBMUh++/OC7H1sAYJ1RR5+yH
	G90nw==
X-ME-Sender: <xms:JxSCaekthvbjm2War2xFWfqJAOyTO9kQ0EjYjUbmVhEkzLaUDo4Yqw>
    <xme:JxSCaQq2u8BFJ0_CXgkDoGqOi_xSr3WJb_fyJ1goYy7I0N_IPvnk1ozjQoZbyc7BD
    ZWWcPhncZFP3HgmhLxKdUkh0dWibzr156k1vP4FQbEyWwEzbuxRQxk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedtgeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvkfgjfhfutgfgsehtjeertd
    ertddtnecuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepkeevvdduleehgfetfe
    effeefieevfefgieelgfelveeujedvgeefheelffekhffgnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepfigsgiesohhpvghnrggukhdrohhrghdprhgtphhtthhopehlihhnuhigqd
    hmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:JxSCaVThS83cBXG9KEgiLWE_Zdd9cRakjLLUSZLOLm44iRskF3V0Yg>
    <xmx:JxSCacuxCk9oqmjXYezM123dWUPjtQXBiEvRe3K3V3cHUvxDHK-5Zw>
    <xmx:JxSCaSaTNB7bAKIW4B-B3Zdos_RgFIrEYBvaXt3IJCx7998D4jJpWg>
    <xmx:JxSCaZu2NlFAuOxRHhfJ2GH5bLZ1SN_yOfDF8XZf2w4X-0JhWrV2_A>
    <xmx:JxSCacn9bTo168NeiMy8Hgx9NzCFRkZsrKCqrF42I0J99DfQIpM2M9q_>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0A11E2CE0072; Tue,  3 Feb 2026 10:28:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AVHZR4n_KsVg
Date: Tue, 03 Feb 2026 15:28:18 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Waldemar Brodkorb" <wbx@openadk.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Message-Id: <1e9086c1-0cec-4aa7-aab6-e1e605dd9ebf@app.fastmail.com>
In-Reply-To: <f0413775-1a6f-49a6-841b-bf52214a2841@app.fastmail.com>
References: <aX-d0ShTplHKZT33@waldemar-brodkorb.de>
 <f0413775-1a6f-49a6-841b-bf52214a2841@app.fastmail.com>
Subject: Re: serial console on Mikrotik RB532 non-working
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flygoat.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[flygoat.com:s=fm1,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-13102-lists,linux-mips=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiaxun.yang@flygoat.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[flygoat.com:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-mips];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,messagingengine.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,flygoat.com:dkim]
X-Rspamd-Queue-Id: B195EDB512
X-Rspamd-Action: no action



On Tue, 3 Feb 2026, at 3:24 PM, Jiaxun Yang wrote:
> On Sun, 1 Feb 2026, at 6:39 PM, Waldemar Brodkorb wrote:
>> Hi MIPS hackers,
>>
>> I want to use the latest Linux kernel on my Mikrotik RB532, but the
>> serial console is non working. I bisected the problem and the first
>> breaking change is this commit:
>
> Hi,
>
> Can you try this?

Oops sorry I missed a flag, it should be:

diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
index 8ecb56be81ac..239018540221 100644
--- a/arch/mips/rb532/devices.c
+++ b/arch/mips/rb532/devices.c
@@ -213,11 +213,12 @@ static struct platform_device rb532_wdt = {
 static struct plat_serial8250_port rb532_uart_res[] = {
        {
                .type           = PORT_16550A,
-               .membase        = (char *)KSEG1ADDR(REGBASE + UART0BASE),
+               .mapbase        = REGBASE + UART0BASE,
+               .mapsize        = SZ_4K,
                .irq            = UART0_IRQ,
                .regshift       = 2,
                .iotype         = UPIO_MEM,
-               .flags          = UPF_BOOT_AUTOCONF,
+               .flags          = UPF_BOOT_AUTOCONF | UPF_IOREMAP,
        },
        {
                .flags          = 0,

Thanks
- Jiaxun

