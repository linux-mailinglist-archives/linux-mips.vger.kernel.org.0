Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58FCC76B63D
	for <lists+linux-mips@lfdr.de>; Tue,  1 Aug 2023 15:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbjHANug (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Aug 2023 09:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbjHANuf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Aug 2023 09:50:35 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CE9AED
        for <linux-mips@vger.kernel.org>; Tue,  1 Aug 2023 06:50:34 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3174aac120aso5224373f8f.2
        for <linux-mips@vger.kernel.org>; Tue, 01 Aug 2023 06:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690897833; x=1691502633;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IJuCqMY/WyVWQqhvhXoSdBwu9Yp8tzubG+TPvAbbNM0=;
        b=jZdycMa2But4VpDOKGfaEG6Ogd98YDBj/OKXqU8rNJrVNpZEcWJJXM96TadK3jl/5j
         uyqQVlJSWpVCHSj5FjcfYLU0le4a5aAGdmPNVp2D16WWhj+R3GtLs/qJoUcC6eqZLwwK
         fvBhSWdCASJ649iMs/nhq9ezosL9o33/dCWt1bAGjTWNbXll68KvYzONgslOCq0o+XvK
         to2zxlbv0YRlVsrC9cFgfa1SUDjmXeiAczOORUCHAU9ckvQBx0eGIuxz3hUfuzZaSE3U
         56FoPO3G4YHJbfQc6IxqP0h+I/MbxCyJPXVi+KgpfPx3zZC8ibcoqS3R5a9SoIr3MqKs
         jVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690897833; x=1691502633;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJuCqMY/WyVWQqhvhXoSdBwu9Yp8tzubG+TPvAbbNM0=;
        b=Uqb+D1Xb+fpvVx3H4n9gmkLvAXzLmkB3Ptld+TIhWLOHDeJWWAA07JlB6E3NtXbXj+
         S6pVMOLEIAXdG2qGYAVqKsp1miSl8OhsB2FUQaqqSiA6TZKQLXjSO6Qmo4HpnuKzBh1h
         kWCAJ9V626qb4Lk+w1zybocwA58cZTHijn4y+FloUPyX6Cu5rXHfa3A/6E6RnqqrFrkA
         fE9k88OtMJEHIk4e8oZG+MozMgrNHryHt5mGalHVbZnYT8gaPg1U2fTp4FcF/PwHxuAl
         /i7APFnteE71Lr53Cf460PxLocd96aZ1ZPPWJBLZnBMLyt+WrVAD8+TAimAO4el/44Bh
         RcGw==
X-Gm-Message-State: ABy/qLaOLfm0waLqktRMyhATITf7QrwWmB+UWCqrsFPwut9Qmngwup/B
        xq4Wg/Oc+XA5Z5Wk93Dv7DSZzA==
X-Google-Smtp-Source: APBJJlHCzwrT2n/ZEY2tClXquSHSfoSTE6jOjV3Csu0wV5bAAfeXLbOigrmSovPQYx1TDbaGYrEEIg==
X-Received: by 2002:a5d:494b:0:b0:317:636b:fcb1 with SMTP id r11-20020a5d494b000000b00317636bfcb1mr2239485wrs.27.1690897832765;
        Tue, 01 Aug 2023 06:50:32 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.174.59])
        by smtp.gmail.com with ESMTPSA id r8-20020adfe688000000b0031434c08bb7sm16073501wrm.105.2023.08.01.06.50.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Aug 2023 06:50:32 -0700 (PDT)
Message-ID: <76e29459-d407-e2d1-c052-c841bfab9474@linaro.org>
Date:   Tue, 1 Aug 2023 15:50:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v5 7/7] usb: dwc3: dwc3-octeon: Add SPDX header and
 copyright
Content-Language: en-US
To:     Ladislav Michl <oss-lists@triops.cz>,
        David Daney <david.daney@fungible.com>
Cc:     linux-mips@vger.kernel.org,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, Liang He <windhl@126.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <ZMd/HzISn0mPsNWt@lenoch> <ZMeAAYx6Z3hlQBNQ@lenoch>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZMeAAYx6Z3hlQBNQ@lenoch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 31/7/23 11:33, Ladislav Michl wrote:
> From: Ladislav Michl <ladis@linux-mips.org>
> 
> Assign copyright to indicate driver rewrite is done for RACOM s.r.o.
> As David no longer works for Marvell (Cavium), I'm to blame for breakage.
> 
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> ---
>   CHANGES:
>   - v2: None
>   - v3: None
>   - v4: Assign copyring to RACOM s.r.o., Mírová 1283, Nové Město na Moravě
>   - v5: None
> 
>   drivers/usb/dwc3/dwc3-octeon.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-octeon.c b/drivers/usb/dwc3/dwc3-octeon.c
> index d578110f7afb..6f47262a117a 100644
> --- a/drivers/usb/dwc3/dwc3-octeon.c
> +++ b/drivers/usb/dwc3/dwc3-octeon.c
> @@ -1,11 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
>   /*
> - * XHCI HCD glue for Cavium Octeon III SOCs.
> + * DWC3 glue for Cavium Octeon III SOCs.
>    *
>    * Copyright (C) 2010-2017 Cavium Networks
> - *
> - * This file is subject to the terms and conditions of the GNU General Public
> - * License.  See the file "COPYING" in the main directory of this archive
> - * for more details.
> + * Copyright (C) 2023 RACOM s.r.o.
>    */
>   
>   #include <linux/bitfield.h>
> @@ -537,6 +535,6 @@ static struct platform_driver dwc3_octeon_driver = {
>   module_platform_driver(dwc3_octeon_driver);
>   
>   MODULE_ALIAS("platform:dwc3-octeon");
> -MODULE_AUTHOR("David Daney <david.daney@cavium.com>");
> +MODULE_AUTHOR("Ladislav Michl <ladis@linux-mips.org>");
>   MODULE_LICENSE("GPL");
>   MODULE_DESCRIPTION("DesignWare USB3 OCTEON III Glue Layer");

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

