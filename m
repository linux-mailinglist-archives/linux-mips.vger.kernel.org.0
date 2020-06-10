Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8879D1F4A92
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 03:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbgFJBD3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 21:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbgFJBD2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 21:03:28 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F13C2C05BD1E;
        Tue,  9 Jun 2020 18:03:27 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t16so274850plo.7;
        Tue, 09 Jun 2020 18:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=NupSQB3mn8qZxA9C+29tXiojSZbrUujAJ11XO4adz54=;
        b=GCQkCdEiNYyzIfE6eQxrZSwuaO0dIWy7eHGXmXA1SdLiERVW7009HeQkYuzacxuYX4
         5AQz6RnVqsww2m5rDmqQX9T9eeXAgxtZMO177JzKUaLejW1r+042Apv5nkmDnFdl00y3
         mjRMTj+Pt3Z945s9Olz5qlPDSI1YODCmX+ehy4RY7y6YKt89EkC/J5LQC+z3T7PEUYbf
         kmi1bh+Vf8C9kQ6IoWA5zG+jR3NXECdz/FF0lgI1cyd6WhtoRtayxHuk2IKv1wF1EYSG
         JJd6iUR5y0dIYsuolvTTifVRh1PDnfjxll5W+I/ZR/8LfachXBsIQfyPd8vEBpa6ngHY
         D1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NupSQB3mn8qZxA9C+29tXiojSZbrUujAJ11XO4adz54=;
        b=tvcYMxM/e/wMROx3Z1Bs154lkVTocZEdFeTWgQwl2tvL9Z0lsP5zg258gIbxqyDy0K
         TbQsbXMThongLVrgWo3SKJ7ktqMh6u3EMVAMBcsUH2FcuFSpUeYsZqDBNw5d+iE4cTm2
         HOgJ5fRtcGPi53tI3t1Qfntq7s7uLEnoOmZPb1vcw+xbCw0cdtXbYXIb3jDVE1sWgIIV
         1aguZn7pv1rGupevwx5mV/o7+IIRpTQntt0K2bGJp1vBL3F/ftNDCDmefGnQx8M4kZe8
         +qMcGt3JZZgL2obePXh99/WdBwP28zFTzi7KLsykPQ+fKyDOqvWdaAl/fqqeqHc7qsaj
         nWpg==
X-Gm-Message-State: AOAM531+MPLtx/jrrD52sgak37TLZ5W2+YBJqhhkyen00po4VaHdK0nP
        iqDpeofDHfGVSftJ+WcRX4E=
X-Google-Smtp-Source: ABdhPJzogdaBaa0lQCLqzIWam/p34pHlSbpfpn+NytAYwVmTCSSIewQgm2rMHf1tgTEBBf+4zrOwtg==
X-Received: by 2002:a17:90a:1aa2:: with SMTP id p31mr501764pjp.227.1591751006221;
        Tue, 09 Jun 2020 18:03:26 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 25sm3571826pjk.50.2020.06.09.18.03.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 18:03:25 -0700 (PDT)
Subject: Re: [PATCH v2 1/7] mips: bmips: select ARCH_HAS_RESET_CONTROLLER
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        p.zabel@pengutronix.de, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
References: <20200609134232.4084718-1-noltari@gmail.com>
 <20200609160244.4139366-1-noltari@gmail.com>
 <20200609160244.4139366-2-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <894c287e-2cde-63ec-d396-7a5fd175da6f@gmail.com>
Date:   Tue, 9 Jun 2020 18:03:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200609160244.4139366-2-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/9/2020 9:02 AM, Álvaro Fernández Rojas wrote:
> This allows to add reset controllers support.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
