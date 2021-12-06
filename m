Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F352D46A601
	for <lists+linux-mips@lfdr.de>; Mon,  6 Dec 2021 20:51:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348722AbhLFTyr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Dec 2021 14:54:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348327AbhLFTyr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Dec 2021 14:54:47 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A592C061746;
        Mon,  6 Dec 2021 11:51:18 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id r26so23483985oiw.5;
        Mon, 06 Dec 2021 11:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GpOk1yAja8xkekw3cS+BtU6PU09LvqDcAjEYwaYoBnw=;
        b=XnZUU8pXFkpzsY2cKvTpZQ69FMCok6b0I/YHcBAmBFPr/uJcN3IqeWZ8ClWJCCZX98
         AQacqh2g/uMdA+6TgivYUykhs1bYsnTY7Q42302gmODZaMv44tDLvzpUB/lRtYaWXYr5
         WxOEWnDzy0M4CQdwCf1Pvf4J71l0iIDoNkzli+ZSNu7Oog47Dgd4GV9/W7xC4My7Wbu5
         jRbKFJH3SMeJ/SKwo2CP1FlVlfFYdkIRrqL0Xl4t3IF5Lk81EV/z9DDBLthBgUekG0Ah
         LypeWYIwYAqCkLalqtoemaHI0bV3Y3hzip8XNcg8kvlrj+Y+bFi3ZsX3unPFMeNGCzEA
         cfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=GpOk1yAja8xkekw3cS+BtU6PU09LvqDcAjEYwaYoBnw=;
        b=4HY2AK/wab++yca/+QHrt1qLUjVoHo+gIPKOxxB1JhC+Hqdy2m4OdyJiXTDyQ+QFwj
         CIgCPNo/XPrgRUwaTfYSPH6WDay5HLb5hCKf+veN2movP1rDZL74u061Tlp5SytLOPg2
         Bb5S42Pp+I07eOkYj1u8cBIrLhTzwiBaCHXXhcTBP8HXVYyXoAlXeB8qNWUAGvxYVTD/
         NyfwITAIiSg+TEiKH294jbi9DAxWsj02o+ZZStYkYXDJhqCvNTn5t4LIScJ04K3zfvgh
         NphgkEW/1WxwWCIovqJattgfk23NcWwvDhnFk9c5HDeKip97ocbepVYYZX1gjQqDbYRB
         g3Tg==
X-Gm-Message-State: AOAM532R7gG4g3jIfk2AFuqHMeNJ0UBUr9sjQCXOAjDBY+5LpAIzl76v
        FVBp8C/CfzrYvd3H78hAsFSXDNTGDjo=
X-Google-Smtp-Source: ABdhPJx06t1hDmzxQYZjanZCyYyWBQ3XwQNfDp+aETxk4+ULDI0JvLkNuMzmax3chtKUvWGwk/vPjg==
X-Received: by 2002:a05:6808:1686:: with SMTP id bb6mr748230oib.40.1638820277471;
        Mon, 06 Dec 2021 11:51:17 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e14sm2433650oow.3.2021.12.06.11.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 11:51:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 6 Dec 2021 11:51:15 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
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
Message-ID: <20211206195115.GC3759192@roeck-us.net>
References: <78eba629-b0cf-e1db-df73-2b33fb0b4929@gmail.com>
 <Ya3NaVKf1NRc8rrx@google.com>
 <89b9512d-2e5e-c23a-d1f2-62172c8f68f7@gmail.com>
 <Ya3SU6U6YT6mlFu8@google.com>
 <f5745952-9e3c-ed7a-cced-ce42d3da2276@gmail.com>
 <Ya5ctkIU+jNzDfBc@google.com>
 <f4af4971-7047-80c9-69ae-e6587979ecd5@roeck-us.net>
 <e1fa1683-a0a6-8ee0-9da5-8e97dd9c820a@gmail.com>
 <432664af-5660-aaad-bf75-81e4d61cb078@roeck-us.net>
 <46a88b40-6d92-727c-7adc-5723921d08e3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46a88b40-6d92-727c-7adc-5723921d08e3@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 06, 2021 at 11:43:31AM -0800, Florian Fainelli wrote:
[ ... ]
> > 
> > Your series includes the patch discussed here, and it is the first patch
> > of your series. The second patch in your series depends on it. Are you
> > telling me that I should drop those two patches from your series ?
> 
> No, quite the contrary, I want you to keep the entire 7 patches that
> converted the bcm7038-wdt binding to YAML and get rid of the bcm63xx-wdt
> changes, the branch that you have right now is good in that regard.
> 
> I don't see why you should be creating an immutable branch for Lee and
> not simply merge Rafal's "[PATCH V4 RESEND 2/2] dt-bindings: mfd: add
> Broadcom's Timer-Watchdog block" patch with Lee's ack directly. This is
> a new file, so I don't see how it would create conflicts as long as we
> don't pile up changes on top.

It sounded to me like Lee wanted an immutable branch for that, which I
can't do for watchdog. That means the options are to either drop the dt
changes, or to drop everything until after the dt issues are sorted out.

Guenter
