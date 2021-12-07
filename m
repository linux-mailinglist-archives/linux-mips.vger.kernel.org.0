Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36EA246B85A
	for <lists+linux-mips@lfdr.de>; Tue,  7 Dec 2021 11:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234666AbhLGKH3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Dec 2021 05:07:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234637AbhLGKHY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Dec 2021 05:07:24 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9682FC061748
        for <linux-mips@vger.kernel.org>; Tue,  7 Dec 2021 02:03:53 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id d9so28330118wrw.4
        for <linux-mips@vger.kernel.org>; Tue, 07 Dec 2021 02:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=YMXGNl+2STyhxzO3HVuriZuNvccL7QLCPDwSy26sqQI=;
        b=k31XRrWxV+zeine2/5ZK0CSlMZrpZRSLjBrKRrd8jyX0X4uWq2r9UvB5dRWfBQf8ZY
         60uqwiAb3a3oYm+p7qxcQ7aduV8SnLgOx1HUnTV8eE9g1Nd+mkxjXE66XXF32SYBW8PS
         Nwc75fKd6Eb9Ce5MgSETVlJwiCiQ5YXCmLiaIk0QQ1arktl/WSEeDcw56Vn7PH5R9ywW
         ROWWsBa+UqXhS4rvSsg0hnhYU8w0L0RN3N3dWzcdv5K9bVQQufsrhHViiBZdYAQS5cCU
         +1U20lxpF4xmGkGuX1tIix41TwCTY6HP/iEAowkXqiy9dHhe7i/0YDkIl64Dnzlft/ZL
         aTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=YMXGNl+2STyhxzO3HVuriZuNvccL7QLCPDwSy26sqQI=;
        b=NvWlsfOJDIS6WIsSTZUf6pZiXnCqTJ267yNdoRB2wyDjNajQK4ypzF4ucIv27xlPkm
         HMXItsSyBYxx+2ou/WJSgehi8Jipv/DjMiHzGaFejtlGXugMNBnfLT9l9OW3yijun4DO
         UGapCGok4swRlYSAf2eLmKg763VL9cOOeI29H8YMjQ/IWubq+p00/CfYBuLOvNlQirqX
         ObYESiWbC4itebwpv4bJYcoa4RDR0OwRSGr0tvE0hxGVsjl6RGm0iDll8ZKTza9aJp2H
         hNFzeun2dyQLG1ETqR0IsLgVhMp51z5pw9wg5M2eottuN7fGiYttCHiWWUGaY+VloBiW
         MvNw==
X-Gm-Message-State: AOAM531eML3vvjYiBC14hM3BQnfM9J55hFcO2YhlnBkSJoNasWRTqWU0
        lJcDquqcDgPkE7NDi6JNGpSjXQ==
X-Google-Smtp-Source: ABdhPJwYUZnANnjuqYc9L3SYbaNbTuNKVK7/vPDMWrjfEVPdCx7HOqfB+V2StymL2HCWR8V0Rk3J5A==
X-Received: by 2002:a5d:588b:: with SMTP id n11mr49739256wrf.344.1638871432163;
        Tue, 07 Dec 2021 02:03:52 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id c1sm13827383wrt.14.2021.12.07.02.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 02:03:51 -0800 (PST)
Date:   Tue, 7 Dec 2021 10:03:49 +0000
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
Message-ID: <Ya8xhUR5GbTxVE8w@google.com>
References: <Ya3NaVKf1NRc8rrx@google.com>
 <89b9512d-2e5e-c23a-d1f2-62172c8f68f7@gmail.com>
 <Ya3SU6U6YT6mlFu8@google.com>
 <f5745952-9e3c-ed7a-cced-ce42d3da2276@gmail.com>
 <Ya5ctkIU+jNzDfBc@google.com>
 <f4af4971-7047-80c9-69ae-e6587979ecd5@roeck-us.net>
 <e1fa1683-a0a6-8ee0-9da5-8e97dd9c820a@gmail.com>
 <432664af-5660-aaad-bf75-81e4d61cb078@roeck-us.net>
 <46a88b40-6d92-727c-7adc-5723921d08e3@gmail.com>
 <20211206195115.GC3759192@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211206195115.GC3759192@roeck-us.net>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Florian Fainelli wrote:
> I don't see why you should be creating an immutable branch for Lee and
> not simply merge Rafal's "[PATCH V4 RESEND 2/2] dt-bindings: mfd: add
> Broadcom's Timer-Watchdog block" patch with Lee's ack directly. This is
> a new file, so I don't see how it would create conflicts as long as we
> don't pile up changes on top.

Rafał Miłecki wrote:
> would that be OK for you to simply ack 2/2? So Guenter can pick my
> patch without the whole immutable branch & PR thing?                   

Guenter Roeck wrote:
> I don't entirely see the point of that complexity for dt changes,    
> but whatever. Since my tree is not the official watchdog-next tree,  
> that means I can not take the entire series (which goes way beyond   
> the dt changes and also drops the bcm63xx driver). Unless I hear     
> otherwise, I'll drop the series from my tree for the time being      
> and wait for the dt changes to be sorted out.                        

If Rob wants `dt_binding_check` to run cleanly in -next, we have to
treat the DT documentation in the same manner we do for real code
when build dependencies exist between patches.  Simply sucking them up
through a single repo is just dandy until subsequent changes are
required, which unfortunately is often the case.

Being the Maintainer of MFD, which is often the centre point of
cross-subsystems patch sets, I've been bitten by this too many times.
Hence my hesitancy to 'just Ack it and be done'.

I've been pushing back on the requirement for clean `dt_binding_check`
runs in -next for a while and would much prefer to treat it the same
way we do `checkpatch.pl`, whereby a clean run is not a hard
requirement.  Instead it is used as one of many tools to check for
inconsistencies prior to submission (as possibly against patch-sets
once they are posted onto the list).  However, just as we see false
positives in `checkpatch.pl` we should see them in `dt_binding_check`
where patches have simply been applied into different trees and may
lag each other by a week or two.

> It sounded to me like Lee wanted an immutable branch for that

Not exactly, I said:

  "> Suppose we should take patch #2 via [Watchdog] as well.

   If that happens, I would like a PR to an immutable branch."

The alternative is that I take the patch and provide an immutable
branch to you, which I am in a position to do.

Of course all of this hassle just goes away if the clean
`dt_binding_check` run on -next requirement is laxed and we can just
take our own patches without fear of wrath.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
