Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84F9D31AAA3
	for <lists+linux-mips@lfdr.de>; Sat, 13 Feb 2021 10:20:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhBMJUU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Feb 2021 04:20:20 -0500
Received: from elvis.franken.de ([193.175.24.41]:52749 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229671AbhBMJUQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 13 Feb 2021 04:20:16 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lAr4j-0003E3-03; Sat, 13 Feb 2021 10:18:49 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 8C3A4C0344; Sat, 13 Feb 2021 10:06:59 +0100 (CET)
Date:   Sat, 13 Feb 2021 10:06:59 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: Re: MIPS noncoherent DMA cleanups v2
Message-ID: <20210213090659.GD4330@alpha.franken.de>
References: <20210210095641.23856-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210095641.23856-1-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 10, 2021 at 10:56:35AM +0100, Christoph Hellwig wrote:
> Hi Thomas,
> 
> this series cleans up some of the mips (maybe) noncoherent support.
> It also remove the need for the special <asm/dma-coherence.h> header only
> provided by mips.
> 
> Changes since v1:
>  - fix a bisection issue due to a missing brace
>  - simplify the parameter parsing given that it happens after
>    plat_mem_init

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
