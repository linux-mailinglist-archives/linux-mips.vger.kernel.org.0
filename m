Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2E7391324
	for <lists+linux-mips@lfdr.de>; Sat, 17 Aug 2019 23:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbfHQVWR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 17 Aug 2019 17:22:17 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:40108 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfHQVWQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 17 Aug 2019 17:22:16 -0400
Received: by mail-io1-f68.google.com with SMTP id t6so13259609ios.7
        for <linux-mips@vger.kernel.org>; Sat, 17 Aug 2019 14:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=TIwIXh9oi1rBMxLrZ6m/eqcO3acs/QprBotrm1MYtgU=;
        b=CJVuNDGu30vfZIQhNtyqH+dgEouyhowB/pqTopdU55GkSITlHL0uKSvYQI8xfwB4KF
         b/uCqqA3AXKBIdWSBL/bm8atFw/BTbw6zCCCzTTokg/rSqwXa1cCfQMW6iusHpscU8Il
         0ZqX+tec6msmO1pwyfGqBVymy0nWOHfws7CGDoh79Fg0fctZqQK8Mql9QboplE1l26jI
         c7lYq5mvTGfbdlGkY9/A+2cUa+UcDH5vprCBHPJps3g09zIR/90rJ1p5sEuvA/RhvAOH
         Ua8oYgLyyo0AHKEUE5W/NGenZReiOCrCvLJt/QdP2CD/U0d1u2yrDe5h1Bhkwwdzihi3
         +qPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=TIwIXh9oi1rBMxLrZ6m/eqcO3acs/QprBotrm1MYtgU=;
        b=QA+ETZH5NbwlaQJy1NLdbnKhPHmOyDA1xWVsURHiSAYHIicbGgOS3ysZPiICVVkwrc
         jsQ51uedC/erkuP1vVOSNKGxgCIi8wm5cj6RKouatnq9aJGKU975jisIx+P+SoS/46rP
         kH9MhxAHTpCd3hQX63Z5n4cdq49Byit1yA0bRlb6VRWW7wD/C0DGRfdngy+3CoEHCUlk
         Gv9agRRAexF3u8LKN3JIRL852TdG81l0n1MNbgWWhc0mNAQQm9Dol++2ELN1G03YgO6o
         W66lMJa8Y4qhx9l81qV9B/bj0NvvljD5ZObvT9+/qktGPpvoSw/oSGR7FO7zLR6W0vqV
         fwGQ==
X-Gm-Message-State: APjAAAU17NQhuqKN1u65uEnrGwdR1BUZZkmbhDkZGmMYJtaAF/dfhjsZ
        lgPmEV/QdZBtAvlVfLMup5BOrA==
X-Google-Smtp-Source: APXvYqyWkWAJ5sPsUpqbWAy71qmGXtDWPCrfasxRd8m0NdlFhlF6iU5nZ24EPromxMFk1aH65Eky+w==
X-Received: by 2002:a5d:8e16:: with SMTP id e22mr18276290iod.171.1566076936091;
        Sat, 17 Aug 2019 14:22:16 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
        by smtp.gmail.com with ESMTPSA id j25sm13091311ioj.67.2019.08.17.14.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2019 14:22:15 -0700 (PDT)
Date:   Sat, 17 Aug 2019 14:22:15 -0700 (PDT)
From:   Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To:     Christoph Hellwig <hch@lst.de>
cc:     Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
        Michal Simek <monstr@monstr.eu>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Guan Xuetao <gxt@pku.edu.cn>, x86@kernel.org,
        linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        openrisc@lists.librecores.org, linux-mtd@lists.infradead.org,
        linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
        nios2-dev@lists.rocketboards.org, linux-riscv@lists.infradead.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 24/26] riscv: use the generic ioremap code
In-Reply-To: <20190817073253.27819-25-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1908171421560.4130@viisi.sifive.com>
References: <20190817073253.27819-1-hch@lst.de> <20190817073253.27819-25-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 17 Aug 2019, Christoph Hellwig wrote:

> Use the generic ioremap code instead of providing a local version.
> Note that this relies on the asm-generic no-op definition of
> pgprot_noncached.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/Kconfig               |  1 +
>  arch/riscv/include/asm/io.h      |  3 --
>  arch/riscv/include/asm/pgtable.h |  6 +++
>  arch/riscv/mm/Makefile           |  1 -
>  arch/riscv/mm/ioremap.c          | 84 --------------------------------
>  5 files changed, 7 insertions(+), 88 deletions(-)
>  delete mode 100644 arch/riscv/mm/ioremap.c

Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>
Tested-by: Paul Walmsley <paul.walmsley@sifive.com> # rv32, rv64 boot
Acked-by: Paul Walmsley <paul.walmsley@sifive.com> # arch/riscv


- Paul
