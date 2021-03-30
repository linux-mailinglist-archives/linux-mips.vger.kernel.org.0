Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12ADA34F036
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 19:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232593AbhC3Ryu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 13:54:50 -0400
Received: from verein.lst.de ([213.95.11.211]:60025 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232059AbhC3RyT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Mar 2021 13:54:19 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id ACC8768B05; Tue, 30 Mar 2021 19:54:17 +0200 (CEST)
Date:   Tue, 30 Mar 2021 19:54:17 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        hch@lst.de
Subject: Re: [PATCH 3/3] MIPS: Remove get_fs/set_fs
Message-ID: <20210330175417.GC15145@lst.de>
References: <20210330172702.146909-1-tsbogend@alpha.franken.de> <20210330172702.146909-4-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330172702.146909-4-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> -	if (likely(access_ok( __gu_ptr, size))) {		\
> -		if (eva_kernel_access())				\
> -			__get_kernel_common((x), size, __gu_ptr);	\

FYI, it might be a good idea to fold __{get,put}_kernel_common into
__{get,put}_kernel_nofault now that these are the only callers left.

Similarly __get_user_common and __put_user_common should probably also
go away.

>  static inline unsigned long
>  raw_copy_to_user(void __user *to, const void *from, unsigned long n)
>  {
> +	return __invoke_copy_to_user(to, from, n);

I think __invoke_copy_to_user, __invoke_copy_from_user and
___invoke_copy_in_user can go away now as well.
