Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21BF326FF3C
	for <lists+linux-mips@lfdr.de>; Fri, 18 Sep 2020 15:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbgIRN5c (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 18 Sep 2020 09:57:32 -0400
Received: from elvis.franken.de ([193.175.24.41]:44584 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726129AbgIRN5c (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 18 Sep 2020 09:57:32 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kJGtG-0002UB-04; Fri, 18 Sep 2020 15:57:30 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D2C08C0FDF; Fri, 18 Sep 2020 15:55:40 +0200 (CEST)
Date:   Fri, 18 Sep 2020 15:55:40 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Wei Li <liwei391@huawei.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        guohanjun@huawei.com
Subject: Re: [PATCH] MIPS: Correct the header guard of r4k-timer.h
Message-ID: <20200918135540.GE19202@alpha.franken.de>
References: <20200918014111.46747-1-liwei391@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918014111.46747-1-liwei391@huawei.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Sep 18, 2020 at 09:41:11AM +0800, Wei Li wrote:
> Rename the header guard of r4k-timer.h from __ASM_R4K_TYPES_H to
> __ASM_R4K_TIMER_H what corresponding with the file name.
> 
> Signed-off-by: Wei Li <liwei391@huawei.com>
> ---
>  arch/mips/include/asm/r4k-timer.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
