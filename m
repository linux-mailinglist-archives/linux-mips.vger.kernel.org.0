Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5270D3BED99
	for <lists+linux-mips@lfdr.de>; Wed,  7 Jul 2021 19:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231308AbhGGSAh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Jul 2021 14:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhGGSAh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 7 Jul 2021 14:00:37 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F2C6C061574;
        Wed,  7 Jul 2021 10:57:56 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id a18so6069782lfs.10;
        Wed, 07 Jul 2021 10:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YZVtqe4dtfVKhsc5t0kNTYDDPN8aMQmhYzUMMd7LpKo=;
        b=DrNgX9da3Pgd1OAdkWUagFJY4UwGOGlTgjUEPqkpFPOhj/riNTioCHuuKHhuVqY072
         J/r1T+JbbQEuszI/d+1JKm0ulArW0rdv5HwNgIZrcZPNW+sQNq2qCcun3GFEdgTkPn2H
         50G91TpkHm6ghPVO46Ju9G2BsdWdKdswPYcEKs8g1LOTqifvijB6FmSSNWdRVkuzAprv
         5LDoxyb5iFZLzqosm3E4CNC33LvmKxRNLovx/S7n2S8fFo2dbNO/CQBe/zLfst4n8C6H
         mz/JGDDjXjftDbKgiFVl+CE4EuLnV7Is0tGddy6tYw/e5yn6RrYPvazsBTpn/A1JRYQY
         qt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YZVtqe4dtfVKhsc5t0kNTYDDPN8aMQmhYzUMMd7LpKo=;
        b=Y1+/f0dKNEs+NNDDDo+DRC2UwbCp3clzI/Zs+g7V1jTU5Pk3pvA6nOTZkSWIMC6u0u
         odlaJfI2HmEWinZLvMpNXiSfeSgFKIKieMpQIUC/0L2SA+sesrBLLtJCtS2P6Nm0JGwv
         KB5TaGzfHjcGyCObxNIFmDjP2hxLCQmXT5K46jnuQVAZ5NyvtwHE+iDX3yJblfwKZwfq
         i/sopjCnLkFQ00CNP+/uFZIyTjjfZBZQOKokyV8eiDxmgNsNzyATgjQ00xI2roujH0nO
         wnTUXmjU6IhPS3Pz8LnAbfMygfeZpGdYlDP4cE6VR/3L+LX5E/2lIExioSHk5UGhGcEK
         fm4Q==
X-Gm-Message-State: AOAM531uIFdTfL6OtkkuM2P6Evw4SHQKM++Md9YQP0lhB3Kf/R0k782h
        lU8eFvPUTsJrYfV3xtB8g7oJgbuzRLY=
X-Google-Smtp-Source: ABdhPJz3pxUvzvKt1n+ddxDlT3BXBsX/SDkMc7No9ccyi6e5qka6ZCS8nWcDxb6oxONmlme7aOMudQ==
X-Received: by 2002:ac2:532e:: with SMTP id f14mr19439588lfh.103.1625680674396;
        Wed, 07 Jul 2021 10:57:54 -0700 (PDT)
Received: from [192.168.1.102] ([178.176.76.61])
        by smtp.gmail.com with ESMTPSA id g12sm50594ljj.94.2021.07.07.10.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 10:57:54 -0700 (PDT)
Subject: Re: [PATCH v2 5/9] phy: pistachio-usb: Depend on MIPS || COMPILE_TEST
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20210707031552.20166-1-jiaxun.yang@flygoat.com>
 <20210707031552.20166-6-jiaxun.yang@flygoat.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <9e588748-04b3-8399-79c9-23054cce41a1@gmail.com>
Date:   Wed, 7 Jul 2021 20:57:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210707031552.20166-6-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 7/7/21 6:15 AM, Jiaxun Yang wrote:

> So it will be avilable for generic MIPS kenrel.

   Kernel. :-)

> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
[...]

MBR, Sergei
