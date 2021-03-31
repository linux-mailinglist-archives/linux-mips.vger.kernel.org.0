Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C13F34FFAD
	for <lists+linux-mips@lfdr.de>; Wed, 31 Mar 2021 13:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235265AbhCaLrU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 31 Mar 2021 07:47:20 -0400
Received: from elvis.franken.de ([193.175.24.41]:40552 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235140AbhCaLrE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 31 Mar 2021 07:47:04 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lRZJO-0002SS-00; Wed, 31 Mar 2021 13:47:02 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id BB939C2047; Wed, 31 Mar 2021 13:41:19 +0200 (CEST)
Date:   Wed, 31 Mar 2021 13:41:19 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] MIPS: Remove get_fs/set_fs
Message-ID: <20210331114119.GA10555@alpha.franken.de>
References: <20210330172702.146909-1-tsbogend@alpha.franken.de>
 <20210330172702.146909-4-tsbogend@alpha.franken.de>
 <20210330175417.GC15145@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330175417.GC15145@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 30, 2021 at 07:54:17PM +0200, Christoph Hellwig wrote:
> > -	if (likely(access_ok( __gu_ptr, size))) {		\
> > -		if (eva_kernel_access())				\
> > -			__get_kernel_common((x), size, __gu_ptr);	\
> 
> FYI, it might be a good idea to fold __{get,put}_kernel_common into
> __{get,put}_kernel_nofault now that these are the only callers left.

__get_data macro used it, but I rewrote it, so I could fold in
__get/__put_kernel_common.

> Similarly __get_user_common and __put_user_common should probably also
> go away.

__get_user_common is used 3 times and __put_user_common twice. So I
left them as they are.

> >  static inline unsigned long
> >  raw_copy_to_user(void __user *to, const void *from, unsigned long n)
> >  {
> > +	return __invoke_copy_to_user(to, from, n);
> 
> I think __invoke_copy_to_user, __invoke_copy_from_user and
> ___invoke_copy_in_user can go away now as well.

done.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
