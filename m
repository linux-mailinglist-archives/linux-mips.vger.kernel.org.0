Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CECBA27E8DA
	for <lists+linux-mips@lfdr.de>; Wed, 30 Sep 2020 14:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729693AbgI3Msx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Sep 2020 08:48:53 -0400
Received: from elvis.franken.de ([193.175.24.41]:36177 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbgI3Msw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 30 Sep 2020 08:48:52 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kNbXO-0003um-00; Wed, 30 Sep 2020 14:48:50 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E9CE4C103C; Wed, 30 Sep 2020 13:16:44 +0200 (CEST)
Date:   Wed, 30 Sep 2020 13:16:44 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Heiher <r@hev.cc>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        "Maciej W . Rozycki" <macro@linux-mips.org>
Subject: Re: [PATCH] MIPS: Optional SYNC emulation
Message-ID: <20200930111644.GA19903@alpha.franken.de>
References: <20200821031228.31231-1-r@hev.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200821031228.31231-1-r@hev.cc>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 21, 2020 at 11:12:28AM +0800, Heiher wrote:
> MIPS ISA defines several types of memory barrier, of which Type-0 (full barrier)
> is required, and the others are optional. In some vendor implementation (such as
> Loongson), all optional parts are implemented to emit an illegal instruction
> exception. Here, emulate to full barrier to ensure the functional semantics.
> 
> If an implementation does not support SYNC 0, it should also not support SMP, so
> the `smp_mb()` is only a compilation barrier.

I see your point, but isn't taking an exception already more than a
compiler barrier ? Does the missing sync hurt in real life ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
