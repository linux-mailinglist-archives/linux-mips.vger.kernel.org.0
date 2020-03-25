Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56B58192694
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 12:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbgCYLEP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 07:04:15 -0400
Received: from pio-pvt-msa3.bahnhof.se ([79.136.2.42]:50250 "EHLO
        pio-pvt-msa3.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbgCYLEP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 25 Mar 2020 07:04:15 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id BE3C03F30D;
        Wed, 25 Mar 2020 12:04:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id YlsgwM6yP6_9; Wed, 25 Mar 2020 12:04:13 +0100 (CET)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 8043E3F26F;
        Wed, 25 Mar 2020 12:04:12 +0100 (CET)
Date:   Wed, 25 Mar 2020 12:04:12 +0100
From:   Fredrik Noring <noring@nocrew.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] MIPS: remove cpu_has_64bit_gp_regs and
 cpu_has_64bit_addresses
Message-ID: <20200325110412.GA40881@sx9>
References: <20200324161525.754181-1-hch@lst.de>
 <20200324161525.754181-2-hch@lst.de>
 <alpine.LFD.2.21.2003250226450.2689954@eddie.linux-mips.org>
 <20200325083012.GA21605@lst.de>
 <20200325085524.GA28706@sx9>
 <20200325085852.GA23786@lst.de>
 <20200325092446.GB28706@sx9>
 <20200325095435.GA27807@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200325095435.GA27807@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> So from what I can tell this uses a 32-bit kernel and 32-bit userspace,
> and sets both pu_has_64bit_gp_regs and cpu_has_64bit_addresses to 0.
> 
> Now if you ever wanted to make use of the 64-bit registeres it would
> require quite some changes, which probably really should have a new
> Kconfig option.  In fact a lot of the workaround for the 64-bit
> registeres that are in the code already should be keyed off such an
> option rather than CONFIG_CPU_R5900.

Addresses are always 32-bit for the R5900 (and not even sign extended?),
as I understand, but GPRs are also always 128-bit. The kernel is unable
to disable 64-bit operations and 128-bit multimedia instructions (MMIs)
because the R5900 doesn't implement CP0.Status.UX. [ In other MIPS ISA
implementations, attempting to execute 64-bit operations in 32-bit user
or supervisor mode may cause an reserved instruction exception. ]

The best approach, I think, is to have the kernel properly save/restore
128-bit GPRs in all cases, as MMIs are quite useful and actually would
"mostly" work regardless of any kernel support. I wrote "mostly" because
with o32 the upper 96 bits of the GPRs would be clobbered when switching
contexts unless they are restored by the kernel.

Also of note is that some pieces of hardware require a 64-bit store
instruction, even with a 32-bit kernel. This implies that the kernel
either saves 128 or 64 GPR bits in 32-bit mode too, or, that interrupts
are disabled to avoiding clobbering GPRs in these specific cases.

Fredrik
