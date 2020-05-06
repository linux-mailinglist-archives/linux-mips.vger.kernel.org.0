Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E39D1C7320
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 16:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729026AbgEFOmb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 10:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728712AbgEFOmb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 May 2020 10:42:31 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C53C061A0F;
        Wed,  6 May 2020 07:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=PhdajbNn68yKLUpzBA64THvXTzqUMkhchAQNlpDFb4w=; b=faoi2zfZ65krF7BF3qUUJfKYRx
        cniqB35eZxuYkKsNE+7KTwE4viLklY4E1t/hGQSOOiWztg9Mq00mIdcIzK0zkhTINMU6h7yaUVZrB
        ZIFO1J0yGUnSvXTzi/E9QUILDu1ewOueuKnXU4GiY22Q5XuGKkOu4Lnj8dTPZ0CJ78sdHlTLVg4sp
        uVb7g4b/xrl3q3R+euu8YSifXQmYB8AyWndN64wjgz01U+b4rUyKR1yf3WvHSSgf1Jy1QigWdNp2n
        0iNhSgsNZJ5ipXOEoPNwb/vx7SM9/rHiMNAM7/17epxZmS6hX8z3nlAdbQ7+0H2fZezfwp6s2I76C
        t7RSQVFg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jWLFQ-0001wI-Ty; Wed, 06 May 2020 14:42:08 +0000
Date:   Wed, 6 May 2020 07:42:08 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Christoph Hellwig <hch@infradead.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v6] MIPS: Loongson: Add DMA support for LS7A
Message-ID: <20200506144208.GD27643@infradead.org>
References: <1588213867-32274-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H5QBOnrqVbMfGf7H5vJ6UMhUxhkCqAzZiwRFn_VwTQHpA@mail.gmail.com>
 <7d7f6211-f6bc-daae-5b13-b54092e762a1@loongson.cn>
 <CAAhV-H7jX9uVwb+GnaKXHPBsBQY35YKccbDedLrmfp8-hveVfw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H7jX9uVwb+GnaKXHPBsBQY35YKccbDedLrmfp8-hveVfw@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 06, 2020 at 04:47:30PM +0800, Huacai Chen wrote:
> > For the above reasons, I think what you are concerned is not a
> > big deal.
> I don't think so, this is obviously a regression. If we can accept a
> regression of RS780E, why we still maintain Loongson-2EF rather than
> simply drop them?

While I much prefer to use the default, regression an otherwise
working platform seems like a bad idea.  I don't really know much
about the Loongson platforms, do they all boot using the same kernel
image?
