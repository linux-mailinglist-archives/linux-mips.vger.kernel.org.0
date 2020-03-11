Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59F75182420
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 22:44:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729468AbgCKVoo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 17:44:44 -0400
Received: from elvis.franken.de ([193.175.24.41]:35035 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729102AbgCKVoo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 11 Mar 2020 17:44:44 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jC99c-0007O4-00; Wed, 11 Mar 2020 22:44:40 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9FC99C1038; Wed, 11 Mar 2020 22:44:32 +0100 (CET)
Date:   Wed, 11 Mar 2020 22:44:32 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Kamal Dasu <kdasu.kdev@gmail.com>, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: c-r4k: Invalidate BMIPS5000 ZSCM prefetch lines
Message-ID: <20200311214432.GA5900@alpha.franken.de>
References: <20200207223324.46011-1-kdasu.kdev@gmail.com>
 <53c0ca2d-84a5-7556-c1f4-a75e99f0a743@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53c0ca2d-84a5-7556-c1f4-a75e99f0a743@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 11, 2020 at 01:54:23PM -0700, Florian Fainelli wrote:
> On 2/7/20 2:33 PM, Kamal Dasu wrote:
> > Zephyr secondary cache is 256KB, 128B lines. 32B sectors. A secondary cache
> > line can contain two instruction cache lines (64B), or four data cache
> > lines (32B). Hardware prefetch Cache detects stream access, and prefetches
> > ahead of processor access. Add support to invalidate BMIPS5000 cpu zephyr
> > secondary cache module (ZSCM) on DMA from device so that data returned is
> > coherent during DMA read operations.
> > 
> > Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> 
> Thomas can review and apply this patch? Thank you!

looks good to me. I only wonder whether r4k_dma_cache_wbinv() also
needs this ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
