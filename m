Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28D8A3FB603
	for <lists+linux-mips@lfdr.de>; Mon, 30 Aug 2021 14:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbhH3M3V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Aug 2021 08:29:21 -0400
Received: from mengyan1223.wang ([89.208.246.23]:55328 "EHLO mengyan1223.wang"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230423AbhH3M3O (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Aug 2021 08:29:14 -0400
Received: from [192.168.124.4] (unknown [113.200.174.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
        (Client did not present a certificate)
        (Authenticated sender: xry111@mengyan1223.wang)
        by mengyan1223.wang (Postfix) with ESMTPSA id 2BE5165EBF;
        Mon, 30 Aug 2021 08:28:16 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mengyan1223.wang;
        s=mail; t=1630326498;
        bh=bnBEhZWycKRIadjfHHn9AQMN2ncBTN3XEHPv5Fd4Pu8=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=UhFpHKwdJzVxS1RL1fdG/9N32gGRVyPexa/kHeP6jZw4iLbukv3ReKiTfgbEl0G8T
         FSEVKaoFOqN9x818wpnSzpUCwnI57Rrz9MbhE+WZWe/BZTwiL4SwNr6SNZ4kDM4j4r
         iCQNfKj+08qZLkssJREC2DbjcNe6hy8QYdwTSA6Lyy6dMJU+gsJm5Nyw96fsVrrHvq
         Fr5Byv78j9gd+GRcSgOKneAiJ6J1bh7zEZO7o6fmlQAFe9L7d86nOK8VMMuCmEIDAn
         kM/5ApiA6GvnHzJwP/Ubhc9Esk/ZQp+NXEp+Gm8FxYORfmWWmHFbk79pg2jmiFTNMq
         nnB1Olxm5ITDg==
Message-ID: <086f60d6ef4395db5da7ee22c4f352d5c901d396.camel@mengyan1223.wang>
Subject: Re: [PATCH] mips: remove reference to "newer Loongson-3"
From:   Xi Ruoyao <xry111@mengyan1223.wang>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>
Date:   Mon, 30 Aug 2021 20:28:09 +0800
In-Reply-To: <b32c0d64-77b2-d054-afcf-7d006eba3418@flygoat.com>
References: <0b7c9431efb12c2d957fcc53ec8f0743725d61b3.camel@mengyan1223.wang>
         <b32c0d64-77b2-d054-afcf-7d006eba3418@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 2021-08-30 at 10:32 +0800, Jiaxun Yang wrote:
> 
> 在 2021/8/29 20:49, Xi Ruoyao 写道:
> > Newest Loongson-3 processors have moved to use LoongArch
> > architecture.
> > Sadly, the LL/SC issue is still existing on both latest Loongson-3
> > processors using MIPS64 (Loongson-3A4000) and LoongArch
> > (Loongson-3A5000).
> LLSC is fixed on Loongson-3A4000 as per CPUCFG report.

If I don't enable LL/SC fix, GCC libgomp tests fail on both 3A4000 and
3A5000 (using github.com/loongson/gcc for the latter) with "invalid
access to 0x00000049" or "0x00000005".  This is a race condition: it
does not happen at all with OMP_NUM_THREADS=1, happens with about 10%
possibility with OMP_NUM_THREADS=2, and about 90% possibility with
OMP_NUM_THREAD=4 (on 3A5000, on 3A4000 the possibility is lower).

My investigation suggests this means a GCC instrinic,
__atomic_compare_and_exchange_n is not really atomic as it should be.

If this is not a hardware issue in the GS464V/LA464 uarch, then it will
be very low-possibility coincidence: two unrelated code-generation bugs
for __atomic_compare_and_exchange_n (LA port has borrowed some code from
MIPS port, but the instrinics are of course newly coded).  And I've
inspected libgomp & gcc code about __atomic_compare_and_exchange_n
carefully, nothing wrong spotted except LoongArch GCC supports "-mfix-
loongson3-llsc" which adds a "dbar 0" (like "sync" on MIPS) instruction
after SC (only for instrinics).  Enabling this fixes the libgomp
failures. Likewisely, "-Wa,-mfix-loongson3-llsc" fixes it on 3A4000.

libgomp code has been verified with thread sanitizer on other
architectures (unfortunately libtsan is not available on MIPS or
LoongArch yet), so it's very unlikely to be a coding error leading to
the race.

And LL/SC fix is still in Huacai's 3A5000 kernel.  In a mail on linux-
arch Huacai said it's "not so easy to be fixed".

Or these are two different erratas and I misunderstand them as the same
one?

