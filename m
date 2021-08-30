Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0333FB9EA
	for <lists+linux-mips@lfdr.de>; Mon, 30 Aug 2021 18:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233341AbhH3QPk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Aug 2021 12:15:40 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:45341 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231181AbhH3QPj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Aug 2021 12:15:39 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 622035C018B;
        Mon, 30 Aug 2021 12:14:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 30 Aug 2021 12:14:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=M
        Ltfvsz5PBLhNxJJBnRudTcBEtVLLW8z4Z1VJJBgPmQ=; b=RfjYL7QJXJuAV77fw
        wNtBdaedne47flkMKJqmLEdNvTstUMgPurWb329vt6LGE9KqnCnTIc9QV5XEYwgI
        fv2kJF1ucl7HEYydu5ey1pCUQMjh197Aioy5b5hNElukuSJ/osm/Agb6Cv5FkUUQ
        IlpuPewJfNk35Tan3hOTs7w1IYBqM20x4cgOt8TJa0/+xVdQVWq+sfJ0w6nevtMV
        bGfnJA1CwqyzVijak9eGwNlpjFiL+5lPSFH6r8M8glB1VfTnoBdJtbAeZDd1GFPe
        1Fnwt1bcY+aPowbXRzwraukTeyfHAkXTHiCwU5S3DolOe8xs9zg7rFL/Jvmby0B2
        fMMFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=MLtfvsz5PBLhNxJJBnRudTcBEtVLLW8z4Z1VJJBgP
        mQ=; b=nZtYo64m2t+eMbihsW5H2bGwKPjs/Dnu5WLhsWB8ByIrsKW7YtYOLnpJz
        MUbHk0MkZbInS0+/yH0ccGsX/DSb6h/k66sjTyISqKMVKJ1Lh0MQEnphuUTSa/VM
        XSwVuNCgSZjvbqiXRbwo1xo2s0TTFMVhbhdpSAMQCFoyefnLYNKyK+ION/d/FyPv
        08a+UyABrH6x8qNtIj6SSVk+i95Ww/RHNFLPfqqtyEpdnsMiEWkjuc0j9LJQfRrk
        xWXosEOoM1Y6qHLcZqdIXCULB6hBgyvsMIgZPjaqbeaMPP6eegRqY2nmtlvqaMgX
        C3ISZeJLxNmNfdjUJ0mrqvt/IyVfg==
X-ME-Sender: <xms:9AMtYRqAZ6QmJH9tPn6q08gdG_FilNKvNQ_Niqv4FMo8QMHEve4COA>
    <xme:9AMtYToDF-nD7QPYx3qw_yGb2sTCo7rAviYuuTL9EFbsXD-zQZkHCPL3olcxptF1A
    TiHYxxJROtw83t793M>
X-ME-Received: <xmr:9AMtYePTiigZgavZmd4DcSNjY3TpisZ4SxBztYECxy8O1cPcDLlv61MzT7kg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduledgleelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeekieeghfffhfeuuddtvdegleeltdejgeevfeekteetheefhffg
    vefhueetkeefieenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:9AMtYc6VoXHu7D5tMp7bYEKVNTc3YqC8cZAjr65yRFH1nrYDeXcQqA>
    <xmx:9AMtYQ6hj4gpyVYeb7-zDGL5nOT1E54VQ4IoFPthDWOg6dDy_0DC3g>
    <xmx:9AMtYUjDqE2mwvKoBd3XnMyff7pP68wW2Jt17iJC8nem1yvxxZfb0g>
    <xmx:9QMtYelJG6tCaCizKp64mPVkBkvJEhmvRkcRlv8f1qyyKOyw0d325g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Aug 2021 12:14:42 -0400 (EDT)
Subject: Re: [PATCH] mips: remove reference to "newer Loongson-3"
To:     Xi Ruoyao <xry111@mengyan1223.wang>, linux-mips@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>
References: <0b7c9431efb12c2d957fcc53ec8f0743725d61b3.camel@mengyan1223.wang>
 <b32c0d64-77b2-d054-afcf-7d006eba3418@flygoat.com>
 <086f60d6ef4395db5da7ee22c4f352d5c901d396.camel@mengyan1223.wang>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <1d49da11-51d5-e148-cb02-9bd0ee57fae6@flygoat.com>
Date:   Tue, 31 Aug 2021 00:14:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <086f60d6ef4395db5da7ee22c4f352d5c901d396.camel@mengyan1223.wang>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2021/8/30 下午8:28, Xi Ruoyao 写道:
> On Mon, 2021-08-30 at 10:32 +0800, Jiaxun Yang wrote:
>> 在 2021/8/29 20:49, Xi Ruoyao 写道:
>>> Newest Loongson-3 processors have moved to use LoongArch
>>> architecture.
>>> Sadly, the LL/SC issue is still existing on both latest Loongson-3
>>> processors using MIPS64 (Loongson-3A4000) and LoongArch
>>> (Loongson-3A5000).
>> LLSC is fixed on Loongson-3A4000 as per CPUCFG report.
> If I don't enable LL/SC fix, GCC libgomp tests fail on both 3A4000 and
> 3A5000 (using github.com/loongson/gcc for the latter) with "invalid
> access to 0x00000049" or "0x00000005".  This is a race condition: it
> does not happen at all with OMP_NUM_THREADS=1, happens with about 10%
> possibility with OMP_NUM_THREADS=2, and about 90% possibility with
> OMP_NUM_THREAD=4 (on 3A5000, on 3A4000 the possibility is lower).
Apologize for the false report, yes, you are right. I had checked with 
Loongson guys
and they confirmed that the workaround still needs to be applied to 
latest 3A4000
processors, including 3A4000 for MIPS and 3A5000 for LoongArch.

Though, the reason behind the workaround varies with the evaluation of 
their uArch,
for GS464V based core, barrier is required as the uArch design allows 
regular load
to be reordered after an atomic linked load, and that would break 
assumption of compiler
atomic constraints.

For GS464E, barrier is required to flush the Store Fill Buffer and land 
all the cachelines
to L1 cache, otherwise a linked load to a cacheline located at SFB may 
cause deadlock.

For original GS464, barrier is required to deal with some kind of 
pipeline hazard to
ensure store condition won't be shorted to success.

Patch LGTM. The config symbol looks ambiguous and I'd agree with your 
idea of renaming.

Thanks,

- Jiaxun

>
> My investigation suggests this means a GCC instrinic,
> __atomic_compare_and_exchange_n is not really atomic as it should be.
>
> If this is not a hardware issue in the GS464V/LA464 uarch, then it will
> be very low-possibility coincidence: two unrelated code-generation bugs
> for __atomic_compare_and_exchange_n (LA port has borrowed some code from
> MIPS port, but the instrinics are of course newly coded).  And I've
> inspected libgomp & gcc code about __atomic_compare_and_exchange_n
> carefully, nothing wrong spotted except LoongArch GCC supports "-mfix-
> loongson3-llsc" which adds a "dbar 0" (like "sync" on MIPS) instruction
> after SC (only for instrinics).  Enabling this fixes the libgomp
> failures. Likewisely, "-Wa,-mfix-loongson3-llsc" fixes it on 3A4000.
>
> libgomp code has been verified with thread sanitizer on other
> architectures (unfortunately libtsan is not available on MIPS or
> LoongArch yet), so it's very unlikely to be a coding error leading to
> the race.
>
> And LL/SC fix is still in Huacai's 3A5000 kernel.  In a mail on linux-
> arch Huacai said it's "not so easy to be fixed".
>
> Or these are two different erratas and I misunderstand them as the same
> one?
>

