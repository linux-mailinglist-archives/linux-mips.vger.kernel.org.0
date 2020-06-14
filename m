Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDA3B1F86CA
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jun 2020 06:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725385AbgFNEqJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Jun 2020 00:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbgFNEqJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Jun 2020 00:46:09 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09824C03E96F;
        Sat, 13 Jun 2020 21:46:09 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id n9so5445062plk.1;
        Sat, 13 Jun 2020 21:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=5w0Ptkm8JDLtwWEyeAb5D9HFETqA5YXjnTeDKjEageI=;
        b=HrvDVJb4BKUvi/kxM5uMN40AJAt2chnBipHT+iDPUQ9sJ/uBgSdyxCdfyZM8AV3uNr
         9GbPBunGD5mN4Ed8lrseSLY+hUdXbvO9zjRhthqrZ4mLNN4mgP7bv8Um5ayvFhEZQaOY
         XCjypnJs/qgX/ux6Wy7H32nOALnp2ZKRtmvspZp/SQfFj23MCrJMPaf8pC3+SiYPqHuQ
         7wpRIQIZZiN94i85JyzxVioscQkJqj/4AYBczZdU5BiK6/A3Hd9Xoe60WYQrTazVQgrI
         /lwuL7irPtAwWzDesbnSzRBUy2wxFx9Q4DxeoQg+ItiOMHldrG+Hj6ec0yKvVe9Om1XV
         iEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5w0Ptkm8JDLtwWEyeAb5D9HFETqA5YXjnTeDKjEageI=;
        b=OfkPSHhP1Kw7x2F52nT+toMgDt9BWzcsvmauVw25TmCY64FISItjtI9UO40oL3d1mt
         7oKcRbG5/wPQ36zYYUSh5xlV0sWXToo33iSRdnn35vEfVMwYbkdCukbLMC1UG/q4wRCg
         Mdj+bATDW5cfwfg8rS2oVWE3O3x5aBx1NZepWt3e/F37XYxebHWwFMMUYW2lXS8D2VM2
         rzIbA7ugS99ulPISSFLn5/NpFSwFlM9OnzeSFXxEHMEY0wraT6LrFpNRZjNvAtPUAEcR
         u/b8IQb7brUak5s+08ujTNqK5+s9EDoP0doYWXQX8XsK97szmJD0a5eMktryVOU2pCo4
         1+pQ==
X-Gm-Message-State: AOAM530TEZeLk09c8mNuSIT5xsHw1XKNCIYGlfP5U263pevSfqdHPzba
        7k2IuWwl6cWxiPxTofJwoPdE8vHT
X-Google-Smtp-Source: ABdhPJwYCh4fyMcyTTI5dN+w4zq8nHcsRMR3cegFAe7BgLZMQBfHbzV7Fm1+9KcDXKkpRUc8UUXEkg==
X-Received: by 2002:a17:902:704a:: with SMTP id h10mr17002044plt.85.1592109968571;
        Sat, 13 Jun 2020 21:46:08 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id y26sm10346769pff.26.2020.06.13.21.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2020 21:46:07 -0700 (PDT)
Subject: Re: [PATCH v4 3/9] mips: bmips: add BCM6362 power domain definitions
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200610171630.465579-1-noltari@gmail.com>
 <20200613082140.2009461-1-noltari@gmail.com>
 <20200613082140.2009461-4-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <a8ee054d-26d7-d1c3-bb1b-c8f88d333f1d@gmail.com>
Date:   Sat, 13 Jun 2020 21:46:05 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200613082140.2009461-4-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/13/2020 1:21 AM, Álvaro Fernández Rojas wrote:
> BCM6362 SoCs have a power domain controller to enable/disable certain
> components in order to save power.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Florian Fainelli <F.fainelli@gmail.com>
-- 
Florian
