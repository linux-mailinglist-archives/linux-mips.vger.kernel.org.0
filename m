Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 337A74691CF
	for <lists+linux-mips@lfdr.de>; Mon,  6 Dec 2021 09:53:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239773AbhLFI5I (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Dec 2021 03:57:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239762AbhLFI5C (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Dec 2021 03:57:02 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9377C061746;
        Mon,  6 Dec 2021 00:53:33 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id l7so19593498lja.2;
        Mon, 06 Dec 2021 00:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=Y+zsPiE0jWqgVe4pQvQSN2GD2mZTf30FFOs17Fe9qJ4=;
        b=PoNJdAuISWmPkzyOQORKtt61J/LDS4hk6NMbBK2sCDoStwlaEO/UdMvqyR0PvTglqT
         rVIJxzd6YoHH/wcpl6dhiY2FW9vke87hLWvUyuqfNRXbuWVKVH5eik4Gg0EMVg1EtUf7
         u3IY7qS50pU0notYvbPsIvktr3NCCYlmAC6EpygYZMwLzxUroan+LUx81pPmWRbl92Bd
         bc+910xldsBJvaYU3l00ocAhaheOGcy5xigX7wn9Ctb9PFiK+LZRYqZnb1ckIi9v/6ZB
         0VeMvkPq2LTxtj9BjxQ/jt3TJl0I/QXBrQgtKzXwjG0/Yx1ty2pdreItyLW4n9VzguPP
         Ntvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Y+zsPiE0jWqgVe4pQvQSN2GD2mZTf30FFOs17Fe9qJ4=;
        b=WS0ZoVCkL/mOMbQwVqIRKdhUZMZ+bMlrQVinEGBGf+a9guEE9BAE2X05BkH8whCCdm
         JMI5+AHEwRycs1yysGWTIJh2iFMa00L/NOD21fH45eJPgXgkKvpEFZfgaP/ziKu9oGZ3
         C5ltFWO/ncpw7fTJpfh912BE+GaTnYwryRFbCBE5jT93+59z8VISc1zFnH1IxaP/A+b3
         CG9ifb3q1RXq16BL5N9/F9KpLlWavJwLtNRZde1hxjfJfkbpaHqF4DSWuKPk+fgn9L3U
         SssnO1nhRsicQ+JxEc5ma2fimjo6/CT3wwfCgBvwTl9K9CCd40DuFiVsItIcqKGQWb4E
         W2UQ==
X-Gm-Message-State: AOAM532yRTF9vYi5dQFmz+f0ST6yGNrlgsXMJxvEPFdISFfWLwSixx6M
        vD7jBhgeID0EAyAkMIhwJNY=
X-Google-Smtp-Source: ABdhPJxRd/1Wloa5EyY1GdBVJv7Hfi1IuZGG731ukC+uaBzwOsS9SBQDrhbUL6b7V5lcirsr6E9vQw==
X-Received: by 2002:a2e:b8d0:: with SMTP id s16mr34164757ljp.496.1638780812063;
        Mon, 06 Dec 2021 00:53:32 -0800 (PST)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id q6sm1296694lfr.76.2021.12.06.00.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 00:53:31 -0800 (PST)
Message-ID: <89b9512d-2e5e-c23a-d1f2-62172c8f68f7@gmail.com>
Date:   Mon, 6 Dec 2021 09:53:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0
Subject: Re: [PATCH V4 RESEND 1/2] dt-bindings: watchdog: convert Broadcom's
 WDT to the json-schema
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Rob Herring <robh@kernel.org>
References: <20211115055354.6089-1-zajec5@gmail.com>
 <78eba629-b0cf-e1db-df73-2b33fb0b4929@gmail.com>
 <Ya3NaVKf1NRc8rrx@google.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <Ya3NaVKf1NRc8rrx@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 06.12.2021 09:44, Lee Jones wrote:
> On Mon, 06 Dec 2021, Rafał Miłecki wrote:
>> On 15.11.2021 06:53, Rafał Miłecki wrote:
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> This helps validating DTS files.
>>>
>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>
>> I'm not familiar with handling multi-subsystem patchsets (here: watchdog
>> & MFD).
>>
>> Please kindly let me know: how to proceed with this patchset now to get
>> it queued for Linus?
> 
> What is the requirement for these to be merged together?

If you merge 2/2 without 1/2 then people running "make dt_binding_check"
may see 1 extra warning until both patches meet in Linus's tree.

So it all comes to how much you care about amount of warnings produced
by "dt_binding_check".
