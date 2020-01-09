Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F01F136189
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 21:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728693AbgAIUI0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 15:08:26 -0500
Received: from gate.crashing.org ([63.228.1.57]:55777 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725763AbgAIUIZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Jan 2020 15:08:25 -0500
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 009K7ZKP004645;
        Thu, 9 Jan 2020 14:07:35 -0600
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 009K7XMf004644;
        Thu, 9 Jan 2020 14:07:33 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Thu, 9 Jan 2020 14:07:33 -0600
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Christophe Leroy <christophe.leroy@c-s.fr>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, arnd@arndb.de,
        tglx@linutronix.de, vincenzo.frascino@arm.com, luto@kernel.org,
        x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org
Subject: Re: Surprising code generated for vdso_read_begin()
Message-ID: <20200109200733.GS3191@gate.crashing.org>
References: <cover.1577111363.git.christophe.leroy@c-s.fr> <bd4557a7-9715-59aa-5d8e-488c5e516a98@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd4557a7-9715-59aa-5d8e-488c5e516a98@c-s.fr>
User-Agent: Mutt/1.4.2.3i
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 09, 2020 at 05:52:34PM +0000, Christophe Leroy wrote:
> Wondering why we get something so complicated/redundant for 
> vdso_read_begin() <include/vdso/helpers.h>
> 
> static __always_inline u32 vdso_read_begin(const struct vdso_data *vd)
> {
> 	u32 seq;
> 
> 	while ((seq = READ_ONCE(vd->seq)) & 1)
> 		cpu_relax();
> 
> 	smp_rmb();
> 	return seq;
> }
> 
> 
>  6e0:   81 05 00 f0     lwz     r8,240(r5)
>  6e4:   71 09 00 01     andi.   r9,r8,1
>  6e8:   41 82 00 10     beq     6f8 <__c_kernel_clock_gettime+0x158>
>  6ec:   81 05 00 f0     lwz     r8,240(r5)
>  6f0:   71 0a 00 01     andi.   r10,r8,1
>  6f4:   40 82 ff f8     bne     6ec <__c_kernel_clock_gettime+0x14c>
>  6f8:
> 
> r5 being vd pointer
> 
> Why the first triplet, not only the second triplet ? Something wrong 
> with using READ_ONCE() for that ?

It looks like the compiler did loop peeling.  What GCC version is this?
Please try current trunk (to become GCC 10), or at least GCC 9?


Segher
