Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08BFB2FD471
	for <lists+linux-mips@lfdr.de>; Wed, 20 Jan 2021 16:48:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732136AbhATPqg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Jan 2021 10:46:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733153AbhATPnf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Jan 2021 10:43:35 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E95CC0613CF;
        Wed, 20 Jan 2021 07:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=EyTnVlIrdSLCo6JyOajP4X/OWzN+1G60OBjF6nl2eiw=; b=UMNyKud7QfL/JKZFlVOiv6mY4B
        KzNOaNatbJtvZhLUNRjH5T8Ck20c0IOhFuUxcBL4Y0UYvYth/hJaXsKZa/Qjf4jrNymnsI/neFcl/
        oukWYrJJj+gyY2BRk2LTqksbSgCZzFGDYJ9XgDhrh5Y7reMCosux/J9TVngGWGs1+B0OPaXInLpy7
        vQaNzleu4UimzRermNog001jSHDep1WSRtFZbCb8/yvwXvq8Akm1SryZgFyiHA081rzyOMRclfN59
        jM7k3RaBJjDFBdp9XVodL6aJuACgBYBfGDrgZRyauX7MRij5mB8RqRbmKMpt7Qw+8WSWv/MOXXoz5
        3JyuOuNA==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l2Fck-00FrNy-89; Wed, 20 Jan 2021 15:42:32 +0000
Date:   Wed, 20 Jan 2021 15:42:22 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     Christoph Hellwig <hch@infradead.org>, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org, Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH 3/3 v7] block: Add n64 cart driver
Message-ID: <20210120154222.GA3779710@infradead.org>
References: <20210115133559.84b2997dc326c277c4d91503@gmx.com>
 <20210120144405.GA3763056@infradead.org>
 <20210120172009.f805cfbcf526100fa59b5130@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120172009.f805cfbcf526100fa59b5130@gmx.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 20, 2021 at 05:20:09PM +0200, Lauri Kasanen wrote:
> I'm not sure I know what that is, or how to do so. This is what the
> existing simple drivers were doing, so I copied them.

drivers/block/ps3vram.c is an example for a simple bio based driver.
