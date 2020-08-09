Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 867D123FF79
	for <lists+linux-mips@lfdr.de>; Sun,  9 Aug 2020 19:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbgHIRXh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 9 Aug 2020 13:23:37 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23087 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726199AbgHIRXg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 9 Aug 2020 13:23:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596993815;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=60GKudByszXzSU9r7sTdue2pMvjRmoypxp10iEs7VnI=;
        b=PyzdpQjXb9YHxjbJCoh6z/ZiW1skhKu6a0AvvrDrbuYhmQrJasV3C32vBNZ/VGnZIGaP/N
        JURh6rx0JbTUSxO7qXDoL6/sNpy3uSDG0DuwdMj/dLXkGC/hhDomjL4Cx1fFyLNwdn2bhS
        cuzoxzlLoxZZwBWCL7gQDJpxeHkZ0zM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-ShCQnuxNNGizHhbhh1phIA-1; Sun, 09 Aug 2020 13:23:31 -0400
X-MC-Unique: ShCQnuxNNGizHhbhh1phIA-1
Received: by mail-wr1-f70.google.com with SMTP id e14so3284886wrr.7
        for <linux-mips@vger.kernel.org>; Sun, 09 Aug 2020 10:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=60GKudByszXzSU9r7sTdue2pMvjRmoypxp10iEs7VnI=;
        b=kQyHIYn8K4W3m27ZAuoo7NhEflkw40VyRJjRQ484ZQ33qeMyKFLt1fy3gTYYsgGfcd
         Ckr1muVhNCMa59+WvWF+U4YYNhUSu74y2k797iUwb86JfepsqHDz6V4Pcv316QEyYYr/
         xcuO+7hjoFEKJMfO7fVbqunnTNa01FSGQJr2m62xi4BmhOPoMWEiIVeBckGkxxhlFXJt
         fB/KNqVjyOHb9Ka0GefEGt9Ydqkzl6VKqwbsk5lE2Xhx1Oibi7ge8ZSQP/PwlYH53Hws
         SZl30uk163YUMQlqAkZFGzrMycZOAiJdlkam7/HTEyB2QnSmkPD60gh9CR435AKI82PP
         bzHg==
X-Gm-Message-State: AOAM530S5CSdAc1s2mkzrxUHZE6PbRmattAsr8hbsdGpTm2kpHJkYEpE
        ZxDVRozZ2pCHS7AVKwu3BC/TB2mMrRCuUzASGv75JhlsFfrk/vyU+9jalZHG8gWMeXgOl9ZOBJ2
        R+vNlH/ywHeaKEcfxsquDyA==
X-Received: by 2002:a05:6000:118c:: with SMTP id g12mr20755644wrx.212.1596993810605;
        Sun, 09 Aug 2020 10:23:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzwEPa1MPtSV651TG2wBd2JGpLDN+D3LrImZPSbEhFkjVn/IV+rGrVC44uH0fDnj2r1OeS2g==
X-Received: by 2002:a05:6000:118c:: with SMTP id g12mr20755633wrx.212.1596993810341;
        Sun, 09 Aug 2020 10:23:30 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:8deb:6d34:4b78:b801? ([2001:b07:6468:f312:8deb:6d34:4b78:b801])
        by smtp.gmail.com with ESMTPSA id g7sm18096445wrv.82.2020.08.09.10.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2020 10:23:29 -0700 (PDT)
Subject: Re: [PATCH] MIPS: VZ: Only include loongson_regs.h for CPU_LOONGSON64
To:     Greg KH <greg@kroah.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>, stable@vger.kernel.org
References: <1596891052-24052-1-git-send-email-chenhc@lemote.com>
 <20200808153123.GC369184@kroah.com>
 <2b2937d0-eae6-a489-07bd-c40ded02ce89@flygoat.com>
 <20200809070235.GA1098081@kroah.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5ffc7bb1-8e3f-227a-7ad0-cec5fc32a96a@redhat.com>
Date:   Sun, 9 Aug 2020 19:23:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200809070235.GA1098081@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 09/08/20 09:02, Greg KH wrote:
>>>> diff --git a/arch/mips/kvm/vz.c b/arch/mips/kvm/vz.c
>>>> index 3932f76..a474578 100644
>>>> --- a/arch/mips/kvm/vz.c
>>>> +++ b/arch/mips/kvm/vz.c
>>>> @@ -29,7 +29,9 @@
>>>>   #include <linux/kvm_host.h>
>>>>   #include "interrupt.h"
>>>> +#ifdef CONFIG_CPU_LOONGSON64
>>>>   #include "loongson_regs.h"
>>>> +#endif
>>> The fix for this should be in the .h file, no #ifdef should be needed in
>>> a .c file.
>> The header file can only be reached when CONFIG_CPU_LOONGSON64 is
>> selected...
>> Otherwise the include path of this file won't be a part of CFLAGS.
> That sounds like you should fix up the path of this file in the
> #include line as well :)
> 

There is more #ifdef CONFIG_CPU_LOONGSON64 in arch/mips/kvm/vz.c, and
more #include "loongson_regs.h" in arch/mips.  So while I agree with
Greg that this idiom is quite unusual, it seems to be the expected way
to use this header.  I queued the patch.

Paolo

