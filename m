Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A0325BD36
	for <lists+linux-mips@lfdr.de>; Thu,  3 Sep 2020 10:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgICI1M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Sep 2020 04:27:12 -0400
Received: from elvis.franken.de ([193.175.24.41]:50506 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725984AbgICI1L (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 3 Sep 2020 04:27:11 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kDkaL-0000I1-03; Thu, 03 Sep 2020 10:27:09 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 5556CC0E86; Thu,  3 Sep 2020 10:21:14 +0200 (CEST)
Date:   Thu, 3 Sep 2020 10:21:14 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     afzal mohammed <afzal.mohd.ma@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: SNI: Fix SCSI interrupt
Message-ID: <20200903082114.GD6220@alpha.franken.de>
References: <20200902213214.108514-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902213214.108514-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Sep 02, 2020 at 11:32:14PM +0200, Thomas Bogendoerfer wrote:
> On RM400(a20r) machines ISA and SCSI interrupts share the same interrupt
> line. Commit 49e6e07e3c80 ("MIPS: pass non-NULL dev_id on shared
> request_irq()") accidently dropped the IRQF_SHARED bit, which breaks
> registering SCSI interrupt. Put back IRQF_SHARED and add dev_id for
> ISA interrupt.
> 
> Fixes: 49e6e07e3c80 ("MIPS: pass non-NULL dev_id on shared request_irq()")
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/sni/a20r.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

applied ti mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
