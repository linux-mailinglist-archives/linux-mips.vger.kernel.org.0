Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 473571E4D58
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 20:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728007AbgE0Ssb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 May 2020 14:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727880AbgE0SsS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 May 2020 14:48:18 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CAB8C08C5C1;
        Wed, 27 May 2020 11:48:18 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id nu7so2017708pjb.0;
        Wed, 27 May 2020 11:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CdXGMbnJPFZ1OXBjluxy0OMcUuIHa8+nT3WEXVeHqe8=;
        b=XxpDFfdG3DnSWPlywYnD96my7g+V6rp0EbPPA4JeFYNOGszeWV6JFI0iNswlLH5DOw
         rhWrKhs3AUzq1N1qJ0iTH+ij3MP/jfhrwBRcSzIRjxzqR1dA2n8JTS8n+laKCxfrZvId
         Vmxi/tkFlOp+RCazeM444a8KkC5Czaput6u7WZZh5n/JLN3lAvmIH3twJb+N/tFLg/JZ
         RGp4btYD7iJ01oKNlvqRdL4S/l4cn7lNcklD/wxIxpP6e4ZPaQt556OQFBbHFdxy1Vge
         OJcltuvQGgmhMYMY7hMbR2vewD5L4zE2l+7RUMFO2QIBzbRviBwV8Jmnwmx0yKSxTKbN
         pDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=CdXGMbnJPFZ1OXBjluxy0OMcUuIHa8+nT3WEXVeHqe8=;
        b=tSGa6wc6cTEuo1rTcLZjkBXjhL6un5jafLQq2sauzxYdpt9peLNdsr11m1FqSO2dF9
         JzjW8ObicV10xZZ6UE8uk+pnZujuFT44S+GlfwqpxlpwxqriIj6oWtnY65ueO9/BaM31
         ICQAi840Xk5vohWzRFYtOkmKwDp01Immaw5NLIEBcV0RsGRqA8A/cFQQRAYSzXb3WlSC
         HCKLv9OGMOudgSzXOv28JRyhs6zkR+W7pzTqDCX35QHuFJ73QvAXrybXu01oZFMji4J5
         qWj3z/Pybsr7OIhBH6ZqdLjYuiaWTM30fKJ96vShdw6tgUPEzIZcv4zCXMZZIsZ8ETzd
         OrVw==
X-Gm-Message-State: AOAM5319t7qIRE/oMEZLuwuy8jrTFYEj4CDhPfq4Ddli9Q7pG5v6GRTU
        MFlRIpYLXjgowGFEuK9jqgXuYqi6
X-Google-Smtp-Source: ABdhPJwAJfObBr8qIMwh6rD5SaQSv19q5VL+f601RZyC8mvZUHcYIoHpe+XGNBs3YrWxbCikwuw3Xg==
X-Received: by 2002:a17:90a:c791:: with SMTP id gn17mr6623904pjb.46.1590605297501;
        Wed, 27 May 2020 11:48:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l187sm2642837pfl.218.2020.05.27.11.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2020 11:48:16 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] hwmon: Add Baikal-T1 PVT sensor driver
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200526133823.20466-1-Sergey.Semin@baikalelectronics.ru>
 <20200526133823.20466-4-Sergey.Semin@baikalelectronics.ru>
 <20200527162549.GA225240@roeck-us.net>
 <20200527165205.5krrdahiup3i2oq3@mobilestation>
 <14256f0f-2977-4a54-cf01-ae7e684d10c2@roeck-us.net>
 <20200527170524.hbjbikp5b6e5nw5l@mobilestation>
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
Message-ID: <68094bbc-6183-308e-169c-44534d19375e@roeck-us.net>
Date:   Wed, 27 May 2020 11:48:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200527170524.hbjbikp5b6e5nw5l@mobilestation>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/27/20 10:05 AM, Serge Semin wrote:
> On Wed, May 27, 2020 at 09:58:00AM -0700, Guenter Roeck wrote:
>> On 5/27/20 9:52 AM, Serge Semin wrote:
>>> On Wed, May 27, 2020 at 09:25:49AM -0700, Guenter Roeck wrote:
>>>> On Tue, May 26, 2020 at 04:38:23PM +0300, Serge Semin wrote:
>>>
>>> [nip]
>>>
>>>>> +
>>>>> +=============================== ======= =======================================
>>>>> +Name				Perm	Description
>>>>> +=============================== ======= =======================================
>>>>> +update_interval			RW	Measurements update interval per
>>>>> +					sensor.
>>>>> +temp1_type			RO	Sensor type (always 1 as CPU embedded
>>>>> +					diode).
>>>>> +temp1_label			RO	CPU Core Temperature sensor.
>>>>> +temp1_input			RO	Measured temperature in millidegree
>>>>> +					Celsius.
>>>>> +temp1_min			RW	Low limit for temp input.
>>>>> +temp1_max			RW	High limit for temp input.
>>>>> +temp1_min_alarm			RO	Temperature input alarm. Returns 1 if
>>>>> +					temperature input went below min limit,
>>>>> +					0 otherwise.
>>>>> +temp1_max_alarm			RO	Temperature input alarm. Returns 1 if
>>>>> +					temperature input went above max limit,
>>>>> +					0 otherwise.
>>>>> +temp1_trim			RW	Temperature sensor trimming factor in
>>>>> +					millidegree Celsius. It can be used to
>>>>> +					manually adjust the temperature
>>>>> +					measurements within 7.130 degrees
>>>>> +					Celsius.
>>>>
>>>> vs. standard ABI:
>>>>
>>>> temp[1-*]_offset`
>>>>                 Temperature offset which is added to the temperature reading
>>>>                 by the chip.
>>>>
>>>>                 Unit: millidegree Celsius
>>>>
>>>> If you really think this is necessary, why not use the standard ABI ?
>>>
>>> That would have made much more sense.) I'll replace the handwritten temp1_trim
>>> with the standard temp1_offset attribute in v4 shortly today. Thanks for pointing
>>> this out.
>>>
>>
>> Sorry for not realizing this earlier. The added explanation
>> made all the difference.
> 
> No worries. I'll fix it in v4. What about the clk_get_rate() part of the code?
> You had a comment regarding it in v2. I responded with justification that we can
> leave it as is. If you still disagree, then I create the clock rate caching in the
> private data at the probe() stage.
> 
Reason asking for it is that clk_get_rate() is unnecessarily costly if the rate
doesn't change. But it isn't worth bike shedding about it.

Guenter

> -Sergey
> 
>>
>> Guenter

