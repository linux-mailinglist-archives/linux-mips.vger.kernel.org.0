Return-Path: <linux-mips+bounces-3277-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 963948C6DC9
	for <lists+linux-mips@lfdr.de>; Wed, 15 May 2024 23:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C75191C221D2
	for <lists+linux-mips@lfdr.de>; Wed, 15 May 2024 21:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC76315D5A2;
	Wed, 15 May 2024 21:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="d1arJioY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GfqXR+Uj"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout8-smtp.messagingengine.com (wfout8-smtp.messagingengine.com [64.147.123.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8F915CD6C;
	Wed, 15 May 2024 21:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715808401; cv=none; b=NgN+0koXxFFrpysxaR9CIeIx05f8bfFfL/3mGcgx2uf0M/Di151dGv6F5tv64yRHYTnEgZ+nhqGkUZ+GhQzfTtXh1+kJyST13ZzUmk9k4uP/gZXDCBpxDxrFC/bgtftx1qm+LERWmc5cj/5e+NTEwTKh6lsLXQlathK6Bcd6gko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715808401; c=relaxed/simple;
	bh=AVWjrF1aB+rVH8EVf5yWkVZ14chy25cKhlbqbiUx/D0=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=i7PDBxbx9Xz47JZpYLw+5LEtuGx/3sgKDAFve2zXPfztqlnmN4JIeBjx4wjUOvekuqcYT9+9FvCfxQpZLG5TOev+KsGjuc6BubtTI5b9B57qPysmObw6gbm2Ut0CAb8CO85B8b9zPW66yABFtTbQVmOuk91gdPFlmmNXx9tJ1mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=d1arJioY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GfqXR+Uj; arc=none smtp.client-ip=64.147.123.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.west.internal (Postfix) with ESMTP id D4D671C0009D;
	Wed, 15 May 2024 17:26:38 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Wed, 15 May 2024 17:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1715808398;
	 x=1715894798; bh=iC8etUHEwOXKfGQuCm6oDeCaMzIDQh1lzehF6fQBU10=; b=
	d1arJioY6yp3XSudVzXwvPyBtaEAVGaxUBjAznlMf3HinFamS8B+jxP5DqH3EaWB
	A0Uo88m8L9+0TF0HJBKpBJRkUK4Pjqen2JKB4sE+LyVFH1kBxNPrSDNgc/F10QyR
	P7YKCaHJAkjkSrZ0gdmEjnpl2gjw/efq3agSX2ob4VbRCYVq7BJ9h9teFH9I5xRV
	cm5A31Nkch2XvFlSm+9d1URR59O8d2TWB5bWXvjVWvEaayf1VoLs+oqFiRMhuayt
	RWSA9S2WNA2VC89lObugcLXOF1kU5Y9qel7sS0q7rP1/mWBiqBOwrzGSpUq+ArjR
	YLU4LkzJptLNnTILeF0Mig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715808398; x=
	1715894798; bh=iC8etUHEwOXKfGQuCm6oDeCaMzIDQh1lzehF6fQBU10=; b=G
	fqXR+UjDwDk6ohpX17aLJL6ZOuRhfAYbdMGLKxlPy+W7LHxzR8IFqqMny31VL/E2
	R0TxwbqjZ6QwOSWfs/2x5j+r026CHhy8JZUPGlBvXHQepFzgijThgyZqNwWe5kca
	VZlWWuh/3GjpVJc1ZD9I2tG/qfCb12smIk7xrB/OfWSBeMs2sVWwL/7YZ327VZbS
	/NVq0sPSN8+O/iSEBZ2f6nCrB3LeIWQOR19e2f6WU1e2qw+kt2pFEIcSSX4QhUnA
	3OiVzS+TDjyoBRojeSP2saDt7KTezMbd4GZvimU+S3NG6N7+fZcbZgsGQbyE5GDU
	fSwfib3knjpm3Wk/CQcYg==
X-ME-Sender: <xms:jShFZjO_UVID7zSeu5VTzx-I5OC8I8mBjA_ivr4dz-K8-W43tQkNSA>
    <xme:jShFZt9WkEMjdD_qHVSh57JJbLNZOpmrqUopZBP7Lgnb7ZxxAbvUo4ddt4FfxIUwp
    j8oL2GVk1NL1W_Ul8k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdegkedgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    lfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtg
    homheqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefh
    jeeugeevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:jShFZiSvdeGlNqA4SSqlPzFdbKZ-rHVXbdFNA_rjkqW-4YdZQjpTyw>
    <xmx:jShFZntWiawwKgu7Bn7QEmrxb99fzSjXmVv6nr0yeRlbHGBr9UiAJA>
    <xmx:jShFZrcY1Hl6bBuO-UsW7okcJHYQEslcNpR5k_Q18dv816ifdYEKlg>
    <xmx:jShFZj2MHWkVA-G5_r1Ri7t5N20-Olnj8d-viKdgl4FXeaPhTUJi1A>
    <xmx:jihFZv4LXU5etinvr_Ltwr-fu1kkCfZf3Yef7AnvbDd_WKe_AEkkusES>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8E9F836A0074; Wed, 15 May 2024 17:26:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-456-gcd147058c-fm-hotfix-20240509.001-g0aad06e4
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <4b8d0a71-f4b3-4c6b-b1e2-f67bb2908508@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2405150850270.45291@angie.orcam.me.uk>
References: <20240202-llvm-msym32-v1-0-52f0631057d6@flygoat.com>
 <20240202-llvm-msym32-v1-6-52f0631057d6@flygoat.com>
 <alpine.DEB.2.21.2405142235100.45291@angie.orcam.me.uk>
 <7fc82f8b-df9d-45f5-8e82-27eac7b4b0ab@app.fastmail.com>
 <alpine.DEB.2.21.2405150850270.45291@angie.orcam.me.uk>
Date: Wed, 15 May 2024 22:26:16 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 "Guenter Roeck" <linux@roeck-us.net>
Subject: Re: [PATCH 6/8] MIPS: Limit MIPS_MT_SMP support by ISA reversion
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B45=E6=9C=8815=E6=97=A5=E4=BA=94=E6=9C=88 =E4=B8=8B=E5=
=8D=882:43=EF=BC=8CMaciej W. Rozycki=E5=86=99=E9=81=93=EF=BC=9A
> On Wed, 15 May 2024, Jiaxun Yang wrote:
>
>> >> MIPS MT ASE is only available on ISA between Release 1 and Release=
 5.
>> >
>> >  R2+ only actually, as also evident from Kconfig...
>>=20
>> Hi Maciej,
>>=20
>> Long time no see :-)
>
>  It's not so easy to get rid of me. ;)
>
>> There is nothing stopping us to run R1 kernel on R2 hardware, given t=
hat
>> those features are all detected at boot time. I understand MT was int=
roduced
>> at 34K which is R2.
>
>  We can certainly choose to support R2 features at run time with R1 ke=
rnel=20
> configurations, but it's not what the change description says (left qu=
oted=20
> above for reference).  And the MT ASE, indeed first implemented with t=
he=20
> 34K (for which I was a member of the product development team back at =
MIPS=20
> UK), is not a part of the R1 ISA specification set.
>
Good to know!

The motivation behind this patch is to workaround some randconfig failur=
es
that combines MT with early ISA release.

They are not trivial to fix, so I just ban them in Kconfig. I was a litt=
le bit
reluctant to admit that in commit message.

Anyway, thanks for bringing that up.

--=20
- Jiaxun

