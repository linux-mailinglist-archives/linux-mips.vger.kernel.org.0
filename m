Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B363D829C8
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2019 04:56:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728870AbfHFC4A (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Aug 2019 22:56:00 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33360 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728922AbfHFC4A (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Aug 2019 22:56:00 -0400
Received: by mail-ed1-f68.google.com with SMTP id i11so17432697edq.0
        for <linux-mips@vger.kernel.org>; Mon, 05 Aug 2019 19:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegavinli.com; s=google;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc;
        bh=ymynYvUaAJ/fSsk8dTF47gjXr8CYua8YobOOSKegPcM=;
        b=UanfDFFyXJgYSA7QqCuSdaCf5p+I3v2GUlvbhA8+2qe6l86pJKL0lTlbCFnTx3gBOk
         jjw0CPJdEKovLTwXtm6Go48h8/Y8NunT8oKKFGaMd9OyBH8HT4SxYQbIV6jerO9zgRB+
         DhQfv6wnIBUjLqio5JTWuVL4Tjft7woEGwUdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc;
        bh=ymynYvUaAJ/fSsk8dTF47gjXr8CYua8YobOOSKegPcM=;
        b=ANq3SOxlKg40q9mPWAgkvPoDF+iXsrhGTIEbQcQW2rguAum0feSF8+czSes4BPrLVe
         fYMfTdyR/UpHxl385xqiUA0U/Pm9yaYHihmeyIRhdVgaOSTO7/wszdKKw8xE3voYXNni
         2mf9+jA+NxXG2+Bh++HumEFx8nXRYV/D6vQioqm5X5UN6J5WMmamQAZhKx93+h9Pygo8
         +dV6DgzfqsQuzdcp/b+6VntXOM8xnF2NXMXKNLXMTPdqgNG90lHsNr9wu26BoB0vINLR
         241B28aunsD1fhP2vcrzp5hQ/lSTPZC0Z4Ip79utxaEvsA92OpQ1p6oiZZVHSFL0V31P
         tJJQ==
X-Gm-Message-State: APjAAAUtcoGfIZ0GIeHFCVmo9RfAC8MIZyLcXfftPWftTv58EzcCuE00
        6mgJQjp53f/mn1KLCINDvjZIVhJ6F74Cew==
X-Google-Smtp-Source: APXvYqwCQ/MXwCzExS5dUl/Wau0R2IDrgb+fZVtZ3SzyY0Yt7wlLBRDhvpUMbujiF6VcO+U3M2RlWg==
X-Received: by 2002:aa7:d781:: with SMTP id s1mr1523685edq.20.1565060158213;
        Mon, 05 Aug 2019 19:55:58 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 17sm20458990edu.21.2019.08.05.19.55.55
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 19:55:57 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id v15so80947545eds.9;
        Mon, 05 Aug 2019 19:55:55 -0700 (PDT)
X-Received: by 2002:a17:906:b315:: with SMTP id n21mr1014103ejz.312.1565060155502;
 Mon, 05 Aug 2019 19:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190805080145.5694-1-hch@lst.de> <20190805080145.5694-2-hch@lst.de>
 <CAP_+7SzPdNCMKuuXMjHjpCzxsey2YWR_e6mTAWtNSZ6kKBvKFw@mail.gmail.com>
In-Reply-To: <CAP_+7SzPdNCMKuuXMjHjpCzxsey2YWR_e6mTAWtNSZ6kKBvKFw@mail.gmail.com>
From:   Gavin Li <gavinli@thegavinli.com>
Date:   Mon, 5 Aug 2019 19:55:44 -0700
X-Gmail-Original-Message-ID: <CA+GxvY5C_rrukCzC5K-h72bePyW8PS_Rfj3uxh-K6UrcAextUQ@mail.gmail.com>
Message-ID: <CA+GxvY5C_rrukCzC5K-h72bePyW8PS_Rfj3uxh-K6UrcAextUQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dma-mapping: fix page attributes for dma_mmap_*
To:     Christoph Hellwig <hch@lst.de>
Cc:     Shawn Anastasio <shawn@anastas.io>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linuxppc-dev@lists.ozlabs.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Gavin Li <git@thegavinli.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

>         /* create a coherent mapping */
>         ret = dma_common_contiguous_remap(page, size, VM_USERMAP,
> -                       arch_dma_mmap_pgprot(dev, PAGE_KERNEL, attrs),
> +                       dma_pgprot(dev, PAGE_KERNEL, attrs),
>                         __builtin_return_address(0));
>         if (!ret) {
>                 __dma_direct_free_pages(dev, size, page);

Is dma_common_contiguous_remap() still necessary in the
DMA_ATTR_NON_CONSISTENT case? I would presume it would be fine to just
return a linearly mapped address in that case.
