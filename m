Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2CFC1DCEE3
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 16:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729691AbgEUOFI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 May 2020 10:05:08 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27452 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728630AbgEUOFH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 May 2020 10:05:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590069906;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1KWrwV1dtFMtu/4KkYPjzJvXwhFfafM3w3HVZXPt+m8=;
        b=W/I8v7YEUY2MFrzWHRsAZ5gERbgH21jJAHx0TOy6SBOdUxJVpKw14h+/tO+Otz3Lotnjaj
        AokNonW2yc6MKpI3WZHls6w9fn9RsbYlBgj+gNkxGAnl+B/Skw/tXnYIAziX6XDgWzCnqI
        QCKhiwtlPJMY00oe9w/ExjkBTorN8QU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-OxVNQIkoMsq59VCNzp54_w-1; Thu, 21 May 2020 10:05:03 -0400
X-MC-Unique: OxVNQIkoMsq59VCNzp54_w-1
Received: by mail-wm1-f69.google.com with SMTP id v23so1904689wmj.0
        for <linux-mips@vger.kernel.org>; Thu, 21 May 2020 07:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1KWrwV1dtFMtu/4KkYPjzJvXwhFfafM3w3HVZXPt+m8=;
        b=jD+0gl5RHnEvYX0gKvsxon6+fY/COf9gdoi1zf7CG/pRPYQkz1QY3giAq7ouHQFkkx
         K4gxtSIZqEj0JmkLMfkkWDNp7XyKE1yWB74pdo+VL06ZU43ueyX+LgfNeu4SGDzBXyzC
         4GxVyEXIzdgL3OsGmS9uGFIxostk7hBYXs1smMhiY4FTs8szVw0zXALpHizmU8jxeSrF
         6WfnKNYlaZyu/kK03x/lpxQKbul/Kg9BQcrOSWJID5c6Qx+Os7jvVY6e30D3COfb2vjo
         u66UCbNfKdTQicqTK47xhKcIZE9XitzefR1Ke0vA7Mm9gWz/FZbYsnYSszH+FGIBBKfZ
         Mc9Q==
X-Gm-Message-State: AOAM531mcVON8MZrr55rFg1w3almY/KcMw4P+qjsknZ2/lV2O2RVAoLq
        GugmBjujktfaH+4SbEMRGd6M4c6/2C2x1aJVjtP+yDYBCxzwTTB2MiQLOfSUH4l3lNDa0TghlKX
        yMJR8fIcvryMud1H05Wx9kg==
X-Received: by 2002:a7b:c14e:: with SMTP id z14mr9629555wmi.9.1590069899877;
        Thu, 21 May 2020 07:04:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdBRXiG4LHaSz6Ah14kKzAPztUjfiFhdLpLThi6vY3VpDKZLovxV3YoQOhhMpmNWwxtOi7HA==
X-Received: by 2002:a7b:c14e:: with SMTP id z14mr9629538wmi.9.1590069899623;
        Thu, 21 May 2020 07:04:59 -0700 (PDT)
Received: from [192.168.178.58] ([151.30.94.134])
        by smtp.gmail.com with ESMTPSA id 10sm6740082wmw.26.2020.05.21.07.04.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 07:04:59 -0700 (PDT)
Subject: Re: [PATCH V6 15/15] MAINTAINERS: Update KVM/MIPS maintainers
To:     Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
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
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <23cbe8a9-21a9-93a3-79aa-8ab17818a585@redhat.com>
Date:   Thu, 21 May 2020 16:04:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAHiYmc7ykeeF_w25785yiDjJf3AwOzfJybiS=LxfjYizn_2zEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 21/05/20 13:04, Aleksandar Markovic wrote:
> I agree. E-mail address can be easily changed later.
> 
> I think it is reasonable that minor email tech problems should not stop
> this series.
> 
> I gather that at least approximate consensus is that v6 is "good to go".
> 
> While I am at this series, I just want to let everybody that there is a
> long-standing practice in QEMU for MIPS that we don't upstream
> changes that depend on kernel support that is not yet upstreamed
> in kernel - and I want to keep that practice in future (and not limited
> to KVM, but for all kernel/QEMU interdependant code).
> 
> In other words, corresponding Huacai's changes in QEMU will be
> kept on hold as long as this series is still not upstreamed in kernel.
> But, that was the original Huacai's plan anyway.

I am going to queue them for 5.8.

Thanks,

Paolo

