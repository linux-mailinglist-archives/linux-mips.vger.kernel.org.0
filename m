Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F5EE79C57
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2019 00:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728151AbfG2WQt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Jul 2019 18:16:49 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:45984 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbfG2WQs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 Jul 2019 18:16:48 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23992779AbfG2WQpdRPci (ORCPT
        <rfc822;linux-kernel@vger.kernel.org> + 1 other);
        Tue, 30 Jul 2019 00:16:45 +0200
Date:   Mon, 29 Jul 2019 23:16:45 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>,
        Hassan Naveed <hnaveed@wavecomp.com>,
        Stephen Kitt <steve@sk2.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] mips: avoid explicit UB in assignment of
 mips_io_port_base
In-Reply-To: <20190729211014.39333-1-ndesaulniers@google.com>
Message-ID: <alpine.LFD.2.21.1907292302451.16059@eddie.linux-mips.org>
References: <20190729211014.39333-1-ndesaulniers@google.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 29 Jul 2019, Nick Desaulniers wrote:

> The code in question is modifying a variable declared const through
> pointer manipulation.  Such code is explicitly undefined behavior, and
> is the lone issue preventing malta_defconfig from booting when built
> with Clang:
> 
> If an attempt is made to modify an object defined with a const-qualified
> type through use of an lvalue with non-const-qualified type, the
> behavior is undefined.
> 
> LLVM is removing such assignments. A simple fix is to not declare
> variables const that you plan on modifying.  Limiting the scope would be
> a better method of preventing unwanted writes to such a variable.
> 
> Further, the code in question mentions "compiler bugs" without any links
> to bug reports, so it is difficult to know if the issue is resolved in
> GCC. The patch was authored in 2006, which would have been GCC 4.0.3 or
> 4.1.1. The minimal supported version of GCC in the Linux kernel is
> currently 4.6.

 It's somewhat older than that.  My investigation points to:

commit c94e57dcd61d661749d53ee876ab265883b0a103
Author: Ralf Baechle <ralf@linux-mips.org>
Date:   Sun Nov 25 09:25:53 2001 +0000

    Cleanup of include/asm-mips/io.h.  Now looks neat and harmless.

However the purpose of the arrangement does not appear to me to be 
particularly specific to a compiler version.

> For what its worth, there was UB before the commit in question, it just
> added a barrier and got lucky IRT codegen. I don't think there's any
> actual compiler bugs related, just runtime bugs due to UB.

 Does your solution preserves the original purpose of the hack though as 
documented in the comment you propose to be removed?

 Clearly it was defined enough to work for almost 18 years, so it would be 
good to keep the optimisation functionally by using different means that 
do not rely on UB.  This variable is assigned at most once throughout the 
life of the kernel and then early on, so considering it r/w with all the 
consequences for all accesses does not appear to me to be a good use of 
it.

 Maybe a piece of inline asm to hide the initialisation or suchlike then?

  Maciej
