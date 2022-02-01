Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1E34A60E8
	for <lists+linux-mips@lfdr.de>; Tue,  1 Feb 2022 17:01:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240776AbiBAQBV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Feb 2022 11:01:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20074 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240769AbiBAQBV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Feb 2022 11:01:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643731278;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9TOgZSvYLjnxXgPMR3aA+UnxenzdhiCu/Ec4ih921w8=;
        b=GwQZVoxHXSx3xUaS0YWw+G/lDXsXgdwBaKi0Dd70KwcS784axjNHKSdXjxDfS145rKTr/x
        fVEkq38geeGZX3WR7ePDFasVO/lefF8oaU7dftda72TXkoDvNdM0drOC3DsAdidxfIrsAd
        IEXMRFmT/RSpgJSkH0kF8jyaRLuGZpw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-76-ZkAgZHyTPXWw_wD3ZcknCQ-1; Tue, 01 Feb 2022 11:01:03 -0500
X-MC-Unique: ZkAgZHyTPXWw_wD3ZcknCQ-1
Received: by mail-ej1-f72.google.com with SMTP id ky6-20020a170907778600b0068e4bd99fd1so6738084ejc.15
        for <linux-mips@vger.kernel.org>; Tue, 01 Feb 2022 08:01:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9TOgZSvYLjnxXgPMR3aA+UnxenzdhiCu/Ec4ih921w8=;
        b=xBWSkKIekn/WyAK9S6EP76SLBcHuB1vTJs5yiJfgtNmd0ZvB30bWYVwgyDdX1cJ73y
         gZ5QaXLkvLCazLdIilLqZ3qqgL3GXrCXYga2lDos35tndDyHnHclslGKsHmuGhJBwWTQ
         5Pc27LM+UV1vZSIl0I4VZfGzW4GaKydCqsZhSAilKJV1hIuUnqdtaisSBhu3ELK+/zrO
         or2sWsJJa9yCtJ4vJ+PZJtDwxPotIVazpvFLBcR44lof0IP37HOAEN5iUcJjFEd6ePZ7
         erXeCErGQnHf1Y3slXi9kOfZBMtRrevQdvphpEbJMlCPrLMM4gkx2BOsYJQ7oeH4Tn0O
         WQRA==
X-Gm-Message-State: AOAM531WJIePY8KmwVd7IT+BRGPdRzCs/3xlcWzJ5cm79FJB910jrNtK
        kwlg4FBXSyMzLAyIw9NTejrEvM8jmDvuAvU4Rgt9GMHFOfWj0xel6nJtbfmW7zw7csF0NDEvmSH
        C9v17HBsgrA27mEDoioTOwQ==
X-Received: by 2002:a17:907:72d6:: with SMTP id du22mr21767246ejc.179.1643731257032;
        Tue, 01 Feb 2022 08:00:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyi6gqf6sTZV2adqJ/EwU8K0kh4yabr0HjJDqz0uGv4IXAxFUKBb//nn4tH0Br/W6v0yRG1zw==
X-Received: by 2002:a17:907:72d6:: with SMTP id du22mr21767209ejc.179.1643731256826;
        Tue, 01 Feb 2022 08:00:56 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.googlemail.com with ESMTPSA id gh33sm14883510ejc.17.2022.02.01.08.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 08:00:56 -0800 (PST)
Message-ID: <f8359e15-412a-03d6-1b0c-a9f253816497@redhat.com>
Date:   Tue, 1 Feb 2022 17:00:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V5 21/21] KVM: compat: riscv: Prevent KVM_COMPAT from
 being selected
Content-Language: en-US
To:     Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>,
        Drew Fustini <drew@beagleboard.org>,
        Wang Junqiang <wangjunqiang@iscas.ac.cn>,
        Christoph Hellwig <hch@lst.de>,
        linux-arch <linux-arch@vger.kernel.org>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-csky@vger.kernel.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>,
        kvm-riscv@lists.infradead.org, KVM General <kvm@vger.kernel.org>
References: <20220201150545.1512822-1-guoren@kernel.org>
 <20220201150545.1512822-22-guoren@kernel.org>
 <CAAhSdy27nVvh9F08kPgffJe-Y-gOOc9cnQtCLFAE0GbDhHVbiQ@mail.gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAAhSdy27nVvh9F08kPgffJe-Y-gOOc9cnQtCLFAE0GbDhHVbiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/1/22 16:44, Anup Patel wrote:
> +Paolo
> 
> On Tue, Feb 1, 2022 at 8:38 PM <guoren@kernel.org> wrote:
>>
>> From: Guo Ren <guoren@linux.alibaba.com>
>>
>> Current riscv doesn't support the 32bit KVM API. Let's make it
>> clear by not selecting KVM_COMPAT.
>>
>> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>> Signed-off-by: Guo Ren <guoren@kernel.org>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Anup Patel <anup@brainfault.org>
> 
> This looks good to me.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>

Hi Anup,

feel free to send this via a pull request (perhaps together with Mark 
Rutland's entry/exit rework).

Paolo

