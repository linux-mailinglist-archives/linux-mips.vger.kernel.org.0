Return-Path: <linux-mips+bounces-14391-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBkuN8XS8WnPkgEAu9opvQ
	(envelope-from <linux-mips+bounces-14391-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2026 11:43:33 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA0C4922EA
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2026 11:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D07B301051F
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2026 09:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9D1E3A7842;
	Wed, 29 Apr 2026 09:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="liFlFwoG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VhRNBFCH"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1853A1A2F;
	Wed, 29 Apr 2026 09:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455380; cv=none; b=n6BBP3bRtwvxEvvrFts2QFuQIlDhdfE/hONFBINJryrzHEdc5uJEk/SyiMfYbIhhv0Dc/mCf+vGUkLF/Ifg9QhueyDARjgDlqgIMfbXrSV8z1ygoP3bAw1ond6EuFXTuVeBhYYGyjsworn+crz/gCt1l0yXQY4PzmAWmNrUS8cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455380; c=relaxed/simple;
	bh=Xf6zZJzgLMvmAW30t87H7JUR7g6g8WBSZqFVbcO1fkc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=PPMBhh6eYCfvpWFbvzxa4dRtIV6fYmxG3+w9rvKvRRljnGpwmcLdcX8ZZ8KniDCUl9tql4uo0W2Y5Ym8OZxGc4kECXdbsQHxQ3A4LG/t/IYMGM+JvlJ14TwWNyQK341rYhQOncAS59/Hq1CHRNjhMOvJe6tnHlxPd0KIEBN/4NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=liFlFwoG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VhRNBFCH; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id A2BA4EC018B;
	Wed, 29 Apr 2026 05:36:18 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-03.internal (MEProxy); Wed, 29 Apr 2026 05:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1777455378;
	 x=1777541778; bh=RrrQxnCiP4A6oVNx6GsMcrgkKaGPOhYYSIH0FcBHhLk=; b=
	liFlFwoGDYgC23B+Kwgw0pkhWWNfLZ2ELx9qRFn7ScjmQq/5KmK96ZZMWwZgvmCO
	QCXNTLuRNtBSk6BH/TuxXiZqVgzQnoBhAnpmFSXDlMfsYrR33uis3kw7un/qkPzI
	mnPiio298np+BGbH11N7iaFv9nKqy7CNK0m2wJjX22WmX3uKCP37cidA/nvMDdOL
	2YQYK0wqxn32BpHFrXP4zRTS/6Bfm+2HlrlwnpcoJEDRjqRYATuuKoczYzv1/Mm0
	EcU5MAARlBYkI8CTr7FSZQUzu3Y99N1GJ2YPRUbB2Vr8e8smW6UG1dBOBJ0agcBb
	DZNVFGB3M1iJmE/kWP7+5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777455378; x=
	1777541778; bh=RrrQxnCiP4A6oVNx6GsMcrgkKaGPOhYYSIH0FcBHhLk=; b=V
	hRNBFCHaHknS3aWRi6PDhQst5r5ROGYzfEnDZ9aQcc+e/C7gwHfbAcy/UTeC4d2z
	RbcUSLGiazuYxTiYFakA1ho8nxmR7ZSLz7OlXyZKwWI5RyqRDrZYwCF/1wlnp6ls
	nRV8lJgaQLEM6wKeQm632kLgH9G0uYtJKRgr2Hjm7T/0U/5iD1EvFbe6ZyLWEvrd
	Pn4YVep+PkD9nIDfdhM9SviM+qs7a9JBvEUkFt1OWADgb4oc0IJS2SqvHHPuwcpW
	tb1DUjPmfGyrFhyKuxx5aVZYZFOYwwx8aGot1vz7aM/1Zcpc7Mu/CqA9k+qnIXju
	p38jm55yIMR1hhwn5YLhw==
X-ME-Sender: <xms:EdHxaQqQl1rGrNqLNPEFB20pswlrXXKKRUDlw2HGL2Mt23gKizGUgw>
    <xme:EdHxaRckuA4aIVspRX7Vwaws32pblT9FkIunAV3iBHfvj7XZuAbJx-53T117XdQH7
    mvHrZI8KLu3v7BNfaXPLx_lpOHSBGCfTQakKyuQOKlaAyU4v_S5Og>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekgedtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdflihgrgihu
    nhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpefhtefhuddtieegleeuiedttdehheduveffjeettdekvdeuiedt
    udejfeeijeeifeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphht
    thhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtshgsohhgvghnugesrg
    hlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepiihhvghnghigihhnghgurges
    ihhstggrshdrrggtrdgtnhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvg
    esvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgv
    lhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmihhpsh
    esvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:EdHxaX7k3I-3o4O8j_P--SAa_vZvv7qzlQ3-FPpeay1wKWRP83kq4A>
    <xmx:EdHxadUzILC4Q1aAiffPCMKtTQa43vwVXu8Axhq0Xo7YYJxd8XkLcw>
    <xmx:EdHxafJrqjPb5nrK4RMV_BimM_Tc1-oL8T4FgOkyENLX-L34Q4Sl-w>
    <xmx:EdHxaftIb_Ngp2uk4oW12e-eLK1jA0_3OrU1NxD5_XvjIIp_lzSshA>
    <xmx:EtHxab6R05X8krldV1dMOT4erXvQi5jvAwKZHo6d3lAOnf7fWcWAZaAA>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A25F72CE0072; Wed, 29 Apr 2026 05:36:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ApIjjO01HLYR
Date: Wed, 29 Apr 2026 10:35:34 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <3194da09-3bfc-4482-b179-04b6d5df4a00@app.fastmail.com>
In-Reply-To: <20260411101744.4020216-1-zhengxingda@iscas.ac.cn>
References: <20260411101744.4020216-1-zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH 0/2] Enable LPC interrupt controller on MIPS LS7A systems
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4DA0C4922EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[flygoat.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[flygoat.com:s=fm3,messagingengine.com:s=fm2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-14391-lists,linux-mips=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiaxun.yang@flygoat.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[flygoat.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,flygoat.com:dkim,flygoat.com:email]



On Sat, 11 Apr 2026, at 11:17 AM, Icenowy Zheng wrote:
> This patchset tries to enable support for LPC interrupts on MIPS-based
> Loongson systems with Loongson 7A1000 PCH chip.
>
> The corresponding irqchip support (along with the DT binding) is already
> added to the tip tree.
>
> Tested on a Haier Boyue G51 system with legacy i8042 keyboard/mouse as
> integrated ones.
>
> This patchset is splitted from the original patchset that contains both
> driver part and DT part.

For the series:

Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

>
> Icenowy Zheng (2):
>   MIPS: Loongson64: dts: Sort nodes
>   MIPS: Loongson64: dts: Add node for LS7A PCH LPC
>
>  arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> -- 
> 2.52.0

-- 
- Jiaxun

