Return-Path: <linux-mips+bounces-7392-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 375D3A0A343
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 12:26:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D74916877C
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2025 11:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5285B1922DC;
	Sat, 11 Jan 2025 11:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="ghlZMLDe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="lOvnQ3SA"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3C61865E3;
	Sat, 11 Jan 2025 11:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736594804; cv=none; b=KlYKqnJhdylhRYHKkMqUdWTe/T4TWTDJrgS3E74i+wqf6Ah8hT0sYVwqrVGbodeHw00wJv55w2Kr+FEE4StPBmP8XFpXkXUp7e6L21TfdYjr2NVPNHfWiDZsc8mEg/YUrzZu2Yj1haRCkhDVFd14csOt72X7jPiRFFq0Ww81P/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736594804; c=relaxed/simple;
	bh=D2AAOLYfAZyuBV7sazdyya4q+dujMbJczcTRFQmHPsI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lstLPn2v6NkPH0JrYjZKsvw84mrkdqZXJDZTo6g/3QfQIEyxUP74mNE6JrMLLrv+FUYI8lHE1dsL3PLY9hTmLy41oeVMb+nC/bQt7OxXd/Vv5YuMPRW0a1roUgxYg8qZa4dO/h0DyqcpjopWCJlg5P/062U56tIrvMAUWFdF+Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=ghlZMLDe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=lOvnQ3SA; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id BBC7413801D9;
	Sat, 11 Jan 2025 06:26:39 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Sat, 11 Jan 2025 06:26:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736594799;
	 x=1736681199; bh=306DKy1iW1JzjoeCQKfH4cZUMdXrxc6521qKQil5/zQ=; b=
	ghlZMLDeXknyJQN4sbOdEwf1wQ6c68VsdnA5+xgGkeSgkoqVTHWJ/yYZWCvFgIqF
	jQCnIWi6hDudul1avjuCwVVg7hknVGs+bPgF231fGu19in0Mt7Uil/lN/fDUSSiP
	Aj5ZD1ZmgxpqzsBlByiYzZJCuFJPDU9SghhVDbxMIpmchdxgSNsbmxgZ4WJhxZOf
	z3nRXeqbyPaXpqqCJEdeoEyNTejYC3OnnaoeWHPs5rgeMJ/bUzx2FEdRYisVIHCp
	IalY27nh8IiBjXlf8RjUq7grkW0UW0SEzs4KBzGPVuP6LYcSutyMsv2im9iIVVsK
	rtPqZp9eUaVU47XtQqvMnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736594799; x=
	1736681199; bh=306DKy1iW1JzjoeCQKfH4cZUMdXrxc6521qKQil5/zQ=; b=l
	OvnQ3SAVg5D0usL6wfD5jhG0pZzeu9dvJu8qgIzqjSmqc37pXG+P491hthbPz7wF
	Tu/UQrozxSOzYLS6wBoDbHWNJt6hP5mCV9rvlAjUN7s6LCpcXSRsOahZLpZge0yd
	2NLryAO5vA0d7pEe4kZhFgHTn+AesF252t8IZd0oK9I3SGKGo80s/NQ3UZSbwkaL
	U3cjJ1HN9zlSi+qcmX5oHx34rgsl2T/9rWyzGo2WN5hi0uMMvFVqqzhAnmPmpNMx
	AGjn9Om5mFDzvuRHRw45W4J95PcFaLXHky5hmHMXkgoMes13118b1C0f0UDy7itm
	ByArRUFBOG0dYLDZ38xwQ==
X-ME-Sender: <xms:blWCZ0i8VPq1j5Dr4YS2vcwnNw0gIz3XJuv1zZGPNMwx5ZBrlpjC1Q>
    <xme:blWCZ9D2kgHe6L0xmYh6cGioAweemkrN2P6AxffuvfQPnt_qtIU8ISE0gmkkC2Pkb
    K4VKv98mMtp9ULNii0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehtddgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeek
    keelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghr
    nhgusgdruggvpdhnsggprhgtphhtthhopedukedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepiigvhhgrseguvggsihgrnhdrohhrghdprhgtphhtthhopehsrghmsehgvghn
    thhoohdrohhrghdprhgtphhtthhopehmrghtthhsthekkeesghhmrghilhdrtghomhdprh
    gtphhtthhopehkvggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlmhgt
    kheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrd
    horhhgpdhrtghpthhtoheprhhitghhrghrugdrhhgvnhguvghrshhonheslhhinhgrrhho
    rdhorhhgpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmheikehkrdhorhhgpdhrtg
    hpthhtoheplhhoohhnghgrrhgthheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:blWCZ8FOcpTXR9XwxoRhp4w6S64F9rQxtGa2QOtxf96xgMNMoRucVA>
    <xmx:blWCZ1RaPCRSjrJ6jONCpVfg2C0ZsNw6qJFaC8uWdOorw9Rire2tgA>
    <xmx:blWCZxyyjQCEU5liQw9ntqVLF8rUdeHtMMJudbBkyXFXTyFrtc9s1A>
    <xmx:blWCZz6aEIWvulzsdiaUKRLwhk6yioPbZeYEcfXbT0Sq9sIHiz1qNQ>
    <xmx:b1WCZ5lff-OS-i9W6CDejLJdJUxIsPdsHnrvbUIvxXyXXbjAbqY1ViMw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 625092220073; Sat, 11 Jan 2025 06:26:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 12:26:18 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Eric W. Biederman" <ebiederm@xmission.com>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>
Cc: "Richard Henderson" <richard.henderson@linaro.org>,
 "Matt Turner" <mattst88@gmail.com>, "Kees Cook" <kees@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, linux-alpha@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 "Michael Cree" <mcree@orcon.net.nz>, "Sam James" <sam@gentoo.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michael Karcher" <kernel@mkarcher.dialup.fu-berlin.de>,
 "Chris Hofstaedtler" <zeha@debian.org>, util-linux@vger.kernel.org,
 linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Message-Id: <6c1f31be-cd3b-4090-abbd-fd3968858e1b@app.fastmail.com>
In-Reply-To: <87jzb2tdb7.fsf_-_@email.froward.int.ebiederm.org>
References: <20250103140148.370368-1-glaubitz@physik.fu-berlin.de>
 <24f03227-1b55-4e50-b6e9-7ac74fda2602@app.fastmail.com>
 <678ee681-12c3-4e79-a04b-495daf343846@app.fastmail.com>
 <bff3cfad8a87799101891b4f786c5104db9dab13.camel@physik.fu-berlin.de>
 <82d33a2d-dffe-4268-a175-4536b3f9c07f@app.fastmail.com>
 <cc420e1a843da3cf349607369851c338f4049c4e.camel@physik.fu-berlin.de>
 <87jzb2tdb7.fsf_-_@email.froward.int.ebiederm.org>
Subject: Re: [PATCH] alpha/elf: Fix misc/setarch test of util-linux by removing 32bit
 support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Jan 11, 2025, at 01:16, Eric W. Biederman wrote:
> Richard Henderson <richard.henderson@linaro.org> writes[1]:
>
>> There was a Spec benchmark (I forget which) which was memory bound and ran
>> twice as fast with 32-bit pointers.
>>
>> I copied the idea from DEC to the ELF abi, but never did all the other work
>> to allow the toolchain to take advantage.
>>
>> Amusingly, a later Spec changed the benchmark data sets to not fit into a
>> 32-bit address space, specifically because of this.
>>
>> I expect one could delete the ELF bit and personality and no one would
>> notice. Not even the 10 remaining Alpha users.
>
> In [2] it was pointed out that parts of setarch weren't working
> properly on alpha because it has it's own SET_PERSONALITY
> implementation.  In the discussion that followed Richard Henderson
> pointed out that the 32bit pointer support for alpha was never
> completed.
>
> Fix this by removing alpha's 32bit pointer support.
>
> As a bit of paranoia refuse to execute any alpha binaries that hafe
> the EF_ALPHA_32BIT flag set.  Just to fail explicitly in case someone
> somewhere has binaries that trying to use alpha's 32bit pointer
> support.
>
> [1] 
> https://lkml.kernel.org/r/CAFXwXrkgu=4Qn-v1PjnOR4SG0oUb9LSa0g6QXpBq4ttm52pJOQ@mail.gmail.com
> [2] 
> https://lkml.kernel.org/r/20250103140148.370368-1-glaubitz@physik.fu-berlin.de
> Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

