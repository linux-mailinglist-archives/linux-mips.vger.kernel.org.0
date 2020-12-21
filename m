Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA9642DF9F4
	for <lists+linux-mips@lfdr.de>; Mon, 21 Dec 2020 09:32:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbgLUIct (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Dec 2020 03:32:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgLUIct (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Dec 2020 03:32:49 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B78C2C0613D3;
        Mon, 21 Dec 2020 00:32:08 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id q18so10182272wrn.1;
        Mon, 21 Dec 2020 00:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VoiV0D68E7iBU6MgOJJtpGcG8ySo+Z5P8wrAxN/JZM4=;
        b=Ovso28SZMLRIhLgjh1Zx0mc+tPkxInEmCudiHe0gy+9uzNEIcvnwlwRo25C1Gqw1uo
         sGzHsf7EM2Xv3YyauEemOsVzh+bIi/8vI1/mTlpf5hGM5UAUq6VgizLdK9NrOfiFj5zZ
         uY7TQjrTzPm+7TkTkUE3uIZXHFIOCjUWTsHEcBMr6adhzVKBmjLXVzYwUStTcGYVshiY
         JONtiEZBEeU7SGN60OGvMkbKL9UM6z1hbpyW0zuPrj0P9WH0FH4DHF3SCZ+PevpGYecQ
         WfyqtgJxjxMH11JxRdjr/f9o6TEMDe2crgsrtoyPzSXl409gGzi/tJY/iv8biVKMdfZC
         /tTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VoiV0D68E7iBU6MgOJJtpGcG8ySo+Z5P8wrAxN/JZM4=;
        b=LiLmT+z5HmTJOlA99SocPXl5dbQlWuvGprXA1B49V7T4zZMqo+YX2O7Ug8Ecn+2ewW
         5P4Izc15gTn6dJggKhabdcK1QLrK87fjYUGBiXBnTbotaZXK8upbUdBq/WRH9NPRzVUX
         Kjpx+4jm4DaFcMlPFvQy/CCdfJo7+I5Ir28LifcNAbPx31gPf0B2VqgZs1VDA3R1I97r
         xhT8mrXy7Z+jsrJ37ONaH6dfjgsZNgx7GoitxCzXXcRCBWZ88Z/z10DtX+AazCOkHk1N
         PMRESehUqckpZ/TMnkZOFZbNVhugS1I8QxfYuMGIn8p9dkfykJN061L3+34xEDaDK5LL
         MM2Q==
X-Gm-Message-State: AOAM531XkRL1lqwjuVTOVTq+h/sPz9+I7HKGo1MTzy5B//1KFO18btqr
        7d355fDsBRiLnkZ8RV8htZQ=
X-Google-Smtp-Source: ABdhPJx4YGEmXDYJ2YKR4RrvSOsm7/mnOT/aDO8wr0wOUJEtAbHndIf8eLruBEyKHqfyDd46ST3H8Q==
X-Received: by 2002:a5d:504d:: with SMTP id h13mr17651300wrt.246.1608539527540;
        Mon, 21 Dec 2020 00:32:07 -0800 (PST)
Received: from [192.168.1.143] ([170.253.51.130])
        by smtp.gmail.com with ESMTPSA id n12sm27406645wrg.76.2020.12.21.00.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Dec 2020 00:32:07 -0800 (PST)
Subject: Re: [PATCH] cacheflush.2: Document Architecture-specific variants
To:     "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Heinrich Schuchardt <xypron.glpk@gmx.de>,
        linux-man@vger.kernel.org
Cc:     Vineet Gupta <vgupta@synopsys.com>,
        linux-snps-arc@lists.infradead.org, Guo Ren <guoren@kernel.org>,
        linux-csky@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>, libc-alpha@sourceware.org
References: <20201214143852.16565-1-alx.manpages@gmail.com>
 <53a3c827-3e83-441b-8192-afdf323ca296@gmail.com>
From:   "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Message-ID: <f4946e75-11eb-6938-3fe3-664af0f4d601@gmail.com>
Date:   Mon, 21 Dec 2020 09:32:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <53a3c827-3e83-441b-8192-afdf323ca296@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 12/20/20 9:54 PM, Michael Kerrisk (man-pages) wrote:
> Hi Alex
> 
> On 12/14/20 3:38 PM, Alejandro Colomar wrote:
>> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
>> ---
>>
>> Hi Michael,
>>
>> Please apply this patch after
>> '[PATCH v5] cacheflush.2: Document __builtin___clear_cache() as a more
>>  portable alternative'.
> 
> Thanks. Applied.
> 
>>  man2/cacheflush.2 | 42 ++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>
>> diff --git a/man2/cacheflush.2 b/man2/cacheflush.2
>> index fc35f1a0b..0761b429a 100644
>> --- a/man2/cacheflush.2
>> +++ b/man2/cacheflush.2
>> @@ -31,6 +31,10 @@ cacheflush \- flush contents of instruction and/or data cache
>>  .PP
>>  .BI "int cacheflush(char *" addr ", int "nbytes ", int "cache );
>>  .fi
>> +.PP
>> +.IR Note :
>> +On some architectures,
>> +there is no glibc wrapper for this system call; see NOTES.
>>  .SH DESCRIPTION
>>  .BR cacheflush ()
>>  flushes the contents of the indicated cache(s) for the
>> @@ -87,6 +91,44 @@ but nowadays, Linux provides a
>>  .BR cacheflush ()
>>  system call on some other architectures, but with different arguments.
>>  .SH NOTES
>> +.SS Architecture-specific variants
>> +Glibc provides a wrapper for this system call,
>> +with the prototype shown in SYNOPSIS,
>> +for the following architectures:
>> +ARC, CSKY, MIPS, and NIOS2.
>> +.PP
>> +On some other architectures,
>> +Linux provides this system call, with different arguments:
>> +.TP
>> +M68K:
>> +.PP
>> +.in +4n
>> +.EX
>> +.BI "int cacheflush(unsigned long " addr ", int " scope ", int " cache ,
>> +.BI "               unsigned long " len );
>> +.EE
>> +.in
> 
> I made the formatting rather:
> 
> [[
> .TP
> M68K:
> .nf
> .BI "int cacheflush(unsigned long " addr ", int " scope ", int " cache ,
> .BI "               unsigned long " len );
> .fi
> ]]
> 
> That's for consistency wqith the SYNOPSIS sections, where .EX/.EE 
> isn't used.

Ahh. Right!

Thanks,

Alex

> 
>> +.TP
>> +SH:
>> +.PP
>> +.in +4n
>> +.EX
>> +.BI "int cacheflush(unsigned long " addr ", unsigned long " len ", int " op );
>> +.EE
>> +.in
>> +.TP
>> +NDS32:
>> +.PP
>> +.in +4n
>> +.EX
>> +.BI "int cacheflush(unsigned int " start ", unsigned int " end ", int " cache );
>> +.EE
>> +.in
>> +.PP
>> +On the above architectures,
>> +glibc does not provide a wrapper for this system call; call it using
>> +.BR syscall (2).
>> +.SS GCC alternative
>>  Unless you need the finer grained control that this system call provides,
>>  you probably want to use the GCC built-in function
>>  .BR __builtin___clear_cache (),
> 
> 
> Cheers,
> 
> Michael
> 
> 
> 

-- 
Alejandro Colomar
Linux man-pages comaintainer; https://www.kernel.org/doc/man-pages/
http://www.alejandro-colomar.es/
