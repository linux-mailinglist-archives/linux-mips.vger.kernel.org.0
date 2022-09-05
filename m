Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9D45AD942
	for <lists+linux-mips@lfdr.de>; Mon,  5 Sep 2022 20:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232315AbiIESv1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Sep 2022 14:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232411AbiIESvZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Sep 2022 14:51:25 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A162A941
        for <linux-mips@vger.kernel.org>; Mon,  5 Sep 2022 11:51:24 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id m66so9542959vsm.12
        for <linux-mips@vger.kernel.org>; Mon, 05 Sep 2022 11:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=waVF2Zkls6p4dtc9CzOd8vWQdb3uv6Dg4aQ5i0JwEm8=;
        b=hDhsA6yF/4ikzlN3N0CsnwqUatKpLfnFtlo+o9Jy9dV7LBBiJXxwUNwDxmlYCdxwDy
         ZmkfEusO6Le69y7wgMsPThSUjNIv8cvcRj4+j5MhNGvhdqzwG8Ppl8NkPuc6G4d2yyfG
         ro3Xfc/UUFUo3O4h/xNF/qY2a5CQoXEGejzHJH0J+1sTxEUdYgwKGq0IaBtPaMU56ZJL
         3dyilnZy+Z1C1SfBL1PI7vBzbqMD+tQ535W+/CUT+vPlhtMmloOmczVBHkHKVpu5TDqX
         06DyKjwTD+IQawG83CzEWeqi1SwtmSBDJ3NFLvZBuONEPb998kXqF8xmmoI4KAWn9vpb
         zfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=waVF2Zkls6p4dtc9CzOd8vWQdb3uv6Dg4aQ5i0JwEm8=;
        b=ajCFqLCCFBHWN07uNXDeKqgKwx3uZUJiissMfZ+anROracptQFfe/KMOl/Ug/B92nw
         4NIkrFjNEa7Erbjnu+jEgsY9WDSaf6iqPh9/szOnQjoj1+Qamv6LSyQ0g37vHd+lSmnu
         vyvNdjdvXBa/17VaidkJTvVmr/NynLGkgF6YgDHZaobw6l1+FMyOod7KtDIG43rKzXzj
         vvb3Xt+tAjq5CW9YI1jVhd6el3Ppr1MMf5J6c3jYhRKmrzEv1BIIurci+sNDh2RjJFHi
         vu3p/J2S9s8wCCQy4gg7LrwtLALE+QcIk23iGSxfuu0Uw/xt8AHl/PzCj72246Yy4JH2
         zHJg==
X-Gm-Message-State: ACgBeo20z7bnNSpGX/LLcvwkEQA9WYv7hR5g90UvWZQ8RQT5e7fcB6D9
        rriEalr3TZNRNcabsfk2feBfhctJurRF1wkR46w1gA==
X-Google-Smtp-Source: AA6agR7dtLL5IIGG1Q/HwqLtUVy0aW5huRLuhdjh+9IVyEmSMEPezwo1YJVez4ACu0dW/RjFjIMqh2TltCZbYsFY6g8=
X-Received: by 2002:a05:6102:5094:b0:388:6903:5f09 with SMTP id
 bl20-20020a056102509400b0038869035f09mr13679997vsb.46.1662403883854; Mon, 05
 Sep 2022 11:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220725091740.28188-2-alexander.sverdlin@nokia.com> <20220830030259.3503212-1-yuzhao@google.com>
In-Reply-To: <20220830030259.3503212-1-yuzhao@google.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Mon, 5 Sep 2022 12:50:47 -0600
Message-ID: <CAOUHufY76AfTbz0wKixae=m0Zdh5P3fW2cosOvYKrJ-x0XpzJw@mail.gmail.com>
Subject: Re: [PATCH 1/2] MIPS: Introduce CAVIUM_RESERVE32 Kconfig option
To:     alexander.sverdlin@nokia.com
Cc:     cminyard@mvista.com, joe@perches.com,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org, tsbogend@alpha.franken.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Alexander,

On Mon, Aug 29, 2022 at 9:03 PM Yu Zhao <yuzhao@google.com> wrote:
>
> Hi,
>
> This commit produces a bogus error message on systems that use the
> default value. Please take a look.
>
> Thanks.
>
>   Linux version 6.0.0-rc1 (builder@buildhost) (mips64-openwrt-linux-musl-gcc (OpenWrt GCC 11.2.0 r19590-042d558536) 11.2.0, GNU ld (GNU Binutils) 2.37) #0 SMP Sun Jul 31 15:12:47 2022
>   Failed to allocate CAVIUM_RESERVE32 memory area  <<<===
>   Skipping L2 locking due to reduced L2 cache size
>   CVMSEG size: 0 cache lines (0 bytes)
>   printk: bootconsole [early0] enabled
>   CPU0 revision is: 000d9301 (Cavium Octeon II)

Following up on this. Please take a look. Thanks.
