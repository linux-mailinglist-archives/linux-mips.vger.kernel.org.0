Return-Path: <linux-mips+bounces-7316-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DF0A07039
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 09:44:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 976A63A69CD
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2025 08:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243C7215065;
	Thu,  9 Jan 2025 08:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="fe9N0bg7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WMs4FOZr"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C1521504D;
	Thu,  9 Jan 2025 08:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736412243; cv=none; b=tm9A7AjhSPbQig1YM3SSlVQln0JKZKdSw00fbNs2SWT+8GavEFxemXjm7tfyMAuTuIIjKu4AbHaohhlYaoCnKPXLp1vBieZIotW/3WBHNEm5Rv0yr8frUPrIei3/MIDj8ur6N7OgYjibKRjPnZ0OrWMMMxVX3ipJ7Z3D0OIQRJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736412243; c=relaxed/simple;
	bh=8H6BygMIu1Z3lOz7VJer5HBaeLon7BbM/2AemECWP4M=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=TtRCOAb94qp+nr72YBtuJ8J3LnG7nFeDL/TkJ5boBJnvGPfZPjq+T6P4Jg9hfyp7eiQwX5pceSfUkW4WuOZiZlR/yl8W0BSocPEAYiA0Wf78fluj6LXN3ddI7/SInxX/uL/Cf7HhV6Ld/VYj60PJ/KtQoYp8QJwXZUeqIfRy2+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=fe9N0bg7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WMs4FOZr; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 827DD11401AD;
	Thu,  9 Jan 2025 03:44:00 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 09 Jan 2025 03:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736412240;
	 x=1736498640; bh=tigQXaY52+f4nEMAt97v+LIiKFSTsAzA1NT4bvf0HiY=; b=
	fe9N0bg73wO77VQ4hqkdowFETgmawdiJkIJ7feHkc1xwiGI6bjrneI9VRNPt8R/Y
	AfM+d3TjPmW3YAzAkVa51dyDZNBccqlYSDinIu2qUyQdWg2D7rIsJIRpiXIWaYKa
	qGPo7HW/c4ykNqxs6niZ/0rGLxDGo/ph25fBKW0WqiTA/TwfzvVqg6RPhaRChmAP
	eXQ1AcyxNeCw/SetMXBSvxku1nuGuoc3GQ+Tk83BNUhQaFa/tlI5qhPySefRGfOi
	HmgQqxI7fwe0obN3W4ULH9Be8nlo7VDQ/sEQJvU0i2K/MVRm92GDvIq2vzZoxcEG
	WF/0OFdNCds2zGrkyAJY2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736412240; x=
	1736498640; bh=tigQXaY52+f4nEMAt97v+LIiKFSTsAzA1NT4bvf0HiY=; b=W
	Ms4FOZrnkuG0wcIfRkrKCxcQVXFUegr6R+YARwAfJIuWjUXAhthkbJJonWrSmNQV
	nTj+BzuhqgC2X7FC9pp9yOicsTiw6HZnJo+uMz9UTagKGRKeLkp6aJg20zFeQ4EH
	ylFpyD1Q2J5n0cHRI5h+XWpp5MFLfI/3ogEwwY9TwYtr66LH8Q3rkf2o3zkavXrp
	/fJKf7FhuMBcu0NXBhMoaE83BaWOb9kXFWV4ajoyDexUAQNpDS8zL02SK+NMO3Qk
	UiLSTrKvBc6Q+rSmaoyRzrFlswW/P8Ol3IeQ/V3/GpEEUsI1F+wJbtC4KCoAft0F
	nxnxistGx8pA+H1/NHH4A==
X-ME-Sender: <xms:Tox_Z7saN7uAizgebebXFs4arIf4Fbvasl3tKa-d28EvnC8IV1vZdg>
    <xme:Tox_Z8d_1E7BGD7NztUjAAlmcQOXskaeejLfpx-qXPCnkYlNQCuHgjSN5gB4FIhjL
    vlsFg9Ty7chZdAIzHs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeghedguddvfecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:Tox_Z-yJG9BDEken2s0M3eerfXdoiYzTQuz_W6_cs78rrA5f7p1eAQ>
    <xmx:Tox_Z6MtF2yRnJBHrhp6lXiIWi4Xem7EtuSbx_4krv84BDYGnJz0UA>
    <xmx:Tox_Z7-kZoGjhfeHoPFFMTdht9yvKI3oVci-mB4v5bIklRS71FpB2g>
    <xmx:Tox_Z6VbslOI5gJ0HBaX3YihZjBTqrydLvJWJmUucTay1E8H8eLlaQ>
    <xmx:UIx_Z4iX2WwoRqQTPJ2GNboLPBjbISPSUatlpTe2Jx2hAK8pSMNp1XHw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9B5FE2220072; Thu,  9 Jan 2025 03:43:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 09 Jan 2025 09:43:38 +0100
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
Message-Id: <678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com>
In-Reply-To: <24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com>
References: <20250103140148.370368-1-glaubitz@physik.fu-berlin.de>
 <24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com>
Subject: Re: [PATCH] alpha: Fix personality flag propagation across an exec
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jan 9, 2025, at 09:01, Arnd Bergmann wrote:
> On Fri, Jan 3, 2025, at 15:01, John Paul Adrian Glaubitz wrote:
>
>> 
>>  #define SET_PERSONALITY(EX)					\
>> -	set_personality(((EX).e_flags & EF_ALPHA_32BIT)		\
>> -	   ? PER_LINUX_32BIT : PER_LINUX)
>> +	set_personality((((EX).e_flags & EF_ALPHA_32BIT)	\
>> +	   ? PER_LINUX_32BIT : PER_LINUX) | (current->personality & (~PER_MASK)))
>
> This looks wrong to me: since ADDR_LIMIT_32BIT is not part of
> PER_MASK, executing a regular binary from a taso binary no longer
> reverts back to the entire 64-bit address space.
>
> It seems that the behavior on most other architectures changed in 2012
> commit 16f3e95b3209 ("cross-arch: don't corrupt personality flags upon
> exec()").
>
> At the time, the same bug existed on mips, parisc and tile, but those
> got fixed quickly.

Correction: from what I can tell, mips still has the bug (and now
also loongarch), it's just in SET_PERSONALITY2() now instead of
SET_PERSONALITY():

        current->personality &= ~READ_IMPLIES_EXEC;
        ...
        p = personality(current->personality);                          \
        if (p != PER_LINUX32 && p != PER_LINUX)                         \
                set_personality(PER_LINUX);                             \

personality() only returns the lower 8 bits (execution domain),
so if any of them are set (BSD/HPUX/IRIX32/IRIX64/...), both
the upper and the lower bits are cleared, otherwise neither
of them are.

The behavior on the other architectures is that we clear the
lower bits but keep the upper ones.

      Arnd

