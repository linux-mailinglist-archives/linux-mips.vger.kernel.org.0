Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7889B755DA4
	for <lists+linux-mips@lfdr.de>; Mon, 17 Jul 2023 09:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbjGQH7p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Jul 2023 03:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229817AbjGQH7f (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Jul 2023 03:59:35 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 482C7FE
        for <linux-mips@vger.kernel.org>; Mon, 17 Jul 2023 00:59:33 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fbd33a57dcso44138955e9.0
        for <linux-mips@vger.kernel.org>; Mon, 17 Jul 2023 00:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689580772; x=1692172772;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f65L06gbFrKHxS83TTCwRU9AqV0nAbAPQwTAVUkVeVo=;
        b=uw6ye23Rqfp3pCqe6MyHbosc/p/RzSBMaSxQ9ewY5hf6BXEScK8uIcJx+AW94HfeQU
         nYxFkQsLJ/loxj7IZwmxFHvQLwD34mob7wOprHNiznQ7eqGXub98q11OiMSGnB/yExCE
         G147PhwhGeHc1auckNTATsWmffu4m3uHcWwskKgDsnFkF7nWZ/xONheRmGpB4yR+iMX8
         Obk83TLRMMlgq25yV/Z11dIJXpPQbraGxSEy743BlPyHIn+n69otB7OMjNM/3/zwKudf
         kKaLE0wkYlKeXj/PU5fZ/QX7bGzRZpWXtqf2vxURDYurW5tkl9FfBDDfD6mxhQxy5ZHc
         HC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689580772; x=1692172772;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f65L06gbFrKHxS83TTCwRU9AqV0nAbAPQwTAVUkVeVo=;
        b=WTn7hiPwtxDu6GnKx5wnSlXwofxsC4aLmVNu8kTOh1wuuQ8FXlvgPqn3OjgANCP413
         BM4KyGfQunTpBs5Lpa8eeRsE87vcXJvBiQEb2VVnidTt3ImoNrIZhEh1MMD+swffUk0D
         bxd2D34GUHRyEjOnro7yOwGwjc34F6zsyXdOrbJvgRL58Qxlp9Qubpuw5OonbysNHUfv
         4+WUbPwt4DjdrNo+61FJp5JNKlmi1j0QGYXnLtRbCXVx4ohwT0RPQC6QVXt5v9OtdGpM
         cuxkRoKl+CMY+LDDVXpAGmlshTYSwl5ofQMgpK/Uhz/TZczIhqWMQlVcMRVFPFD97HNT
         8N0A==
X-Gm-Message-State: ABy/qLaUxX/4/XTTZGS/bYliRkkl/BfDlkagbiQDMCAoCAL+S7EV1KNL
        7fxZu/anQncfDmfe/XoNS8gN2I5NJcWczOI43Gk=
X-Google-Smtp-Source: APBJJlFQlfYBTUFmTBJsxAfm6tlv+4JE29IQG0DVo4gcJYb8veRdJfETc1pWPi57sjh6sN+U7Z5X+A==
X-Received: by 2002:a1c:7502:0:b0:3fb:d81a:8b4 with SMTP id o2-20020a1c7502000000b003fbd81a08b4mr10383228wmc.16.1689580771726;
        Mon, 17 Jul 2023 00:59:31 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.144.39])
        by smtp.gmail.com with ESMTPSA id c22-20020a05600c0ad600b003fc01495383sm7303733wmr.6.2023.07.17.00.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 00:59:31 -0700 (PDT)
Message-ID: <004bd252-ea93-fcb4-84d9-7c58c5417ce4@linaro.org>
Date:   Mon, 17 Jul 2023 09:59:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v4 5/6] usb: dwc3: dwc3-octeon: Dump control register on
 clock init failure
Content-Language: en-US
To:     Ladislav Michl <oss-lists@triops.cz>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org
References: <ZLP7CSUm095ADtdw@lenoch> <ZLP73wvnW8Ke+7RB@lenoch>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZLP73wvnW8Ke+7RB@lenoch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 16/7/23 16:17, Ladislav Michl wrote:
> From: Ladislav Michl <ladis@linux-mips.org>
> 
> It might be interesting to know control register value in case
> clock fails to enable.
> 
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> ---
>   CHANGES:
>   - v4: new patch
> 
>   drivers/usb/dwc3/dwc3-octeon.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

