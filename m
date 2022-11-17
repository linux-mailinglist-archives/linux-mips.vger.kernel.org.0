Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE8562E781
	for <lists+linux-mips@lfdr.de>; Thu, 17 Nov 2022 23:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241074AbiKQWAG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Nov 2022 17:00:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241078AbiKQV7u (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 17 Nov 2022 16:59:50 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB961170
        for <linux-mips@vger.kernel.org>; Thu, 17 Nov 2022 13:58:27 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id k22so3088678pfd.3
        for <linux-mips@vger.kernel.org>; Thu, 17 Nov 2022 13:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r2vqsefxvlQpm7YoDJQXEXeeHIkQ6S5JMCMQ5S8aLio=;
        b=k2i7Pob22XCdE3eYvjx4pPufwTb8mTPjukR1UCSAv0kmL6U29qZrcajtJc3GiwR25C
         GxngyGxuAOe8R1u2fG07FDvUurbqbhzNNAvQ0bvvdjotWAgaJxTe1J6rbJlEzDLOD/Zm
         f5ROj4ZQvL1a3wZkcDpdW1XiI4mqzUly58q/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2vqsefxvlQpm7YoDJQXEXeeHIkQ6S5JMCMQ5S8aLio=;
        b=vTsm6M9HiHHrukWIlV0RSUPCAn+Ubg9K9ylIQYj2rxOAIhzYuDqm7jhZfl2kYaktNT
         HKY/20srVGoK56r2T2dTtSnJM+TjTdyd7iNj0R9sfpv7kwcYdnfkBq8q19Z9eju8Zn9b
         bneDp48h6GzzJG0ijDEqTxN+rhxN43Yz2lmkhRUm+Yw9yEGoJCc68covhVDpRTHPiuzv
         CoX+1w1IXD/pyXqJh2bAdHHxG4rwnPjhMLnfGJyCMKmr421ceMD/8JdVvd8lavzLx0pT
         lSk6PmujvsuXMLY/6EFefjTwiv1C/jckrFGtTkg3JOZyn+ZV95eSIhd+uiWab2yrHCmN
         GTTg==
X-Gm-Message-State: ANoB5pm7s4fgICPV7uRLQ1+X8GO+m5Z2ettV1VzkZNwYGfOmlqAFUH6T
        d7AbQwxRTmieXSq4Aa82+7vQbg==
X-Google-Smtp-Source: AA0mqf6OLZEOM+uadHNHyZ4glxVpWyLO25QJV2wWHbf4ZbABty2OM80CQ8wN7Ibt7qgRI014DYHeJw==
X-Received: by 2002:a63:5c0f:0:b0:470:8e8a:8e11 with SMTP id q15-20020a635c0f000000b004708e8a8e11mr3843188pgb.490.1668722306503;
        Thu, 17 Nov 2022 13:58:26 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id k3-20020a17090a3cc300b00200461cfa99sm3966446pjd.11.2022.11.17.13.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 13:58:25 -0800 (PST)
Date:   Thu, 17 Nov 2022 13:58:25 -0800
From:   Kees Cook <keescook@chromium.org>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Heiko Carstens <hca@linux.ibm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Christoph =?iso-8859-1?Q?B=F6hmwalder?= 
        <christoph.boehmwalder@linbit.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Theodore Ts'o <tytso@mit.edu>,
        Andreas Dilger <adilger.kernel@dilger.ca>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        "Darrick J . Wong" <djwong@kernel.org>,
        SeongJae Park <sj@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Helge Deller <deller@gmx.de>, netdev@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-block@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mmc@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: Re: [PATCH v3 2/3] treewide: use get_random_u32_{above,below}()
 instead of manual loop
Message-ID: <202211171358.4B4E0E2F17@keescook>
References: <20221114164558.1180362-1-Jason@zx2c4.com>
 <20221117202906.2312482-1-Jason@zx2c4.com>
 <20221117202906.2312482-3-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117202906.2312482-3-Jason@zx2c4.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 17, 2022 at 09:29:05PM +0100, Jason A. Donenfeld wrote:
> These cases were done with this Coccinelle:
> 
> @@
> expression E;
> identifier I;
> @@
> -   do {
>       ... when != I
> -     I = get_random_u32();
>       ... when != I
> -   } while (I > E);
> +   I = get_random_u32_below(E + 1);
> 
> @@
> expression E;
> identifier I;
> @@
> -   do {
>       ... when != I
> -     I = get_random_u32();
>       ... when != I
> -   } while (I >= E);
> +   I = get_random_u32_below(E);
> 
> @@
> expression E;
> identifier I;
> @@
> -   do {
>       ... when != I
> -     I = get_random_u32();
>       ... when != I
> -   } while (I < E);
> +   I = get_random_u32_above(E - 1);
> 
> @@
> expression E;
> identifier I;
> @@
> -   do {
>       ... when != I
> -     I = get_random_u32();
>       ... when != I
> -   } while (I <= E);
> +   I = get_random_u32_above(E);
> 
> @@
> identifier I;
> @@
> -   do {
>       ... when != I
> -     I = get_random_u32();
>       ... when != I
> -   } while (!I);
> +   I = get_random_u32_above(0);
> 
> @@
> identifier I;
> @@
> -   do {
>       ... when != I
> -     I = get_random_u32();
>       ... when != I
> -   } while (I == 0);
> +   I = get_random_u32_above(0);
> 
> @@
> expression E;
> @@
> - E + 1 + get_random_u32_below(U32_MAX - E)
> + get_random_u32_above(E)
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
