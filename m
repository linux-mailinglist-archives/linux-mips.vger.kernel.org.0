Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 253B277F146
	for <lists+linux-mips@lfdr.de>; Thu, 17 Aug 2023 09:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348492AbjHQHdo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Aug 2023 03:33:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348570AbjHQHdj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 17 Aug 2023 03:33:39 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D992D30F0
        for <linux-mips@vger.kernel.org>; Thu, 17 Aug 2023 00:33:17 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so1316972a12.1
        for <linux-mips@vger.kernel.org>; Thu, 17 Aug 2023 00:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692257596; x=1692862396;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XqVwwc2dDlYlCMTarZ/PjmKE+CsteLytpeFTL+9lo0M=;
        b=F4UrenxJRzj7RIgGu2RAZ2FUbmJEF38qgllIOTjkWb91A+EGbBRBvbhHqKxIO/AeNe
         ff4+SIOxVHNabjcg7l5TwiX0NWBzieVdmlblIxPBlK0tY01TSyLib+9qnr2FnWt66sXZ
         Ir7tJSfIR4U2c6qGCHcDZt7br1mzXyUdZM2BKRwvU3dv2PNOesfmlqTM6uJCvbzmf7DQ
         /BQmQ2DmlmTrOy3n3WQLJj3lRTTEEqdsco+uzM60FV6tRtGpOrx4fUryqA+4w6F4oUt5
         /mhOH7g/8a4pwXNbvv1PpfHTnJH1zcitg5hU892GdkgYp8jALVFToAUGlI5ExSdF6Tzl
         Djkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692257596; x=1692862396;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XqVwwc2dDlYlCMTarZ/PjmKE+CsteLytpeFTL+9lo0M=;
        b=Ij7w1VTZgDXZ1QX2Jo3sIVX4W1oRK97n/mQvGFmhEGIMW7ElEa7/7FgdXlfEHe/eGg
         4ZRhWhbNc2YQJ2qJdVX1x/2mFciloXyaYrEFHSFr7vLSfNnWrgVfm4lp99EWcKFOu+H4
         30bj6SKVys8l0fsOhPNzUPjjRUajh5iUMlDJnFldi4hUiHNy1yPzTJoyThrbAyhLvqB2
         glzXdAJ+DOcD6/aIIwKtXZPDb3NbPfj1YewY4X7oAPO07xWAXdR7P71k5RwJsmglX/nF
         6tA++PisfFMY8j+zwYtw0YWXbEafUtRXo+d4o/PyUnLsMaoJjaAq4/5/LlzL/kS7xsm0
         6i5A==
X-Gm-Message-State: AOJu0YzLpU5zfSgEyr63463ro2vg4IsebVSITWAF5h2Ax7c160J03c9I
        M4/aBFkIFCrLP/PK6/bOEIfCXQ==
X-Google-Smtp-Source: AGHT+IFghrFx0zxJbJiB3SRR94OfeZeGqRzD/iYhIlcu/DnH8WCxmeY5R8S/g/7SDRhGfDDg6uwxBg==
X-Received: by 2002:a05:6402:40c8:b0:522:b9ae:db3c with SMTP id z8-20020a05640240c800b00522b9aedb3cmr2223766edb.6.1692257595980;
        Thu, 17 Aug 2023 00:33:15 -0700 (PDT)
Received: from [192.168.69.115] (mek33-h02-176-184-23-56.dsl.sta.abo.bbox.fr. [176.184.23.56])
        by smtp.gmail.com with ESMTPSA id k15-20020a05640212cf00b00521f4ee396fsm9365410edx.12.2023.08.17.00.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 00:33:15 -0700 (PDT)
Message-ID: <f7230276-decf-2248-52b2-c2de4a13647c@linaro.org>
Date:   Thu, 17 Aug 2023 09:33:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v2 3/4] arch/mips/configs/*_defconfig cleanup
Content-Language: en-US
To:     Trevor Woerner <twoerner@gmail.com>, linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20230817025942.3209-1-twoerner@gmail.com>
 <20230817025942.3209-4-twoerner@gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230817025942.3209-4-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Trevor,

On 17/8/23 04:59, Trevor Woerner wrote:
> Drop CONFIG_IP_NF_TARGET_CLUSTERIP from any remaining mips defconfigs as it
> was removed in commit 57f8e00d8a82 ("usb: 71 musb: Drop old unused am35x
> glue layer").

How 57f8e00d8a82 is related? Do you mean commit 9db5d918e2c0
("netfilter: ip_tables: remove clusterip target")?

> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>   arch/mips/configs/ip22_defconfig        | 1 -
>   arch/mips/configs/malta_defconfig       | 1 -
>   arch/mips/configs/malta_kvm_defconfig   | 1 -
>   arch/mips/configs/maltaup_xpa_defconfig | 1 -
>   arch/mips/configs/rm200_defconfig       | 1 -
>   5 files changed, 5 deletions(-)
> 
> diff --git a/arch/mips/configs/ip22_defconfig b/arch/mips/configs/ip22_defconfig
> index 44821f497261..dc49b09d492b 100644
> --- a/arch/mips/configs/ip22_defconfig
> +++ b/arch/mips/configs/ip22_defconfig
> @@ -127,7 +127,6 @@ CONFIG_IP_NF_MATCH_TTL=m
>   CONFIG_IP_NF_FILTER=m
>   CONFIG_IP_NF_TARGET_REJECT=m
>   CONFIG_IP_NF_MANGLE=m
> -CONFIG_IP_NF_TARGET_CLUSTERIP=m
>   CONFIG_IP_NF_TARGET_ECN=m
>   CONFIG_IP_NF_TARGET_TTL=m
>   CONFIG_IP_NF_RAW=m

