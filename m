Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A089A7A1FE0
	for <lists+linux-mips@lfdr.de>; Fri, 15 Sep 2023 15:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235250AbjIONc4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Sep 2023 09:32:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234348AbjIONcz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 15 Sep 2023 09:32:55 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89F0C1FE0
        for <linux-mips@vger.kernel.org>; Fri, 15 Sep 2023 06:32:50 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2bf8b9c5ca0so34164131fa.0
        for <linux-mips@vger.kernel.org>; Fri, 15 Sep 2023 06:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694784769; x=1695389569; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EH3krxykBLViGheBAmECI15DsHYCa+0q5ptgJCLWm9s=;
        b=ZB97HkeJ9/oivle4VQEhSZ38Zm/OIblzEfAbdlaY0CzCkUgmkVm+PhmkZ9eogmysg6
         +CcxU+PZw3oTnsoIvu3X48n/vJLTpjI2/eNpok97TccpqaO3BESSaLle8WcLBq0DMJr4
         lNsgyTCwj46uV2NVOEL3Y8GjbrybF3a5x/u2OquC8ysIEhQEa/WuOCStOrjUMer7zRkX
         UmaPVv4NkFpw4ALijjKKXeLs7QicpiiLvCFtQZxbSl29kSUk1bXrhpDUcOnG7jNwg4zX
         ziNGg28yM5k29TfANlGESD42gJDMyOpOIfNsBKb521TbfrzdijkMu4CU8rK3EkLAvvPD
         2ukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694784769; x=1695389569;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EH3krxykBLViGheBAmECI15DsHYCa+0q5ptgJCLWm9s=;
        b=qahbtxcHf1HfkCm2DiYDSP2vpuwu0ivmZ5FBTMXgx/aACj4SyUYAK6Ns+F6TUrZFZz
         RIVue76MOB2xruI6n7erc5+DhuvhKf2Z9V+tlDIlGjt1xAPlTE00kg/9xX8JkgR9gFgQ
         e6ze0IWj50m/YOHXN9SU9qvrsL+qq03TTavxLKz67sDcS3EGOhSGnsaDanBUQRFgOhxG
         xgHugwcB5fLBDqvldeD6bv84r7tOJRGCPbTJJAZPilk4WYgj1j5kEAVcHKe9Xw0TGgcl
         +yDmtxHoO8HsF8P+2xfTJLXJ8+vHQwBUjlJpXXZMaUvTkuRba5CZ4WD9+OR844631k5Q
         gD6w==
X-Gm-Message-State: AOJu0YwuW2VRK+gICyaXLn636NXPnaY6ju8gkbuxdAz2tfG1xI6Ij8+F
        +W6JKxuJh4M4GvFZlq+qBzELsg==
X-Google-Smtp-Source: AGHT+IELKv5mGywXFFOGHkIDg2uqTAyh4DcYGkaffsd2DsqhfxKNykBdu+A+bvdXZLgt3sdAn4V2zw==
X-Received: by 2002:a05:6512:3b99:b0:500:bf33:3add with SMTP id g25-20020a0565123b9900b00500bf333addmr1869284lfv.47.1694784768784;
        Fri, 15 Sep 2023 06:32:48 -0700 (PDT)
Received: from [192.168.69.115] (6lp61-h01-176-171-209-234.dsl.sta.abo.bbox.fr. [176.171.209.234])
        by smtp.gmail.com with ESMTPSA id g8-20020a50ee08000000b00521d2f7459fsm2251217eds.49.2023.09.15.06.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 06:32:48 -0700 (PDT)
Message-ID: <033ad151-5f63-c7b5-6e0d-daea43786823@linaro.org>
Date:   Fri, 15 Sep 2023 15:32:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v3 1/3] MIPS: Cleanup malta_defconfig
Content-Language: en-US
To:     Yuan Tan <tanyuan@tinylab.org>, tsbogend@alpha.franken.de,
        42.hyeyoo@gmail.com
Cc:     linux-mips@vger.kernel.org, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, falcon@tinylab.org, w@1wt.eu,
        linux@weissschuh.net
References: <cover.1694680448.git.tanyuan@tinylab.org>
 <0b4450f083b612f78207e17499fc6ea6c65c6f3b.1694680448.git.tanyuan@tinylab.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <0b4450f083b612f78207e17499fc6ea6c65c6f3b.1694680448.git.tanyuan@tinylab.org>
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

On 14/9/23 10:43, Yuan Tan wrote:
> Use 'make savedefconfig' to cleanup malta_defconfig.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Yuan Tan <tanyuan@tinylab.org>
> ---
>   arch/mips/configs/malta_defconfig | 39 +++++++------------------------
>   1 file changed, 8 insertions(+), 31 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

