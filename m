Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92BCF10748
	for <lists+linux-mips@lfdr.de>; Wed,  1 May 2019 12:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbfEAK7K (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 May 2019 06:59:10 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33728 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbfEAK7K (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 May 2019 06:59:10 -0400
Received: by mail-pf1-f196.google.com with SMTP id z28so3156097pfk.0;
        Wed, 01 May 2019 03:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8SGQbEjaib7Nhep2Q++3S1f8rzs3/Y7ym1uGZjAH6kw=;
        b=NX7Yd44v5So6MaNiIhjz4fW08cnocDFsis50jFMXBeQ94nhM8FHhzwYEpRtUcPxn1x
         zDqZ/M5fy6sAVUz6Os7ScVnsD5uFpJyM3pZhcpcWzDs2dxq/3kh1f97D1yia1xzBqrCv
         4OKjXBI6uquf3jBjh8fgkCiJ4aOs8HZgRMNut8+3JrWJSBeYdPL64FDeUzWf1HE3TEG7
         bsMmwnGDnF9IgHm7aMtlRj+W/jKbZUsY7YayCNUuSFHq6HbYIL7sR2JZn3aCmk/6xquQ
         ddUMgNsepEzBOXjKH5VpVKTmAR4cD/yvgqitsi3KuvqmAwDsj/7sOeQ7fT8+rw04FcUx
         BRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8SGQbEjaib7Nhep2Q++3S1f8rzs3/Y7ym1uGZjAH6kw=;
        b=csecKGrvDZjOWrqqPfL27bg4l02Drl/F4CWFrd3Pg5HxxFKG8VO88mSdkf2/Tq5vWx
         HCnxHtE1RpffrFI3qBe69bmRtRgKzA2d0Ozxousg+6euVZNcEPfOwHxPzi7S3BlSh8/F
         feqOvOFftS180hFzyvJGY/gXxqqlqmyhCl9OQHtk4XaQ63My6F6ij38NoGVjxOKt4ni0
         7QUiLcHSXz02kPcRt0DDqFPL+epFhBtoVY9EFlbdqrYRV+d9Clm9LPICNqi1PDYIJWVC
         xpSOKLbGoWu0iSt5f9IHBpplLkZ7tpxf8Vv1BU7W9cHWfcSZjig0E+uGzM0n1Fwpc4Ka
         Y8Rg==
X-Gm-Message-State: APjAAAVHjq7PYIvX987pSaXkRgSmH4BE+OP5PsgYYKYOJym/nv6g5aD2
        elRdc1j0nb/GkGyEV2zPUgEvCIHj
X-Google-Smtp-Source: APXvYqxFn0wBuKRgk/9vlkcN0OKH0p+qkkZSyrGestN3cYg6IH8+cfxbRWmSgq6G2Sa/L46jQZHAbQ==
X-Received: by 2002:a62:1d83:: with SMTP id d125mr40625283pfd.74.1556708349589;
        Wed, 01 May 2019 03:59:09 -0700 (PDT)
Received: from ?IPv6:2409:251:20c0:100:fe80:8e59:9ae1:e028? ([2409:251:20c0:100:fe80:8e59:9ae1:e028])
        by smtp.gmail.com with ESMTPSA id g65sm89246pfg.77.2019.05.01.03.59.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 03:59:09 -0700 (PDT)
Subject: Re: [RFC v2 1/5] clk: mips: ralink: add Ralink MIPS gating clock
 driver
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     John Crispin <john@phrozen.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-mips@vger.kernel.org, linux-clk@vger.kernel.org
References: <20190405000129.19331-1-drvlabo@gmail.com>
 <20190405000129.19331-2-drvlabo@gmail.com>
 <155622043597.15276.9250071449626345612@swboyd.mtv.corp.google.com>
From:   NOGUCHI Hiroshi <drvlabo@gmail.com>
Message-ID: <63290737-8f9a-3d17-77ed-d5417a58294a@gmail.com>
Date:   Wed, 1 May 2019 19:58:43 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <155622043597.15276.9250071449626345612@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Thanks for suggestions.

>> +{
>> +       struct clk_hw *clk_hw;
>> +       const char *name;
>> +       const char *parent_name;
>> +       u32 val;
>> +       int cnt;
>> +       int num;
>> +       int i;
>> +       int idx;
>> +
>> +       syscon_regmap = syscon_regmap_lookup_by_phandle(np, "ralink,sysctl");
>> +       if (IS_ERR(syscon_regmap)) {
>> +               pr_err("rt2880-clock: could not get syscon regmap.\n");
>> +               return PTR_ERR(syscon_regmap);
>> +       }
>> +
>> +       cnt = of_property_count_u32_elems(np, "clock-indices");
>> +       if (cnt < 0) {
>> +               pr_err("rt2880-clock: clock-indices property is invalid.\n");
>> +               return cnt;
>> +       }
>> +
>> +       num = 0;
>> +       for (i = 0; i < cnt; i++) {
>> +               if (of_property_read_u32_index(np, "clock-indices", i, &val))
> 
> I'm a little lost one what the indices are for? Why is the number space
> being folded like this?

I want to let the clock cell index match  with the bit number in the 
gate control register.
Is my "clock-indices" usage wrong ?
