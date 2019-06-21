Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8F154E98C
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2019 15:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbfFUNkY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jun 2019 09:40:24 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:41077 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbfFUNkX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Jun 2019 09:40:23 -0400
Received: by mail-qt1-f194.google.com with SMTP id d17so6861259qtj.8
        for <linux-mips@vger.kernel.org>; Fri, 21 Jun 2019 06:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZCrivaPmWHSHjQSdgEw4GI/j98fJxtxh9tp1DIhn9Pk=;
        b=iFE5ScFSlA9eaFIsPJU8p0w1qOx41yW1vrAuYeo+l9Q0KwpkxwhaD346XR6CI3LuMu
         FsUTSf6vE97JnP3EPZrFn46YHJ7vRTKevOvCMH1mna8IGtNFXf48ywkiIrsuxvMz1Lyo
         73WFQX5rdb2D6muLva15ZoWDq9Kj/YcD/y2bpNGuMg6dRxVmYAap99xfHkj4krlsmpA9
         WLzb7MYs8YrQkoW/Cq3RrCPIBJ2bvt0kiEleJq5K2k1LS5IcxoG3chSgmdVQLBLoizx0
         yMC2TCuZc1Ce7lhLmgcinzihQvYINNi8qNCu1nQLWvdKkjW4U7948HBdCkUlKYsn6Uth
         DaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZCrivaPmWHSHjQSdgEw4GI/j98fJxtxh9tp1DIhn9Pk=;
        b=kuvfwBJctK4EyiRAfZT0sBY9EbkNz/HK9XX4JR/t770LAp6ZppoclgUtcrPILhXywt
         h4YFvKKN+WD/SmdPcH4jqF4tyannAQuqIA6syt6CgQfFYev/HF/RNdMtGzgPF3iMkkwV
         29PHz9TvFKAVzWJEdlJ082USveLhEweojjavFqkaRjIoO+lc8WWMkbn8srMJTyTNUBJv
         I7bR5NFthHtk8rpxa94cJD9vDJIyiWvbesh0ZXzQrsuq3DLL8DGTNSyproxEM8JfwH68
         o1BR6NYSLhLn0g5ViZz+knd3Fr93f3e82XGS58hQBxvjDafRn9wbErT0+sh/OpL4nDPN
         P4zQ==
X-Gm-Message-State: APjAAAVDrCv59uMi9u/VX055E+R5ieOji/NM70slOchUH5kV9BdnOi5U
        2riVRt1mxCg4RLxbHL58PN861w==
X-Google-Smtp-Source: APXvYqzfk92nAm4v0PC/p+cfLaUPeFmmoTuTFE99jGSQ5m486NYHbLSajeoJYynPCh/suXX0ETWpgw==
X-Received: by 2002:ac8:17c1:: with SMTP id r1mr115641302qtk.41.1561124422594;
        Fri, 21 Jun 2019 06:40:22 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.55.100])
        by smtp.gmail.com with ESMTPSA id i22sm1837536qti.30.2019.06.21.06.40.22
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jun 2019 06:40:22 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1heJm9-000060-L5; Fri, 21 Jun 2019 10:40:21 -0300
Date:   Fri, 21 Jun 2019 10:40:21 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
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
Subject: Re: [PATCH 02/16] mm: simplify gup_fast_permitted
Message-ID: <20190621134021.GM19891@ziepe.ca>
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-3-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611144102.8848-3-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jun 11, 2019 at 04:40:48PM +0200, Christoph Hellwig wrote:
> Pass in the already calculated end value instead of recomputing it, and
> leave the end > start check in the callers instead of duplicating them
> in the arch code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/s390/include/asm/pgtable.h   |  8 +-------
>  arch/x86/include/asm/pgtable_64.h |  8 +-------
>  mm/gup.c                          | 17 +++++++----------
>  3 files changed, 9 insertions(+), 24 deletions(-)

Much cleaner

Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>

Jason
