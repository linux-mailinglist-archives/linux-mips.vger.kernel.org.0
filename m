Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9DE45CA82
	for <lists+linux-mips@lfdr.de>; Wed, 24 Nov 2021 18:01:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242533AbhKXREr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Nov 2021 12:04:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242707AbhKXREq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 24 Nov 2021 12:04:46 -0500
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FC6BC061574;
        Wed, 24 Nov 2021 09:01:36 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id 132so3498234qkj.11;
        Wed, 24 Nov 2021 09:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4l8EHpoHR/MUDumoB/hsOQmLQDeVna4zuNcu6MG7N2Y=;
        b=oNawTdMVSlhLmOCrDcR19sMj/RztqPP/+Xul1ST0ZdjZqP/GXamlE06D/eZB2NI71+
         tKrHOxVlG3T5aAXCdaXsBqOpttB7xDhe0zytOjT9XF/Y3kqcM15J6tnRSys3yPlVcfuj
         8EP1DG66Meqvt2KL14gdwqQ9jbr3N/44XS5CpoXDIWeaEKiqwkaLUHeulZyzxTbsYxOq
         T6Wi5OfXgyLiFxQ2A14taCw6JYR4yAQ9jvV+sjc9AENZn1PYPL5iPuP5LjAJLWFIOb9y
         2/kVWUspoQ1F3b/jzWi05rfUah5HK/mQ6U2zRluZPdRWkPa235jsXYLL3mGnRGdQT0aH
         XKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4l8EHpoHR/MUDumoB/hsOQmLQDeVna4zuNcu6MG7N2Y=;
        b=oKt+a3OFza6iWdfZQO0BmiNG9Otjps7U1FInY7cln6i7swnK+R+GhRswIQJ9iaGw1j
         yH82tyniK3/UqDAImIlb1+gGmJx+qjUiA0XjjgHjWCTrkMxquXiVSdtDBbE98hZc+RTe
         dUlefd83rqc2rQphbjGvmR8YwIJwRWF9Rafv6okv+/n+oLRTYELCd+6yzHiO3mDcz8n8
         S8e6vv3PQT70t2H4viD+5KiDV+cTM6KXAKW8QkidSmACbFK57Gu7h+ksgCIjryLK+u8l
         q3+150ICmh9Y6Gl22eqegP1J2+qiSbiPNe5PwBuaOoR6ILzDt8EWvJ7dUnTl+dgoffRD
         T68w==
X-Gm-Message-State: AOAM532M65azHCoDjBaraCZA6KAJMVYbmWpLkyTY0jOqycdjB/YdEmkI
        wB4s9+58Uh2eLBc2CqzZbko=
X-Google-Smtp-Source: ABdhPJxMWf3VHGwZdkv0Dz7RlGUGqhel603IxJS5niNv9/50hWXBURFDisFz9q7IqpkQPDpH9JG1hg==
X-Received: by 2002:ae9:e907:: with SMTP id x7mr7705930qkf.150.1637773295831;
        Wed, 24 Nov 2021 09:01:35 -0800 (PST)
Received: from [192.168.1.140] ([65.35.200.237])
        by smtp.gmail.com with ESMTPSA id x16sm158330qko.15.2021.11.24.09.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 09:01:35 -0800 (PST)
Subject: Re: [PATCH 0/3] of/fdt: Rework early FDT scanning functions
To:     Rob Herring <robh@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        John Crispin <john@phrozen.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20211118181213.1433346-1-robh@kernel.org>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <7c3286d4-2da4-b083-b3a4-88d32e475617@gmail.com>
Date:   Wed, 24 Nov 2021 12:01:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211118181213.1433346-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/18/21 1:12 PM, Rob Herring wrote:
> The early FDT scanning functions use of_scan_flat_dt() which implements 
> its own node walking method. This function predates libfdt and is an 
> unnecessary indirection. This series reworks 
> early_init_dt_scan_chosen(), early_init_dt_scan_root(), and 
> early_init_dt_scan_memory() to be called directly and use libfdt calls.
> 
> Ultimately, I want to remove of_scan_flat_dt(). Most of the remaining 
> of_scan_flat_dt() users are in powerpc.
> 
> Rob
> 
> 
> Rob Herring (3):
>   of/fdt: Rework early_init_dt_scan_chosen() to call directly
>   of/fdt: Rework early_init_dt_scan_root() to call directly
>   of/fdt: Rework early_init_dt_scan_memory() to call directly
> 
>  arch/mips/ralink/of.c                |  16 +---
>  arch/powerpc/kernel/prom.c           |  22 ++---
>  arch/powerpc/mm/nohash/kaslr_booke.c |   4 +-
>  drivers/of/fdt.c                     | 121 ++++++++++++++-------------
>  include/linux/of_fdt.h               |   9 +-
>  5 files changed, 79 insertions(+), 93 deletions(-)
> 


"checkpatch --strict" reports some "CHECK" issues, but review of the patches
for correctness becomes much more difficult if they are addressed, so they
should be ignored for this series.

-Frank
