Return-Path: <linux-mips+bounces-7318-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 967BCA0706A
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 09:56:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87E0916453D
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 08:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09368214A6D;
	Thu,  9 Jan 2025 08:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="N0f63wdm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="k1jm5abD"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6622144DD;
	Thu,  9 Jan 2025 08:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413013; cv=none; b=Ywtcg6hYKDjQY8v1kDuI71BU1OXZJPd6iTrSKiB4CmyLOOjgDQETMD43Y8rdxot1mJzc3hD8PfGj8GkGSmr4Uh8O33esG6jpsSAbadhtWWe6PtW+lJ7p+eS/284RpBT3Ua9za9J2oA+4IV3De8oz9/1TasibABxeKnGWtcF7o/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413013; c=relaxed/simple;
	bh=NehpKKmMaR3GIYZqcYVx7P8VJfB6vAuyKnRWoyG7G1o=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Aqo131yqNsZzofcQryANNx8Jc4Sls+iOKL2gzA0qxcIeNdimmCOnqobX/wf+ft4lIcUR1uRSBB2jjV/hSpQgd+zx0v9a40DD78RJK/nHuRF0HvOeZEh72sw7waEhcQ2pbuDaGTVEYGsP+QgnREMdflC3wGKH90TiaLi7Dq8K5cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=N0f63wdm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=k1jm5abD; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 2DADD13808D6;
	Thu,  9 Jan 2025 03:56:51 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 09 Jan 2025 03:56:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736413011;
	 x=1736499411; bh=XaB+Ck7nxPsi1AU/Ik3zZJz+uK6Ih4GsicawNA5NprQ=; b=
	N0f63wdmcvkoKozoVJfycF3bbYXp7dZJ46CqbI93McMyi5veqqhlRAWALX3EjSMo
	4yNCsFObApFEtAKekwQnxy2vNSPD697WMJZc3PXXcwzTWmfJypzshGNNqAVgy0ey
	bXuykbVyDLglc6bH+5mW/g/Gx1BlDCwsT9iXKay1FbM8KcytGEJu1VMIDDOc1b6C
	hgGey7xdNzdPjb85ALTEDlhQmzqW5Nfj77rxhw/NrS4nVqHSCCL9OIdlBYvzTByi
	0Esh/gFX827Pf+jD2G0KM9QUi0cwZErNXPRRgyYtbVW2gNt51GKNs4HCTEfmPhsN
	fSy1SxfsoGogmFsWkmxVBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736413011; x=
	1736499411; bh=XaB+Ck7nxPsi1AU/Ik3zZJz+uK6Ih4GsicawNA5NprQ=; b=k
	1jm5abDOh/xLoDwK2om+OAm5riBvIbc+0bqxRRdrftSVRkh9fBRs3Tp+moNap0Nt
	sPWaGpHwH1gQs9+13KuXDV3Wa/X9x3YpxtRpeHaVuy+AVvP2LUCcy+L3jYdEuj68
	MZSPeyJ5k0a2Lgxbl5y1lVR7caEXaoBNjUhAhRHk+MhQfpMwkN9w+OlAEjYPJo9H
	EFimEYdVwEUQ2Y6DTK6MZFRE1qq7kviG8ctOfQzi1yY6xUbdHif/URtlbbJ0XbjS
	NTPawFs4gzg+DfXgjPhYZfShXZtm+BHpA9F6VVtwyWysawQbbMKS+LaS/tGrjCpA
	CxPiYU+03tWmMA3JXWsoQ==
X-ME-Sender: <xms:Uo9_Zwd12NFUlOsW3pLsfbVsgF36TP-8UNnjqN4BOmosFhUzyqgPlw>
    <xme:Uo9_ZyM6uA6PyZdehxdmDmb12DinNW-76N63kYc0ByWNVuRe1BG4BwIEbbFNRNPva
    yXAvMQ94PS3yH2qsAc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeghedguddviecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:Uo9_ZxiLULLalc0tj6zR_98iw2pDgpO-0BoDKRvVMJ271jRUBlyVsw>
    <xmx:Uo9_Z181RpgymxR6mdxtEgM2z-kCVk_tHpGi1coG-IhUTtcFsTwrUg>
    <xmx:Uo9_Z8vXr7sxq599wRSjtZrm-q9tXdmNK5RqsoptMuKtvnJH4XWNag>
    <xmx:Uo9_Z8HfyV_akjFlGt1YqAS738U4ORouzcMBI4Q6fVUmqKnvTrddEg>
    <xmx:U49_Z8ShCsSs-BZz_dYyILOpbvceXneyD6wb_DHb9M0HC1OlZbLgsT-w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5D39D2220072; Thu,  9 Jan 2025 03:56:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 09 Jan 2025 09:56:28 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Matt Turner" <mattst88@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, "Kees Cook" <kees@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-alpha@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: "Michael Cree" <mcree@orcon.net.nz>, "Sam James" <sam@gentoo.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michael Karcher" <kernel@mkarcher.dialup.fu-berlin.de>,
 "Chris Hofstaedtler" <zeha@debian.org>, util-linux@vger.kernel.org,
 linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Message-Id: <82d33a2d-dffe-4268-a175-4536b3f9c07f@app.fastmail.com>
In-Reply-To: 
 <bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de>
References: <20250103140148.370368-1-glaubitz@physik.fu-berlin.de>
 <24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com>
 <678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com>
 <bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de>
Subject: Re: [PATCH] alpha: Fix personality flag propagation across an exec
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jan 9, 2025, at 09:46, John Paul Adrian Glaubitz wrote:
> On Thu, 2025-01-09 at 09:43 +0100, Arnd Bergmann wrote:
>> On Thu, Jan 9, 2025, at 09:01, Arnd Bergmann wrote:
>> > On Fri, Jan 3, 2025, at 15:01, John Paul Adrian Glaubitz wrote:
>> > 
>> > > 
>> > >  #define SET_PERSONALITY(EX)					\
>> > > -	set_personality(((EX).e_flags & EF_ALPHA_32BIT)		\
>> > > -	   ? PER_LINUX_32BIT : PER_LINUX)
>> > > +	set_personality((((EX).e_flags & EF_ALPHA_32BIT)	\
>> > > +	   ? PER_LINUX_32BIT : PER_LINUX) | (current->personality & (~PER_MASK)))
>> > 
>> > This looks wrong to me: since ADDR_LIMIT_32BIT is not part of
>> > PER_MASK, executing a regular binary from a taso binary no longer
>> > reverts back to the entire 64-bit address space.
>> > 
>> > It seems that the behavior on most other architectures changed in 2012
>> > commit 16f3e95b3209 ("cross-arch: don't corrupt personality flags upon
>> > exec()").
>> > 
>
> So, if I understand this correctly, we should just use PER_MASK on alpha
> for 64-bit executables and allow the bits to be cleared for 32-bit binaries?

I think ideally the EF_ALPHA_32BIT handling should use TIF_32BIT
as we do on other architectures, at that point the custom SET_PERSONALITY()
can be removed in favor of the asm-generic version.

Alternatively this could do something like the arm32 version (note
that on arm, PER_LINUX_32BIT/ADDR_LIMIT_32BIT means "allow using
the entire 32-bit address space rather than limiting to 26 bits for
compatibility", while on alpha it means "use only 31 instead of
42 bits for addressing", but the logic can be the same):

        unsigned int personality = current->personality & ~PER_MASK;
        /*
         * APCS-26 is only valid for OABI executables
         */
        if ((eflags & EF_ARM_EABI_MASK) == EF_ARM_EABI_UNKNOWN &&
            (eflags & EF_ARM_APCS_26))
                personality &= ~ADDR_LIMIT_32BIT;
        else
                personality |= ADDR_LIMIT_32BIT;
        set_personality(personality);

In any case, I think we should fix alpha, mips and loongarch at
the same time, to make sure it doesn't take another decade to
fix the rest.

    Arnd

