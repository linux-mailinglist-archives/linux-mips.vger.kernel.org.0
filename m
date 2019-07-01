Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD305C231
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jul 2019 19:43:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727372AbfGARnx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jul 2019 13:43:53 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33950 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727130AbfGARnx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Jul 2019 13:43:53 -0400
Received: by mail-pf1-f194.google.com with SMTP id c85so6930430pfc.1;
        Mon, 01 Jul 2019 10:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4Ab+2WLxKa6sTxudyHiiBJTaUT/WpEhsKe3EvRMNAaI=;
        b=K2RPLl6T13anE5AR4Pains2OnguPjEf0HP9RI2xe6PwRE6dBBNyLLCc9hFuEDcbsTx
         erp0Vs+QqvO1AwXZQqpghNcoKB4TY4asm1/KQBOb1E3e3cgIHtUb5zQiHr97n0zz/OMr
         vfdO+NEMA82RYyGO3KULn4yfpE9GtgHNpGMHWjaBHqfSBKfhRkuGTBSl0Al8DliMX3GC
         JH9Nf+eyCC2Xd3aa0r72reEZ+9mz+IHs3SAMRG289GRZgXzQ0BLjCbdtawq9g4+A2fOW
         IBBJFcZgqZO3P0VGV+lxXCoAIdpXnu1+CRdybQ2Aue7wghH4XwwvtRZO0qS42iqyL7/4
         b9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=4Ab+2WLxKa6sTxudyHiiBJTaUT/WpEhsKe3EvRMNAaI=;
        b=abQUu1R5Z3SIA/pWXlLRPkEwdHSwqyFdHASwORplJ6OtjJ13qdGnbLAB8Av6sYOesI
         RbpEGWoTfLDEWrMHakmenNGkFxcbyEB4RxAQ2QwHnd3YUZXKsmM3DNSN5YoPZqN0Elqd
         HR7/EBQD6km7YKb0DK023HeMbdjbcvdLLR+bXns8QGiqcppgfDwZxbhqGl40joNuZQ70
         cqA19AFh1TnKagax/Rk4eIehHUHsTiyxxp8K1aJuFd+n9z1Mcybrx3zxXz95GEwYJZ0g
         Az2PPciTAtkHsDjge4NG5WvT9OIrG07MGp2DiH7iH2ZYfsU+MdjDBj4MMvwPCC+uSpoZ
         A/NQ==
X-Gm-Message-State: APjAAAWdK2ZJuFnVNqFPQo/JiPptk9IfLrVga1sXD0zHXAYBSyMvcvil
        K5DpcvityIxViNo8Fr4NeN4=
X-Google-Smtp-Source: APXvYqw5mWiLG8IgGXcXSo5PJtCcJK41xioi+PaV9M13xIHT0xLiV7aKc0U8ppKeb5x0epPkS/qOFg==
X-Received: by 2002:a63:5048:: with SMTP id q8mr25679697pgl.446.1562003032456;
        Mon, 01 Jul 2019 10:43:52 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q63sm21513330pfb.81.2019.07.01.10.43.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 10:43:52 -0700 (PDT)
Date:   Mon, 1 Jul 2019 10:43:51 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: don't select ARCH_HAS_PTE_SPECIAL
Message-ID: <20190701174351.GB24848@roeck-us.net>
References: <20190701151818.32227-1-hch@lst.de>
 <20190701151818.32227-3-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701151818.32227-3-hch@lst.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jul 01, 2019 at 05:18:18PM +0200, Christoph Hellwig wrote:
> MIPS doesn't really have a proper pte_special implementation, just
> stubs.  It turns out they were not enough to make get_user_pages_fast
> work, so drop the select.  This means get_user_pages_fast won't
> actually use the fast path for non-hugepage mappings, so someone who
> actually knows about mips page table management should look into
> adding real pte_special support.
> 
> Fixes: eb9488e58bbc ("MIPS: use the generic get_user_pages_fast code")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/mips/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index b1e42f0e4ed0..7957d3457156 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -6,7 +6,6 @@ config MIPS
>  	select ARCH_BINFMT_ELF_STATE if MIPS_FP_SUPPORT
>  	select ARCH_CLOCKSOURCE_DATA
>  	select ARCH_HAS_ELF_RANDOMIZE
> -	select ARCH_HAS_PTE_SPECIAL
>  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
>  	select ARCH_SUPPORTS_UPROBES
> -- 
> 2.20.1
> 
