Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 122ED912F5
	for <lists+linux-mips@lfdr.de>; Sat, 17 Aug 2019 23:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbfHQVHb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 17 Aug 2019 17:07:31 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:37612 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726208AbfHQVHb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 17 Aug 2019 17:07:31 -0400
Received: by mail-io1-f66.google.com with SMTP id q22so13206232iog.4
        for <linux-mips@vger.kernel.org>; Sat, 17 Aug 2019 14:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=oaLZqyUNyQl0GDzg3TD6D3y22xcAlUrpApHmCWftkKw=;
        b=RFEgb4b2hnNS1WpBLunJkjsIPF/Sn00DtxYAOuifEl6DxdVvHfM90BewsheCYGGIbc
         KkLEVKkHBB0QA34K1oL1QqTpTDmH1r0AAS5LIo/Wzqnat3RY7e+91XBtlrB6cTkdTpWU
         kte/9iGUVWH3tp9kz8MHvMt2gyye60gDCIBj8NdLeTB71AjDJMlqAJtKUxtx8xWkFhbs
         YbzFpA0yJYJCQurf1gnnMtlqH+un70tn1BjQGrEcVg5mWlPKN1VotnQ0tUinFRHtRRZr
         YGQo+eeilNUcY2675AOwdgK09hjXorEyFrfH2VgmS9azKAXXlU4rovb4iLfV8rGhNCxH
         YgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=oaLZqyUNyQl0GDzg3TD6D3y22xcAlUrpApHmCWftkKw=;
        b=V08Xb6G/KfB196PBqL1OiyRXOsP2b7OQ7Z8wkBpLqm2IpuDGXVrdmQt961Xap69JTv
         I4Ki8wqjiXW4RR7WOacMbirtRxYJoq5m9M3f60G1o3Q4bDt5uIEQZZ4I6/KsXOPuPYiS
         Fap+avr/kP1ytOxzGtwzF+iSgjPNvf37Q874s94bG5Kh8fCP5JZLLkiEeIVFBY3lDVPt
         636FQqM6DpXy2FmzyfrfJPpAAe36AQEHxIw05ihu8wBd3/XO1Zc3WCpSN66PZzMq1wWL
         d/inWJxcEIJXUirWLj1NyiHGmRU/iZj5WIbFD1mEIcHKLJypRdAO64dFh0RFW5zSRHYo
         q5Xg==
X-Gm-Message-State: APjAAAUU5+OzAxcY7CkvNVSBhqIpqQ13C1HoZ7DVKeKGLJ67Gej9GCXq
        H0xHUbZXs3K2OG8bkUXxy6aOKg==
X-Google-Smtp-Source: APXvYqxg4I5F1jSj4ALE9JDvtf3Qsjlfm04dEVrcDSQX4DQggSlvp1PesRmYUB74gUk83a46+nakJw==
X-Received: by 2002:a05:6638:637:: with SMTP id h23mr18425886jar.59.1566076050556;
        Sat, 17 Aug 2019 14:07:30 -0700 (PDT)
Received: from localhost (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
        by smtp.gmail.com with ESMTPSA id l6sm6664146ioc.15.2019.08.17.14.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2019 14:07:29 -0700 (PDT)
Date:   Sat, 17 Aug 2019 14:07:29 -0700 (PDT)
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
Subject: Re: [PATCH 15/26] asm-generic: ioremap_uc should behave the same
 with and without MMU
In-Reply-To: <20190817073253.27819-16-hch@lst.de>
Message-ID: <alpine.DEB.2.21.9999.1908171403330.4130@viisi.sifive.com>
References: <20190817073253.27819-1-hch@lst.de> <20190817073253.27819-16-hch@lst.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 17 Aug 2019, Christoph Hellwig wrote:

> Whatever reason there is for the existence of ioremap_uc, and the fact 
> that it returns NULL by default on architectures with an MMU applies 
> equally to nommu architectures, so don't provide different defaults.
> 
> In practice the difference is meaningless as the only portable driver
> that uses ioremap_uc is atyfb which probably doesn't show up on nommu
> devices.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

[ ... ]

> diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
> index d02806513670..a98ed6325727 100644
> --- a/include/asm-generic/io.h
> +++ b/include/asm-generic/io.h

[ ... ]

> @@ -1004,6 +985,21 @@ static inline void __iomem *ioremap_wt(phys_addr_t offset, size_t size)
>  }
>  #endif
>  
> +/*
> + * ioremap_uc is special in that we do require an explicit architecture
> + * implementation.  In general you do now want to use this function in a
                                         ^^^ not

> + * driver and use plain ioremap, which is uncached by default.  Similarly
                ^ instead 

> + * architectures should not implement it unless they have a very good
> + * reason.
> + */

Looks like this mess is only needed on x86 with certain graphics drivers 
and conflicts between MTRR and page table-based MMU attributes.


Reviewed-by: Paul Walmsley <paul.walmsley@sifive.com>
Tested-by: Paul Walmsley <paul.walmsley@sifive.com> # rv32, rv64 boot


- Paul
