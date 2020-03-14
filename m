Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43D8418574B
	for <lists+linux-mips@lfdr.de>; Sun, 15 Mar 2020 02:36:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbgCOBgC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Mar 2020 21:36:02 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37787 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727067AbgCOBgB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Mar 2020 21:36:01 -0400
Received: by mail-pf1-f193.google.com with SMTP id p14so7687400pfn.4;
        Sat, 14 Mar 2020 18:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=enmh88Oq7hYMaA3wg6YRTMgt0lLyr3oCSQxfmO8yIk0=;
        b=ix52UfXVTvYdzWgeyE3fArZfM5Oov+79b6Wgfzmv4cG+x0P9TLxanMTeOw28etFnOT
         FV5CxAErCIC3IJWfqam427ZSWrVOFXNy6jNG8+U1k/c7qGvfL3NNg/o/zPDOSlZhklG8
         StaKqtyAZIcSb6OXqLPf8Y2YhvxfFvadynYDZrnuyMiCcd+fgOhlk1RWoZbdMezX4pss
         M9MBPbczHMmWr9+fFt9cN7WhMNcjJQbWjkpZVJGpMaE2PycfriqMuwle4TaR/0RTw+8F
         we7/VJsyrF0j7cy0kIVj3yV/wkM1A4wvlinXqtFpoYMS7eZlYPDM20Blid3akqJ6OgTx
         G9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=enmh88Oq7hYMaA3wg6YRTMgt0lLyr3oCSQxfmO8yIk0=;
        b=nYGxEJLsm9EOlmLPe71/j7hU/S0jLPCrZDBvh9AQ78W1B8bsO3JBfuEclzdJ8o5SA7
         irJWmWWYga1t8O3A4jtlFE9P5yh5jdEtPgSv39pgqSHo91Q64r4Cl02vbMXjJqATc54h
         lDF5yp3dNAhBJUQ8SCqJg9XCyNLvwbhMVZih9TT45iGV1cvd2dmkmcq7uxFwj3yPDuNP
         gIHTs+WMKuxQuY6BWkVFfE8wjuLWauqsOP/fBmGRhgc5kflQ+YzDLa4eiw4f73TW92eW
         WI4clYVfq9/gRD8POhBn28+HJ6ZdprS32tqagxnHDPD2SJ8+bWbWY/XiAa4pCjLXIo8C
         priQ==
X-Gm-Message-State: ANhLgQ1T77+dP1YA8GwBO6A9LSpIO8PRnARTSURcCTeqcNkZgSUwg9M2
        RjyupWTmyTQOcM+bIJOhbQNGI+g1
X-Google-Smtp-Source: ADFU+vuGK2ZF9wa95KwLbauH1QnF8nd86i6tUXFxQWyV3BcPWwpk0QqcNGgnDyYpmlr+IkirNr2CDw==
X-Received: by 2002:a63:89c1:: with SMTP id v184mr18165617pgd.333.1584181735887;
        Sat, 14 Mar 2020 03:28:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q12sm60639314pfh.158.2020.03.14.03.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2020 03:28:55 -0700 (PDT)
Subject: Re: [PATCH v4] MIPS: Replace setup_irq() by request_irq()
To:     afzal mohammed <afzal.mohd.ma@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        John Crispin <john@phrozen.org>,
        Nathan Chancellor <natechancellor@gmail.com>
References: <20200304203144.GA4323@alpha.franken.de>
 <20200305115759.3186-1-afzal.mohd.ma@gmail.com>
 <20200313164751.GA30134@roeck-us.net> <20200314010744.GA5494@afzalpc>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <204ac322-4214-fc83-e0b9-14473f855b0a@roeck-us.net>
Date:   Sat, 14 Mar 2020 03:28:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200314010744.GA5494@afzalpc>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 3/13/20 6:07 PM, afzal mohammed wrote:
> [ + Nathan ]
> 
> Hi Guenter, 
> 
> On Fri, Mar 13, 2020 at 09:47:51AM -0700, Guenter Roeck wrote:
> 
>> This patch causes all my mips qemu emulations to hang during boot. This affects
>> all mips, mips64, mipsel, and mipsel64 emulations.
> 
> Can you please apply,
> 
> https://lkml.kernel.org/r/20200311152751.GA5044@afzalpc,
> 
> on top of this patch & see if it fixes the issue. Else please let me
> know the qemu command line you are using.
> 

I have not tested all configurations, but a quick check suggests
that it does indeed fix the problem.

Thanks,
Guenter
