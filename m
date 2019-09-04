Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2724CA7FF2
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2019 12:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbfIDKFO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Sep 2019 06:05:14 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59550 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727348AbfIDKFO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 4 Sep 2019 06:05:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=02H0SxIUNxp2UEHFkwbSDc5jO1XGq5OcUntTnGs7L8E=; b=Dkt/kG8vsEat9piuYXOUnEuBQ
        3NF4HRst+CVGpbbMU79i+G9Q9ev57UBLxxvNpZdptNOW9ucvBSfeWmRo5FX5gCVerXRlzzmfkszM2
        L39DAS44eYIg/FfphFWBJKF/D0E3dKiHWI5iKhr+Ma05vVcey3CWY+FvRw3Gme+Kjy3lGrPvv8sZW
        ql3TDG3uMB6pt79plBQfzN7gQiL44gxpIgPExb0fXQIvO0lgq7GGlSL75rf1InzKHRIo35UQjL86Z
        skmh9C3hDSDM8Wd+Gm/pTx06sUyg281LNaD9AclhSsq7DlEmi2fnCtrJSJIYLn7uorvK5cjBnOKxm
        RD5ouJa6A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i5S9o-00010H-Fx; Wed, 04 Sep 2019 10:04:56 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 529C130116F;
        Wed,  4 Sep 2019 12:04:17 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id C865B29C3712D; Wed,  4 Sep 2019 12:04:53 +0200 (CEST)
Date:   Wed, 4 Sep 2019 12:04:53 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     "huangpei@loongson.cn" <huangpei@loongson.cn>
Cc:     =?utf-8?B?6ZmI5Y2O5omN?= <chenhc@lemote.com>,
        ralf <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
        jhogan <jhogan@kernel.org>,
        "jiaxun.yang" <jiaxun.yang@flygoat.com>,
        linux-mips <linux-mips@vger.kernel.org>
Subject: Re: Something about loongson_llsc_mb
Message-ID: <20190904100453.GU2386@hirez.programming.kicks-ass.net>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-3-git-send-email-linyunsheng@huawei.com>
 <20190831085539.GG2369@hirez.programming.kicks-ass.net>
 <4d89c688-49e4-a2aa-32ee-65e36edcd913@huawei.com>
 <20190831161247.GM2369@hirez.programming.kicks-ass.net>
 <tencent_34DDA31F622119EE5003B7F4@qq.com>
 <2019090410032559707512@loongson.cn>
 <20190904092154.GC2349@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904092154.GC2349@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Sep 04, 2019 at 11:21:54AM +0200, Peter Zijlstra wrote:
> 
> *why* are you replying to some random unrelated thread?
> 
> Also, please use a sane MUA and wrap your lines <80 chars.
> 
> On Wed, Sep 04, 2019 at 10:03:31AM +0800, huangpei@loongson.cn wrote:
> > >Hi, Peter,
> > >
> > >I found that this patch has been merged but I haven't received the e-mail for some unknown reasons.
> > >https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=1c6c1ca318585f1096d4d04bc722297c85e9fb8a
> > >
> > >Firstly, your comments are correct, so the barrier.h part is perfect.
> > >
> > >Secondly, most of the rest is useless, because smp_mb__before_llsc, loongson_llsc_mb and other memory barriers are the same thing on Loongson-3. We don't need to add loongson_llsc_mb if there is already a smp_mb__before_llsc.
> 
> There wasn't. Take for example set_bit(), that didn't have
> smp_mb__before_llsc on.
> 
> Also; MIPS should probably convert to asm-generic/bitops/atomic.h.
> 
> > >Thirdly, maybe the only exception is syscall.c, but mips_atomic_set is not used on Loongson-3. And if in some cases we use it, I think the user-to-kernel context switch has the same effect of a memory barrier.
> 
> And how is some random person trying to make sense of MIPS to know that?
> 
> You all created a badly documented inconsitent trainwreck. You're
> 'lucky' the MIPS maintainers accepted that mess in the first place.
> 
> Anyway, yes there are too many barrers now in some cases, in a previous
> version I had:
> 
>   https://lkml.kernel.org/r/20190424124421.693353463@infradead.org
> 
> But because I dropped changes to local.h that might not be true anymore;
> it needs careful consideration. Please audit carefully and if you find
> all smp_mb__before_llsc() usage is now superfluous for this 'funny' chip
> of yours, then re-submit the above patch.

I think we're good, smp_mb__{before,after}_atomic() already doesn't work
with local_t.
