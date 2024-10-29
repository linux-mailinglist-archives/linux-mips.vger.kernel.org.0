Return-Path: <linux-mips+bounces-6550-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 052E79B548A
	for <lists+linux-mips@lfdr.de>; Tue, 29 Oct 2024 21:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B940B283667
	for <lists+linux-mips@lfdr.de>; Tue, 29 Oct 2024 20:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A83192B63;
	Tue, 29 Oct 2024 20:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="NjI+HYsu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MwNgcknW"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439EE3207
	for <linux-mips@vger.kernel.org>; Tue, 29 Oct 2024 20:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730235437; cv=none; b=uc2+PV7Ur1c32Cpeo/ARiCSLrcN7ufaWJ80QNbdZGCQFq/FHwW9mzp1yENoehYiOuHrv4PbRqmiQ6ey/bdIBGK4lgekfwVYg7SW13IGrwflHgsDDxP9zNOT3hXRpnwonQK9AtTI/bcaFlSh510k/U8v6O5kBlkIyPtLcoufdbI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730235437; c=relaxed/simple;
	bh=0G1RYk88qkkpNG9j1EeF2aKVTZPRTakvmfIkSr2iiFE=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=eFAPaIYwlUta9Qqy/+JAv5cBPKF62m+dHCBy/s1pH3eBkOSBwbpZ2e3ASpSE0Tb5DlbqvPgZ2athQuAmpCBWQylMAJZ4tEVLwkXvpt73peSFSB9MPCNlZUFXQ73q3kVfr1LB5GTvDDRwpV6Ga/q7vXd+BnMJ5jp+8VrobaEVcJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=NjI+HYsu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MwNgcknW; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 5F65E1140188;
	Tue, 29 Oct 2024 16:57:12 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Tue, 29 Oct 2024 16:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1730235432;
	 x=1730321832; bh=3YTnWthxrB+LNxihz3S2HX1mYUcPT1PnsRJXwp0WAjI=; b=
	NjI+HYsuqGpPZ8FpoONT/myks7AYv18hejpf9OOPGFQiGT9QgpNse+JY493xnjeX
	9VQrmLKbMX1SUqZcqZozUqJEcd/7Aem0MZXWDh2QGspSu0BZasmOl3Vpf9hD7+tO
	8Lql3uidF5A2PeBzF4D/lYr5Ep3068JmbixMBRVZExVspkBCfEew3Jvoxs6E8ITU
	37FMH5KhEVJetox8Ur+DgcotDPDWFtOzhmXPpjSxQM6BKbm26jivWD6b84fsv/Rq
	NZ8xoEfLdsi9Jb2e0pWx8h7tcO6UuB6sQBjfS6HVy8ONWrixfcp3bVHkZakbyZuC
	rTM2kenHDP+H5M0KR2Rfsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1730235432; x=1730321832; bh=3
	YTnWthxrB+LNxihz3S2HX1mYUcPT1PnsRJXwp0WAjI=; b=MwNgcknW4um72SdtT
	ZNSHlYy98vWslAbmBf+5/0P7dkiSxtSIjKTxlyShGcxQq7OybTiQYSLN1ao3D+iU
	GX6mCT5gErkBxrj99T3gk32DIQb+Q1xiT38+3R3IAzGK7CKtOrn732x2p4V41doh
	DeibdTWqvaSr4cAyPbYiRiNSM2llPIofItwy0OlvnvvowzLAMftdDHmzO+gQsd80
	6mWXjltQ9UZbtilBXf5n4NHTmb4y5m3PeXKsFN1AjN3wGMaX8Z6BOH8lTJ5AuQH8
	vFjYQyG9CCJAvbWmOyKUR/ikqKRrN4eQaD7/GjyhQS70ktPfET2k2BTzunhWBt/K
	l00ww==
X-ME-Sender: <xms:KEwhZw5MJlsVezRXKOkjsd2cqr9FcY9AbOlt0yg7R6EFcuwRd1732w>
    <xme:KEwhZx4SgcBFpVkjl04OwvKCHUtiOeGwDP8ghVmwO9p2IQNQO7BA91PmJT5A_AXEf
    auRTgoYknrtpr-3mFE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekuddgudefkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepgfdvieduffeuudektdejhffh
    heefkeehuddtudegffdttedtffffueeuieekvdegnecuffhomhgrihhnpegrrhgthhhivh
    gvrdhorhhgpdhsghhirdgtohhmpdhnvghtsghsugdrohhrghdpghhnuhdrohhrghenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunh
    drhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphhtthhopedvpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopeguohifnhhinhhthhgvsghunhhnhihhohhlvgesgh
    hmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:KEwhZ_cCRJwumpIlUb8jQJEC4rCYfKf0Wq_ufGOX_UlIvVC7T7Qigg>
    <xmx:KEwhZ1KZNtbxkQciFhYnXdarw3MNBwrfOI87wvGJ1iXMzyFEsWZoaA>
    <xmx:KEwhZ0K42vKwxekNDYb-6ahmkwFweV_w1wuZt-G96uj8aQIINfWlbQ>
    <xmx:KEwhZ2xcaoLH3SRn7IUGUMcdGaWagGOvZYniNcspi-KxFmkjDD3eOw>
    <xmx:KEwhZ-i8dLjJu0J8pEl3V8KqsYnnDxi4QZWvbkJmKC7PkU01Jx-9HDCG>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E408B1C20067; Tue, 29 Oct 2024 16:57:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 29 Oct 2024 20:56:51 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "DiTBho Down in The Bunny hole" <downinthebunnyhole@gmail.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Message-Id: <3105ecf0-f00c-4d36-8813-ec7aeb1dfd08@app.fastmail.com>
In-Reply-To: 
 <CAAZ8i80GGmwy5u1dPoG+f43PxGgD_pFhOrQkEr=5bhmLfn6sSQ@mail.gmail.com>
References: 
 <CAAZ8i80GGmwy5u1dPoG+f43PxGgD_pFhOrQkEr=5bhmLfn6sSQ@mail.gmail.com>
Subject: Re: SGI MIPS, Speculative Execution issue
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B410=E6=9C=8829=E6=97=A5=E5=8D=81=E6=9C=88 =E4=B8=8B=
=E5=8D=883:20=EF=BC=8CDiTBho Down in The Bunny hole=E5=86=99=E9=81=93=EF=
=BC=9A
> hi
> "Speculative Execution"  is a feature of the R10000 Processor.
>
> I read that is problematic on machines that are Non-Cache
> Coherent,such as the IP28 Indigo2 and on R10000/R12000-based IP32 O2
> systems.
>

Hi,

> The first thing I don't understand is what does it mean that they are
> "Non-Cache Coherent" systems.

"Non-Cache Coherent" systems means that coherency is not maintained
between CPU Caches and external Bus DMA.

Which usually means cache writeback/invalidate needs to be performed
by software before/after DMA requests.

>
> I mean, I know what coherence of the cache means in a multiprocessor
> environment, but I'm a bit confused by what I read for these mono
> processor systems.
>
> As far as I understand, in the R4k and R10k architecture "coherency
> logic" should be on-chip of all the participating agents, both CPU(s)
> and DMA masters, but I didn't understand if being a "cache coherent
> system" depends only on a hw circuit implemented in the CPU (on-chip
> -> inside the CPU) or if there is a need for circuits external to the
> CPU (on-chip -> inside the bus controller, or something).

I think it is yes. External circuit is required for a fully coherent
R10k system.

See R10k user manual section 2.1 Uniprocessor Systems, to quote:

"If hardware I/O coherency is desired, the external agent may use the
multiprocessor primitives provided by the processor to maintain cache
coherency for interventions and invalidations. External duplicate tags
can be used by the external agent to filter external coherency requests."

In my interpretation, it means bus controller needs to send cache
intervention request to CPU based on requests from other bus masters to
actively maintain coherency.

Please check "Table 6-12 Encoding of SysCmd[7:5] for External Request"
as well for some implementation details.

If you want some background reading, "A Primer on Memory Consistency
and Cache Coherence" would be a good start point.

>
> a) SGI IP28/r10K -> not cache coherent, but uses R10k
> b) SGI IP32/r10K -> not cache coherent, but uses R10k
> c) SGI IP30/r10K -> cache coherent and uses R10k
>
> A few more details on the nature of Speculative Execution, and the
> issues it poses to the Indigo2 can be found at the following URLs:
>
> 1) MIPS R10000 Microprocessor User's Manual (pages 51-55 )
> https://web.archive.org/web/20051028113506/http://techpubs.sgi.com/lib=
rary/manuals/2000/007-2490-001/pdf/007-2490-001.pdf
>
> 2) Post to NetBSD sgimips Mailing List on 29 Jun 2000
> http://mail-index.netbsd.org/port-sgimips/2000/06/29/0006.html
>
> however there are no sw/hw examples.
>
> As far as I know, Linux never worked on O2/R10K, while, and it worked
> years ago (20?) on IP28 only with patched gcc to force "cache barrier"
> workarounds.
>
> I cannot find those patches, and I haven't yet understood the issue.
>

This is already being merged into upstream GCC. See
`-mr10k-cache-barrier=3Dsetting` option.

GCC documentation [1] has some explanation to the nature of the problem.

> -
>
> I see that Linux, NetBSD and OpenBSD all work fine on IP30, even with
> a couple of { R10K, R12K, R14K } CPUs!
>
> The R10K is documented as a four-way superscalar design that
> implements register renaming and executes instructions out-of-order.
>
> I wonder if the problem is related to this "out-of-order" nature of
> the CPU paired with the Branch Prediction and Speculative Execution
> nature of a purist RISC design.

Yes, it's related. GCC documentation explained that very well.

>
> Thinking about that, although one or more instructions may begin
> execution during each cycle, and each instruction takes several or
> many cycles to complete, when a branch instruction is decoded, its
> branch condition may not yet be known. However, the R10000 processor
> can predict whether the branch is taken, and then continue decoding
> and executing subsequent instructions along the predicted path.
>
> When a branch prediction is wrong, the processor must back up to the
> original branch and take the other path. This technique is called
> "speculative execution", and whenever the processor discovers a
> mispredicted branch, it aborts all speculatively-executed instructions
> and restores the processor's state to the state it held before the
> branch.
>
> However - the manual says - the cache state is not restored, and this
> is clearly a side effect of speculative execution.
>
> Worse still, if the speculative approach involved a Conditional Store
> (SC): will it be restored? No, because - the manual says - if the
> cache is involved, then it won't be restored, so this is a real mess
> that needs at least a sw barrier.

I don't really know R10k implementation details, but IMHO since SC can
only change a cacheline between two exclusive states, it doesn't matter
that much....

>
> (I can't find software examples, I would like to read them)
>
> I wonder ... is there any hw-mechanism with the IP30 (missing in IP28
> and IP32) that saves you when you are playing with cached-memory and
> or LL/SC instructions in a conditional block (e.g. semaphore, mutex,
> etc)?
>
> Can someone explain this matter to me?

Thanks
[1]: https://gcc.gnu.org/onlinedocs/gcc/MIPS-Options.html

>
> Thanks
>
> D.

--=20
- Jiaxun

