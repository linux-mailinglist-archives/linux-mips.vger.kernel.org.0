Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC30F3FBA10
	for <lists+linux-mips@lfdr.de>; Mon, 30 Aug 2021 18:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbhH3Q0a (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Aug 2021 12:26:30 -0400
Received: from mengyan1223.wang ([89.208.246.23]:36108 "EHLO mengyan1223.wang"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237734AbhH3Q03 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Aug 2021 12:26:29 -0400
Received: from [IPv6:240e:35a:10e9:a200:dc73:854d:832e:2] (unknown [IPv6:240e:35a:10e9:a200:dc73:854d:832e:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
        (Client did not present a certificate)
        (Authenticated sender: xry111@mengyan1223.wang)
        by mengyan1223.wang (Postfix) with ESMTPSA id D7E0C65B15;
        Mon, 30 Aug 2021 12:25:27 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mengyan1223.wang;
        s=mail; t=1630340735;
        bh=V9KPj1l200pe8lvrcwheafYz+NbTIXwaozb+aPY+BSE=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=Fqrh/qF+X3n/+zQXnNn+7tjXVNEFnrUVO1Qflwd0i5G2GH4A2jkbApWcQhTi+VyG5
         qO4I5sItnmPNSC1PKnv1t57DqNF071cp1MWSVeHlfne6Q97uIcgDnHcGLkb6Zl/q50
         XO3Z+GxVdMZrjCvcHoIEaaO3YglzsegxQ6EeXAoo0yyxVMAkyhxNG8WynqxnbokiHh
         5f4qkXuDvSppBg1rK0OXBblglXkUO65JvJ+AuGEHZQH5Xc1iqwnpqXgclzFPfi4fqo
         jVJiigqJbpjm2hBX4XKFSOPl/NCmrrghSVxBAj4pPAkq2u/hag1b8PBfvlKdjOA3sM
         eZtBEnUkSGxEg==
Message-ID: <40948c12746cbef5d5c2262d69a157f9b609845b.camel@mengyan1223.wang>
Subject: Re: [PATCH] mips: remove reference to "newer Loongson-3"
From:   Xi Ruoyao <xry111@mengyan1223.wang>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>
Date:   Tue, 31 Aug 2021 00:25:17 +0800
In-Reply-To: <1d49da11-51d5-e148-cb02-9bd0ee57fae6@flygoat.com>
References: <0b7c9431efb12c2d957fcc53ec8f0743725d61b3.camel@mengyan1223.wang>
         <b32c0d64-77b2-d054-afcf-7d006eba3418@flygoat.com>
         <086f60d6ef4395db5da7ee22c4f352d5c901d396.camel@mengyan1223.wang>
         <1d49da11-51d5-e148-cb02-9bd0ee57fae6@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 2021-08-31 at 00:14 +0800, Jiaxun Yang wrote:
> 
> 
> 在 2021/8/30 下午8:28, Xi Ruoyao 写道:
> > On Mon, 2021-08-30 at 10:32 +0800, Jiaxun Yang wrote:
> > > 在 2021/8/29 20:49, Xi Ruoyao 写道:
> > > > Newest Loongson-3 processors have moved to use LoongArch
> > > > architecture.
> > > > Sadly, the LL/SC issue is still existing on both latest
> > > > Loongson-3
> > > > processors using MIPS64 (Loongson-3A4000) and LoongArch
> > > > (Loongson-3A5000).
> > > LLSC is fixed on Loongson-3A4000 as per CPUCFG report.
> > If I don't enable LL/SC fix, GCC libgomp tests fail on both 3A4000
> > and
> > 3A5000 (using github.com/loongson/gcc for the latter) with "invalid
> > access to 0x00000049" or "0x00000005".  This is a race condition: it
> > does not happen at all with OMP_NUM_THREADS=1, happens with about
> > 10%
> > possibility with OMP_NUM_THREADS=2, and about 90% possibility with
> > OMP_NUM_THREAD=4 (on 3A5000, on 3A4000 the possibility is lower).

> Apologize for the false report, yes, you are right. I had checked with
> Loongson guys
> and they confirmed that the workaround still needs to be applied to 
> latest 3A4000
> processors, including 3A4000 for MIPS and 3A5000 for LoongArch.
> 
> Though, the reason behind the workaround varies with the evaluation of
> their uArch,
> for GS464V based core, barrier is required as the uArch design allows 
> regular load
> to be reordered after an atomic linked load, and that would break 
> assumption of compiler
> atomic constraints.

> For GS464E, barrier is required to flush the Store Fill Buffer and
> land 
> all the cachelines
> to L1 cache, otherwise a linked load to a cacheline located at SFB may
> cause deadlock.
> 
> For original GS464, barrier is required to deal with some kind of 
> pipeline hazard to
> ensure store condition won't be shorted to success.

This explains the different (mis)behavior of LL/SC on those uarchs.  I
remember the original report of LL/SC issue said it can cause a deadlock
on earlier model of 3As, but I didn't observed any deadlock on 3A4000.

(That's I why didn't tried the workaround immediately after spotting
libgomp failure, but debugged the code from 00:00 AM to 04:00 :( )

Thanks for your detailed explanation!

> Patch LGTM. The config symbol looks ambiguous and I'd agree with your 
> idea of renaming.
> 
> Thanks,
> 
> - Jiaxun

> > Or these are two different erratas and I misunderstand them as the
> > same one?

So basically this is true :).  They just happen to share one workaround.

-- 
Xi Ruoyao <xry111@mengyan1223.wang>
School of Aerospace Science and Technology, Xidian University

