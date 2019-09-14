Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6777FB2C52
	for <lists+linux-mips@lfdr.de>; Sat, 14 Sep 2019 19:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbfINRBE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Sep 2019 13:01:04 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:48214 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725795AbfINRBE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Sep 2019 13:01:04 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23994604AbfINRBCPP927 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 14 Sep 2019 19:01:02 +0200
Date:   Sat, 14 Sep 2019 18:01:02 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Joshua Kinard <kumba@gentoo.org>
cc:     Paul Burton <paul.burton@mips.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: Re: [PATCH 4/4] MIPS: Remove unused R8000 CPU support
In-Reply-To: <56180022-f5dc-d35d-8411-87f96412883d@gentoo.org>
Message-ID: <alpine.LFD.2.21.1909141759380.7834@eddie.linux-mips.org>
References: <20190722215705.20109-1-paul.burton@mips.com> <20190722215705.20109-4-paul.burton@mips.com> <56180022-f5dc-d35d-8411-87f96412883d@gentoo.org>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 27 Jul 2019, Joshua Kinard wrote:

> > Our R8000 CPU support can only be included if a system selects
> > CONFIG_SYS_HAS_CPU_R8000. No system does, making all R8000-related CPU
> > support dead code. Remove it.
> > 
> > Signed-off-by: Paul Burton <paul.burton@mips.com>
> 
> [snip]
> 
> I actually have one of these CPUs, and the SGI IP26 system to go with it.
> Fascinating CPU design.  More like a multi-chip set rather than just a
> single CPU die.  That said, no tears are shed over this code getting
> excised, as it's half-complete, because only the R8K TLB code was written.
> The cache code (c-r8k.c?) was never completed.  I don't even know if the R8K
> TLB code was ever tested on real hardware.  A scanned copy of the CPU manual
> is on the linux-mips FTP server somewhere, and I think I have a copy
> somewhere as well, if anyone ever gets interested again.

 With all the old-timers I believe gone from the MIPS world I doubt this 
is ever going to happen.

  Maciej
