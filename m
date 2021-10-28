Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39CBF43E623
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 18:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbhJ1QeM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 12:34:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbhJ1QeL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Oct 2021 12:34:11 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC1C9C061745;
        Thu, 28 Oct 2021 09:31:44 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id c4so6885391pgv.11;
        Thu, 28 Oct 2021 09:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2qpAsnBxzb0RZo6O+g4/E2Sye48fZtV2IzqgJ/O82Hs=;
        b=FMnNta75QMNAWIGl1B3HdzW6hSck9J6vNSUU8HT02cAterxi27aCSzs2z4GWQ7tUvx
         QgKsZD3l9Z/eG5mw7GOSGW6f/6+ma3wC+HP5EYKE6Wa7WsXWerXdElpYHYTwZisrnmEP
         iLh7EEQWfoW7GMAVsAfS4eZ6HcuRz8SlgXm1X8sOp8y3JoNo4q2kXwFgoHnE00Gnk0d1
         zQeFSIh+iugbMqayQ74zgzUAc0aILr0AkAR10jGFXZYyfBVlATjGlSeZ/1s88NW7/vPB
         cIx13d2U4pfpRy4lwJIekA9xPwzaNNNz96EVm3FGynf8n1VJHszvkSOCze8EWhChze8q
         oVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2qpAsnBxzb0RZo6O+g4/E2Sye48fZtV2IzqgJ/O82Hs=;
        b=bhJWJUDFvCqTQpndT2L6MW9oS4CVhtYakaV2j+vRl86YLCy7qSWnEPBYVE8qXRsxhr
         IG+apOKNEcQEH1kZTVIlQ16wQkEr0W87i/fMCh+JKSBNVv8vYmoGWKOSmEKHxhADxHwU
         EMYwd4B8IO2Ge1rP4WlZooTGGFVTvSsoedVv+GNfmomJDA0n6AcqXzPAn0Bwz95HgctC
         rYY/w25QoshwaSnHfdmiU5pxmSl7ZeODbncOOuL0QFNyBCwTprOFZrtNPw7UjQWs8FRj
         bhxgvl9PnTM7gRyS65tV6Qz8fjd2rEC9OjP7nA5uoA9tr9R8hewqiKAyOrTuNe4NfS/H
         ghFQ==
X-Gm-Message-State: AOAM5332Esx7otXLVfkxRFISJido9wGBdsE+kfF2wIJgPpy5dYN6T04h
        uk10VJPJiXQYekji8zzu48o9jz+NLXw=
X-Google-Smtp-Source: ABdhPJzzDlQaIDcmSkSn3lkrT3w/hge17S7j3EClN7/6pg8UyrZ2MUJ16hZ+JIQ+ZVr3CW3Dl6MZtg==
X-Received: by 2002:aa7:9250:0:b0:44c:27d1:7f0f with SMTP id 16-20020aa79250000000b0044c27d17f0fmr5245275pfp.41.1635438704432;
        Thu, 28 Oct 2021 09:31:44 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id mu11sm10274735pjb.20.2021.10.28.09.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Oct 2021 09:31:43 -0700 (PDT)
Subject: Re: [PATCH 1/3] dt-bindings: watchdog: convert Broadcom's WDT to the
 json-schema
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211028093059.32535-1-zajec5@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <d139ad05-1140-0972-de6f-53e6fa0029ec@gmail.com>
Date:   Thu, 28 Oct 2021 09:31:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028093059.32535-1-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/28/21 2:30 AM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files. While at it also rename it to bcm63xx.
> It's the first SoC with that hardware block and it's a naming schema
> used for other Broadcom blocks. It's common for some (originally)
> bcm63xx blocks to be reused in newer SoCs (like 7038 or 4908).
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

I would prefer you do not rename the binding especially as I am about to
remove the bcm63xx_wdt.c driver, and so having a binding name that sort
of matches the driver names makes it a lot easier to keep all of your
eggs in the same basket. We can argue whether 63xx came before 7xxx in
terms of time line, but that still does not justify the rename IMHO.

I realized that we are missing a 7038 pattern in the MAINTAINERS file
for the BCM7XXX entry, and that will be fixed shortly after sending this
email.

Please add Justin Chen (original author) and myself as maintainers for
this binding.
-- 
Florian
