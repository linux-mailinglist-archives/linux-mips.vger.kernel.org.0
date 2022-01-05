Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3EC485145
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jan 2022 11:42:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239464AbiAEKmg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Jan 2022 05:42:36 -0500
Received: from elvis.franken.de ([193.175.24.41]:58466 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235048AbiAEKmb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 5 Jan 2022 05:42:31 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1n53kT-0007Hx-00; Wed, 05 Jan 2022 11:42:29 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 318AAC0DBB; Wed,  5 Jan 2022 11:34:48 +0100 (CET)
Date:   Wed, 5 Jan 2022 11:34:48 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huang Pei <huangpei@loongson.cn>
Cc:     ambrosehua@gmail.com, Bibo Mao <maobibo@loongson.cn>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 1/4] MIPS: fix local_{add,sub}_return on MIPS64
Message-ID: <20220105103448.GA7009@alpha.franken.de>
References: <20211215084500.24444-1-huangpei@loongson.cn>
 <20211215084500.24444-2-huangpei@loongson.cn>
 <20211216124948.GA12930@alpha.franken.de>
 <20211218032312.4lwoo2moxptw2hcq@loongson-pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211218032312.4lwoo2moxptw2hcq@loongson-pc>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Dec 18, 2021 at 11:23:12AM +0800, Huang Pei wrote:
> On Thu, Dec 16, 2021 at 01:49:48PM +0100, Thomas Bogendoerfer wrote:
> > On Wed, Dec 15, 2021 at 04:44:57PM +0800, Huang Pei wrote:
> > > Use "daddu/dsubu" for long int on MIPS64 instead of "addu/subu"
> > > 
> > > Fixes: 7232311ef14c ("local_t: mips extension")
> > > Signed-off-by: Huang Pei <huangpei@loongson.cn>
> > > ---
> > >  arch/mips/include/asm/llsc.h  | 4 ++++
> > >  arch/mips/include/asm/local.h | 8 ++++----
> > >  2 files changed, 8 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/arch/mips/include/asm/llsc.h b/arch/mips/include/asm/llsc.h
> > > index ec09fe5d6d6c..8cc28177c37f 100644
> > > --- a/arch/mips/include/asm/llsc.h
> > > +++ b/arch/mips/include/asm/llsc.h
> > > @@ -14,10 +14,14 @@
> > >  #if _MIPS_SZLONG == 32
> > >  #define __LL		"ll	"
> > >  #define __SC		"sc	"
> > > +#define __ADDU		"addu	"
> > > +#define __SUBU		"subu	"
> > >  #define __INS		"ins	"
> > >  #define __EXT		"ext	"
> > >  #elif _MIPS_SZLONG == 64
> > >  #define __LL		"lld	"
> > > +#define __ADDU		"daddu	"
> > > +#define __SUBU		"dsubu	"
> > >  #define __SC		"scd	"
> > >  #define __INS		"dins	"
> > >  #define __EXT		"dext	"
> > 
> > maybe I wasn't clear enough, I don't want your orginal fix, but use
> > fix patch using __stringify(LONG_ADDU)/__stringify(LONG_SUBU).
> > 
> > Thomas.
> > 
> My point is to keep code style in consistency. If you insist, you can
> fix it by yourself. It is ok, I don't mind.

sorry for causing such frustration on your side.

I've applied

diff --git a/arch/mips/include/asm/local.h b/arch/mips/include/asm/local.h
index ecda7295ddcd..3fa634090388 100644
--- a/arch/mips/include/asm/local.h
+++ b/arch/mips/include/asm/local.h
@@ -5,6 +5,7 @@
 #include <linux/percpu.h>
 #include <linux/bitops.h>
 #include <linux/atomic.h>
+#include <asm/asm.h>
 #include <asm/cmpxchg.h>
 #include <asm/compiler.h>
 #include <asm/war.h>
@@ -39,7 +40,7 @@ static __inline__ long local_add_return(long i, local_t * l)
                "       .set    arch=r4000                              \n"
                        __SYNC(full, loongson3_war) "                   \n"
                "1:"    __LL    "%1, %2         # local_add_return      \n"
-               "       addu    %0, %1, %3                              \n"
+                       __stringify(LONG_ADDU)  "       %0, %1, %3      \n"
                        __SC    "%0, %2                                 \n"
                "       beqzl   %0, 1b                                  \n"
                "       addu    %0, %1, %3                              \n"
@@ -55,7 +56,7 @@ static __inline__ long local_add_return(long i, local_t * l)
                "       .set    "MIPS_ISA_ARCH_LEVEL"                   \n"
                        __SYNC(full, loongson3_war) "                   \n"
                "1:"    __LL    "%1, %2         # local_add_return      \n"
-               "       addu    %0, %1, %3                              \n"
+                       __stringify(LONG_ADDU)  "       %0, %1, %3      \n"
                        __SC    "%0, %2                                 \n"
                "       beqz    %0, 1b                                  \n"
                "       addu    %0, %1, %3                              \n"
@@ -88,7 +89,7 @@ static __inline__ long local_sub_return(long i, local_t * l)
                "       .set    arch=r4000                              \n"
                        __SYNC(full, loongson3_war) "                   \n"
                "1:"    __LL    "%1, %2         # local_sub_return      \n"
-               "       subu    %0, %1, %3                              \n"
+                       __stringify(LONG_SUBU)  "       %0, %1, %3      \n"
                        __SC    "%0, %2                                 \n"
                "       beqzl   %0, 1b                                  \n"
                "       subu    %0, %1, %3                              \n"
@@ -104,7 +105,7 @@ static __inline__ long local_sub_return(long i, local_t * l)
                "       .set    "MIPS_ISA_ARCH_LEVEL"                   \n"
                        __SYNC(full, loongson3_war) "                   \n"
                "1:"    __LL    "%1, %2         # local_sub_return      \n"
-               "       subu    %0, %1, %3                              \n"
+                       __stringify(LONG_SUBU)  "       %0, %1, %3      \n"
                        __SC    "%0, %2                                 \n"
                "       beqz    %0, 1b                                  \n"
                "       subu    %0, %1, %3                              \n"

and the reason is I prefer to keep the changes as small and local 
as possible. This makes the reviews and applying to older trees easier.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
