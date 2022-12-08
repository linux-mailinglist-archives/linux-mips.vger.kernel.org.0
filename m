Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8FB2647560
	for <lists+linux-mips@lfdr.de>; Thu,  8 Dec 2022 19:09:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbiLHSJk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Dec 2022 13:09:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiLHSJi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Dec 2022 13:09:38 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA570578DC
        for <linux-mips@vger.kernel.org>; Thu,  8 Dec 2022 10:09:37 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id h12so2572020wrv.10
        for <linux-mips@vger.kernel.org>; Thu, 08 Dec 2022 10:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iwl5PjnUNgA1yLI2s2Oe1SRaxVEB0YXbiDz/jtRlLh8=;
        b=NOAkNEwA8C4PvKW5Rg1yX0x+2soYIOq37j0jiNyKe8nXfGprQTqhITTcyfZoC3tsZ2
         ylJeMW+GivmFi1xsQ+HDb0Xs6EHvF3lzogbR98Ij2AD6GkrcslE3RkpkIMzKgJMIYzvM
         XO0b3/hMqhdjzmUP0lM9Lt7huVJCjVJQIIuDReeDdEddzQufylp3UvkKvMDynhJligkc
         aDhQGwH6zCpYQ6ZbpbaL0NONEAQi7AP8Tjgijz+A4CAd45Mane+yUnSVDnSFbQHPcsUO
         0rTJ/7/zuZ62+pp5bi5BIU5vIcTZARa0R2SQU8BKxOCDWXM21WXKEVRT8t7SH//8JHxI
         6dkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iwl5PjnUNgA1yLI2s2Oe1SRaxVEB0YXbiDz/jtRlLh8=;
        b=awoAdNqOweVHLX0A5Vs0EBZgzbCGE9PS94Ao/pZcADRUn8oEagAKQKiLTzSNlxeCE9
         6Ia/53WEM7tu0bxMwOUhTBWknlEnZy7CZFFNEuD70OYXWVo27jvlo0S78KA3dAcdGtPU
         ECnGICMUEIaTZB3O+IK32trF8RTa1+x4TqcammAMMtFDJnBrF64xowpLRGz6OuYK3b6C
         xF54+/d2Sn3sQzphaVClp1I3sIzc5TTA3zBB6gjsEq0vjl8nc3SsCMnQYAu/md1IlWBk
         5vGIl/cXQa4AetDSjytuVwTa85KuhNkVTSE067eWY/YOYlgsj0i6rvDOAbKg7Xt0yhsA
         lRww==
X-Gm-Message-State: ANoB5pk+N23VN6AZWybr4Kipro3b59CJcEYkOISegdV6mu4cZWMj+jML
        KSy8BF360Hh1RZnDN8Jiq84AmHZ7UZw/rq6hNTU=
X-Google-Smtp-Source: AA0mqf5YyP+xEaAXfxjjZoTM1P9/8W2arVO0sk4zVV6MzNeFi9plkgnZ54vNbXV3iUbdr9Yqt5q1Yg==
X-Received: by 2002:a5d:4312:0:b0:241:997a:4f57 with SMTP id h18-20020a5d4312000000b00241997a4f57mr1799888wrq.39.1670522976154;
        Thu, 08 Dec 2022 10:09:36 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id z5-20020adff745000000b002383fc96509sm22441223wrp.47.2022.12.08.10.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 10:09:35 -0800 (PST)
Message-ID: <f2026eb3-4b2e-b837-f4d4-afc7c8f62bfb@linaro.org>
Date:   Thu, 8 Dec 2022 19:09:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] MIPS: OCTEON: warn only once if deprecated link status is
 being used
Content-Language: en-US
To:     Ladislav Michl <oss-lists@triops.cz>, linux-mips@vger.kernel.org
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>
References: <Y5HJxeWqJFK0oWyS@lenoch>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y5HJxeWqJFK0oWyS@lenoch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 8/12/22 12:25, Ladislav Michl wrote:
> From: Ladislav Michl <ladis@linux-mips.org>
> 
> Avoid flooding kernel log with warnings.
> 
> Fixes: 2c0756d306c2 ("MIPS: OCTEON: warn if deprecated link status is being used")
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> ---
>   arch/mips/cavium-octeon/executive/cvmx-helper-board.c | 2 +-
>   arch/mips/cavium-octeon/executive/cvmx-helper.c       | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

