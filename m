Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7642832BDA2
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 23:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346451AbhCCQRy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 11:17:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233310AbhCCMcX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Mar 2021 07:32:23 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 299B5C06178A
        for <linux-mips@vger.kernel.org>; Wed,  3 Mar 2021 04:31:39 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id m22so36830373lfg.5
        for <linux-mips@vger.kernel.org>; Wed, 03 Mar 2021 04:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cryptogams.org; s=gmail;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZJ9YmLXJMRVQqrwkPYggJ4USyGQCg6hVZAYYYHZZaEU=;
        b=MWJkz0uD17Lw3eji41KWwp0FylL3T5nJxo2U+RLrwvXXqlhNLse+/0bWk0aNwXUqV7
         saBPb7htZMAuiq6p8XhVNm6E0rgd4Qv0eh005gx/kQ1hXr4iayiqP5i+IPlcOzRX2fYr
         VUVCo1KhBnjurTJQxaUD5D2tivjt86O9HXzNlL6FUz4NVsuButIecXpV7TJkFLPVIZBg
         G5BIm0Pn10kur0d97H2qByacL3lFgKCrPPMvICA30Ndv8Ovbs+wi6yJYBOjGGVumzc/i
         8lSLZofvAszqGUoWiKTXaRgIrrp3xv3NuKvQAcq5HLdoUs1bUYOKyJUTNtgC+kU/tIHt
         FYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZJ9YmLXJMRVQqrwkPYggJ4USyGQCg6hVZAYYYHZZaEU=;
        b=hyyw7iBt0EqkMnwjtau8l3v/6xZq2QLntBBYOTMSzVVTI+tq4EYy84zftydETc0Y1X
         VmEXeUoYSoiiVpGjzWAz+HfDkyvWMyAat/TB/PnAKmRkYKZ+A5lCW118MQjBhUjjBPFH
         Am+6WcllX6LnHHiH0p3XoDh8Fu6s/1FbXpfNvmBRDlgxI83uIo7cht0w4dCRUuBqHPi2
         Kmc7oFVvjN9U1tsTWOp9Hgwoz4ia3gFPaymy7KpJnQZ55zzDFijUxYHKltNeoE76gUqJ
         NU8N9OCag77KA+k8dqFtmALj4lXZ2ijQkkS1AF72tV5OP6AZavwxFVpzbbHQz4UoBGIH
         qXTA==
X-Gm-Message-State: AOAM530odIaW0QAIwOk8gjYzqddrafrPedWG2gVgH+G4WkvDtoKR1HPs
        0BrO5wVPhoh/XAGbA4ndCkTJdg==
X-Google-Smtp-Source: ABdhPJzBp29wZ23xRTdlJ6SJxcClcWGV+ftIYsJQv0I4D1aUw/Ib+kVod1DBPXa00vWtZZxdP9GKNQ==
X-Received: by 2002:ac2:4144:: with SMTP id c4mr15145307lfi.549.1614774697571;
        Wed, 03 Mar 2021 04:31:37 -0800 (PST)
Received: from [10.0.1.129] (c-0f3be255.012-217-67626713.bbcust.telenor.se. [85.226.59.15])
        by smtp.gmail.com with ESMTPSA id x27sm2935199lfu.151.2021.03.03.04.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Mar 2021 04:31:37 -0800 (PST)
Subject: Re: [PATCH] crypto: mips/poly1305 - enable for all MIPS processors
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        George Cherian <gcherian@marvell.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        stable <stable@vger.kernel.org>
References: <alpine.DEB.2.21.2103030122010.19637@angie.orcam.me.uk>
 <CAHmME9qgEMdcVgkBkvBZ9Du=ae=wEyQ4uPa+Au8+LEs5ZQCzAg@mail.gmail.com>
From:   Andy Polyakov <appro@cryptogams.org>
Message-ID: <70eb96e1-3243-105c-b52e-c9bd3239a263@cryptogams.org>
Date:   Wed, 3 Mar 2021 13:31:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9qgEMdcVgkBkvBZ9Du=ae=wEyQ4uPa+Au8+LEs5ZQCzAg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

> I'm also CC'ing Andy on this, who wrote the original assembly, in case
> he has some last minute objection.

Just "what took you so long":-) On potentially related note cryptogams
chacha-mips is as universal as poly1305-mips. "Universal" in sense that
it can be compiled for all MIPS stripes.

Cheers.
