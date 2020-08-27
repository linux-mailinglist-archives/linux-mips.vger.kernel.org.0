Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02EBE254474
	for <lists+linux-mips@lfdr.de>; Thu, 27 Aug 2020 13:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728833AbgH0LmV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 Aug 2020 07:42:21 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34896 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728820AbgH0LmT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 Aug 2020 07:42:19 -0400
Received: from ambrosehua-HP-xw6600-Workstation (unknown [182.149.161.99])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP9_rm0dffZcOAA--.18943S2;
        Thu, 27 Aug 2020 19:41:40 +0800 (CST)
Date:   Thu, 27 Aug 2020 19:41:31 +0800
From:   Huang Pei <huangpei@loongson.cn>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: add missing MSACSR and upper MSA initialization
Message-ID: <20200827114131.b7weawkym7ke37wx@ambrosehua-HP-xw6600-Workstation>
References: <20200825043807.5741-1-huangpei@loongson.cn>
 <20200825043807.5741-2-huangpei@loongson.cn>
 <0d88a29f-035b-2c91-c802-3a405d8f69d8@gmail.com>
 <20200826101037.5aam5rhuiais3yrc@ambrosehua-HP-xw6600-Workstation>
 <893e5ba3-1f2b-d439-1294-d4860a2bf672@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <893e5ba3-1f2b-d439-1294-d4860a2bf672@gmail.com>
User-Agent: NeoMutt/20171215
X-CM-TRANSID: AQAAf9DxP9_rm0dffZcOAA--.18943S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWrWfuw1DAF4kKw1kurykXwb_yoW5CF1kpa
        yDG3Z8Kw48XF9rt3saya4FvrW3WrZYqrWxuFZrK3yrXa98Wr1rGFn7JF9rXFy29rWjgF40
        934YvF4UKa92yw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyFb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
        8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E
        4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
        WUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
        Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
        WrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_
        GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8pnQUUUUUU==
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 26, 2020 at 04:17:43PM +0300, Sergei Shtylyov wrote:

From 218f23077352a7befd2aaad3fa46b93112d4051b Mon Sep 17 00:00:00 2001
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
 arch/mips/kernel/traps.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 38aa07ccdbcc..cf788591f091 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -1287,6 +1287,18 @@ static int enable_restore_fp_context(int msa)
 		err = own_fpu_inatomic(1);
 		if (msa && !err) {
 			enable_msa();
+			/*
+			 * with MSA enabled, userspace can see MSACSR
+			 * and MSA regs, but the values in them are from
+			 * other task before current task, restore them
+			 * from saved fp/msa context
+			 */
+			write_msa_csr(current->thread.fpu.msacsr);
+			/*
+			 * own_fpu_inatomic(1) just restore low 64bit,
+			 * fix the high 64bit
+			 */
+			init_msa_upper();
 			set_thread_flag(TIF_USEDMSA);
 			set_thread_flag(TIF_MSA_CTX_LIVE);
 		}
-- 
2.17.1

> On 8/26/20 1:10 PM, Huang Pei wrote:
> 
> > From 0f4003eb418737df75cb8be79d4da34b1500f3d7 Mon Sep 17 00:00:00 2001
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
> > ---
> >  arch/mips/kernel/traps.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> > index 38aa07ccdbcc..e843b38486b8 100644
> > --- a/arch/mips/kernel/traps.c
> > +++ b/arch/mips/kernel/traps.c
> > @@ -1287,6 +1287,16 @@ static int enable_restore_fp_context(int msa)
> >  		err = own_fpu_inatomic(1);
> >  		if (msa && !err) {
> >  			enable_msa();
> > +			/* with MSA enabled, userspace can see MSACSR 
> > +			 * and MSA regs, but the values in them are from
> > +			 * other task before current task, restore them
> > +			 * from saved fp/msa context
> > +			 */
> > +			write_msa_csr(current->thread.fpu.msacsr);
> > +			/* own_fpu_inatomic(1) just restore low 64bit,
> > +			 * fix the high 64bit
> > +			 */
> 
>    This comment style is acceptable only for the networking code, all the other code
> should have the 1st comment line empty.
> 
> [...]
> 
> MBR, Sergei

