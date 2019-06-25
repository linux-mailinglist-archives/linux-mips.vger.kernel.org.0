Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B188A557E1
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2019 21:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbfFYTh7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Jun 2019 15:37:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:46580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726653AbfFYTh6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 25 Jun 2019 15:37:58 -0400
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C012D2085A;
        Tue, 25 Jun 2019 19:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561491478;
        bh=tJdGNjp4NLA7f2CJGKITTf6uA4kMX96bLEi69D1RpFc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ShVOA7PYXmmz24tjLGDu1PYm64KCDa4yjeLXa3l6FjdwwPWxrgsVBDxgsovdp7feN
         blu+puyvqldhGC0Wxv3kVwuVBCy18spQuzJMsEad+C5F0wrxmqqgxgvTR3f1e5CyBT
         eX6OYwNFOGaN5Cpc8zEu5AANzUORLi6PZJBbAynU=
Date:   Tue, 25 Jun 2019 12:37:57 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Nicholas Piggin <npiggin@gmail.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/16] mm: move the powerpc hugepd code to mm/gup.c
Message-Id: <20190625123757.ec7e886747bb5a9bc364107d@linux-foundation.org>
In-Reply-To: <20190625143715.1689-15-hch@lst.de>
References: <20190625143715.1689-1-hch@lst.de>
        <20190625143715.1689-15-hch@lst.de>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 25 Jun 2019 16:37:13 +0200 Christoph Hellwig <hch@lst.de> wrote:

> +static int gup_huge_pd(hugepd_t hugepd

Naming nitlet: we have hugepd and we also have huge_pd.  We have
hugepte and we also have huge_pte.  It make things a bit hard to
remember and it would be nice to make it all consistent sometime.

We're consistent with huge_pud and almost consistent with huge_pmd.

To be fully consistent I guess we should make all of them have the
underscore.  Or not have it.  
