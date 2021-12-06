Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5010D46A53B
	for <lists+linux-mips@lfdr.de>; Mon,  6 Dec 2021 19:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347949AbhLFS7Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Dec 2021 13:59:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348048AbhLFS7X (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Dec 2021 13:59:23 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 761E7C0613F8
        for <linux-mips@vger.kernel.org>; Mon,  6 Dec 2021 10:55:54 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id i5so24512746wrb.2
        for <linux-mips@vger.kernel.org>; Mon, 06 Dec 2021 10:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=c7JO9Dj0O0LDeoTihsch4OXOMF3QUV6Izzupq0mmt1s=;
        b=MHA4Ri/WcwFC5ZfudOp6IS43arM5CcM/eMRLq+JM6JXx0OUffB+/sBx98C9JiklXik
         KCxPXZ/nefyMknUA7FnO24lyHqeZP+DbJ/j/GgKyLsNM+n34txEAGoiXQbBBmKr98nqP
         CworzmJjAFUOcGVmPCVp1WlDZQLrkoLp5F25ErI2RRzKj1GDvyFw4jPUEaV/KjeipYfx
         W42qjQ8VcE6brsfbvQuJbGogaJ+Dvb8IypClInB5ZQGIbMh7p9Sn8qu+5UCnwqWm11sN
         nimNjhXWIZq4OYW+Ataj/SXi2X+aYe/0+zsK9qShsrDaQhblqTbaDTLJzXXrWaaSaEkm
         uCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=c7JO9Dj0O0LDeoTihsch4OXOMF3QUV6Izzupq0mmt1s=;
        b=YFkDc8i5/beftQgnOjbXJnsjk47N7Fi2FHUV44th8xspzJJtT6g7WhlxWvFxaWyXyc
         cq1SGTPgHHO/VNL8Lx5K56cPF34dQevK99Y4OaAXMZ7HKbut0BA5DVyl4Ycf+71NKjiI
         +4W3slF7U2/mWvLtvlHNgqmpp7e6ytX0NdJEXH97vXQQ38LkfwldcqasOxkLwnvB7LKt
         d3tkF8QcI3i28CejCHtUCThavilbYlKofSY+12AORQl2BU+NjNzgYZgjoeYbdPmmabNh
         g84xreOwDDZcUvKplOtfClPiQpqaoQkpIbICbeoPWRxpp6Qj/1rvxq7J+hJ+CYXip+Uo
         jIVg==
X-Gm-Message-State: AOAM532dA/40WSAQpzSBbAg/OJChbh4a1JKikMppA/sGMK+b7wEPDwIo
        JmZPAhEYBWmnLHWMQmF1j2A28w==
X-Google-Smtp-Source: ABdhPJwdSc7QWeoPK3ekFd+pcsQektg4yOANVuN/d4htXpRTnQDxSO0CP2vPMSHCtlM/1PqkluTacQ==
X-Received: by 2002:a5d:6e82:: with SMTP id k2mr45168678wrz.147.1638816952866;
        Mon, 06 Dec 2021 10:55:52 -0800 (PST)
Received: from google.com ([2.31.167.18])
        by smtp.gmail.com with ESMTPSA id t8sm12305359wrv.30.2021.12.06.10.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 10:55:52 -0800 (PST)
Date:   Mon, 6 Dec 2021 18:55:50 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
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
Message-ID: <Ya5ctkIU+jNzDfBc@google.com>
References: <20211115055354.6089-1-zajec5@gmail.com>
 <78eba629-b0cf-e1db-df73-2b33fb0b4929@gmail.com>
 <Ya3NaVKf1NRc8rrx@google.com>
 <89b9512d-2e5e-c23a-d1f2-62172c8f68f7@gmail.com>
 <Ya3SU6U6YT6mlFu8@google.com>
 <f5745952-9e3c-ed7a-cced-ce42d3da2276@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5745952-9e3c-ed7a-cced-ce42d3da2276@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 06 Dec 2021, Florian Fainelli wrote:

> On 12/6/21 1:05 AM, Lee Jones wrote:
> > On Mon, 06 Dec 2021, Rafał Miłecki wrote:
> > 
> >> On 06.12.2021 09:44, Lee Jones wrote:
> >>> On Mon, 06 Dec 2021, Rafał Miłecki wrote:
> >>>> On 15.11.2021 06:53, Rafał Miłecki wrote:
> >>>>> From: Rafał Miłecki <rafal@milecki.pl>
> >>>>>
> >>>>> This helps validating DTS files.
> >>>>>
> >>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> >>>>> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> >>>>> Reviewed-by: Rob Herring <robh@kernel.org>
> >>>>
> >>>> I'm not familiar with handling multi-subsystem patchsets (here: watchdog
> >>>> & MFD).
> >>>>
> >>>> Please kindly let me know: how to proceed with this patchset now to get
> >>>> it queued for Linus?
> >>>
> >>> What is the requirement for these to be merged together?
> >>
> >> If you merge 2/2 without 1/2 then people running "make dt_binding_check"
> >> may see 1 extra warning until both patches meet in Linus's tree.
> >>
> >> So it all comes to how much you care about amount of warnings produced
> >> by "dt_binding_check".
> > 
> > In -next, I don't, but I know Rob gets excited about it.
> > 
> > Rob, what is your final word on this?  Is it a forced requirement for
> > all interconnected document changes to go in together?
> 
> The first patch is queued up in Guenter's watchdog tree here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?h=watchdog-next&id=a5b2ebc8f6e67b5c81023e8bde6b19ff48ffdb02
> 
> and will be submitted to Wim shortly I believe, so I suppose we should
> take patch #2 via Guenter and Wim's tree as well logically.

If that happens, I would like a PR to an immutable branch.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
