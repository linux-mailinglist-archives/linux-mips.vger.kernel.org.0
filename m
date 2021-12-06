Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3B44690F4
	for <lists+linux-mips@lfdr.de>; Mon,  6 Dec 2021 08:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbhLFHyV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Dec 2021 02:54:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbhLFHyV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Dec 2021 02:54:21 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3CA2C0613F8;
        Sun,  5 Dec 2021 23:50:52 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id b40so23149351lfv.10;
        Sun, 05 Dec 2021 23:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=fCwe1VRxK/j7XJ5dJctRw9LHxIMyo7XPy4yY62+18HM=;
        b=M59fRZr90st8qyqqdtOhcn+AdgfXwiHNaC8fHzWC4JfnZLhpSNLlV22S7uXKBT5KAZ
         jwZjtFdLxN6hfqMuwHhI3rNHCxldQOTom5Sry2IcNeYTaMRcy8yBMZMHXMn6e9ZcxQiA
         R2+2OfPFLWHpL8PD69uNI0scxgi9aaf8xqUTPwk4LASAv+uz5C2dnCN97h+Yto1eiQtl
         C3g7PLSRYFm56O97j+AgbvynUubf6sxF89Zn8LO+JmNOHS3VH2T35qeXmy7KV5tFSEza
         PQVq9Vl/Akga0jr9BL2t+EjF+jwA2gyDQyohy2KJXZwfjdazJgbIjhiQcwR6e0r0/Lcf
         SRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fCwe1VRxK/j7XJ5dJctRw9LHxIMyo7XPy4yY62+18HM=;
        b=evFjN8ZV+sIorkpMcu1lNhpmBYB292iom3E67TCtyWMzzoFKRLrC0lVKtE2Ms87r2N
         5TF+VV31HB3S0pR3FuNUmUb/fYZ4nbfD29Gm7Reu+zQPr8opf0pJeWyLlkpfxKTnYbVA
         tug6dPyG/eJo5rEx1qDGEqmJEIJwcSFe5uJedUnKLl0rPbU+fNbTKL8KkFi2mbH+3xEn
         vyRD1LrAsUVlbaromw+iZNfK0AY2BjKYNiWBcuVQijLpFH1scwDll9miFcSTy74fuAn3
         xQ5Zp49akvHqAKc/D11Ok5wZbsn45RP8Q5GeiEZQgN+CVOlJxExOHgLok/BC6t3B+8eo
         FSog==
X-Gm-Message-State: AOAM5312ZmKzEsj6peKo0KpplkIOPf6rmXsXmvOKYff1nJiWfHBc9zmL
        JZhPlKlvAXBmvuJYTq292EH8JjIL2jE=
X-Google-Smtp-Source: ABdhPJy30DijDfK6V0+GXiVjwsnOqx1pZ7NzOnBqwGVGlHmU8bXtBXfqbz4fZYgBdvHIWP2Q8ip6Ww==
X-Received: by 2002:ac2:4c52:: with SMTP id o18mr34063032lfk.372.1638777051090;
        Sun, 05 Dec 2021 23:50:51 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id b6sm1194949ljr.103.2021.12.05.23.50.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Dec 2021 23:50:50 -0800 (PST)
Message-ID: <78eba629-b0cf-e1db-df73-2b33fb0b4929@gmail.com>
Date:   Mon, 6 Dec 2021 08:50:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
Subject: Re: [PATCH V4 RESEND 1/2] dt-bindings: watchdog: convert Broadcom's
 WDT to the json-schema
To:     Lee Jones <lee.jones@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>
References: <20211115055354.6089-1-zajec5@gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20211115055354.6089-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Wim, Lee,

On 15.11.2021 06:53, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

I'm not familiar with handling multi-subsystem patchsets (here: watchdog
& MFD).

Please kindly let me know: how to proceed with this patchset now to get
it queued for Linus?
