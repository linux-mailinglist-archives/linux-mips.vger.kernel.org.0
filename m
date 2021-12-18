Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F789479860
	for <lists+linux-mips@lfdr.de>; Sat, 18 Dec 2021 04:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbhLRDX1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 17 Dec 2021 22:23:27 -0500
Received: from mail.loongson.cn ([114.242.206.163]:50074 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231789AbhLRDXZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 17 Dec 2021 22:23:25 -0500
Received: from loongson-pc (unknown [111.9.175.10])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxjN0gVL1hY_UBAA--.4493S2;
        Sat, 18 Dec 2021 11:23:14 +0800 (CST)
Date:   Sat, 18 Dec 2021 11:23:12 +0800
From:   Huang Pei <huangpei@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     ambrosehua@gmail.com, Bibo Mao <maobibo@loongson.cn>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 1/4] MIPS: fix local_{add,sub}_return on MIPS64
Message-ID: <20211218032312.4lwoo2moxptw2hcq@loongson-pc>
References: <20211215084500.24444-1-huangpei@loongson.cn>
 <20211215084500.24444-2-huangpei@loongson.cn>
 <20211216124948.GA12930@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216124948.GA12930@alpha.franken.de>
User-Agent: NeoMutt/20180716
X-CM-TRANSID: AQAAf9BxjN0gVL1hY_UBAA--.4493S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy5Gw15Zryrtr1rKr4kWFg_yoW8GFW8pF
        srAa4vkF4UWFW5C348KFn3KF43K395Kr40gFyjgrWvyFy7Xrn5Ww109r45GrykWw48ta48
        Wrs5X3Z5Zryay37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkK14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
        0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
        0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
        AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
        rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
        v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j
        6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbU
        UUUUU==
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Dec 16, 2021 at 01:49:48PM +0100, Thomas Bogendoerfer wrote:
> On Wed, Dec 15, 2021 at 04:44:57PM +0800, Huang Pei wrote:
> > Use "daddu/dsubu" for long int on MIPS64 instead of "addu/subu"
> > 
> > Fixes: 7232311ef14c ("local_t: mips extension")
> > Signed-off-by: Huang Pei <huangpei@loongson.cn>
> > ---
> >  arch/mips/include/asm/llsc.h  | 4 ++++
> >  arch/mips/include/asm/local.h | 8 ++++----
> >  2 files changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/mips/include/asm/llsc.h b/arch/mips/include/asm/llsc.h
> > index ec09fe5d6d6c..8cc28177c37f 100644
> > --- a/arch/mips/include/asm/llsc.h
> > +++ b/arch/mips/include/asm/llsc.h
> > @@ -14,10 +14,14 @@
> >  #if _MIPS_SZLONG == 32
> >  #define __LL		"ll	"
> >  #define __SC		"sc	"
> > +#define __ADDU		"addu	"
> > +#define __SUBU		"subu	"
> >  #define __INS		"ins	"
> >  #define __EXT		"ext	"
> >  #elif _MIPS_SZLONG == 64
> >  #define __LL		"lld	"
> > +#define __ADDU		"daddu	"
> > +#define __SUBU		"dsubu	"
> >  #define __SC		"scd	"
> >  #define __INS		"dins	"
> >  #define __EXT		"dext	"
> 
> maybe I wasn't clear enough, I don't want your orginal fix, but use
> fix patch using __stringify(LONG_ADDU)/__stringify(LONG_SUBU).
> 
> Thomas.
> 
My point is to keep code style in consistency. If you insist, you can
fix it by yourself. It is ok, I don't mind.
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]

