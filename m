Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B5D46BFB2
	for <lists+linux-mips@lfdr.de>; Tue,  7 Dec 2021 16:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232016AbhLGPsG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Dec 2021 10:48:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239141AbhLGPsF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Dec 2021 10:48:05 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE5CC061748
        for <linux-mips@vger.kernel.org>; Tue,  7 Dec 2021 07:44:35 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id p18so11087121wmq.5
        for <linux-mips@vger.kernel.org>; Tue, 07 Dec 2021 07:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GDbc4h38L7Xqu5Gkd11iZTTBGBAs0PJyND5cTN2uSK4=;
        b=JL1eItc2fbu2q5yOpYsMZm6ITJf67rhjlzwho9wAoBRtevh2CFW5DJdTp2MeeiyK6C
         r2CQyQCk+0gqyEeZvrKZUKIe/HFOqo24k1FrVKvG2OQ9P/GLOVgzmgaQTikWfN6uoNQ6
         s6se+7S04BjNNrw/FpvIZ2W1BRu85ARudjZifAh1mYBAESTJRqJEGFXfN7kzJ3cL4UaF
         1iueBwY5Hqq4jHwbrv2H4IUGrBdmFmBOcpwYSfb5GAV5cIEpGZLMVc+oRVABkSfVGxF7
         O0z/vuAGjeS7XivvcDvrlRGEsLjRBL2A4SvQs4oo0n4X+0rmjgVPVPapblSu8o2g7ImX
         STkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GDbc4h38L7Xqu5Gkd11iZTTBGBAs0PJyND5cTN2uSK4=;
        b=6aFT/0u90OVdHnaDaQZ0F+/kyfjN9Ps2YwHIwvt+5EisEqmWUM8zKispUzwgaJasJf
         oMUYHYKlRkozXNsSRNZgCkorm/giITslEbnNZLBA2qXj+mTq4XT53qtrbHSCJGhk2QUM
         cNvXF5d7ss8dXosSeWM3Kz2tI1Gh0Lc+zQ6sRSx7uLDomEEnNc1fVLI0v2NHgS0LVxDL
         ncnH7rURbRxFxAHocNHeiAtGNilNvSNjVheUSgnmKX3jxiR2LIhpoyutjl22f672aAQ4
         dKKSmCFYP9uK/KM5zoQa0jaUmLzah+kbeim7Puq+GQp4saw9VY/64zFERx18ULw0cLmr
         h4MQ==
X-Gm-Message-State: AOAM533+bKSJdx9CgGIL/eCCIyc02gCrdu+l/riUp6F+uXSBKJdyYfAw
        A3p1z3cffLZtvmUvRyzf4Vw7lakKfITCrw==
X-Google-Smtp-Source: ABdhPJw/ZnhwcGRzecvHHBydUJbGZHREqRCw4qtiHqzsKgHW4meOqCidqlbNDTAow1lOhlUS7zopjw==
X-Received: by 2002:a05:600c:3c91:: with SMTP id bg17mr8111276wmb.80.1638891873696;
        Tue, 07 Dec 2021 07:44:33 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id s8sm86023wra.9.2021.12.07.07.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 07:44:33 -0800 (PST)
Date:   Tue, 7 Dec 2021 15:44:31 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Justin Chen <justinpopo6@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 RESEND 1/2] dt-bindings: watchdog: convert Broadcom's
 WDT to the json-schema
Message-ID: <Ya+BX1X7/YqmfCU8@google.com>
References: <Ya3SU6U6YT6mlFu8@google.com>
 <f5745952-9e3c-ed7a-cced-ce42d3da2276@gmail.com>
 <Ya5ctkIU+jNzDfBc@google.com>
 <f4af4971-7047-80c9-69ae-e6587979ecd5@roeck-us.net>
 <e1fa1683-a0a6-8ee0-9da5-8e97dd9c820a@gmail.com>
 <432664af-5660-aaad-bf75-81e4d61cb078@roeck-us.net>
 <46a88b40-6d92-727c-7adc-5723921d08e3@gmail.com>
 <20211206195115.GC3759192@roeck-us.net>
 <Ya8xhUR5GbTxVE8w@google.com>
 <a86d5998-8d84-7afe-e34e-a632aa890683@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a86d5998-8d84-7afe-e34e-a632aa890683@roeck-us.net>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 07 Dec 2021, Guenter Roeck wrote:

> On 12/7/21 2:03 AM, Lee Jones wrote:
> [ ... ]
> > > It sounded to me like Lee wanted an immutable branch for that
> > 
> > Not exactly, I said:
> > 
> >    "> Suppose we should take patch #2 via [Watchdog] as well.
> > 
> >     If that happens, I would like a PR to an immutable branch."
> > 
> > The alternative is that I take the patch and provide an immutable
> > branch to you, which I am in a position to do.
> > 
> 
> I understand, only I am not in a position to take it since my tree
> isn't the official watchdog-next tree, and it doesn't show up in -next.
> If Wim takes it into the official watchdog-next tree or not would be
> completely up to him.
> 
> I personally don't care if the bindings check is clean in my inofficial
> tree, so maybe this is a non-issue.

That doesn't help, sadly.

I think the best course of action is for Wim to let me know when this
patch makes it into his tree.  I'll take the MFD one at the same time
and the two shall meet in -next.

Honestly, this is all such a faff.

Just to keep a script happy that 3 people care about.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
