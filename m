Return-Path: <linux-mips+bounces-13089-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFvhHNFtgGl38AIAu9opvQ
	(envelope-from <linux-mips+bounces-13089-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 02 Feb 2026 10:26:41 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3A1CA193
	for <lists+linux-mips@lfdr.de>; Mon, 02 Feb 2026 10:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB4F330011B6
	for <lists+linux-mips@lfdr.de>; Mon,  2 Feb 2026 09:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA9992C032E;
	Mon,  2 Feb 2026 09:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eaPCLGSV"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AEB2853EE
	for <linux-mips@vger.kernel.org>; Mon,  2 Feb 2026 09:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770023897; cv=none; b=TfhgFgKiRsAibf1sUtU02p3JRX63tzkz1xaK63U+82k85+hmnfnyrbQBcXwrfkZ3I0vn5wtuCR7Q9wF5LDDx/AA8vkwXScIdpBLXopFDqj6zcPqHUxDhOvV62BXV73JRCU1qd0J+FKDI3fBkP22UR9GYPYjPZN0L96zRWUq/g7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770023897; c=relaxed/simple;
	bh=JqeS7inasXk+D8G8JDOirqUKmLMV3mR5WxQcSxvq4Eg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lrc+4aZnAf0ohOE0L/wgSZdRuSDyY4l9cFYJ4hwgguNxlBpLP6XE+r6p4BKiS3eYC741DqlMm6q6ED/wPGZehv82ITvueG5ZHSCinolpMglLGnoLNYUzVP2I5NgajSZ6tLb9FB+f0aJr96+IOvQk/Wz3SzUcxcONVJ6N4IcTIik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eaPCLGSV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D91C19421
	for <linux-mips@vger.kernel.org>; Mon,  2 Feb 2026 09:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770023897;
	bh=JqeS7inasXk+D8G8JDOirqUKmLMV3mR5WxQcSxvq4Eg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=eaPCLGSVj3ldc2IeazpfcKDAe4So4ft56TnXfG8ICJyVnbPWw79e8ET3E6g2fxQRe
	 S0F7Sp47E/YuuJjUmmecAPoK2hC99HVWxmoQCh78EUQq4/2Xl07spTUKyWQUct9QU8
	 3Z+ISV32YPF8VEeDxWCwKqJ2dUeVaTt+SxWjXgkF2YiUDmGvKtPoWvVqx0fXYKzc1f
	 t02qTAWVl8rxeObx4yC75QS5LoQ2bUBqcDf+HP15OHZLy/2gKKmJ3aARoSehb4wDS2
	 zAjU0O7BL2vQ/AECZLdh15MWlc56PzA7LVhiMTSFp/uZtnPS0dCbQgltQYE48h8N6U
	 cOQ+GA+ghNs8w==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0F0ACF40068;
	Mon,  2 Feb 2026 04:18:16 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Mon, 02 Feb 2026 04:18:16 -0500
X-ME-Sender: <xms:12uAae5jTtcpzhQQcb-FpbwdEOjJQ2vJi1sBiDlkUXc3tDI9Aau_Gw>
    <xme:12uAaSs0H3lKQGgxEF3Fit7uu9uxdu4ULThnRvE8ct6pdQ-ht1W7EkNCawB4sPWpQ
    GzFxSDclp_Pt1oKtBG8wk7utPt912ZOZme3jDld281STdUVwkGWRmwB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeejvdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpedvueehiedtvedtleekuddutefgffdtleetfeetveejveejieehfefhjeei
    jeefudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeel
    qdeffedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrh
    gurdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoh
    epnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghr
    nhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmih
    hpshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmvgesiihihigrohdr
    tggt
X-ME-Proxy: <xmx:12uAaZvmD8JovsrLGr-Z2smbI_6r9zKgiPTe3mVNcaXDgeFM_tvF4g>
    <xmx:2GuAaWKzSeJVVkJtZAOL2dVBi3Lv7QLQBF3yP27AHFBxJPr4NkLFqQ>
    <xmx:2GuAaWnHpjPfh_C65h9M0d7x02hnkfEASNl7i_n6dL4b-6APdUtqVw>
    <xmx:2GuAaXKt5JtKtvHjz1yUtYRTwmXscFuemvwiQb_uL5WJAIxMRRmsyg>
    <xmx:2GuAab4UwPv0GXCkejzkV4tAOfPXHouxt2Ki39F-97SIycz5t88-3GSG>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DAB97700069; Mon,  2 Feb 2026 04:18:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A8lqlFeQHG57
Date: Mon, 02 Feb 2026 10:17:53 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Yao Zi" <me@ziyao.cc>, "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Nathan Chancellor" <nathan@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <99c54e93-fb8c-4bdb-ad40-a3161a42bb8b@app.fastmail.com>
In-Reply-To: <20260202041610.61389-1-me@ziyao.cc>
References: <20260202041610.61389-1-me@ziyao.cc>
Subject: Re: [PATCH] MIPS: tools: relocs: Ship a definition of R_MIPS_PC32
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.35 / 15.00];
	URIBL_BLACK(7.50)[ziyao.cc:email];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ziyao.cc:email];
	TAGGED_FROM(0.00)[bounces-13089-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[kernel.org:s=k20201202];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FROM_NEQ_ENVFROM(0.00)[ardb@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c15:e001:75::/64:c];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B3A1CA193
X-Rspamd-Action: add header
X-Spam: Yes


On Mon, 2 Feb 2026, at 05:16, Yao Zi wrote:
> R_MIPS_PC32 is a GNU extension, its definition is available in glibc
> only since 2.39 (released in 2024), and not available in musl libc yet.
> Provide our own definition for R_MIPS_PC32 and use it if necessary to
> fix relocs tool building on musl and older glibc systems.
>
> Fixes: ff79d31eb536 ("mips: Add support for PC32 relocations in vmlinux")
> Signed-off-by: Yao Zi <me@ziyao.cc>

Thanks for fixing this.

It does imply that the subsequent kallsyms patch will result in 32-bit MIPS no longer being buildable with older toolchains if CONFIG_RELOCATABLE=y.

Not sure if that is an issue, but it needs calling out. Nathan, any thoughts?

> ---
>  arch/mips/boot/tools/relocs.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/mips/boot/tools/relocs.h b/arch/mips/boot/tools/relocs.h
> index 607ff0103064..942981d9ce73 100644
> --- a/arch/mips/boot/tools/relocs.h
> +++ b/arch/mips/boot/tools/relocs.h
> @@ -29,6 +29,13 @@ void die(char *fmt, ...);
>  #define R_MIPS_PC26_S2		61
>  #endif
> 
> +/*
> + * GNU extension that available in glibc only since 2023, not 
> available on musl.
> + */
> +#ifndef R_MIPS_PC32
> +#define R_MIPS_PC32		248
> +#endif
> +
>  #define ARRAY_SIZE(x) (sizeof(x) / sizeof((x)[0]))
> 
>  enum symtype {
> -- 
> 2.52.0

