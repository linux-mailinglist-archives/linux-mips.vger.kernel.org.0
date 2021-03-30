Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31B4634EF1D
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 19:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232290AbhC3RNr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 13:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232246AbhC3RNV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Mar 2021 13:13:21 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EDA7C061574;
        Tue, 30 Mar 2021 10:13:20 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id m11so12567213pfc.11;
        Tue, 30 Mar 2021 10:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=d3X1x/FCNLT+rJxM3zgKRNR50HgBF0X9bKYUlx7z/ZA=;
        b=s28D6FuuWIaHh+R0ikMkDjqvvDUniW6yTMHrQwVK0opigd15pPzK1xs7dNH2RQskHV
         1kEkny4Gq8hQj8sB95BcAeSz1d48w+Zt4JiMSvLQe2hOMoqu5dVHqE8jf79g1Z3KmtYC
         cRrEQ7ywqYzsRgPBUoC555z7drnu+MEzvGgMHuqJsWGTXMzct1miqnToS752k/Z0L7St
         IfKU9d/0b4kKWtyK8hsM8qYOnjh7UF6j5X+iy1R+uoIfHhvquNlAQ5W+nmzQAE9crdPx
         VxrkhgMWUWmEwNf+FWxK/9GSIe7U+FpwzolgiZsOVvDxg0/jFZzrfEEAAkqM9KV3pG+E
         LlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d3X1x/FCNLT+rJxM3zgKRNR50HgBF0X9bKYUlx7z/ZA=;
        b=AXUTGFTMdPwZz3+Ik+zyXQ0PTypXEAUvUcpbOSR0uU+gMx2Q7PJkuzoTfdGYcgjp2M
         PvF0mSBQmqWhCpxoTkaHB7RTCKt2wY6j0qTAkIvweP5IC2OOo3kXcDSMiUzeNgNRON9e
         vXl+1CA51OFEN4FQSA25NbI4HwvRWTb8OLaCvHLoKtkvUYo6uOC0MoWW1poYgxFcaTwS
         hMsDOtPcrOtMeSZVRVwe2jDwbICkUme3cnyzjd8351f+NTPf4q9QP+9+GGoZ/2P/glB+
         5H4MtCONcr/w1OtjsRXIDMyLNF5JE85P1GJdjLFopjwiYz4qWP+nbz9VzmmlvsWuncKw
         sS5g==
X-Gm-Message-State: AOAM5322MrGMxGml/h/aS16Ds8omJIYg3O6YGX9ZjK3SNIQbI8kXPnWp
        VNlbtHAmN+0B9SxoJRCixhT5JWzQ4s4=
X-Google-Smtp-Source: ABdhPJyVmTgvXM9LKp5OFhBCESiYhs/eAyUOPcClY8RsOowZaxaZbXTtzU4e187E3qcHn/yrY8VbMQ==
X-Received: by 2002:a65:6557:: with SMTP id a23mr14650053pgw.95.1617124399769;
        Tue, 30 Mar 2021 10:13:19 -0700 (PDT)
Received: from [10.67.49.104] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id w203sm21401905pff.59.2021.03.30.10.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 10:13:19 -0700 (PDT)
Subject: Re: [PATCH v2 6/6] mips: bmips: bcm63268: populate device tree nodes
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        Paul Burton <paulburton@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210314164351.24665-1-noltari@gmail.com>
 <20210314164351.24665-7-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <ef958376-7176-c903-3820-54be98df1080@gmail.com>
Date:   Tue, 30 Mar 2021 10:13:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210314164351.24665-7-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 3/14/21 9:43 AM, Álvaro Fernández Rojas wrote:
> - Rename periph_clk to periph_osc.
> - Rename clkctl to periph_clk.
> - Move syscon-reboot to subnode.
> - Add hsspi-osc clock.
> - Add watchdog.
> - Add HS SPI controller
> - Add NAND controller.
> - Add USBH PHY.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
