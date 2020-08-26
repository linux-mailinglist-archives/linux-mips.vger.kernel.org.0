Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 995E1252B25
	for <lists+linux-mips@lfdr.de>; Wed, 26 Aug 2020 12:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728132AbgHZKKy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Aug 2020 06:10:54 -0400
Received: from mail.loongson.cn ([114.242.206.163]:38868 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728129AbgHZKKy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 26 Aug 2020 06:10:54 -0400
Received: from ambrosehua-HP-xw6600-Workstation (unknown [222.209.10.89])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxqMUdNUZfkDQOAA--.20078S2;
        Wed, 26 Aug 2020 18:10:43 +0800 (CST)
Date:   Wed, 26 Aug 2020 18:10:37 +0800
From:   Huang Pei <huangpei@loongson.cn>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: add missing MSACSR and upper MSA initialization
Message-ID: <20200826101037.5aam5rhuiais3yrc@ambrosehua-HP-xw6600-Workstation>
References: <20200825043807.5741-1-huangpei@loongson.cn>
 <20200825043807.5741-2-huangpei@loongson.cn>
 <0d88a29f-035b-2c91-c802-3a405d8f69d8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d88a29f-035b-2c91-c802-3a405d8f69d8@gmail.com>
User-Agent: NeoMutt/20171215
X-CM-TRANSID: AQAAf9DxqMUdNUZfkDQOAA--.20078S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFyfWF1xAw18XFW7ZFWxXrb_yoW5Ww4kpa
        1DG3WDKw48XFyDt3sayayFvrW3WrZ5trWxuFZrKw4rXan8Wr1rWFn7JFZxXa4j9rWjga10
        934YvF4UKa92yw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUy2b7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxC20s02
        6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
        I_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
        6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
        0_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j
        6r4UYxBIdaVFxhVjvjDU0xZFpf9x07joGQDUUUUU=
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 25, 2020 at 01:05:31PM +0300, Sergei Shtylyov wrote:

OK, got it, anything else?

From 0f4003eb418737df75cb8be79d4da34b1500f3d7 Mon Sep 17 00:00:00 2001
From: Huang Pei <huangpei@loongson.cn>
Date: Fri, 21 Aug 2020 10:48:40 +0800
Subject: [PATCH] MIPS: add missing MSACSR and upper MSA initialization

init_fp_ctx just initialize the fp/msa context, and own_fp_inatomic
just restore FCSR and 64bit FP regs from it, but miss MSACSR and upper
MSA regs for MSA, so MSACSR and MSA upper regs's value from previous
task on current cpu can leak into current task and cause unpredictable
behavior when MSA context not initialized.

Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/kernel/traps.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 38aa07ccdbcc..e843b38486b8 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -1287,6 +1287,16 @@ static int enable_restore_fp_context(int msa)
 		err = own_fpu_inatomic(1);
 		if (msa && !err) {
 			enable_msa();
+			/* with MSA enabled, userspace can see MSACSR 
+			 * and MSA regs, but the values in them are from
+			 * other task before current task, restore them
+			 * from saved fp/msa context
+			 */
+			write_msa_csr(current->thread.fpu.msacsr);
+			/* own_fpu_inatomic(1) just restore low 64bit,
+			 * fix the high 64bit
+			 */
+			init_msa_upper();
 			set_thread_flag(TIF_USEDMSA);
 			set_thread_flag(TIF_MSA_CTX_LIVE);
 		}
-- 
2.17.1

> Hello!
> 
> On 25.08.2020 7:38, Huang Pei wrote:
> 
> > init_fp_ctx just initialize the fp/msa context, and own_fp_inatomic
> > just restore FCSR and 64bit FP regs from it, but miss MSACSR and upper
> > MSA regs for MSA, so MSACSR and MSA upper regs's value from previous
> > task on current cpu can leak into current task and cause unpredictable
> > behavior when MSA context not initialized.
> > 
> > Signed-off-by: Huang Pei <huangpei@loongson.cn>
> > ---
> >   arch/mips/kernel/traps.c | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> > index 38aa07ccdbcc..f8334b63e4c8 100644
> > --- a/arch/mips/kernel/traps.c
> > +++ b/arch/mips/kernel/traps.c
> > @@ -1287,6 +1287,14 @@ static int enable_restore_fp_context(int msa)
> >   		err = own_fpu_inatomic(1);
> >   		if (msa && !err) {
> >   			enable_msa();
> > +			/* with MSA enabled, userspace can see MSACSR
> > +			 * and MSA regs, but the values in them are from
> > +			 * other task before current task, restore them
> > +			 * from saved fp/msa context */
> > +			write_msa_csr(current->thread.fpu.msacsr);
> > +			/* own_fpu_inatomic(1) just restore low 64bit,
> > +			 * fix the high 64bit */
> 
>    The preferred multi-line comment style is:
> 
> /*
>  * bla
>  * bla
>  */
> 
> > +			init_msa_upper();
> >   			set_thread_flag(TIF_USEDMSA);
> >   			set_thread_flag(TIF_MSA_CTX_LIVE);
> >   		}
> 
> MBR, Sergei

