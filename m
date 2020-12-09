Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBBD2D3FB1
	for <lists+linux-mips@lfdr.de>; Wed,  9 Dec 2020 11:15:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729289AbgLIKOr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Dec 2020 05:14:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729178AbgLIKOr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Dec 2020 05:14:47 -0500
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F645C0617A6
        for <linux-mips@vger.kernel.org>; Wed,  9 Dec 2020 02:14:07 -0800 (PST)
Received: by mail-qk1-x742.google.com with SMTP id d14so27969qkc.13
        for <linux-mips@vger.kernel.org>; Wed, 09 Dec 2020 02:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8rjD7IseveSeNkH6VF4Nm3t/LEPLDkcL2AIVZGOLwaQ=;
        b=bYuZo14ICpkzNIN2VbO0nSMeZMGOGObypWmZnDScE4IKQfy4mYHoZcgftoPAN+UE1A
         8yEkNLgXB4AFkEeX8yrTLyy7c9I9fsZRmybhtJsMPtb1Gm1sEMn9vITJP8Ht5hW03BcV
         CTzKi9lp5VbX1ngvVito4r3LNXJ6laM1+JGNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8rjD7IseveSeNkH6VF4Nm3t/LEPLDkcL2AIVZGOLwaQ=;
        b=ZVbjRO1teMhvPozMaVPaBHf+kFuwz2ZuyAit+7i/6Skl8/Vjn8JT7eIirOM+BvidMS
         tFMxWqfyBoDfeLhiRKA4jIkiz0CoBOTwiKle09iZGjzY3DhguG2BU/lG6aHFxNqV5zFB
         gXO4y9y3vowvV8mSYSr4MqQzXPvXdaEOtvKBSck0rVSIrKwvYK4fhMJ5DCcviDgpYJFf
         IeDLIozULcKGjndwgU6XQqYr5dL008bB+TZCEhaBttEZFsGDWy2oIi+XH6aJd2KSUUpI
         x/yZelUyO7zyr+qb5Xf0re6SMtBZ9SE1PO5knc7fObrII3t8By4AGHqSO2hK87Bmt9d9
         zQBA==
X-Gm-Message-State: AOAM533HeCAagMDXZe1MO/4i7LFxjpeVW4R0HLRr58D5hSgRzVamZ0Pb
        +3FDKFEaeD1N5kntVaxFsSyv1YKSjSTuGWLlzRHbyw==
X-Google-Smtp-Source: ABdhPJwcx3VJ+/O9OTm1VhxGxVov7pwPjx8v0ff+R6oPDxN+CsTklvE1tvNVoov8YhiobB7/4plhzBsdvvM280GFLbM=
X-Received: by 2002:a37:7c07:: with SMTP id x7mr2165263qkc.159.1607508846374;
 Wed, 09 Dec 2020 02:14:06 -0800 (PST)
MIME-Version: 1.0
References: <20201208164821.2686082-1-paul@crapouillou.net> <20201208164821.2686082-2-paul@crapouillou.net>
In-Reply-To: <20201208164821.2686082-2-paul@crapouillou.net>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Wed, 9 Dec 2020 19:13:55 +0900
Message-ID: <CAFr9PX=EgQSXeATLn++DSHkkQar35rpLGh978J5Lnw9jS8XMrw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: ingenic: Only support SoCs enabled in config
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@kernel.org>, od@zcrc.me,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul and others,

Sorry to hijack this but I actually want to do something similar to
this in some other drivers.
The targets I'm working with have only 64MB of ram so I want to remove
code wherever possible.
Is there any reason to do it like this instead of wrapping the whole
unneeded of_device_id struct in an #ifdef?
For example there is a rule that the compatible strings have to be
present even if the driver isn't usable or something?

Thanks,

Daniel
