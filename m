Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 161AD663A23
	for <lists+linux-mips@lfdr.de>; Tue, 10 Jan 2023 08:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbjAJHpt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Jan 2023 02:45:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbjAJHps (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Jan 2023 02:45:48 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E14B17595
        for <linux-mips@vger.kernel.org>; Mon,  9 Jan 2023 23:45:47 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so9102730wms.4
        for <linux-mips@vger.kernel.org>; Mon, 09 Jan 2023 23:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ym5EqUyMGd6MRtXTTvcbTiCkzoNwWDdejFtLQlPuxB0=;
        b=EPKaq6ewhBu41grF4XfiubFBJGlurxUmCD5RF6TKYuGPhnksHKacrCCw9qdNP3N/9W
         7zlNeQI2tfq/njNFi8ei9y12WlVdjyS6DVN2MapauFVaNnDOJPsSQppMEdpR171yJ3dJ
         H0KEn4Dnogt0Hh6Dc+399mTYauzcj2qNCGEf1gD2V5Z/7TGzOhi38BgKDULGZYiLfeNh
         n/h5ehrjXyiQnXSTHRJLs80NwglLgV3V7nsf6w1wQJ5Ifbg8HDMcUL3XFwOirMnoXQcp
         NG3DzgjK/FWIb7ZAd0Z5fA20dnG5u2+shWt89tkiUvjYjUwKtC6O1zgAFoIm0+bv04cH
         huow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ym5EqUyMGd6MRtXTTvcbTiCkzoNwWDdejFtLQlPuxB0=;
        b=Mmur0Iq/2OPbt/RL+r65HZb5qKwQiUAcL0nLsWoqJMvOU9MDXuYLOsMAsU/dHouzBw
         4/BGA7OqWZBpB+72LUTpDecnSgomps2BsHbPCoWJ3iF6zIvF13o/zapSsGsTEPbvuTUD
         9+qUb579xqMtSu6EQHsMzahnVmlN1ToUa+GT/xjHh1UAFkJ71D+s0mVu/a+FSWxhUHeN
         dG3+X+X52Fd0dR6GqDy44pugFh4OXzWnUrXlTQ0TYWwMd5lKP0jIUq3TX5OVRQ1mGq9U
         0Bu4oJyYKYI8w4wh5VWbeD3qnFV7bnbah/8E18sMKSj9g/pton5x0ISE+id0gfgHdnyj
         kIxA==
X-Gm-Message-State: AFqh2kqOLNqCM3LBzWq5yhc39t169qRaylqMm3+mtJTLa/3u8dj2L4P3
        UJCtregAqVrvQmHDdzXyVF+vtA==
X-Google-Smtp-Source: AMrXdXt/e6dIeeujZIpS+wXo8XxrNMqZtTXHeNjs5aWlgAtIaoQC+vokYN4jhRaXIDBKSBiPhCJh+A==
X-Received: by 2002:a05:600c:3506:b0:3cf:803b:d7cc with SMTP id h6-20020a05600c350600b003cf803bd7ccmr51575286wmq.33.1673336745840;
        Mon, 09 Jan 2023 23:45:45 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id j30-20020a05600c1c1e00b003cfa80443a0sm15633046wms.35.2023.01.09.23.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 23:45:45 -0800 (PST)
Message-ID: <cbaa007c-c3d9-d522-b984-b8c11d1efc26@linaro.org>
Date:   Tue, 10 Jan 2023 08:45:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 02/14] MIPS: Always use -Wa,-msoft-float and eliminate
 GAS_HAS_SET_HARDFLOAT
Content-Language: en-US
To:     Nathan Chancellor <nathan@kernel.org>, masahiroy@kernel.org,
        ndesaulniers@google.com
Cc:     nicolas@fjasle.eu, trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, kernel test robot <lkp@intel.com>,
        tsbogend@alpha.franken.de, linux-mips@vger.kernel.org
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-2-658cbc8fc592@kernel.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-2-658cbc8fc592@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 4/1/23 20:54, Nathan Chancellor wrote:
> -Wa,-msoft-float is tested with as-option, which will be a problem for
> clang with an upcoming change to move as-option to use KBUILD_AFLAGS
> instead of KBUILD_CFLAGS due to a lack of '-mno-abicalls' in
> KBUILD_AFLAGS at the point that this check occurs; $(cflags-y) is added
> to KBUILD_AFLAGS towards the end of this file.
> 
>    clang: error: ignoring '-fno-PIE' option as it cannot be used with implicit usage of -mabicalls and the N64 ABI [-Werror,-Woption-ignored]
> 
> This could be resolved by switching to a cc-option check but
> '$(cflags-y)' would need to be added so that '-mno-abicalls' is present
> for the test. However, this check is no longer necessary, as
> -msoft-float is supported by all supported assembler versions (GNU as
> 2.25+ and LLVM 11+). Eliminate GAS_HAS_SET_HARDFLOAT and all of its
> uses, inlining SET_HARDFLOAT where necessary.
> 
> Link: https://lore.kernel.org/202209101939.bvk64Fok-lkp@intel.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: tsbogend@alpha.franken.de
> Cc: linux-mips@vger.kernel.org
> ---
>   arch/mips/Makefile                  | 11 +---------
>   arch/mips/include/asm/asmmacro-32.h |  4 ++--
>   arch/mips/include/asm/asmmacro.h    | 42 ++++++++++++++++++-------------------
>   arch/mips/include/asm/fpregdef.h    | 14 -------------
>   arch/mips/include/asm/mipsregs.h    | 20 ++++--------------
>   arch/mips/kernel/genex.S            |  2 +-
>   arch/mips/kernel/r2300_fpu.S        |  4 ++--
>   arch/mips/kernel/r4k_fpu.S          | 12 +++++------
>   arch/mips/kvm/fpu.S                 |  6 +++---
>   9 files changed, 40 insertions(+), 75 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

