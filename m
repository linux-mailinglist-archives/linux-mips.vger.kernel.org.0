Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9F434EF0F
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 19:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232477AbhC3RKg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 13:10:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232400AbhC3RK2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Mar 2021 13:10:28 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7609C061574;
        Tue, 30 Mar 2021 10:10:28 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id g10so6497615plt.8;
        Tue, 30 Mar 2021 10:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=L5BSH6Fc1zfxMGrlUaI9HN5laBUuyjNlDLOWtR8mnqM=;
        b=BI4ixLmc8GxIB6RcpoVzm1e64qgdZ/grRtIdBmmHU9LoT5dmjZGvNZD7Fcmm+dDnEo
         3imZXua8sxCJV4kst806+xUr2zACmuPDyxNaVLJ4KPifbUqTmqJEuVL0GpAE3TOJfHbW
         0Nr/+NXNI33ZHlfKXTqV7wsC340dSCHTVKhfgXyLBJkgE1iXNf2jip4Bj18cvS+lZIOL
         wqzMZLY7rg8OqZeRH3QI4P+/o4Spy9gf+CXaqTUdHpIrDL/v+maFh69ABShr2stT0E1f
         zby2JA8Qwyq0AYYSg1cSMYIrteQYbqytpCO7014QuYOpuiOg47lCPG7jMsN3t4VO0A0R
         KpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L5BSH6Fc1zfxMGrlUaI9HN5laBUuyjNlDLOWtR8mnqM=;
        b=OXl8darI65xvGcirmybXlhhGaiSQgD9+RmIumUYmgJ2vYKDiYZdROhA9hDq0tGh2py
         gd1LqEqcdbbRiv40uwUIltOcDPjj04DGKP/DDKJt8QQUikZ7erz/ykK8TVP7SBRTb8HX
         LyPhTqi1QTpFvDlRASBDzaUbNbtsnr5WOqMGuketJnlEwi6wJX4pb1ZBDzU9mGpkbdRf
         /sl9/yNbGAH7MuE6a23O1rdeI81oynDgCUjB2V/U2GBac6b+3J9gM8gDczvTjSdQiLnU
         j6g/iFw8jx3pc1XwPq27lBOIRNHKiOX25IRl/SKcsgMZIvGuwVCSQAkxvWyU/+HLvKOG
         HjeQ==
X-Gm-Message-State: AOAM5305ecBv8rHw3+Vac7Y80TJs/7KZwm954SY2+oFOJlUWxgu8w/Wd
        z9whBGcOZoUhu9QjC0HNa76Ww5/h4P8=
X-Google-Smtp-Source: ABdhPJzddz4fB/cvY6SN/0kzbyusWxgerQifHYw8ZrQJ0COePpMXLHjdZfYi513ZNw8TCUJkRPdZhg==
X-Received: by 2002:a17:902:e74e:b029:e5:bde4:2b80 with SMTP id p14-20020a170902e74eb02900e5bde42b80mr34548480plf.44.1617124228001;
        Tue, 30 Mar 2021 10:10:28 -0700 (PDT)
Received: from [10.67.49.104] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id z3sm21227934pff.40.2021.03.30.10.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 10:10:27 -0700 (PDT)
Subject: Re: [PATCH v2 4/6] mips: bmips: bcm6362: populate device tree nodes
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
 <20210314164351.24665-5-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <202dda1a-3d56-df99-029f-e2104659fee3@gmail.com>
Date:   Tue, 30 Mar 2021 10:10:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210314164351.24665-5-noltari@gmail.com>
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
> - Add SPI controller.
> - Add HS SPI controller.
> - Add NAND controller.
> - Add USBH PHY.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
