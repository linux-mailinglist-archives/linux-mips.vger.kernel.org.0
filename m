Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ACB4258355
	for <lists+linux-mips@lfdr.de>; Mon, 31 Aug 2020 23:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730219AbgHaVPh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Aug 2020 17:15:37 -0400
Received: from elvis.franken.de ([193.175.24.41]:43652 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728514AbgHaVPh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 31 Aug 2020 17:15:37 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kCr9I-0002Ki-00; Mon, 31 Aug 2020 23:15:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 26C09C0E41; Mon, 31 Aug 2020 23:07:33 +0200 (CEST)
Date:   Mon, 31 Aug 2020 23:07:33 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huang Pei <huangpei@loongson.cn>
Cc:     ambrosehua@gmail.com, Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: fix missing MSACSR and upper MSA initialization
 for cc97ab23
Message-ID: <20200831210733.GA14500@alpha.franken.de>
References: <20200831020145.31706-1-huangpei@loongson.cn>
 <20200831020145.31706-2-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200831020145.31706-2-huangpei@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Aug 31, 2020 at 10:01:45AM +0800, Huang Pei wrote:
> In cc97ab235f3fe32401ca198cebe6f42642e95770, init_fp_ctx just initialize the

checkpatch will warn you about this:

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
#7: 
In cc97ab235f3fe32401ca198cebe6f42642e95770, init_fp_ctx just initialize the

Use cc97ab235f3f ("MIPS: Simplify FP context initialization") instead of
the pure hash.


> fp/msa context, and own_fp_inatomic just restore FCSR and 64bit FP regs from
> it, but miss MSACSR and upper MSA regs for MSA, so MSACSR and MSA upper regs's
> value from previous task on current cpu can leak into current task and cause
> unpredictable behavior when MSA context not initialized.

And add

Fixes: cc97ab235f3f ("MIPS: Simplify FP context initialization")

before your Signed-off-by, which is what I meant with "add fixes tag".

> 
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  arch/mips/kernel/traps.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
