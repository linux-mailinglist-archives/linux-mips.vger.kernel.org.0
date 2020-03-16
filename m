Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68CF8186EB4
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2020 16:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731550AbgCPPjK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Mar 2020 11:39:10 -0400
Received: from elvis.franken.de ([193.175.24.41]:44978 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731505AbgCPPjJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 16 Mar 2020 11:39:09 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jDrpX-0008Kq-00; Mon, 16 Mar 2020 16:39:03 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id CF651C1079; Mon, 16 Mar 2020 16:31:08 +0100 (CET)
Date:   Mon, 16 Mar 2020 16:31:08 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Kamal Dasu <kdasu.kdev@gmail.com>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: c-r4k: Invalidate BMIPS5000 ZSCM prefetch lines
Message-ID: <20200316153108.GA13674@alpha.franken.de>
References: <20200311214432.GA5900@alpha.franken.de>
 <2388CCC9-8C2A-4907-988D-7A239DE0DD6C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2388CCC9-8C2A-4907-988D-7A239DE0DD6C@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 12, 2020 at 11:09:35PM -0400, Kamal Dasu wrote:
> This is needed on dma reads from device.  

ok.

> > On Mar 11, 2020, at 5:44 PM, Thomas Bogendoerfer <tsbogend@alpha.franken.de> wrote:
> > 
> > ﻿On Wed, Mar 11, 2020 at 01:54:23PM -0700, Florian Fainelli wrote:
> >>> On 2/7/20 2:33 PM, Kamal Dasu wrote:
> >>> Zephyr secondary cache is 256KB, 128B lines. 32B sectors. A secondary cache
> >>> line can contain two instruction cache lines (64B), or four data cache
> >>> lines (32B). Hardware prefetch Cache detects stream access, and prefetches
> >>> ahead of processor access. Add support to invalidate BMIPS5000 cpu zephyr
> >>> secondary cache module (ZSCM) on DMA from device so that data returned is
> >>> coherent during DMA read operations.
> >>> 
> >>> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>

Applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
