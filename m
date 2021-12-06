Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 194244691B1
	for <lists+linux-mips@lfdr.de>; Mon,  6 Dec 2021 09:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239568AbhLFIr6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Dec 2021 03:47:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236613AbhLFIr4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Dec 2021 03:47:56 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44250C061746
        for <linux-mips@vger.kernel.org>; Mon,  6 Dec 2021 00:44:28 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id i5so20859656wrb.2
        for <linux-mips@vger.kernel.org>; Mon, 06 Dec 2021 00:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=c71WbK2hWipjWDhnoEstjaZn6DeXwY8N97KpaOA+PN8=;
        b=ciTIHiE1pZGCwWvFT+xHOFeN/6SXNBUuEIOnvM1gF9eOgSFghMrj6Zf6DUraxNpQYg
         /IUJGi7EiuDbtzZNPSldYNhPoGZ6egcVtXFIhHJj05eqEltOPverfJ3irExAHdZ3OHjv
         boXLhZZze6HPlNMCJoKmViO/Ns9jpNftAeLCCQZi1gYLBW3tlj6BCPgRKOaxGVCIfzUH
         SCqDAaqWqcKcTqx1FHqbPalE2jWYHkH4FGMsjUay8ACiSpRttM+Kk8OV0veGnRCa0BH6
         7vnHCyofuB1vrPcZGD8xePjckuyuXMSVekuYteywPVjHn9Aq8SerY5nZK5pkkoHh+7Zs
         rZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=c71WbK2hWipjWDhnoEstjaZn6DeXwY8N97KpaOA+PN8=;
        b=SpMijXjmsEj1JO3c7SgOUhhr61a80E16hv+5b0xvD5lGERArQVYhxuxxr5WVSXXWRu
         abLB8mOMVUn5kHhjyqJksDOuarpu+xib311d6HsMXWOy8iB0NfiwFDNgrxfzewwiuLe0
         OwHCOz06PB+qqDWhV0Q6gn5wu+hMfb/m4DuSWj2zwWlIWmEMJ25SCRP2T0++E7pYGNqy
         Exf9qv/txU1zB64qeOEfyKrLGX5gTh2eC9RHJLbPkWhpbQEMqWzTFPPT1pKt3W0nP4Rm
         Fg+OVCjOtcmvnb+BfkDR39RI+k5WU8QskqIhtjc5k6M3XqJDO/x9ZeYbkfttjx+zyVS9
         QIHA==
X-Gm-Message-State: AOAM532lNMSsDdZUi9fGo72ePm0e/w3rhXqwSSKmbonzQ+r/I90/p/5H
        QsnjS58S4j8QD9kb0v2gd46iLA==
X-Google-Smtp-Source: ABdhPJyVE/CBg2F0sAj/Kdj4ixBjfohQLT0uodADbk46M95pL7rkpEChYS3q8alJ6mc/P2HuMr1KrA==
X-Received: by 2002:a5d:618f:: with SMTP id j15mr41190354wru.506.1638780266880;
        Mon, 06 Dec 2021 00:44:26 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id m20sm13985538wmq.11.2021.12.06.00.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 00:44:26 -0800 (PST)
Date:   Mon, 6 Dec 2021 08:44:25 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V4 RESEND 1/2] dt-bindings: watchdog: convert Broadcom's
 WDT to the json-schema
Message-ID: <Ya3NaVKf1NRc8rrx@google.com>
References: <20211115055354.6089-1-zajec5@gmail.com>
 <78eba629-b0cf-e1db-df73-2b33fb0b4929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78eba629-b0cf-e1db-df73-2b33fb0b4929@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 06 Dec 2021, Rafał Miłecki wrote:

> Wim, Lee,
> 
> On 15.11.2021 06:53, Rafał Miłecki wrote:
> > From: Rafał Miłecki <rafal@milecki.pl>
> > 
> > This helps validating DTS files.
> > 
> > Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> > Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> 
> I'm not familiar with handling multi-subsystem patchsets (here: watchdog
> & MFD).
> 
> Please kindly let me know: how to proceed with this patchset now to get
> it queued for Linus?

What is the requirement for these to be merged together?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
