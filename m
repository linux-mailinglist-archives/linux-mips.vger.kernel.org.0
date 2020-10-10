Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7115289F74
	for <lists+linux-mips@lfdr.de>; Sat, 10 Oct 2020 11:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728555AbgJJI7w (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 10 Oct 2020 04:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727698AbgJJI4y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 10 Oct 2020 04:56:54 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BEBCC0613D6;
        Sat, 10 Oct 2020 01:56:45 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id j22so7659578lfe.10;
        Sat, 10 Oct 2020 01:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g9vSkxIGlaWSB7biANoG1xKU0aKQl4aNdR2oDLnv0+k=;
        b=lgTnXkjU9AtLrHaVxu1evzcLrvkMvPcdEG1OQYJZdFvptxqF4XLHy1iZWGGT7t6EZg
         nrLR2C4FzLeMXMLv0U7Kkn231OG8dZRaSRTdRVOeICFw2uTnvSGzCTBuqusgQ1XP9JFJ
         aXKpOcHDgzakO2EseHKoe/lvdsLsCq//VPBya35mdUaQh0jD0waooNqHkaf+AKMePJV3
         dNv58cHb6HjNHlBBPf38gwEno3QRK20g4v66pazHHhUlMWcy+LUw66IMFc3+0375YHgN
         u3nYlR8haqMnu2Vec9iHOaI6+KlBBc6alXCZi7ndTB+in9nUw3pXFMFfZqXvjZkbuYwQ
         D5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=g9vSkxIGlaWSB7biANoG1xKU0aKQl4aNdR2oDLnv0+k=;
        b=DAzyVOii2tG0mCZB6AgOnj8hHmbh/wsjN8eSU+ofqx4fwjyARsREAX0AIAHNfS0F/w
         C4Y/4n8/uvTxV5MjP/3I55gNiiIa/uO/HkNGD/HczDBFi0U42m3wjJZXA1iTBZWZJjl3
         xUJUmVJQRiJYWNMzwH/eFMdzT/0dj0KHq48dHvKbMkD8utQT80ftt21MncFPQOiR9TD4
         UfEqHqa8w8hkG19bRU3e7zlRjYdAtc1nreP8kL21jqhy+WzvQh/yvya5OKw56TJKu0FJ
         IKyeTwQ9xt1hufj6chc4ESm57zMWHIT53/MZZSObQPe/NQZeJAv9OYjA/zTFAMMwG2ra
         QvOw==
X-Gm-Message-State: AOAM533theUCNI5+SGiDbpmrNE8OGu85uNDoEGdE8hcbY770L/dxQQBI
        tAtMJnwVXcHIXNl7+MutbEEuO5P/mSE=
X-Google-Smtp-Source: ABdhPJylVSzzVjZcAJsm3hy10uswdeQCyh8b3CermKL+5uCrzklmn/BCo6y8Lss7b0TC//27Vg1+Yg==
X-Received: by 2002:a19:9143:: with SMTP id y3mr6038466lfj.104.1602320203660;
        Sat, 10 Oct 2020 01:56:43 -0700 (PDT)
Received: from [192.168.1.100] ([213.87.133.206])
        by smtp.gmail.com with ESMTPSA id 27sm1952993lfy.109.2020.10.10.01.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2020 01:56:43 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] MIPS: cpu-probe: move fpu probing/handling into
 its own file
To:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201008213327.11603-1-tsbogend@alpha.franken.de>
 <alpine.LFD.2.21.2010100128110.866917@eddie.linux-mips.org>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <0d87a08c-3ae3-fc32-8e96-5692944b8289@gmail.com>
Date:   Sat, 10 Oct 2020 11:56:42 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2010100128110.866917@eddie.linux-mips.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 10.10.2020 3:30, Maciej W. Rozycki wrote:

>> +			/*
>> +			 * MAC2008 toolchain never landed in real world, so we're only
>> +			 * testing whether it can be disabled and don't try to enabled
>> +			 * it.
>> +			 */
>> +			fcsr0 = fcsr & ~(FPU_CSR_ABS2008 | FPU_CSR_NAN2008 | FPU_CSR_MAC2008);
>> +			write_32bit_cp1_register(CP1_STATUS, fcsr0);
>> +			fcsr0 = read_32bit_cp1_register(CP1_STATUS);
>> +
>> +			fcsr1 = fcsr | FPU_CSR_ABS2008 | FPU_CSR_NAN2008;
>> +			write_32bit_cp1_register(CP1_STATUS, fcsr1);
>> +			fcsr1 = read_32bit_cp1_register(CP1_STATUS);
>> +
>> +			write_32bit_cp1_register(CP1_STATUS, fcsr);
>> +
>> +			if (c->isa_level & (MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2)) {
>> +				/*
>> +				 * The bit for MAC2008 might be reused by R6 in future,
>> +				 * so we only test for R2-R5.
>> +				 */
> 
>   Umm, this has formatting issues with lines extending beyond column #80.

    80 columns are no longer a line length limit -- 100 is, IIRC.

>    Maciej

MBR, Sergei
