Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2BBD28B390
	for <lists+linux-mips@lfdr.de>; Mon, 12 Oct 2020 13:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387843AbgJLLR7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Oct 2020 07:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387681AbgJLLR6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Oct 2020 07:17:58 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24EF4C0613CE;
        Mon, 12 Oct 2020 04:17:58 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id a7so16886940lfk.9;
        Mon, 12 Oct 2020 04:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=prTaif8qDcd1qUoXq1ktzlUWrSZNMtNm6psMX/iuAJQ=;
        b=aZN0zmZ1Bnb4ZKESN5+gvyU9vDYl+nq9X5WEEhXj9B78DPZvAMfYgJLi1csiPJuuFj
         KV6mLEnhHr5LRfSxbOX/vzmteTI5y+v1HjtGO24VrcoRHDiGKog7e+LCF07pXN8rpVPF
         dFdj4VMcNUPEeMoWmc22rPfNeBEvDn6vrstE+8wW97095XTNMB3CZS/w8QVOgJED8G/M
         Z/6o2/QEunywdfzozbBFyMxVpKlMR7FmqFvG8al8g3hI6EULxgiCPimd2tj4Rb3jC5Bp
         RIdvNWyo+fqDCePtGvIlJWTRKJWgawztZlYlsCnJyOzB+DHLyxtkWOwvWdepU5fyVcjF
         YK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=prTaif8qDcd1qUoXq1ktzlUWrSZNMtNm6psMX/iuAJQ=;
        b=ZoAG6bUo7NtrgaHZg8lYB2BIV1NcGpt0PXpBvNUq10Kj+Rx/F2Yo74pWMJdHnvxEY3
         OTVjuTr5QGx8flpLCinrYFV1es6BMfd8vJ3MbfddnQp9ej5soeDABmsyzgXp0rAT4YEi
         Cfj8u4xZfCDtSNmmrtj86dHoiFq6v0sKmB6vJR5gUgN2frDVBBw54xziqG/DeOKuXWc9
         i+RA/mqm62vrU94eLf018jP5xDpisYy3q5L+CSi/1pGwZLHqTeq2gHb5Mnc2oVc6P39R
         tyq0vZQXbOxjHZMtZfF96c4G/NYqavo7w7Qsrtzt5HVtOJ+zO6jv82cEjH+eGURnmlq6
         eZTg==
X-Gm-Message-State: AOAM5302J4QPfeyrtGZOZAV48ckkN2ekR2lqb9obeZ0hEFUniU6xib0O
        LbLJyeU7zNQP6WCBLjM5MVFqI5mnRdk=
X-Google-Smtp-Source: ABdhPJyWQR8xZcT/FA4GwCUxHY1ZrdGttCgkq70KAmmv0Z5W9G9NiMMYOdVcNknHrLhZBPvmyHN6mg==
X-Received: by 2002:ac2:4304:: with SMTP id l4mr2375183lfh.122.1602501476179;
        Mon, 12 Oct 2020 04:17:56 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4b8:f3cc:440d:a2c7:62b1:f1b? ([2a00:1fa0:4b8:f3cc:440d:a2c7:62b1:f1b])
        by smtp.gmail.com with ESMTPSA id n7sm3209523lfi.103.2020.10.12.04.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2020 04:17:55 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] MIPS: cpu-probe: move fpu probing/handling into
 its own file
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201008213327.11603-1-tsbogend@alpha.franken.de>
 <alpine.LFD.2.21.2010100128110.866917@eddie.linux-mips.org>
 <0d87a08c-3ae3-fc32-8e96-5692944b8289@gmail.com>
 <alpine.LFD.2.21.2010101259400.866917@eddie.linux-mips.org>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <89f93c5f-e672-74aa-51c3-7829e6d9ef9b@gmail.com>
Date:   Mon, 12 Oct 2020 14:17:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2010101259400.866917@eddie.linux-mips.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 10/10/20 3:11 PM, Maciej W. Rozycki wrote:

>>>   Umm, this has formatting issues with lines extending beyond column #80.
>>
>>    80 columns are no longer a line length limit -- 100 is, IIRC.
> 
>  I don't think anything has changed here:

   Oh, it did! Look for max_line_length in scripts/checkpatch.pl. :-)

> "The preferred limit on the length of a single line is 80 columns.
> 
> "Statements longer than 80 columns should be broken into sensible chunks,
> unless exceeding 80 columns significantly increases readability and does
> not hide information."
> 
> -- from Documentation/process/coding-style.rst, "Breaking long lines and 
> strings".
> 
>  And if it were to change anytime, then I think it would make sense for 
> such a new rule to apply to new files only.  I would be strongly against 
> it anyway, as the human's capability to parse lines has not changed when 
> it comes to the quantity of characters easily processed at once: the angle 
> spanned by eyes is hardwired.  For this reason the GNU toolchain projects 

   The font sizea are not hardwired though...

> keep the limit even lower, at 74 columns (after extensive discussions).

   This is also close to a limit on the patch descriptions...

>   Maciej

MBR, Sergei

