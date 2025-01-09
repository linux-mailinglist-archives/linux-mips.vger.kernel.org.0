Return-Path: <linux-mips+bounces-7328-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37844A081D5
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 21:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FF2E160303
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 20:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3D32054E4;
	Thu,  9 Jan 2025 20:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="MY8X4Hqe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ozPEQ20c"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ED62054F3;
	Thu,  9 Jan 2025 20:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736456056; cv=none; b=G9u1/+EJ0/NRxSJqg4A/CATWWQogYxKoaLvWGDX8F6NtYeedkb2dbzidXr3hnNo3VuJTYwmZMUA4fkKq3rV/TLgemTlNE4CaE0mqgOpz41C1rG1bn2EacmKhN6QQIRtydllrtZk/VjDFA1EI4+Ud6rTh9jTj3FA5cI7OwlJtrV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736456056; c=relaxed/simple;
	bh=5/C7Qk/iqHGdIjlwh5HEHVsPXP190aXPuUkUTyQD9aE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=tnfxlPEJtnq6b/OrfOzlfwbgrsa+Y60/ZpEHY9bANcyOkmILRse/o7uVg3sWJEDczSQgr+IfmHp6/6AQUTJOr7ijUBSgvRhk43+rimo7hE/0baFai7eIRrBEiDC8JSqKlVMQHA2ysu7f0JGc9CIon7DqSbNJtDeuZV0mZZjM+xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=MY8X4Hqe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ozPEQ20c; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id F0BC313801A0;
	Thu,  9 Jan 2025 15:54:13 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 09 Jan 2025 15:54:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736456053;
	 x=1736542453; bh=LV6jQYO6s0OpqVr09VODFifJLCcP1dDB4WHODaY6vAU=; b=
	MY8X4HqeV7scGXk3qO8Yo6Q/GHyskxaU7hmTXvLVIXsMLl+dm3AB9S4dI+h5kHOP
	Bi/75K+4CiP/MVByS+h4oKimNOjfA9kiFQzTrhqg51CCSR9o23xbkr+RkH/2zEfq
	lF2IfaMGdirOTUL/aLNqFHtCXq3CbzrEMe+IoA2/zCvLcGGZW9lAiNQTm+ZkAOF9
	3bK1oOdB+o6jhGiuE77ykDhWuRU9Bsa234t9fqBRFSwZvXvbQaZ25Or/Lt7rQiGa
	4Ue/Fglrmx53ZsRg/2OitF8FjyHMjmEOtmbL7p48i32NrIV5hzTjxYRrROJ2f4IT
	hUBy0VLP5meYXkK9WmyGFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736456053; x=
	1736542453; bh=LV6jQYO6s0OpqVr09VODFifJLCcP1dDB4WHODaY6vAU=; b=o
	zPEQ20cJaEtO6r/thYRekT7MtdmFULtPsWNlXU1m+r9tKuBmhHD9jnlQGMnfjCUd
	pEa9DAyqHeM2cxuXZxMX35qpPW3H7lxfk/yqkWI+MXuSUHjECxY301i+lSZSZnow
	woIuIYU0GE647Uh6t3EoGVSrvdRhyHVV8+5ZXX097BvmigbJBaVK6YVg8t9QD8Lf
	/LLI35vxXpSQbiU7SRTVmHstYIUVeitcKaDBYavJ7fjPTF+m/b1cS/VtYiiw+Vg1
	dlUQAFQ3ZQNXOaBEHlc93/ohwndtQi9AAWXgV6IKISScDOwa5yS/CpYjr9d0CaYg
	n5MTe7Oy2zmxk8A2QYqTQ==
X-ME-Sender: <xms:czeAZ-gsPK8ZMADacYPNsfr1GINwZPKG5xzPhI5dWs7r5sPtghCiYg>
    <xme:czeAZ_CqzYpjcaatlp4brem-c4aizxGAyPNmcVhiA8Un9zNs0o4udmU-Z7LQ3sXcc
    B4zoqcWOk1YG_1iAfo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegiedgudeflecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopedu
    kedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepiigvhhgrseguvggsihgrnhdroh
    hrghdprhgtphhtthhopehsrghmsehgvghnthhoohdrohhrghdprhgtphhtthhopehmrght
    thhsthekkeesghhmrghilhdrtghomhdprhgtphhtthhopehkvggvsheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepphgruhhlmhgtkheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtoheprhhitghhrghrug
    drhhgvnhguvghrshhonheslhhinhgrrhhordhorhhgpdhrtghpthhtohepghgvvghrthes
    lhhinhhugidqmheikehkrdhorhhgpdhrtghpthhtoheplhhoohhnghgrrhgthheslhhish
    htshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:czeAZ2HAxY2Z9dwqbKEczu6HdQ0Xb05bDuKR0Z9AwM5LUrpX0u0E8A>
    <xmx:czeAZ3R7WcSKplNyC-jAFLDQ4ktyj1SZYTEiW3zm4pjfpOAZsS7NVQ>
    <xmx:czeAZ7yMN6I34dojSie-x3eeTfx3J7Sudz8D-0vux6v5_jHwYgTAkQ>
    <xmx:czeAZ15wTkCQKRU29OPw-xqaFW1U6m1_uOe5vUXhqMBFI8KFiQD-tA>
    <xmx:dTeAZ7kMR0CFbnJAS9hzGTJyKp12YyashwZxdj08sKfsDYYsL1I1cIru>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A68C92220072; Thu,  9 Jan 2025 15:54:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 09 Jan 2025 21:53:51 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 "Eric W. Biederman" <ebiederm@xmission.com>
Cc: "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Matt Turner" <mattst88@gmail.com>, "Kees Cook" <kees@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-alpha@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 "Michael Cree" <mcree@orcon.net.nz>, "Sam James" <sam@gentoo.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michael Karcher" <kernel@mkarcher.dialup.fu-berlin.de>,
 "Chris Hofstaedtler" <zeha@debian.org>, util-linux@vger.kernel.org,
 linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Message-Id: <bff9bd35-4d47-45fc-90c5-28b79425fc8b@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2501091953050.18889@angie.orcam.me.uk>
References: <20250103140148.370368-1-glaubitz@physik.fu-berlin.de>
 <24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com>
 <678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com>
 <bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de>
 <82d33a2d-dffe-4268-a175-4536b3f9c07f@app.fastmail.com>
 <cc420e1a843da3cf349607369851c338f4049c4e.camel@physik.fu-berlin.de>
 <87ed1cufj1.fsf@email.froward.int.ebiederm.org>
 <alpine.DEB.2.21.2501091953050.18889@angie.orcam.me.uk>
Subject: Re: [PATCH] alpha: Fix personality flag propagation across an exec
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jan 9, 2025, at 21:10, Maciej W. Rozycki wrote:
> On Thu, 9 Jan 2025, Eric W. Biederman wrote:
>
>> > So, this would be the 100% correct for alpha then which would not loose
>> > any functionality even for 32-bit binaries?
>> 
>> I don't think it is correct to think about 32-bit binaries on alpha.
>> 
>> Alpha never had a 32bit instruction set.  But at some point it looks
>> like binaries that could not handle more than 31 bits of address
>> space got ported and someone implemented a work-around.  I guess this
>> is the --taso option that Arnd mentioned.
>
>  This also saves some code space in non-PIE and plain static executables 
> as it takes fewer machine instructions to load a 64-bit address that is 
> known beforehand to be a sign-extended 32-bit value.
>
>  This is similar to the MIPS n32 ABI, which also implies a 32-bit address 
> space while still using 64-bit registers for everything, starting from 
> stack slots (it's also ILP32 with the `long long' C data type only making 
> proper use of the full width of the CPU registers, while Alpha's --taso 
> ABI is I believe IP32 (?) with the plain `long' C data type still 64-bit, 
> just as with the regular LP64 ABI).

I'm pretty sure it's still LP64 on Alpha Linux with gcc. There is an
-mpointer-size=32 option in gcc for VMS, but I don't see anything like
that in Linux. The only thing that is implemented here is the option
for the linker that sets the EF_ALPHA_32BIT bit, but none of the
code generation takes advantage of the upper bits being zero.

       Arnd

