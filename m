Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D874A3BC191
	for <lists+linux-mips@lfdr.de>; Mon,  5 Jul 2021 18:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbhGEQYi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Jul 2021 12:24:38 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33058 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbhGEQYi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Jul 2021 12:24:38 -0400
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1m0RM8-0004JH-9k
        for linux-mips@vger.kernel.org; Mon, 05 Jul 2021 16:22:00 +0000
Received: by mail-ed1-f70.google.com with SMTP id da21-20020a0564021775b02903997f7760a6so3014328edb.10
        for <linux-mips@vger.kernel.org>; Mon, 05 Jul 2021 09:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sD/y1xlMgbYq3fBjsf0pX1g5M044zHykQS8WXVhlrdI=;
        b=Ww0MK3pdCU7FOpGyIEkk3CsHULIenNtOB5pk+6wKFBZ7pznK7fbSh2I7hExkubAvtL
         sUoe3vNQqMMUr4Iuqvu1V8H/gp9AkyXDAyWPUo3anomxd4Qef5+QrkDU0zSIW244N//y
         LnfmWYeMKPgLOFifIzL0EammDmzgRT5JtshQSI9T6/V6NWE+3IvOjwb+rDUoypqhlpcG
         1mbqLAPbRnW4CtweQy3niCrIafImaRZbJD8EQ8DUqNwcbgSd6zZvrdY0aXV8Te0jHsIg
         xdVqRoGCdmS2teyD1SNj9Z0q/8G6m6VM/AzHLviT1itEq7l7nlh7eoVkSIYSM/+Rn/B6
         R8SQ==
X-Gm-Message-State: AOAM530W+QIebuX+FCxAhYPISYQyzsY7XeBBRfS80x1v+8eUcjt8hLhf
        mS2Bc0jcxTwEjOuEHCuRmsV0HWfFr42QtoDrXvvvAY5t27Y9Q0yDjxrN/iTd7tI9vTmn1NUYgUQ
        pDqFEsS/93ZMDwlw/aJJC2fDbtz/jC749jjid+ODFrkHpEcS1YolckCE=
X-Received: by 2002:a50:ed82:: with SMTP id h2mr17295936edr.165.1625502120041;
        Mon, 05 Jul 2021 09:22:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCJTJVm2cXmAPIEVtM0YZG4CWbGju7SyX7A+wp+GUMWL0lWArHCZ3pGx2eLKBQqDAJd5M6pJn5KLDGPSPGTWY=
X-Received: by 2002:a50:ed82:: with SMTP id h2mr17295906edr.165.1625502119732;
 Mon, 05 Jul 2021 09:21:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210514131750.52867-1-krzysztof.kozlowski@canonical.com>
 <2b427eca-fd6c-d099-337f-39cfbd85cb46@roeck-us.net> <a15e7f62-12a0-1ec7-5104-f01f9e3eccc7@canonical.com>
 <9d98ec40-757d-28c7-1669-a683b2cd3881@canonical.com> <b87bbb80-ed02-447d-f778-7997848731cd@roeck-us.net>
In-Reply-To: <b87bbb80-ed02-447d-f778-7997848731cd@roeck-us.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date:   Mon, 5 Jul 2021 18:21:48 +0200
Message-ID: <CA+Eumj4aZZPFFB-3PEeBVo6fXW_Fz97oswA3pZuu2aiysnp=nQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ralink: of: fix build of rt2880_wdt watchdog module
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, John Crispin <john@phrozen.org>,
        Lee Jones <lee.jones@linaro.org>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 5 Jul 2021 at 18:08, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/5/21 8:15 AM, Krzysztof Kozlowski wrote:
> > On 14/05/2021 16:04, Krzysztof Kozlowski wrote:
> >> On 14/05/2021 09:48, Guenter Roeck wrote:
> >>> On 5/14/21 6:17 AM, Krzysztof Kozlowski wrote:
> >>>> When rt2880_wdt watchdog driver is built as a module, the
> >>>> rt_sysc_membase needs to be exported (it is being used via inlined
> >>>> rt_sysc_r32):
> >>>>
> >>>>     ERROR: modpost: "rt_sysc_membase" [drivers/watchdog/rt2880_wdt.ko] undefined!
> >>>>
> >>>> Reported-by: kernel test robot <lkp@intel.com>
> >>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> >>>
> >>> Acked-by: Guenter Roeck <linux@roeck-us.net>
> >>>
> >>> I don't see a recent change in the code. Has that problem been there
> >>> all along ?
> >>
> >> I think the problem was there always but 0-day builder did not hit it
> >> until recently:
> >> https://lore.kernel.org/lkml/202105082122.yrF7ploN-lkp@intel.com/
> >
> > Hi Guenter,
> >
> > It seems that patch was not applied. Anything to fix here?
> >
> I see commit fef532ea0cd8 ("MIPS: ralink: export rt_sysc_membase for
> rt2880_wdt.c"). Does that not solve the problem ?

Yes, that fixes it. It was sent later, though. :(

Anyway, thanks!

Best regards,
Krzysztof
