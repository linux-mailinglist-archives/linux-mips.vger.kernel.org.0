Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A763B34EF01
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 19:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232439AbhC3RJe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 13:09:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232313AbhC3RJW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Mar 2021 13:09:22 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E577C061574;
        Tue, 30 Mar 2021 10:09:22 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id f3so2971962pgv.0;
        Tue, 30 Mar 2021 10:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=sL9bNDuKXHYmKoepsSJVXWaG2nXWGx8Q3zU239iY94o=;
        b=t20Kj4BxJQaDZe9LmRWNVaEYEg/t0nIRhPUfhIRj+n8VPMNnbyLKd9S0RuOtOqsxyn
         TlH8ivpiUJ2nw2KOpLlYW4X9otulGyCzsmovAWhjiYOgAkWl/WCf8mam9d4LZCAOGbvR
         p0NWI2c3CdBq3j2SeJ/5MbgcVznBdaWD4OXZfXDnMuUOYB1A55dS3qqW7qyKsuzKBTBP
         rmXQ8Ry51GSHVXz0aC/9Zd6EXWBybYbe+eB+oB0L2e55nbW6lgDZT5HKqaDkF98dAC/9
         Fq5nx3q6ONDh9jiKDapbPiXe7JoY93un1R0WVjTXW83u1BKZxJx35ygsvtEEAOh3bt3p
         7zQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sL9bNDuKXHYmKoepsSJVXWaG2nXWGx8Q3zU239iY94o=;
        b=Rz5z15z0SnQ+2w/mn0OSJcnJjab0Lg5H59vVST6o4X00Q/km9SdPoGIx9prxpRsDXc
         BzvQC4XTPO8QoHJaNex5IolenWtU9FCLzNTVT5h+tOsBKhhohnTzNLNqFvN8wQ6ZTBFq
         K055stmX9UP9X+bhTnOf1XYUI41OxMzDMCArqt+RXovdoLaF/jQAJ7l1FpJE6PAUW21y
         OgCdNTzmCERL/B61TnBVDRuxaj6Aj9jO9xVwioO+yarjooJ34psPgQD3DI87CvZ51OOy
         YxKaNWmeBxFCTMX+lkF6U8PuNNZqPYUp2s+u7fcZjXdgWjejcoxtIGeX7gujTYd+9HhI
         2W3g==
X-Gm-Message-State: AOAM531Zj/2zJv61fH4bWdE3fm2VnrqLQaW2mSImCkiX2MprTsy3xec3
        TzXk1u+X1z7+B08BXBRcc9pfZ/Q5Iio=
X-Google-Smtp-Source: ABdhPJx838Rcu3KOX6ahsAB38SrhtZtrmoDngwV5tx+o/iUFEq2YWIq8rhole1MzjaIlms/KKT+MrQ==
X-Received: by 2002:aa7:814e:0:b029:20e:f3fa:2900 with SMTP id d14-20020aa7814e0000b029020ef3fa2900mr30551526pfn.62.1617124161591;
        Tue, 30 Mar 2021 10:09:21 -0700 (PDT)
Received: from [10.67.49.104] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id k63sm21509382pfd.48.2021.03.30.10.09.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 10:09:21 -0700 (PDT)
Subject: Re: [PATCH v2 3/6] mips: bmips: bcm6358: populate device tree nodes
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
 <20210314164351.24665-4-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <9b1da888-db09-53e7-6b7b-7265df0583d9@gmail.com>
Date:   Tue, 30 Mar 2021 10:09:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210314164351.24665-4-noltari@gmail.com>
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
> - Add watchdog.
> - Add SPI controller.
> - Add USBH PHY.
> - Add cfi-flash.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
