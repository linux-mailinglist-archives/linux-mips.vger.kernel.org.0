Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFB08A7F38
	for <lists+linux-mips@lfdr.de>; Wed,  4 Sep 2019 11:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729493AbfIDJWM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Sep 2019 05:22:12 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:35484 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727351AbfIDJWM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 4 Sep 2019 05:22:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=srv7PXqbi6juyW+1f2ZlkHbP0cRMwyoZ/SBVTOWg5/Q=; b=jYFNGmO50yf14HGjXMyZCRNLv
        D+qirA9LeOciu4777OXErDnKo1ijyxqr1YhZ5ZqV29FfotmjhMsGWNyqZNbsTnsRJnir1M4HZeuOY
        FT/kNdWcR+Wonv3hnwA6L6XA+akYJSS9PH5uPcQV9xFIY7C+IKU+GLmB7JJ6PH9+vCwuOoo7APS2x
        VfwZuw7VxlxfIOTgt6BWP8reR9WUkeE9wnmfKpE18aOB3sPIQAp6NPlCxLvYAV+xuajKjSFb6nU/w
        O/y+w2eSt/BMOEvCi0we9dRfW1uemD7uHnbS8TiY1BCds/m4x3mzEBkDmxTxSLr/jawrkg3dHdYtO
        JHTTcncmQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i5RUD-00029v-7N; Wed, 04 Sep 2019 09:21:57 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 08366306024;
        Wed,  4 Sep 2019 11:21:18 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 7F90C29D882FC; Wed,  4 Sep 2019 11:21:54 +0200 (CEST)
Date:   Wed, 4 Sep 2019 11:21:54 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     "huangpei@loongson.cn" <huangpei@loongson.cn>
Cc:     =?utf-8?B?6ZmI5Y2O5omN?= <chenhc@lemote.com>,
        ralf <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
        jhogan <jhogan@kernel.org>,
        "jiaxun.yang" <jiaxun.yang@flygoat.com>,
        linux-mips <linux-mips@vger.kernel.org>
Subject: Re: Something about loongson_llsc_mb
Message-ID: <20190904092154.GC2349@hirez.programming.kicks-ass.net>
References: <1567231103-13237-1-git-send-email-linyunsheng@huawei.com>
 <1567231103-13237-3-git-send-email-linyunsheng@huawei.com>
 <20190831085539.GG2369@hirez.programming.kicks-ass.net>
 <4d89c688-49e4-a2aa-32ee-65e36edcd913@huawei.com>
 <20190831161247.GM2369@hirez.programming.kicks-ass.net>
 <tencent_34DDA31F622119EE5003B7F4@qq.com>
 <2019090410032559707512@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2019090410032559707512@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


*why* are you replying to some random unrelated thread?

Also, please use a sane MUA and wrap your lines <80 chars.

On Wed, Sep 04, 2019 at 10:03:31AM +0800, huangpei@loongson.cn wrote:
> >Hi, Peter,
> >
> >I found that this patch has been merged but I haven't received the e-mail for some unknown reasons.
> >https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git/commit/?id=1c6c1ca318585f1096d4d04bc722297c85e9fb8a
> >
> >Firstly, your comments are correct, so the barrier.h part is perfect.
> >
> >Secondly, most of the rest is useless, because smp_mb__before_llsc, loongson_llsc_mb and other memory barriers are the same thing on Loongson-3. We don't need to add loongson_llsc_mb if there is already a smp_mb__before_llsc.

There wasn't. Take for example set_bit(), that didn't have
smp_mb__before_llsc on.

Also; MIPS should probably convert to asm-generic/bitops/atomic.h.

> >Thirdly, maybe the only exception is syscall.c, but mips_atomic_set is not used on Loongson-3. And if in some cases we use it, I think the user-to-kernel context switch has the same effect of a memory barrier.

And how is some random person trying to make sense of MIPS to know that?

You all created a badly documented inconsitent trainwreck. You're
'lucky' the MIPS maintainers accepted that mess in the first place.

Anyway, yes there are too many barrers now in some cases, in a previous
version I had:

  https://lkml.kernel.org/r/20190424124421.693353463@infradead.org

But because I dropped changes to local.h that might not be true anymore;
it needs careful consideration. Please audit carefully and if you find
all smp_mb__before_llsc() usage is now superfluous for this 'funny' chip
of yours, then re-submit the above patch.

> +. per-cpu like local_t *should only* be written by local cpu, and may be read by remote cpu sometimes
> 
> +. if and only if local cpu can write per-cpu, then Loongson3's llsc bug would not be triggerd.
> 
> same as this_cpu_cmpxchg_double
> 
> If so, then no need to add sync before and after cmpxchg_local

Correct, we already dropped the change for other local.h stuff.

