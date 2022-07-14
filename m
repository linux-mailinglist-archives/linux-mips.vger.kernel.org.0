Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A095C575417
	for <lists+linux-mips@lfdr.de>; Thu, 14 Jul 2022 19:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231150AbiGNRe1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Jul 2022 13:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbiGNRe0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Jul 2022 13:34:26 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E4805A47E
        for <linux-mips@vger.kernel.org>; Thu, 14 Jul 2022 10:34:24 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id v185so1978994ioe.11
        for <linux-mips@vger.kernel.org>; Thu, 14 Jul 2022 10:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6F+lTK9m+LZj4WUnP2SiONBj/xB77any1ApspcO7854=;
        b=DJoDPwvC6n3hPBaJxYLtGhx4aLo7Mqd2zwJe+6oIOHzZGWA2pf+Nv+ZTt0bo6negCR
         5mwtv5eVojyzCHPXDrr9R+FwPnlEok7d6RCaxE2AqJe7oOCRAn6mJEN3XXdJZxlr0MX5
         iwvmDLIQDVJOYJA0vFsydZ7K5mN0gIZIdGqMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6F+lTK9m+LZj4WUnP2SiONBj/xB77any1ApspcO7854=;
        b=BoVfS5yLxd59pu/vtLURFrXiwUv3NyBmx7LcgNzTJgcOzAeitWLEVJsfPhtnJMEumP
         YAqnB1mb+wwUvYyGCvKbyBCFujhYaB5SOY9wdzqzj3tKr/8dosuuoo9Vy/XYgxgGY7XG
         idsg4z7Sy33LBVuhHik9HH3WBamwRDU2KsPf/C5Q6f0nxmK8uwXO9xGv55cAJ0oj9IyQ
         WSv2VV1/sDr6mKBqFJNZBIj05IRHCD7xHkUmcayW4vOyKBOzjdvKvyun+36MKt2Iwkp5
         l+kJ+pAaNcyXWtQyNZ95ug9eRP2bns200wLUn4dYuj50M7I7iZdLo/1tmSxzb+9mdYsN
         SZXA==
X-Gm-Message-State: AJIora/qNEJPIH9oSA8gmZU6C00rTCz/SMjtrGu8paG3KcZtgte4zGPR
        CfubPzU5TSFq2yW1MNzzj5MCIJW7M3DPbnC2lRXaAw==
X-Google-Smtp-Source: AGRyM1un6aL+z1TV1HigmDwCQKIJCyNwlfjPKZ/PeCmC7PRqO+e7SdotmkxBFVf2kYUbTotnAoRTZk63S1bxkiQ14gY=
X-Received: by 2002:a05:6638:1a08:b0:33f:4b10:1958 with SMTP id
 cd8-20020a0566381a0800b0033f4b101958mr5387094jab.220.1657820063945; Thu, 14
 Jul 2022 10:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220714141705.2375-1-sohu0106@126.com>
In-Reply-To: <20220714141705.2375-1-sohu0106@126.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 14 Jul 2022 10:34:13 -0700
Message-ID: <CAADWXX9rrESSEGmA4C9F85E9jo7H-pv+CUtyAU_kyB=DfcHRpA@mail.gmail.com>
Subject: Re: [PATCH] MIPS: vpe: fix integer overflow in vpe_write()
To:     Ning Qiang <sohu0106@126.com>
Cc:     dan.carpenter@oracle.com, greg@kroah.com, security@kernel.org,
        linux-mips@vger.kernel.org, tsbogend@alpha.franken.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

[ This was in my spambox, it may have been marked as spam for others too ]

On Thu, Jul 14, 2022 at 7:17 AM Ning Qiang <sohu0106@126.com> wrote:
>
> In the vpe_write function of arch/mips/kernel/vpe.c,parameter "size_t
> count" is pass by userland, if "count" is very large, it will bypass
> the check of "if ((count + v->len) > v->plen)".(such as
> count=0xffffffffffffffff).

We reject oversized IO requests to read/write, and clamp them at
MAX_RW_COUNT (which is basically INT_MAX rounded down to a page size).

Exactly to avoid issues like this.

So you shouldn't be able to pass in those kinds of counts, and it
won't be able to overflow the arithmetic unless 'v->len' can grow
boundlessly, which I don't think it can.

So I suspect this is not actually possible, but if you have a
test-case that shows me wrong, that woudl be interesing.

That said: that 'vpe_write()' thing is *odd*. Why is it using that
'v->len' thing, instead of using the passed-in offset?

So there is certainly somewhat strange code in there, and it would
probably be good to take a look at it. But being a very special MIPS
driver, I'm not sure how many people care...

               Linus
