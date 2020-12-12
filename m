Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 166692D865F
	for <lists+linux-mips@lfdr.de>; Sat, 12 Dec 2020 13:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbgLLMOz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Dec 2020 07:14:55 -0500
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:25393 "EHLO
        ste-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbgLLMOz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Dec 2020 07:14:55 -0500
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 8F2943F8A8;
        Sat, 12 Dec 2020 13:13:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.901
X-Spam-Level: 
X-Spam-Status: No, score=-1.901 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, NO_RELAYS=-0.001]
        autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 9L4zQsiZgrvO; Sat, 12 Dec 2020 13:13:49 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 1D47D3F894;
        Sat, 12 Dec 2020 13:13:47 +0100 (CET)
Date:   Sat, 12 Dec 2020 13:14:11 +0100
From:   Fredrik Noring <noring@nocrew.org>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        linux-mips@vger.kernel.org, Andreas Jaeger <aj@suse.de>,
        Nick Clifton <nickc@redhat.com>,
        =?utf-8?Q?J=C3=BCrgen?= Urban <JuergenUrban@gmx.de>,
        libc-help@sourceware.org
Subject: Re: [PATCH 002/120] MIPS: R5900: Trap the RDHWR instruction as an SQ
 address exception
Message-ID: <X9S0EzYeHmaP0zQl@sx9>
References: <cover.1567326213.git.noring@nocrew.org>
 <4f856a5ea2c039c6639df875d11b5bff1bf7ecd2.1567326213.git.noring@nocrew.org>
 <2767f5c3-4e89-6543-34f7-6cd1a1be8c23@amsat.org>
 <alpine.LFD.2.21.2011191241410.656242@eddie.linux-mips.org>
 <X9SiXnZJLxDCrKMV@sx9>
 <alpine.LFD.2.21.2012121105280.2104409@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.2012121105280.2104409@eddie.linux-mips.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Dec 12, 2020 at 11:36:35AM +0000, Maciej W. Rozycki wrote:
>  Unlike TLS pointer access, specifically using $3 as rt, which has been 
> made a part of the Linux ABI, they're not supposed to be referred with 
> pre-R2 code.  After all RDHWR was only introduced with R2.
> 
>  Indeed there's emulation code in the kernel for those encodings even with 
> pre-R2 hardware, but it is not guaranteed to give sensible results, and 
> given the circumstances I'm not sure what it really is for, e.g. what is 
> SYNCI_Step for with processors that do not implement SYNCI?  The cycle 
> counter register may be absent too, so even emulated accesses will return 
> rubbish; gettimeofday(2) is the standard interface.
> 
>  So I think we can safely ignore them, just as we can any ULR access with 
> rt != $3.  Unlike standardised TLS pointer accesses such instructions 
> won't appear in compiler-generated code and whoever uses them in handcoded 
> assembly or otherwise generated machine code will have to make sure they 
> make sense for their application (yes, there's rubbish code out there, 
> e.g. Firefox has a JIT that unconditionally produces MIPS R2 code even if 
> the piece of software has been compiled for an older ISA revision, and 
> having not verified that the CPU it runs on actually supports the R2 ISA, 
> but that's just the usual imperfection of the world; you just can't fix it 
> all).

Many thanks, that resolves it! I'll write it up in the commit message.

Fredrik
