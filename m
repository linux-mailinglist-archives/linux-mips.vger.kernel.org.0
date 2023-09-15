Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7537A1FE3
	for <lists+linux-mips@lfdr.de>; Fri, 15 Sep 2023 15:35:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235330AbjIONfQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Sep 2023 09:35:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235229AbjIONfP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 15 Sep 2023 09:35:15 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A850810D
        for <linux-mips@vger.kernel.org>; Fri, 15 Sep 2023 06:35:10 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-403012f27e1so22350555e9.1
        for <linux-mips@vger.kernel.org>; Fri, 15 Sep 2023 06:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694784909; x=1695389709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ruK0QLZl8vsq9zufotofxg/Umh6XaihjuTLxziFd4os=;
        b=VPooinWXzzJjYBUZ5NUB+3302o+M8q6Rq9ahr02XtzP5EE4kNi/32ncOLFMOu9NrgJ
         ZPW8JLGffyUKxyw2AtjW3OotYq2q7Xdpev7gwPPrs3Kvhj72ntdLZp5ZPYENmTf6JbwZ
         asK6NC2xMpI+1hGhgbaeTBVyniTnWSarYXarx6gbplOaMNoL3IGBChA53jHwmSSmi4VY
         gUFu5UgOiWzCc+iK6jycE2Oob1zwUmjK/NzXrlq2PNOfeih4VVcEMY50aPGF3a9LfJK4
         B+M0s9+r4yaRwc12D+RVcm4Ue1VULNkKlkA7MOvH0g03XW1UjC0PXC1JJs5DAAPCp1U+
         xmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694784909; x=1695389709;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ruK0QLZl8vsq9zufotofxg/Umh6XaihjuTLxziFd4os=;
        b=NBFoBR6Tc1rjKhJlArNfgx7T43piKWG9xRQgJHHbdYiGqdADDlFHUvhTdgvQ48fo0m
         FZqUfWTJMMW1a9iEw9zeHu7k6XOWriT4+++eVu+ZSGld6/hfczsCAxy6a7/CgPfkJFOy
         jeG28BzQh3A5vKEyOa8W+Cn+KHjmUigaUIjmMb6FUI4o77papbweGAK1ZEY/SZkmc/hW
         IHDUoos8OViHeSnvKilz7n74/A2viKg93N0vphjTrTp3Sk23T88CfN4vG7bwEh7eXfVP
         K0Fu44YVNPfzO9dF0pbj5KjTMun64c6mpVN6xoRtOD++TgBHoCeXWRExxQ6y9U9RFzA4
         N3Zw==
X-Gm-Message-State: AOJu0YztM/3lbPkWYEgXqfjdos/tLvhrQC5NBYS0UzQaKZecqFK9TNjF
        0KmOGtUC1Kxl/PGVgOcG/PQkfw==
X-Google-Smtp-Source: AGHT+IGykTRu/0pm9CX6voeQPOq7p7Yo37M4Yup5/8QdFeHB4KcXUOqbrtJDitKbHlpONyY3t/EgGw==
X-Received: by 2002:a05:600c:209:b0:3fe:fc0f:52e2 with SMTP id 9-20020a05600c020900b003fefc0f52e2mr1612389wmi.37.1694784909099;
        Fri, 15 Sep 2023 06:35:09 -0700 (PDT)
Received: from [192.168.69.115] (6lp61-h01-176-171-209-234.dsl.sta.abo.bbox.fr. [176.171.209.234])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c22d100b003fee0741b8csm7518047wmg.23.2023.09.15.06.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 06:35:08 -0700 (PDT)
Message-ID: <19e21e8c-95ea-362d-1ead-9369c211dba2@linaro.org>
Date:   Fri, 15 Sep 2023 15:35:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v3 3/3] MIPS: Simplify malta_defconfig
Content-Language: en-US
To:     Yuan Tan <tanyuan@tinylab.org>, tsbogend@alpha.franken.de,
        42.hyeyoo@gmail.com
Cc:     linux-mips@vger.kernel.org, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, falcon@tinylab.org, w@1wt.eu,
        linux@weissschuh.net
References: <cover.1694680448.git.tanyuan@tinylab.org>
 <4d946232ffdd8891a32d4a9f17dbca10a4aa465d.1694680448.git.tanyuan@tinylab.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <4d946232ffdd8891a32d4a9f17dbca10a4aa465d.1694680448.git.tanyuan@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 14/9/23 10:44, Yuan Tan wrote:
> Simplify malta_defconfig with POWER_RESET dependences.
> 
> Regenerate malta_defconfig with 'make savedefconfig'.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
> ---
>   arch/mips/configs/malta_defconfig | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/mips/configs/malta_defconfig b/arch/mips/configs/malta_defconfig
> index 7ae07d57b79a..99049e993192 100644
> --- a/arch/mips/configs/malta_defconfig
> +++ b/arch/mips/configs/malta_defconfig
> @@ -192,7 +192,6 @@ CONFIG_CFG80211=m
>   CONFIG_MAC80211=m
>   CONFIG_MAC80211_MESH=y
>   CONFIG_RFKILL=m
> -CONFIG_PCI=y
>   CONFIG_DEVTMPFS=y
>   CONFIG_CONNECTOR=m
>   CONFIG_MTD=y
> @@ -284,7 +283,6 @@ CONFIG_MOUSE_PS2_ELANTECH=y
>   CONFIG_SERIAL_8250=y
>   CONFIG_SERIAL_8250_CONSOLE=y
>   CONFIG_POWER_RESET=y
> -CONFIG_POWER_RESET_PIIX4_POWEROFF=y
>   CONFIG_POWER_RESET_SYSCON=y
>   # CONFIG_HWMON is not set
>   CONFIG_FB=y

IMHO this should be squashed with the previous patch,
to keep it "atomic", easing reverts or cherry-picks
during backports.
