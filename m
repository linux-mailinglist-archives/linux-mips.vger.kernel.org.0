Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5F3351ADB
	for <lists+linux-mips@lfdr.de>; Thu,  1 Apr 2021 20:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236799AbhDASDY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Apr 2021 14:03:24 -0400
Received: from elvis.franken.de ([193.175.24.41]:44820 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236822AbhDAR6q (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 1 Apr 2021 13:58:46 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lRx0R-0006B4-00; Thu, 01 Apr 2021 15:05:03 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0A5EDC2095; Thu,  1 Apr 2021 14:51:00 +0200 (CEST)
Date:   Thu, 1 Apr 2021 14:51:00 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] MIPS: uaccess: Remove get_fs/set_fs call sites
Message-ID: <20210401125100.GA9556@alpha.franken.de>
References: <20210331115603.146159-1-tsbogend@alpha.franken.de>
 <20210331115603.146159-4-tsbogend@alpha.franken.de>
 <20210401063055.GB25514@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401063055.GB25514@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 01, 2021 at 08:30:55AM +0200, Christoph Hellwig wrote:
> On Wed, Mar 31, 2021 at 01:56:00PM +0200, Thomas Bogendoerfer wrote:
> > +#define __get_user_nofault(dst, src, type, err_label)			\
> > +do {									\
> > +	int __gu_err;							\
> > +									\
> > +	__get_user_common(*((type *)(dst)), sizeof(type),		\
> > +			  (__force type *)(src));			\
> > +	if (unlikely(__gu_err))						\
> > +		goto err_label;						\
> > +} while (0)
> > +
> > +
> > +static inline int __get_addr(unsigned long *a, unsigned long *p, bool user)
> > +{
> > +	if (user)
> > +		__get_user_nofault(a, p, unsigned long, fault);
> > +	else
> > +		__get_kernel_nofault(a, p, unsigned long, fault);
> > +
> > +	return 0;
> > +
> > +fault:
> > +	return -EFAULT;
> > +}
> 
> Why can't these use plain old get_user and get_kernel_nofault?
> You "optimize" away the access_ok / get_kernel_nofaul_allowed checks
> here, but now use totally non-standard and possibly dangerous APIs.

thanks, I was too deep into the macro wormhole... using standard API
makes this even look nicer. Posting v3 in a few minutes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
