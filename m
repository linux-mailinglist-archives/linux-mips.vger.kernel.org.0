Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 227D7257196
	for <lists+linux-mips@lfdr.de>; Mon, 31 Aug 2020 03:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgHaBin (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 30 Aug 2020 21:38:43 -0400
Received: from mail.loongson.cn ([114.242.206.163]:50224 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726573AbgHaBim (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 30 Aug 2020 21:38:42 -0400
Received: from ambrosehua-HP-xw6600-Workstation (unknown [182.149.161.99])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxuuSVVExf430PAA--.20338S2;
        Mon, 31 Aug 2020 09:38:36 +0800 (CST)
Date:   Mon, 31 Aug 2020 09:38:29 +0800
From:   Huang Pei <huangpei@loongson.cn>
To:     WANG Xuerui <kernel@xen0n.name>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH Fixes] MIPS: add missing MSACSR and upper MSA
 initialization
Message-ID: <20200831013829.5jvxr4xxdqwxdcom@ambrosehua-HP-xw6600-Workstation>
References: <20200828085706.29190-1-huangpei@loongson.cn>
 <28ec8eab-065b-3bc5-986a-883211c2b522@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28ec8eab-065b-3bc5-986a-883211c2b522@xen0n.name>
User-Agent: NeoMutt/20171215
X-CM-TRANSID: AQAAf9AxuuSVVExf430PAA--.20338S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF1kJF4UAr1DZFyUAr1rXrb_yoW8Wryrpa
        98CF95Kw4rXF1vy3saya4Fqry3G39Yqr4Iva9xKayrXa15Gr1rGFn7tFnxWa4a9rWUWa10
        ga4YqF1UKa92y37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUySb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
        0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC2
        0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
        0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
        14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20x
        vaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
        6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bOoGdUUUUU=
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 28, 2020 at 11:26:19PM +0800, WANG Xuerui wrote:
> Hi Pei,
> 
> On 8/28/20 4:57 PM, Huang Pei wrote:
> > init_fp_ctx just initialize the fp/msa context, and own_fp_inatomic
> > just restore FCSR and 64bit FP regs from it, but miss MSACSR and upper
> > MSA regs for MSA, so MSACSR and MSA upper regs's value from previous
> > task on current cpu can leak into current task and cause unpredictable
> > behavior when MSA context not initialized.
> > 
> > Signed-off-by: Huang Pei <huangpei@loongson.cn>
> Actually I think what Thomas meant by saying "add a Fixes tag" in the
> previous thread was "to add a Fixes: tag to refer to the broken commit" . So
> perhaps send a v3?
> > ---
> >   arch/mips/kernel/traps.c | 12 ++++++++++++
> >   1 file changed, 12 insertions(+)
> > 
> > diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> > index 38aa07ccdbcc..cf788591f091 100644
> > --- a/arch/mips/kernel/traps.c
> > +++ b/arch/mips/kernel/traps.c
> > @@ -1287,6 +1287,18 @@ static int enable_restore_fp_context(int msa)
> >   		err = own_fpu_inatomic(1);
> >   		if (msa && !err) {
> >   			enable_msa();
> > +			/*
> > +			 * with MSA enabled, userspace can see MSACSR
> > +			 * and MSA regs, but the values in them are from
> > +			 * other task before current task, restore them
> > +			 * from saved fp/msa context
> > +			 */
> > +			write_msa_csr(current->thread.fpu.msacsr);
> > +			/*
> > +			 * own_fpu_inatomic(1) just restore low 64bit,
> > +			 * fix the high 64bit
> > +			 */
> > +			init_msa_upper();
> >   			set_thread_flag(TIF_USEDMSA);
> >   			set_thread_flag(TIF_MSA_CTX_LIVE);
> >   		}
Got it, resend with a tag refering to hte broken commit

