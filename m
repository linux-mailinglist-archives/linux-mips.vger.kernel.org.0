Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3B2E19FAA4
	for <lists+linux-mips@lfdr.de>; Mon,  6 Apr 2020 18:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729533AbgDFQn0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Apr 2020 12:43:26 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35628 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729578AbgDFQn0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Apr 2020 12:43:26 -0400
Received: by mail-pl1-f195.google.com with SMTP id c12so20213plz.2
        for <linux-mips@vger.kernel.org>; Mon, 06 Apr 2020 09:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=eP345ArGYnfGAJ4jzoK1LoRsxz9bzdzVl4xTuSWk8YU=;
        b=MW8/mQveOroeY0x1xpt8gPhQROWiBKBbi6WYW1EvrM+99HqbdYjegbaYgTLHtdhq1J
         l4QPfHXLUAHwah6DKPElpdCoNk/mzsNS50F//u2UWG7wU5c4a4/GkJczthkimZUpn+qf
         DQIOFUaCcWiA0jzlGY8FZKr4Mnx0zlemtrO+SWFM+jmsaSw3jNiXjYEgvKJ/Gnr0NwUK
         MnClJVV3jSNRRkmUx3oKbc74LCCOJEYOHSeGdVPLODh175Xr4qGV0zFy7UPhLe/1NkmS
         WYcQaq3Ph8aIWWt+Ip0jt0z+671w0Sbq04XPtO1QlMeNjZ7c784pcgA2r2rnYpZcgi/o
         VlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=eP345ArGYnfGAJ4jzoK1LoRsxz9bzdzVl4xTuSWk8YU=;
        b=iDIL5dykZ9s9AIR8g5/he2kmGeM5y9yTFheVUzu2Xo7RkyJhlS4whe0kfsIGaHQwSP
         f0m4Rplc7vx8t7GgPErhG7wHwmem1z5PSMw54ntL/rT9IZavDzf9RjYEAvjWnAdn+/Pr
         /Xc+z6NpGdZzp6wdT1BWDpMIlN03pQg1nuSXRWMbT3eGtZlRDJ0VENyHYy59Ztht0kQH
         FIMWsEppCYWzlqKyx2Ljpb/XHX7swenUMcp2T+sa1rh53RwBkLKf4850XIJLQdv/zkr4
         fqvXT+1heaFAaaUVIwpkmduaRGin2Y1RashEIOyjRkqDa2dXAKrzAhCVsrg4x7+WS+Dv
         h7aQ==
X-Gm-Message-State: AGi0PuaZ0o4JA2oFmmwipcZPVZ9XV51xgbNZbLzA+NzK7KF1IH2ewLAh
        +cK0EKUGOWMM+/mfgf0y5lzCBw==
X-Google-Smtp-Source: APiQypKGMyFeOjdTrlkRBPTR6ySLfo8qSkh83qKknt8owxl20zhRTJaNBpZZCNFvk4gJqtcAV7uKiA==
X-Received: by 2002:a17:90a:fa17:: with SMTP id cm23mr19190pjb.121.1586191404980;
        Mon, 06 Apr 2020 09:43:24 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:0:9efe:9f1:9267:2b27])
        by smtp.gmail.com with ESMTPSA id z7sm12001669pfz.24.2020.04.06.09.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 09:43:24 -0700 (PDT)
Date:   Mon, 6 Apr 2020 09:43:21 -0700
From:   Fangrui Song <maskray@google.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     YunQiang Su <wzssyqa@gmail.com>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MIPS: malta: Set load address for 32bit kernel correctly
Message-ID: <20200406164321.c3377heoqprzwbjc@google.com>
References: <20200405082451.694910-1-jiaxun.yang@flygoat.com>
 <alpine.LFD.2.21.2004051738000.4156324@eddie.linux-mips.org>
 <96C9B1A0-2F89-4650-B0A4-6A6242A2AA0A@flygoat.com>
 <alpine.LFD.2.21.2004051817310.4156324@eddie.linux-mips.org>
 <CAKcpw6U=VW+h4sU1fzrsqXU9z-zVfcFsENKHgAD4paqtndip2w@mail.gmail.com>
 <079F408B-9C44-4317-8DD3-7A1896564960@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <079F408B-9C44-4317-8DD3-7A1896564960@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-04-06, Jiaxun Yang wrote:
>
>
>于 2020年4月6日 GMT+08:00 下午6:57:18, YunQiang Su <wzssyqa@gmail.com> 写到:
>>Maciej W. Rozycki <macro@linux-mips.org> 于2020年4月6日周一 上午1:23写道：
>>>
>>> On Mon, 6 Apr 2020, Jiaxun Yang wrote:
>>>
>>> > > Given the description above I think it should be done uniformly
>>and
>>> > >automatically across all platforms by trimming the address
>>supplied
>>> > >with
>>> > >$(load-y) to low 8 digits in a single place, that is at the place
>>where
>>> > >
>>> > >the variable is consumed.  This will reduce clutter across
>>Makefile
>>> > >fragments, avoid inconsistencies and extra work to handle
>>individual
>>> > >platforms as the problem is triggered over and over again, and
>>limit
>>> > >the
>>> > >risk of mistakes.
>>> >
>>> > I was intended to do like this but failed to find a proper way.
>>> >
>>> > Makefile isn't designed for any kind of calculation.
>>> > And shell variables are 64-bit signed so it can't hold such a huge
>>variable.
>>> >
>>> > Just wish somebody can give me a way to do like:
>>> >
>>> > ifndef CONFIG_64BIT
>>> > load-y = $(load-y) & 0xffffffff
>>> > endif
>>>
>>>  Use the usual shell tools like `sed', `cut', `awk', or whatever we
>>use in
>>
>>perl may be the easiest to use tool here.
>>
>>ifndef CONFIG_64BIT
>>  load-y := $(shell $(PERL) -e 'print $(load-y) & 0xffffffff')
>>endif
>>
>>Note that it is `:=' instead of '='.
>
>It seems like perl is not one of kernel's build dependencies.[1]
>I'm comsidering a alternative solution,
>write a small hostprog in C to deal with that.
>
>Thanks.
>
>[1]: https://www.kernel.org/doc/html/v5.6/process/changes.html

load-y := 0xffffffff80100000
load-y := 0x$(shell echo "$(load-y)" | rev | head -c 8 | rev)

>>
>>> the kernel build already for other purposes.  There's no need to do
>>any
>>> actual calculation here to extract the last 8 characters (and the
>>leading
>>> `0x' prefix).  At worst you can write a small C program, compile it
>>with
>>> the build system compiler and run, as we already do for some stuff.
>>>
>>>   Maciej
>
>-- 
>Jiaxun Yang
