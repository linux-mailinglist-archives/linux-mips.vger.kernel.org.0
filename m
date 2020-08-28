Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7CCD2556E3
	for <lists+linux-mips@lfdr.de>; Fri, 28 Aug 2020 10:51:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728548AbgH1Ivg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Aug 2020 04:51:36 -0400
Received: from mail.loongson.cn ([114.242.206.163]:52872 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728444AbgH1Ive (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 28 Aug 2020 04:51:34 -0400
Received: from ambrosehua-HP-xw6600-Workstation (unknown [182.149.161.99])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxWuRgxUhfdOMOAA--.19372S2;
        Fri, 28 Aug 2020 16:50:47 +0800 (CST)
Date:   Fri, 28 Aug 2020 16:50:40 +0800
From:   Huang Pei <huangpei@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: add missing MSACSR and upper MSA initialization
Message-ID: <20200828085040.vqmkmfkejtwrhejs@ambrosehua-HP-xw6600-Workstation>
References: <20200825043807.5741-1-huangpei@loongson.cn>
 <20200825043807.5741-2-huangpei@loongson.cn>
 <0d88a29f-035b-2c91-c802-3a405d8f69d8@gmail.com>
 <20200826101037.5aam5rhuiais3yrc@ambrosehua-HP-xw6600-Workstation>
 <893e5ba3-1f2b-d439-1294-d4860a2bf672@gmail.com>
 <20200827114131.b7weawkym7ke37wx@ambrosehua-HP-xw6600-Workstation>
 <20200828074118.GA5732@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200828074118.GA5732@alpha.franken.de>
User-Agent: NeoMutt/20171215
X-CM-TRANSID: AQAAf9AxWuRgxUhfdOMOAA--.19372S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw4rGFykCr48Wr1DCw4UJwb_yoWkAwcEqF
        1DKrWvvrs8Zrn2ganFvrZFqrWvg3yUGan3Way7WrWDZF1xJFWkKF1UC34DZFn7AFn7CrnI
        9r4FyrySqw15tjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb7xYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6r43MxAIw28IcxkI
        7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
        Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY
        6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
        AIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv
        6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j7hL8UUUUU=
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 28, 2020 at 09:41:18AM +0200, Thomas Bogendoerfer wrote:
> On Thu, Aug 27, 2020 at 07:41:31PM +0800, Huang Pei wrote:
> > On Wed, Aug 26, 2020 at 04:17:43PM +0300, Sergei Shtylyov wrote:
> > 
> > >From 218f23077352a7befd2aaad3fa46b93112d4051b Mon Sep 17 00:00:00 2001
> > From: Huang Pei <huangpei@loongson.cn>
> > Date: Fri, 21 Aug 2020 10:48:40 +0800
> > Subject: [PATCH] MIPS: add missing MSACSR and upper MSA initialization
> > 
> > init_fp_ctx just initialize the fp/msa context, and own_fp_inatomic
> > just restore FCSR and 64bit FP regs from it, but miss MSACSR and upper
> > MSA regs for MSA, so MSACSR and MSA upper regs's value from previous
> > task on current cpu can leak into current task and cause unpredictable
> > behavior when MSA context not initialized.
> > 
> > Signed-off-by: Huang Pei <huangpei@loongson.cn>
> 
> Please submit in a new email and not in respone to another mail, and
> add a Fixes tag.  Otherwise the fix looks correct to me. Thank you.
> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]

Got it, send this patch alone in a new mail

Huang Pei,

