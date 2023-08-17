Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4977377FB10
	for <lists+linux-mips@lfdr.de>; Thu, 17 Aug 2023 17:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353279AbjHQPoO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 17 Aug 2023 11:44:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353326AbjHQPoD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 17 Aug 2023 11:44:03 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B93530F0
        for <linux-mips@vger.kernel.org>; Thu, 17 Aug 2023 08:44:00 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4ff9121fd29so3166771e87.3
        for <linux-mips@vger.kernel.org>; Thu, 17 Aug 2023 08:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692287038; x=1692891838;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lp1IuZHqWfKCAVZooutFxjvYW2JldAzLdhi3fANGf+o=;
        b=Y7OkJ5kzfBR9aS1o3hbSjWBbpDhDfQvuOJAbLWMeHIdCvYVqIqsch4xPQi6nhKj1sW
         MyG2VLyh2d/VhqbZsXyum3ahPYS8bZD/3vhehfn8OxUL5vrX+3/9cMxCnE5qiSsgyDR/
         fShe46mhdY+NApZpcWsPqTIffnvlvkPtOI+jgn4rIt384WQhvhdi97ih/Ilt5JjDZtjs
         doYEk6M74dQhbXRqKo5cHgm5Sxala+iBlG/zi0HHIrvQSCxfxkgmFC1tMXvlzNgJkmoZ
         rUDnjo4tsPM/cqSjpRMFtA5WxE0YyMxathg7q3nRUgdWs7XXqmVaU3lpDCCDHWNMmo6U
         MjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692287038; x=1692891838;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lp1IuZHqWfKCAVZooutFxjvYW2JldAzLdhi3fANGf+o=;
        b=ehUQLjrz2ZPstwh4T6r70FezSvrYY5JrTxJ2mdvRsY3vfvxdxB4FZZ+TMuz/60zuuf
         PINHUrJidywEdA2DQG0a1bjfyHZXTo1YoFN8Gg+UVEBLRbWTSQTzyutJn046WOAwCn7H
         UjX8MQ6oOYBJI7HprxK5A88FrMRZZtjZ+Ds0J27GuUXRZ4Ooa7GepMb8nvRzo7DEyVaA
         j+Fogk7IjULu6nmbgOZpZAEcr4khwcaNsmwYbUhTQLiCMJkcQvqfqGsyuNE1TBogoKr3
         QKL+bYocbL/oXcQyqfIrcG5p/yNq7KuwWjvXU39rgySn4nYdE34Yfk/NTTDW/NsEXXNy
         Ni5A==
X-Gm-Message-State: AOJu0YxSrMidcu0az9DhbFqkt+2CIlaN7t8j++bZGrJIwCZme9jRr+aW
        4d63OKD6qZ86RJncItAdE/LYsg==
X-Google-Smtp-Source: AGHT+IGo/MkOhuQ87pyBbC2n512LcvZgd8ip292GYtt+yin2/JuZNeICWXDi7cMjkYGQ4p2MIAoVng==
X-Received: by 2002:a2e:241a:0:b0:2b9:df53:4c2a with SMTP id k26-20020a2e241a000000b002b9df534c2amr4656731ljk.20.1692287038600;
        Thu, 17 Aug 2023 08:43:58 -0700 (PDT)
Received: from [192.168.69.115] (mek33-h02-176-184-23-56.dsl.sta.abo.bbox.fr. [176.184.23.56])
        by smtp.gmail.com with ESMTPSA id lj5-20020a170906f9c500b0098d2d219649sm10418014ejb.174.2023.08.17.08.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 08:43:57 -0700 (PDT)
Message-ID: <c608d62f-e3fe-1ead-b0a7-f935fea80702@linaro.org>
Date:   Thu, 17 Aug 2023 17:43:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v3 3/4] arch/mips/configs/*_defconfig cleanup
Content-Language: en-US
To:     Trevor Woerner <twoerner@gmail.com>, linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20230817115017.35663-1-twoerner@gmail.com>
 <20230817115017.35663-4-twoerner@gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230817115017.35663-4-twoerner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 17/8/23 13:50, Trevor Woerner wrote:
> Drop CONFIG_IP_NF_TARGET_CLUSTERIP from any remaining mips defconfigs as it
> was removed in commit 9db5d918e2c0 ("netfilter: ip_tables: remove clusterip
> target").
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>   arch/mips/configs/ip22_defconfig        | 1 -
>   arch/mips/configs/malta_defconfig       | 1 -
>   arch/mips/configs/malta_kvm_defconfig   | 1 -
>   arch/mips/configs/maltaup_xpa_defconfig | 1 -
>   arch/mips/configs/rm200_defconfig       | 1 -
>   5 files changed, 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

