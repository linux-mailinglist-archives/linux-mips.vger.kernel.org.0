Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F10FB4214BA
	for <lists+linux-mips@lfdr.de>; Mon,  4 Oct 2021 19:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235584AbhJDRF7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Oct 2021 13:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235119AbhJDRF7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Oct 2021 13:05:59 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E307C061745;
        Mon,  4 Oct 2021 10:04:10 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id k23so1136780pji.0;
        Mon, 04 Oct 2021 10:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KSk5l7mdzrJfPwPq7PQoSfM6i1dcNInCldcD7w5Rhdg=;
        b=HGFVHIsP+6R7wNek89B8ROjD5hstgjgoRRaOyjwS+rFGdiVJR4bVDZIr37pdCr1W/2
         POTGQZZ0OE1qFVt3G6N3de0DusfCSq35asGHmPmheySNYkxSrFRNfUupa1kijPRGkIsL
         0BIwWFutc383PQI5ZmLcpcUukuc02k0LRz8kEgkPvmvbwiujTAUxTGlLh4p/KS1mLhVk
         HdV6amOFNGB0MyM6d5XGm8EVj3q9aGwMiYy1Cp4jYJxJRoJIlINOS4jIJFOFQVaXO5hW
         IgzkVqPA74KQhS9n3EmSSQeDMO2dztCsucVj0nvr5IemLBOIa5CJQW/P6+N0o/86kYEU
         05kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KSk5l7mdzrJfPwPq7PQoSfM6i1dcNInCldcD7w5Rhdg=;
        b=1eb4+f0I30NQMY5nSfJmxrD2hvXehPCFLqZ/YU0mXH6HXCinTo1RGQmwll59AT6ycA
         jQeNHlhN4BxMC4oVEUh9tjKoxj0VQIeiQ0HSLd3lpLq0uCSDpvlCjieh5IeJsUP16Z1c
         XRl/jX6XhdVsj4iFV+3Q2GfQQ2XzRcTp7muo5/wX9hSceI1BTCDOLelVjUSbBFOb0B/9
         m3nQFrlmPs5dpx2a/aUFfuNmbpDWfvusL4CWEy+8Ao+Uy6uvzXVl84xLuWsrKiDQMBIe
         MdL14GSGCaWV1oCNXykJV1W24I6cCkKsjc5SkOMqrcuRNtDJgfNMpFiIGXlXX+V1L+K0
         Rmeg==
X-Gm-Message-State: AOAM530tn25GJhXXD+FnBiWgRf/IAdBDGb5FgrgboPCOzf/0UX3rvgBy
        jgeJCqp2AcDmspfCx3efS67bukmjqe0=
X-Google-Smtp-Source: ABdhPJyBBa5NckhrG5G/+VSSniHL/ROk9PH0Mj2W/GCzuQPGAcdVL4ZkZJerflFTZv1PzFVavFO87Q==
X-Received: by 2002:a17:90a:86:: with SMTP id a6mr37401886pja.190.1633367049126;
        Mon, 04 Oct 2021 10:04:09 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id z24sm15839126pgu.54.2021.10.04.10.04.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 10:04:08 -0700 (PDT)
Subject: Re: [PATCH v3 00/14] Modular Broadcom irqchip drivers
To:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "moderated list:ARM SUB-ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>
References: <20210928182139.652896-1-f.fainelli@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <c49d51d0-bb17-8e0d-4181-1eb93a2ae787@gmail.com>
Date:   Mon, 4 Oct 2021 10:03:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928182139.652896-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 9/28/21 11:21 AM, Florian Fainelli wrote:
> Hi Thomas, Marc,
> 
> This patch series aims at allowing the 3 interrupt controller drivers
> used on Broadcom STB platforms to be built as modules in order for those
> to be shipped in a GKI enabled system (Android).
> 
> The irq-bcm7038-l1 requires us to export a number of symbols, which is
> not great, but there are not obvious solutions other than adding
> accessor functions to get the same information.
> 
> Assuming you are happy with the changes though, please do take the last
> two changes as well through your tree.
> 
> Thanks!

I will be re-submitting a v4 with the Acked-by from Thomas on patch 1,
and the Reviewed-by from Rob on patch 9 along with the update he
proposed to the qcom-pdc driver. Finally, I will take Sergey's update as
well on patch 14.
-- 
Florian
