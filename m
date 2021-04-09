Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9938C3599B7
	for <lists+linux-mips@lfdr.de>; Fri,  9 Apr 2021 11:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbhDIJqh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Apr 2021 05:46:37 -0400
Received: from elvis.franken.de ([193.175.24.41]:36276 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231370AbhDIJqf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 9 Apr 2021 05:46:35 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lUniV-0004w2-00; Fri, 09 Apr 2021 11:46:19 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3AA26C24DC; Fri,  9 Apr 2021 11:44:55 +0200 (CEST)
Date:   Fri, 9 Apr 2021 11:44:55 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] MIPS: octeon: Add __raw_copy_[from|to|in]_user symbols
Message-ID: <20210409094455.GA8810@alpha.franken.de>
References: <20210408214846.50758-1-tsbogend@alpha.franken.de>
 <1fa6ff61-25af-7d24-2d03-de03ec73e8f6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fa6ff61-25af-7d24-2d03-de03ec73e8f6@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Apr 09, 2021 at 11:42:46AM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 09.04.2021 0:48, Thomas Bogendoerfer wrote:
> 
> > Cavium Octeon has it's own memcpy implementation and also need the change
> 
>    Its. :-)

applied (with typo fixed) to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
