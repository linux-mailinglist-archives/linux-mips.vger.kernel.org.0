Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 898581D9BD2
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2020 18:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729219AbgESQAJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 May 2020 12:00:09 -0400
Received: from elvis.franken.de ([193.175.24.41]:59262 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729204AbgESQAJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 19 May 2020 12:00:09 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jb4ex-0001Fc-01; Tue, 19 May 2020 18:00:03 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6AE10C0136; Tue, 19 May 2020 17:59:19 +0200 (CEST)
Date:   Tue, 19 May 2020 17:59:19 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Joshua Kinard <kumba@gentoo.org>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH v3 1/3] MIPS: Split R10000 to allow for R12K+
 optimizations
Message-ID: <20200519155919.GC15797@alpha.franken.de>
References: <677e22b32c5beb082885ba41f3dd1006660ee69f.1589753297.git.kumba@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <677e22b32c5beb082885ba41f3dd1006660ee69f.1589753297.git.kumba@gentoo.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 17, 2020 at 07:24:37PM -0400, Joshua Kinard wrote:
> From: Joshua Kinard <kumba@gentoo.org>
> 
> Add more-specific support for R12000 and higher CPUs by splitting the
> R10000 logic at several places.  This avoids the workarounds enabled
> by R10000_LLSC_WAR and passes -mno-fix-r10000 to gcc during the kernel
> compile.

I've looked at gcc-10 and to me it looks like all R10K type CPUs are treated
the same. And it looks like that even MIPSpro doesn't have any special options
for R12k/R14k/R16k. So the only difference between -march=r10000 and
-march=r12000 is that r10k implies -mfix-r10000 (you probably know that
as it's your change). Therefore I don't see a reason to add the patch
as it is. I'm still open for adding a CPU_R10000_WORKAROUNDS option.
If you don't want to do it I'll probably add it, when IP35 support emerges
as this is so far the only platform I know, where no R10k was ever used.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
