Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A83034F023
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 19:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232349AbhC3RuG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 13:50:06 -0400
Received: from verein.lst.de ([213.95.11.211]:60001 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232579AbhC3Rtp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Mar 2021 13:49:45 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id C6B2468B05; Tue, 30 Mar 2021 19:49:43 +0200 (CEST)
Date:   Tue, 30 Mar 2021 19:49:43 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        hch@lst.de
Subject: Re: [PATCH 2/3] MIPS: uaccess: Remove get_fs/set_fs call sites
Message-ID: <20210330174943.GB15145@lst.de>
References: <20210330172702.146909-1-tsbogend@alpha.franken.de> <20210330172702.146909-3-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330172702.146909-3-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 30, 2021 at 07:26:59PM +0200, Thomas Bogendoerfer wrote:
> +#define __get_data(x, ptr, u)						\
> +	(((u) == true) ? __get_udata((x), (ptr), sizeof(*(ptr))) :	\
> +			__get_kdata((x), (ptr), sizeof(*(ptr))))
> +

I'm a little worried about exposing this in uaccess.h.  Can you
have local helpers insted, preferably strongly typed for their
specific use cases?
