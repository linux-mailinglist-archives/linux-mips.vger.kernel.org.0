Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57530394372
	for <lists+linux-mips@lfdr.de>; Fri, 28 May 2021 15:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234246AbhE1Nj7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 May 2021 09:39:59 -0400
Received: from elvis.franken.de ([193.175.24.41]:53912 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229653AbhE1Nj4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 28 May 2021 09:39:56 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lmcgs-00013T-00; Fri, 28 May 2021 15:38:18 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 750C4C1B28; Fri, 28 May 2021 15:37:50 +0200 (CEST)
Date:   Fri, 28 May 2021 15:37:50 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Keguang Zhang <keguang.zhang@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V1 0/4] MIPS: Loongson1B: Add dmaengine and NAND device
Message-ID: <20210528133750.GA3164@alpha.franken.de>
References: <20210526133100.436048-1-keguang.zhang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526133100.436048-1-keguang.zhang@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 26, 2021 at 09:30:56PM +0800, Keguang Zhang wrote:
> From: Kelvin Cheung <keguang.zhang@gmail.com>
> 
> This patchset is to add dmaengine and NAND device
> for Loongson1B.

as I saw two more versions of this series, is this something to look at
and apply ?

For future submissions, could you please add a changelog when you update
a series ? Thanks a lot.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
