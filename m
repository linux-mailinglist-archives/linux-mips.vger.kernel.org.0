Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DFBE1DE0C7
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2020 09:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728402AbgEVHYs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 May 2020 03:24:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32110 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728369AbgEVHYr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 May 2020 03:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590132285;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CiOMvxe2jHNY+2yIWreiVBjH4fPgrug0GPoTBvnau78=;
        b=RJ1Zh9FEA3ozzMAN8RTUNoOROlLACHBdphsjwj8vS1nb2wBKJowclKORglTHF/6t8smmJm
        MSVDKsdzsnwXdHWjfqO2dnSbULVZYIv3M5ScW/Izyzjqw5mfLtZydt2+ZIVHNv+Rm2kG3t
        fZoZhAskDXsqcgJqH2EKifptr5PzYJg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-HY_zvNEFPOGdHWvKPxMHhA-1; Fri, 22 May 2020 03:24:44 -0400
X-MC-Unique: HY_zvNEFPOGdHWvKPxMHhA-1
Received: by mail-ej1-f70.google.com with SMTP id bo19so638451ejb.0
        for <linux-mips@vger.kernel.org>; Fri, 22 May 2020 00:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CiOMvxe2jHNY+2yIWreiVBjH4fPgrug0GPoTBvnau78=;
        b=lbF+7tCfaEytObpd5xIjPSqWBZPCmcTKpeAdfEpvx3RL4XCtIXXw6ulIOEZqIGRDhO
         sDbASMpVxb8bqTnWUPOvIV2A4CDHvI0blEHH7JqtLXPedG89meBCGkbHE8Zwh9ANTccg
         B9KH0XkNJfMAcIua7OnasOK8a4D6tDZ/GYTPzV+1S3hvk3x1l6FafLzAUtiZJLwl9Hby
         nJJrI0FK2yyQchStkCAxe66aToj9Dh/cTyITUKMBaWcZF2P1yv4Z827WKsV3iuAQBNx1
         vBRtxPD3pit8ySQHtVgr5QMxCfca9wdRGTLo+XQ5NaFx9UXi6RPiBrW+sEcjnnWvsL6j
         Q/gQ==
X-Gm-Message-State: AOAM531/yr++BGJrHwbsbLas3w/8nSdj5d8/KTw4uY28Uv2Cgq5/LqvH
        BQbIsVRipq3c3SngApzLpnoWGcxOrRacl44/K9nVEGS4OCWGnv1wrHSOzoeT1dXnanBVorZKYiF
        8y0CoKADiDLXdBoVUUMkMgA==
X-Received: by 2002:a50:98a2:: with SMTP id j31mr1896934edb.79.1590132283078;
        Fri, 22 May 2020 00:24:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2/7Lzq8aatk5F6PWyc98BYOgmkn0sJpKH2YvkgO4wyo00NuLPnQnbwFDtC82RVMWBjWDDzw==
X-Received: by 2002:a50:98a2:: with SMTP id j31mr1896925edb.79.1590132282901;
        Fri, 22 May 2020 00:24:42 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:71e6:9616:7fe3:7a17? ([2001:b07:6468:f312:71e6:9616:7fe3:7a17])
        by smtp.gmail.com with ESMTPSA id m11sm7116234ejq.49.2020.05.22.00.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 00:24:42 -0700 (PDT)
Subject: Re: [PATCH V6 15/15] MAINTAINERS: Update KVM/MIPS maintainers
To:     Huacai Chen <chenhuacai@gmail.com>
Cc:     Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        kvm <kvm@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1589688372-3098-1-git-send-email-chenhc@lemote.com>
 <1589688372-3098-16-git-send-email-chenhc@lemote.com>
 <20200517082242.GA3939@alpha.franken.de>
 <CAHiYmc5m+UhWv__F_FKqhiTkJxgqErmFn5K_DAW2y5Pp6_4dyA@mail.gmail.com>
 <CAHiYmc4m7uxYU0coRGJS8ou=KyjC=DYs506NyXyw_-eKmPVJRQ@mail.gmail.com>
 <CAAhV-H4SspEUMLDTSZH3YmNbd+cRx3JK+mtsGo6cJ2NLKHPkKQ@mail.gmail.com>
 <CAHiYmc7ykeeF_w25785yiDjJf3AwOzfJybiS=LxfjYizn_2zEQ@mail.gmail.com>
 <23cbe8a9-21a9-93a3-79aa-8ab17818a585@redhat.com>
 <CAAhV-H6aGkxV41ymu+HPxiSBq9uw-QhmaxFxnZYJTfUay946cg@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3269366b-7239-bb06-0bc6-cb661b9e5206@redhat.com>
Date:   Fri, 22 May 2020 09:24:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6aGkxV41ymu+HPxiSBq9uw-QhmaxFxnZYJTfUay946cg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 22/05/20 07:34, Huacai Chen wrote:
>> I am going to queue them for 5.8.
> Thank you for your help. But this series depends on an early patch
> from Jiaxun Yang ("MIPS: Loongson64: Probe CPU features via CPUCFG")
> which seems only in MIPS tree now. So, maybe this series is better be
> queued in Thomas's tree?
> 

That's not a problem, I can handle it during the merge window.  In the
future I'd ask for a topic branch or something like that.

Thanks for bringing KVM/MIPS back to life. :)

Paolo

