Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3C82588D7
	for <lists+linux-mips@lfdr.de>; Tue,  1 Sep 2020 09:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgIAHOD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Sep 2020 03:14:03 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41600 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726006AbgIAHOD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Sep 2020 03:14:03 -0400
Received: from ambrosehua-HP-xw6600-Workstation (unknown [182.149.161.99])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj9209E1fr9cPAA--.602S2;
        Tue, 01 Sep 2020 15:13:58 +0800 (CST)
Date:   Tue, 1 Sep 2020 15:13:56 +0800
From:   Huang Pei <huangpei@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     ambrosehua@gmail.com, Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: fix missing MSACSR and upper MSA initialization
 for cc97ab23
Message-ID: <20200901071242.35opmdv67mroryek@ambrosehua-HP-xw6600-Workstation>
References: <20200831020145.31706-1-huangpei@loongson.cn>
 <20200831020145.31706-2-huangpei@loongson.cn>
 <20200831210733.GA14500@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200831210733.GA14500@alpha.franken.de>
User-Agent: NeoMutt/20171215
X-CM-TRANSID: AQAAf9Dxj9209E1fr9cPAA--.602S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFykKr1UXr18Wry5Gw48WFg_yoW8Gr4rpa
        y7G3WYkay8tFyxC3sIk34rt3yY9aykJrWxZFZ3C3yfJry3XrnxWrWxGrs8WFy3ur4FyF10
        yFyDZF15CFyDJ37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8CwCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
        1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUGhFxUUUUU=
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Aug 31, 2020 at 11:07:33PM +0200, Thomas Bogendoerfer wrote:
> On Mon, Aug 31, 2020 at 10:01:45AM +0800, Huang Pei wrote:
> > In cc97ab235f3fe32401ca198cebe6f42642e95770, init_fp_ctx just initialize the
> 
> checkpatch will warn you about this:
> 
> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> #7: 
> In cc97ab235f3fe32401ca198cebe6f42642e95770, init_fp_ctx just initialize the
> 
> Use cc97ab235f3f ("MIPS: Simplify FP context initialization") instead of
> the pure hash.
> 
> 
> > fp/msa context, and own_fp_inatomic just restore FCSR and 64bit FP regs from
> > it, but miss MSACSR and upper MSA regs for MSA, so MSACSR and MSA upper regs's
> > value from previous task on current cpu can leak into current task and cause
> > unpredictable behavior when MSA context not initialized.
> 
> And add
> 
> Fixes: cc97ab235f3f ("MIPS: Simplify FP context initialization")
> 
> before your Signed-off-by, which is what I meant with "add fixes tag".
> 
> > 
> > Signed-off-by: Huang Pei <huangpei@loongson.cn>
> > ---
> >  arch/mips/kernel/traps.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]

Thank you for your time, I will reread submitting-patches.rst and
recheck all my patches

