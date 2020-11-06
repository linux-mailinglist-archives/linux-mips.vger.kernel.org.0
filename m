Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D15612A9134
	for <lists+linux-mips@lfdr.de>; Fri,  6 Nov 2020 09:24:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgKFIY5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Nov 2020 03:24:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726447AbgKFIY4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Nov 2020 03:24:56 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CDC2C0613CF;
        Fri,  6 Nov 2020 00:24:56 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id v144so700410lfa.13;
        Fri, 06 Nov 2020 00:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UYP35iddIaMkoZd1YlyOIfHup33hDp22BB3c4frWXy0=;
        b=RIKXreLQfPQCv3XE7eqVofzW4L3flinxkd3LI74WnGyJ5z3digeZXVgC+kUW0v5izl
         +CKik/eO4SFcGavw3GCPe7rkgyflAc37d8yb8mxZ0B0CBANtaeSAgYUz/i0tFIYr0wQF
         4X/VkNENNihess+nD1v6kZStIzERBL9yLO36RnaS4BM82+JcS0yIlrUV/Fp6zNF25sUO
         y30QfEI997XXOt+Wx//gOSzEBzAw5xJyOYZK7GyzyLq0dT/FLLafNDRU1MI29NDSpbDF
         58aUxK2Wu27Fh7kLcJi68dZ0qctARSr4llP8Hl/f5Izu/HIuo1w28jOnfcF2ORKBr9Ff
         pptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=UYP35iddIaMkoZd1YlyOIfHup33hDp22BB3c4frWXy0=;
        b=CEaInOcIoUkhZXJVCK2SzcPqzngyPpDC/KO8E1u/t2P6IG0q93R07K8W/CJ8sBTe4m
         J5yhFm828zrfjNcC8dv+2BbYxN9C1fzrk3DKp3toBDMnQFZxUt1fIAo0BYrlnKH6/AkS
         Wh45qqgyxhbf/hf0rqIYF6gKO4/jBhjOtVq6E50WGlMBXsEEqsK5pzDMZzaOHYofHRI7
         FcD4MAPXfoV4ANgHXwwNWoUvZdZdMCYILaUdXBP8XZulLw129D6mNLZb7R/42LKGJiyK
         4l8TmL/gCa8O5EdNPYSKXtpv3NB0DPRChAsDaG2bZCVc1Zv2NQP3ur68EFaMJK1/5j1R
         4XPg==
X-Gm-Message-State: AOAM533QralQ39nQfEQr4fZvis77n+whEcSC+3WRmk+YoAyJjW4mo3y0
        /JkCypZp8PgP+ESsjIQcxyo=
X-Google-Smtp-Source: ABdhPJyOuj0E9VYTPmfhTp7NzPvRTi7AobjrfccJ1r3z8sGiXu+Gpvrn45SyPufinTYr14MA7yITPg==
X-Received: by 2002:ac2:52b9:: with SMTP id r25mr417616lfm.274.1604651094952;
        Fri, 06 Nov 2020 00:24:54 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:283:c116:6015:e10f:1dc8:3b0? ([2a00:1fa0:283:c116:6015:e10f:1dc8:3b0])
        by smtp.gmail.com with ESMTPSA id u24sm74728lfq.240.2020.11.06.00.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2020 00:24:54 -0800 (PST)
Subject: Re: [PATCH] MIPS: BMC47xx: fix kconfig dependency bug for BCM47XX_SSB
To:     Necip Fazil Yildiran <fazilyildiran@gmail.com>, hauke@hauke-m.de
Cc:     szajec5@gmail.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, paul@pgazz.com, jeho@cs.utexas.edu
References: <20201104164126.36399-1-fazilyildiran@gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <547e42cd-f39b-1128-4836-82891dd770d1@gmail.com>
Date:   Fri, 6 Nov 2020 11:24:41 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201104164126.36399-1-fazilyildiran@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 04.11.2020 19:41, Necip Fazil Yildiran wrote:

> When BCM47XX_SSB is enabled and SSB_PCIHOST is disabled, it results in the
> following Kbuild warning:
> 
> WARNING: unmet direct dependencies detected for SSB_B43_PCI_BRIDGE
>    Depends on [n]: SSB [=y] && SSB_PCIHOST [=n]
>    Selected by [y]:
>    - BCM47XX_SSB [=y] && BCM47XX [=y] && PCI [=y]
> 
> The reason is that BCM47XX_SSB selects SSB_B43_PCI_BRIDGE without
> depending on or selecting SSB_PCIHOST while SSB_B43_PCI_BRIDGE depends on
> SSB_PCIHOST. This can also fail building the kernel as demonstrated in a
> bug report.
> 
> Honor the kconfig dependency to remove unmet direct dependency warnings
> and avoid any potential build failures.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=210051

    Isn't that tag supposed to be used for the patch mail itself? At least
that's what I'm seeing in the USB patches where it points to the msg with
a patch...

> Signed-off-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>
[...]

MBR, Sergei
