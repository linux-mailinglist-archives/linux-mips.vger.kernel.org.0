Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFFB41F47EF
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2020 22:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387552AbgFIURV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 16:17:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbgFIURS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 16:17:18 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26BD2C05BD1E;
        Tue,  9 Jun 2020 13:17:18 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ne5so1863108pjb.5;
        Tue, 09 Jun 2020 13:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ycBfwZJp2iSk0H+6hD6qHTXZoBhADfY0mavrlMkbOJI=;
        b=GRlKpdJHXqeavogNWIbRTZXFAqecpcMOBD54j6AOI+aKs8H3lwYxW9IJkSbNfgeJvJ
         xire/2BfLwwyptZd8q+QGzejfVC706NkjJ9mnPswdtwskW6WKhqRo2A2mcUCI/f2UZQ1
         9YXhoyds80y168jeQ0ziR9pXNO/4+Kroy16uF4kBGmnSSDrY6gTCAm7zQ42oESUAWUte
         c31UMBDe5aD5YiVKceEPt3iXa4v9d9LJ8AZbw/iF1GeJ1uZEVljRrZf0uBbsH4aNFDOH
         mBaMFjkwCEwpaU1pvaVhCbet9qhe6bHiXaJ2lJAjLlcZb/EGr4vh1wJYlMJswColVlSi
         HvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ycBfwZJp2iSk0H+6hD6qHTXZoBhADfY0mavrlMkbOJI=;
        b=Fes65+2qBerFnzu3zuLH5E9inN0YUAPwm6Dh9MznXcarqidVBTiJVBTSPkQT/SU2hl
         3B6D4BmYbFMU7o72m2SB4DSoN8iTqafudQ8Pp7PNyTGVdONfnxSrvrNiMFKbDtJzUGC0
         UbQX0PLQZMx5jOTi5BVl/Dce7+zzfEVmkOibst5q7ct3TfSiZt4L0hX7r3UcPw8Q25dT
         tSBb1QcaQa2GmB3mUuYg/uJaG4JIzYWXby5u3Dqp5J7p+h2C8LZrPEoVOGUNQxvle7EI
         JN/jVR8JYJu8rVlOYOK2yRVg9yMjDsXqN7dxusL+vSLr1r67fssvIUkMESygrTNZRRuF
         gZmQ==
X-Gm-Message-State: AOAM533s1rmvztixw/DAdGqeo46XUj1EPjedi4GKQEkjwtn+n09uaGZa
        dh9BtD/+TObt4PVx94YAV1/TPIvA
X-Google-Smtp-Source: ABdhPJwanqh4CtSImWJt1rizt00WKH4mXR4I7BTHb+CSiyqSXDleaNuLB6XrtDSyVmukLYHS769hOA==
X-Received: by 2002:a17:902:7783:: with SMTP id o3mr97268pll.286.1591733837558;
        Tue, 09 Jun 2020 13:17:17 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 140sm10769164pfv.38.2020.06.09.13.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 13:17:16 -0700 (PDT)
Subject: Re: [PATCH 3/7] reset: add BCM6345 reset controller driver
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     robh+dt@kernel.org, tsbogend@alpha.franken.de,
        Jonas Gorski <jonas.gorski@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
References: <20200609134232.4084718-1-noltari@gmail.com>
 <20200609134232.4084718-4-noltari@gmail.com>
 <341e8482c6bd06267633160d7358fa8331bef515.camel@pengutronix.de>
 <729976E9-CAF7-47B6-8783-5FD3D85F9EFD@gmail.com>
 <2a621f170574a616bcf047f6725c74552f7abbb1.camel@pengutronix.de>
 <46614E69-578A-4782-9D72-85B2D2F38FB8@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <e80e5c4c-ceef-3a62-3158-02f742bf76b7@gmail.com>
Date:   Tue, 9 Jun 2020 13:17:14 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <46614E69-578A-4782-9D72-85B2D2F38FB8@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/9/2020 9:41 AM, Álvaro Fernández Rojas wrote:
>>>> If you can do without this, with I think this driver could be made to
>>>> use reset-simple.
>>>
>>> Yes, but only if I can add reset support with a configurable sleep range to reset-simple. Is this possible?
>>
>> I should have mentioned, support for this is on the reset/next branch:
>>
>>  git://git.pengutronix.de/pza/linux.git reset/next
> 
> Yes, but reset_us was only added to reset_simple_data, so there’s no way to fill that value from reset_simple_devdata or device tree, right?

Not that I can see, but you could certainly extend it here:

if (devdata) {
		reg_offset = devdata->reg_offset;
		if (devdata->nr_resets)
			data->rcdev.nr_resets = devdata->nr_resets;
		data->active_low = devdata->active_low;
		data->status_active_low = devdata->status_active_low;
	}

and have an appropriate devdata structure be provided for your
compatible string:

+	{ .compatible = "brcm,bcm6345-reset", .data = bcm6345_reset_devdata },
-- 
Florian
