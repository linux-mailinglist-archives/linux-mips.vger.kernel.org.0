Return-Path: <linux-mips+bounces-13103-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGg3O6gVgmmZPAMAu9opvQ
	(envelope-from <linux-mips+bounces-13103-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 16:35:04 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ED3DB56D
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 16:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3464030AFA09
	for <lists+linux-mips@lfdr.de>; Tue,  3 Feb 2026 15:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771603AEF4F;
	Tue,  3 Feb 2026 15:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="hOkg8a/o";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="M+0KaPKZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048C83AE705
	for <linux-mips@vger.kernel.org>; Tue,  3 Feb 2026 15:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770132696; cv=none; b=k+XozCUaa04wdoc8l9dluzu1nwcuP0BDaeMYI8JT29m09vw4mZtUBW8G2lKBZk3PQfafh0GbuCkh2/H6qwvQ1uJ6xc4KScbz+JUoCz12I7HELtx1qaTfDKaP050iLrMSYNuMa3nXp3x6nQaCTMPEfYCWVvR6bOBzDBLUtwhygdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770132696; c=relaxed/simple;
	bh=OHt+pVC7XMy2S1m6DaDTjOVRlFgP4jtMkpHEDdIkP50=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=KGDpqK38HPoz43s0nXpht7btMMNqK1P74AlyLh36Uz58ObuUguSWR8GHSQYAeHTMPlx0Mjg1JKXQ82dU3oL1MScwJ4Ksq0VZiAttn2RhMuvq+9g3LicM9bY9KEQJaQjlCrtvmuAOn3puofLq+vQq7ewykfuK196/aPoES931aMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=hOkg8a/o; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=M+0KaPKZ; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id D7FCD1D00125;
	Tue,  3 Feb 2026 10:24:39 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-03.internal (MEProxy); Tue, 03 Feb 2026 10:24:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1770132279;
	 x=1770218679; bh=Ni60kKZ2JdSxIUCCQBi8jKP9pGHzTaAVCnbylWuKVxo=; b=
	hOkg8a/olighjY9khJXwbXMDYLmdyclBg7U8VENicK/Bl7GLmAavZG7uzT7foilW
	7/NzrDEf5d+vMeEYtrdMWsCPzm6zvT6+LfcU357rMnplF3MFWkkROyS3BQcif51V
	3BvU5Mc9Cxu2RLiOGZl6On6jN6gQ6OxjVFqgwp+KmotsqHBxEWWWMHWR3M2PBeRd
	Wn2oYVXBcCcLM9C4OdnBe+UzFGq0H8I0SgUjKgsXE3m8rTorxBBaIUk1DxApsLiD
	jB8sSQUW0GI+v/ErUXrpt4ZZWyAOhtXYI+Hbt3itnNt0lKJCl6OOFe0TRcSNxvTt
	etwAEk+lC1j9B27UH7lmEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1770132279; x=1770218679; bh=N
	i60kKZ2JdSxIUCCQBi8jKP9pGHzTaAVCnbylWuKVxo=; b=M+0KaPKZzY88pHV0d
	g2mgQ/aEv6JtvdkWtWvB3Z5pjrpFj9JoshRujl243hivLe3mHbYrhrt9KMtkG/Nz
	THdA7iQhIlduqH8zHwlqpg3vKSbJaO+nI/10GRjoV6zs7P2OmEsifEvoiq76mcVy
	+DY05JmMCYy6ZtTFnjMOiLTBYIZxRhFTdPuF5z6DqrAm/fC9i1jUwHgvCOfZWR/L
	AUvYwd8b24NUSLbuKHKWzFBnk8lc5C8vWi1HDt/L9oNB5IjKb4Qx/H3MakeTVrC9
	+fWdoUZWUjjuTYYMTrbIj3A4jnE5FdPcExuPZX+8Isttc9gWMUCHn1eMS3Uo1gG/
	1JauA==
X-ME-Sender: <xms:NxOCaX3lC8BrXjT9ek7itrw_diM-L0p0FNxk6riEGhYPgdtt94QHcQ>
    <xme:NxOCaQ7YCUb7gcB53W9vbwXro9Jxye7EZIbPc3RFS0zieoohBPGJk1v0OGePr5c_z
    dhUhQJ2gtlhMxtU69T1HngPdfNQWq2SYLYib72_Hx_0H_1SWLFCoFgr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedtgeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvkfgjfhfutgfgsehtjeertd
    ertddtnecuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfdvffdvjeelvddvgf
    ejieetueffhfelledtudejgeffiefhgfefieegtddvjeefnecuffhomhgrihhnpehkvghr
    nhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphht
    thhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeifsgigsehophgvnhgrug
    hkrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghl
    rdhorhhg
X-ME-Proxy: <xmx:NxOCaeilvrJV5si1GHIu59HyQNgoKRIiPvtloOjcN7ZYfABOYVipOQ>
    <xmx:NxOCac9c9a3zGKGiiKdTz0DsBgaGWDA6DwRKRUX5dWd5OzdNQaVWyg>
    <xmx:NxOCadr7dH2AII81Vl_UsEyOtD8n2DYaGkvMgGRweV8ilkBuxtfCPg>
    <xmx:NxOCaT8DpVvc0FGVZ8d9mSzhv_c277SJfY40q86-HLTMknlWDZeUdQ>
    <xmx:NxOCaa1xlLY0fUx8s4LUUYOdQdySVfyhHyI_TXyzxEeARoRHKRFk_Ib7>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 73D8C2CE0078; Tue,  3 Feb 2026 10:24:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AVHZR4n_KsVg
Date: Tue, 03 Feb 2026 15:24:19 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Waldemar Brodkorb" <wbx@openadk.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Message-Id: <f0413775-1a6f-49a6-841b-bf52214a2841@app.fastmail.com>
In-Reply-To: <aX-d0ShTplHKZT33@waldemar-brodkorb.de>
References: <aX-d0ShTplHKZT33@waldemar-brodkorb.de>
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
	TAGGED_FROM(0.00)[bounces-13103-lists,linux-mips=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.987];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[flygoat.com:dkim,app.fastmail.com:mid,messagingengine.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 50ED3DB56D
X-Rspamd-Action: no action



On Sun, 1 Feb 2026, at 6:39 PM, Waldemar Brodkorb wrote:
> Hi MIPS hackers,
>
> I want to use the latest Linux kernel on my Mikrotik RB532, but the
> serial console is non working. I bisected the problem and the first
> breaking change is this commit:

Hi,

Can you try this?

diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
index 8ecb56be81ac..030e0b41ff06 100644
--- a/arch/mips/rb532/devices.c
+++ b/arch/mips/rb532/devices.c
@@ -213,7 +213,8 @@ static struct platform_device rb532_wdt = {
 static struct plat_serial8250_port rb532_uart_res[] = {
        {
                .type           = PORT_16550A,
-               .membase        = (char *)KSEG1ADDR(REGBASE + UART0BASE),
+               .mapbase        = REGBASE + UART0BASE,
+               .mapsize        = SZ_4K,
                .irq            = UART0_IRQ,
                .regshift       = 2,
                .iotype         = UPIO_MEM,

Thanks
Jiaxun

>
> 6e690d54cfa802f939cefbd2fa2c91bd0b8bd1b6 is the first bad commit
> commit 6e690d54cfa802f939cefbd2fa2c91bd0b8bd1b6
> Author: Yi Yang <yiyang13@huawei.com>
> Date:   Tue Jun 28 16:35:15 2022 +0800
>
>     serial: 8250: fix return error code in serial8250_request_std_resource()
>    
>     If port->mapbase = NULL in serial8250_request_std_resource() , it need
>     return a error code instead of 0. If uart_set_info() fail to request new
>     regions by serial8250_request_std_resource() but the return value of
>     serial8250_request_std_resource() is 0, The system incorrectly considers
>     that the resource application is successful and does not attempt to
>     restore the old setting. A null pointer reference is triggered when the
>     port resource is later invoked.
>    
>     Signed-off-by: Yi Yang <yiyang13@huawei.com>
>     Cc: stable <stable@kernel.org>
>     Link: https://lore.kernel.org/r/20220628083515.64138-1-yiyang13@huawei.com
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
>  drivers/tty/serial/8250/8250_port.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> When I compile the commit before this commit everything is fine.
> When I just try to revert it on master I still get no output on my
> serial console.
>
> Anyone here have an idea what is defect in arch/mips/rb532 nowadays?
>
> Thanks in advance,
>  Waldemar

-- 
- Jiaxun

