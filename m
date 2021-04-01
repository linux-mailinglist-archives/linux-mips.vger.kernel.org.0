Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8540350F0F
	for <lists+linux-mips@lfdr.de>; Thu,  1 Apr 2021 08:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbhDAGbA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Apr 2021 02:31:00 -0400
Received: from verein.lst.de ([213.95.11.211]:38315 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232596AbhDAGa5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 1 Apr 2021 02:30:57 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 9097268BEB; Thu,  1 Apr 2021 08:30:55 +0200 (CEST)
Date:   Thu, 1 Apr 2021 08:30:55 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        hch@lst.de
Subject: Re: [PATCH v2 3/4] MIPS: uaccess: Remove get_fs/set_fs call sites
Message-ID: <20210401063055.GB25514@lst.de>
References: <20210331115603.146159-1-tsbogend@alpha.franken.de> <20210331115603.146159-4-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210331115603.146159-4-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 31, 2021 at 01:56:00PM +0200, Thomas Bogendoerfer wrote:
> +#define __get_user_nofault(dst, src, type, err_label)			\
> +do {									\
> +	int __gu_err;							\
> +									\
> +	__get_user_common(*((type *)(dst)), sizeof(type),		\
> +			  (__force type *)(src));			\
> +	if (unlikely(__gu_err))						\
> +		goto err_label;						\
> +} while (0)
> +
> +
> +static inline int __get_addr(unsigned long *a, unsigned long *p, bool user)
> +{
> +	if (user)
> +		__get_user_nofault(a, p, unsigned long, fault);
> +	else
> +		__get_kernel_nofault(a, p, unsigned long, fault);
> +
> +	return 0;
> +
> +fault:
> +	return -EFAULT;
> +}

Why can't these use plain old get_user and get_kernel_nofault?
You "optimize" away the access_ok / get_kernel_nofaul_allowed checks
here, but now use totally non-standard and possibly dangerous APIs.

