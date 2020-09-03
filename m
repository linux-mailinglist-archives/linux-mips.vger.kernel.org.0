Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E112A25BD35
	for <lists+linux-mips@lfdr.de>; Thu,  3 Sep 2020 10:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbgICI1O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Sep 2020 04:27:14 -0400
Received: from elvis.franken.de ([193.175.24.41]:50526 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728229AbgICI1O (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 3 Sep 2020 04:27:14 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kDkaL-0000I1-01; Thu, 03 Sep 2020 10:27:09 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B41C3C0E86; Thu,  3 Sep 2020 10:16:32 +0200 (CEST)
Date:   Thu, 3 Sep 2020 10:16:32 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huang Pei <huangpei@loongson.cn>
Cc:     ambrosehua@gmail.com, Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org
Subject: Re: [PATCH v4] MIPS: add missing MSACSR and upper MSA initialization
Message-ID: <20200903081632.GB6220@alpha.franken.de>
References: <20200901065309.5952-1-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901065309.5952-1-huangpei@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Sep 01, 2020 at 02:53:09PM +0800, Huang Pei wrote:
> In cc97ab235f ("MIPS: Simplify FP context initialization), init_fp_ctx
> just initialize the fp/msa context, and own_fp_inatomic just restore 
> FCSR and 64bit FP regs from it, but miss MSACSR and upper MSA regs for
> MSA, so MSACSR and MSA upper regs's value from previous task on current
> cpu can leak into current task and cause unpredictable behavior when MSA
> context not initialized.
> 
> Fixes: cc97ab235f ("MIPS: Simplify FP context initialization")
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  arch/mips/kernel/traps.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
