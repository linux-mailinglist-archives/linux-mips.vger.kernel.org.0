Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6C7630153E
	for <lists+linux-mips@lfdr.de>; Sat, 23 Jan 2021 13:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbhAWMnJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 Jan 2021 07:43:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbhAWMnI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 23 Jan 2021 07:43:08 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD410C06174A;
        Sat, 23 Jan 2021 04:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=l2WBiCb5duYJRA9nKpihqrJOH1Qjg6utSrFiu8qAdtc=; b=PIQ+56ytgL8BITTLkCIzNrn7rp
        rkwLLz37WYnmE4hAW5jNkxI6hgNTsT34NP4KuhYwCiS0hiAdi+caWZ7ydU5hCNTnwxJ6BpP4uLFR5
        ozKvqtzHTEfgLkdIi3q4j0SePMiambd2pNojHGvQjqgaEg4BgGFvvRn/6hrVUA1QUFoFrSnXCqG/R
        pDyYGvjgJ476RTozrXcVf0daXPRY2JBi5lYvf/2dPzWpZmjAju198qkwrx7ASc9IbPrqzpVRNsZPF
        ZlFX5Nr/QqcLbfEd/uuO4uni5F7KHLIJ/dhj/fsWLGVQeGZNxneJmnmM9vnxP7TSuVVYHByePJJKR
        sylR9eAQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1l3IF0-001vNH-RQ; Sat, 23 Jan 2021 12:42:12 +0000
Date:   Sat, 23 Jan 2021 12:42:10 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        axboe@kernel.dk, linux-block@vger.kernel.org,
        Keith Busch <kbusch@kernel.org>,
        Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v11] block: Add n64 cart driver
Message-ID: <20210123124210.GB458363@infradead.org>
References: <20210123095327.58e5ab6c05f38e9080a79bd3@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210123095327.58e5ab6c05f38e9080a79bd3@gmx.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
