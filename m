Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B852414FA
	for <lists+linux-mips@lfdr.de>; Tue, 11 Aug 2020 04:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgHKCdv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 10 Aug 2020 22:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgHKCdu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 10 Aug 2020 22:33:50 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56ADDC06174A;
        Mon, 10 Aug 2020 19:33:50 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id m7so10406262qki.12;
        Mon, 10 Aug 2020 19:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7oCC5oUKG+SSG28wXifIp6MPrRleapWysXVZ3T9Urho=;
        b=DXgS/arh9/9yYFYXbDzO0r5dePHSSrRCMD49flNv5AftIZX7HT0X7L78nFJJHIjfZP
         br3hOuGW7HxaL2d7Zf4Jn4bsjSNL4bqz3vZXR0LyX80g7PpWhkJs2rkefgrDhDCYzrE4
         cK6F0MB0DuEFCM8wV84HyNPP95wS3hD9hYE/TXaGyIR3h1egs+Ml8xSiuKScC30Xxz6A
         hajW6cOEfo6E+fnwsZB2VPFCZiKHyTGfRrjinT6BU2NF8yj3iF/GAyPIg1x5f6TD2UMk
         yDGqgan/QgtPZaTO6l1s5/X1n4CC4X+IrvKfRnN9bxQdLc0PJI1yIHaIyuuu3Vrq+U46
         kbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7oCC5oUKG+SSG28wXifIp6MPrRleapWysXVZ3T9Urho=;
        b=opTOpprvHhxzpf4SAQP0uwXFrzhI8JziW74TvLYHwm2RWfyU2CFDinSzcwZxDczWNp
         P4+B3Q/KJc2SlyIFjSlLwOQyb5HmtuWQmqzbPTI1W3CsZkppGphqr/S5s7Vc+pbdy+fl
         Ozpo4uSOXa9FsZ8Vspv3S4kXj//4iZ6Plp/JHq7OPkS4L4J6mxGh4L8Hi2YJqsST04n6
         RvmiQZvgsPVbVu4eeC6MfF74pTFe+5PjOl7fCjBfISnD596hYqC3fSn7OYfUXaHoE49e
         4sGitsCVed4/ZQ9UYxErzcJoazetK9ZWPaPGV+1cRZeVcby3BRNWlEEW3xq9GnnaYqiW
         Yu0A==
X-Gm-Message-State: AOAM531yT2aBtH/+5bSpDzGdrVnm1yZNwMKi3d7+EYPHV1mTE8BVmehw
        cn6aLf8Z3KZyc/C2MfQRppe3vEiO
X-Google-Smtp-Source: ABdhPJwe8UYWaUgrasvpBwhqujStM1uIsyxDOPiwRUmCTDhmkaI80KIECz9rIXCj08klupW2QylnuQ==
X-Received: by 2002:a37:62cf:: with SMTP id w198mr29454919qkb.172.1597113229005;
        Mon, 10 Aug 2020 19:33:49 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id 7sm15235445qky.89.2020.08.10.19.33.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2020 19:33:47 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] MIPS: BCM63xx: enable EHCI for DWV-S0 board
To:     =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200807100411.2904279-1-noltari@gmail.com>
 <20200807100411.2904279-4-noltari@gmail.com>
 <CAAdtpL7+_inNrbDpq_wt1Eo=tU6+e+yYR9ox-BF7bN82HVV5_Q@mail.gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <b1210ef6-36ec-9e3f-e686-a87244ea1c33@gmail.com>
Date:   Mon, 10 Aug 2020 19:33:45 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAdtpL7+_inNrbDpq_wt1Eo=tU6+e+yYR9ox-BF7bN82HVV5_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 8/9/2020 11:49 AM, Philippe Mathieu-Daudé wrote:
> Hi Álvaro,
> 
> On Fri, Aug 7, 2020 at 12:05 PM Álvaro Fernández Rojas
> <noltari@gmail.com> wrote:
>>
>> EHCI and OHCI share the same USB ports. Therefore, if the board has OHCI
>> it should also have EHCI.
> 
> This statement isn't correct. OHCI doesn't imply EHCI...
> (although the opposite is almost always true).
> 
> Now per 6358-PB01-R the bcm6358 indeed has a EHCI controller.
> 
> Do you mind rewording the commit description?

Is not it that a single USB port is used and we need the EHCI controller
active in order for the correct speed negotiation to occur?
-- 
Florian
