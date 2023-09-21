Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 470EC7AA502
	for <lists+linux-mips@lfdr.de>; Fri, 22 Sep 2023 00:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232840AbjIUW10 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Sep 2023 18:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbjIUW1K (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 Sep 2023 18:27:10 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE97A2B63
        for <linux-mips@vger.kernel.org>; Thu, 21 Sep 2023 10:57:50 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-502a4f33440so2256765e87.1
        for <linux-mips@vger.kernel.org>; Thu, 21 Sep 2023 10:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695319069; x=1695923869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IHB7MokjFazEBVZHVWPQWx+ouAjuzlds+fkP2tznoWg=;
        b=SECR0gzOYc+637rtQbh9BOMbbdToAnaNC5nINeQZaXmRHT3NV92Vnt7ElhFQ69vsGR
         +FCXXGuCHQmoDkLLcIR4Z9V2mU5ZZsU37R/OSmkeCRZPV7Cth08LQTX/ZBFY1OeS4sfh
         OYLAqxfv8SEdpAK2lvbnsXFOrNIU689F/+vzeRx45PNNLgibHh2ZkeJ0CxXaQgxDJ+5f
         7bgzem6AjExYDcR+gUfWga6vWb9LCSsxP/X+T9j1IGUsalgyTXxt9DkoIjbC9nsm1BId
         c90mNSOX+1Y7JyB/Fo+bCKuVFGvv6bVddmWupgl0IOZDTDext6QfIpdbNS8tAaR9X/1z
         TcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695319069; x=1695923869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IHB7MokjFazEBVZHVWPQWx+ouAjuzlds+fkP2tznoWg=;
        b=Am5/6SEiFpuha9mIs0rBLuUH2h2PmCID+pmBBMgyahvR1lmsiDgeo5ydNU0cSMpwGQ
         7+muTHjCv6pfik9nRXywP+nsqm4TjBSUqGndSmUBPa2IDjENqQ3leNK4rmKxXZJlGfWm
         7/Q5Ao7Uhq91YvRZGvJT8Vsb832uB5Afdm8Ndft0AlTywS8ZNThHcj4q5IhlT+VZuBtI
         k1eyLHCuPgY37vcxU0J0c0LNxnFAbtOi083XT87DdUkWQXWI4+L5Pg+KakV4XtjRBtRj
         VFbf1fQbldYdJWpOAXQTOqH9AQswF56e6hOPcSvmTUrfsqiMJi8USzEfHB0FFKLryMlx
         DNUQ==
X-Gm-Message-State: AOJu0YwepSnH3g/lp2mU+2WTJlG0f19F2qjBfiR103zJqCrIwAPn3QFk
        1ufXfoWS6vBj350lgTX56HQjD6cOm9+KG1VZRFE=
X-Google-Smtp-Source: AGHT+IGcpjHnDw8LA8Dyh0T2ryjOdihtn8w38po8JoSvFO1h83wyuE62Gs1r8YrosYCllwS5Zi78ew==
X-Received: by 2002:a17:906:109e:b0:9a9:ef41:e5a6 with SMTP id u30-20020a170906109e00b009a9ef41e5a6mr4612465eju.1.1695292568673;
        Thu, 21 Sep 2023 03:36:08 -0700 (PDT)
Received: from [172.20.41.70] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id gv10-20020a170906f10a00b0099cd008c1a4sm825012ejb.136.2023.09.21.03.36.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 03:36:08 -0700 (PDT)
Message-ID: <a86483c4-9ec2-3435-198b-9773379c67be@linaro.org>
Date:   Thu, 21 Sep 2023 12:36:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 1/6] serial: 8250: remove AR7 support
Content-Language: en-US
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mips@vger.kernel.org
Cc:     Jonas Gorski <jonas.gorski@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20230920201035.3445-1-wsa+renesas@sang-engineering.com>
 <20230920201035.3445-2-wsa+renesas@sang-engineering.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230920201035.3445-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Wolfram,

(Adding Andy for commit 54b45ee8bd42 "serial: core: Remove
unused PORT_* definitions").

On 20/9/23 22:10, Wolfram Sang wrote:
> AR7 is going to be removed from the Kernel, so remove its type
> definition from 8250 code. As with previous removals, I checked with
> Debian Code Search that 'PORT_AR7' is not used in userspace.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>   drivers/tty/serial/8250/8250_port.c | 7 -------
>   include/uapi/linux/serial_core.h    | 1 -
>   2 files changed, 8 deletions(-)


> diff --git a/include/uapi/linux/serial_core.h b/include/uapi/linux/serial_core.h
> index add349889d0a..3b51901926f9 100644
> --- a/include/uapi/linux/serial_core.h
> +++ b/include/uapi/linux/serial_core.h
> @@ -32,7 +32,6 @@
>   #define PORT_XSCALE	15
>   #define PORT_RM9000	16	/* PMC-Sierra RM9xxx internal UART */
>   #define PORT_OCTEON	17	/* Cavium OCTEON internal UART */
> -#define PORT_AR7	18	/* Texas Instruments AR7 internal UART */

I'm a bit surprised definitions are removed from the uAPI, isn't
it expected to be very stable? Shouldn't it be better to keep it
defined but modify the comment, mentioning "obsolete" or "deprecated"?

Regards,

Phil.

>   #define PORT_U6_16550A	19	/* ST-Ericsson U6xxx internal UART */
>   #define PORT_TEGRA	20	/* NVIDIA Tegra internal UART */
>   #define PORT_XR17D15X	21	/* Exar XR17D15x UART */

