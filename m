Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F371522EDFA
	for <lists+linux-mips@lfdr.de>; Mon, 27 Jul 2020 15:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgG0NyH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Jul 2020 09:54:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22712 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728098AbgG0NyH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Jul 2020 09:54:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595858045;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zEtQDs6cVppDK5WKf5nJI5uTNdjoT/6wHXknBUUaQAk=;
        b=dPb6n2EWCCXyrUwNyax6429YodowF8wXf19SWg6Q3NyKYvWFx8emESlgBgYKxYAZR1Xy8m
        P7o8YP1tgUyV4LB+4JplYXFw2ADNMjozyXoKAjsoJqseTixZRE3FvkvZqjSaycQ0hTiFy3
        XNEoD4H+PJaqUwvSwYtSx3vOFrKDTw8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-kiX0T1BsO1KwonkvcdxvLQ-1; Mon, 27 Jul 2020 09:53:56 -0400
X-MC-Unique: kiX0T1BsO1KwonkvcdxvLQ-1
Received: by mail-wm1-f71.google.com with SMTP id s12so6540586wmc.5
        for <linux-mips@vger.kernel.org>; Mon, 27 Jul 2020 06:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zEtQDs6cVppDK5WKf5nJI5uTNdjoT/6wHXknBUUaQAk=;
        b=dFF4vzlMblPgLlw3x9mTJ+Lkc5QiHoedakHrCqpCWgiQpPkDtMfVqDviznWogbpiDd
         6ehUmUtGMbsaTSNFXcKx4IlHzahmAr3+4UCJGdQfUjY31Yh5tnuJOoFyZjWXN9ON6tqJ
         XNUKtMj2r73+EVzSU5SITYLWce4Mtu4lzrZlUS00j4xROnYR2NWrM/PkNYkYgTi36e55
         /LRjytNFoYUHLUjZ+hAssAo1r6b6WIXm+p7LqBT7v8j/8dFizbfgVdnkaQNdiLAgpcGW
         3evvU1qmzWH07ya6l0pNgR68LZKbQ2PFTN+//MnwTChITLvCXiyei8qe8+o01kJTM2LK
         bDVw==
X-Gm-Message-State: AOAM533VdLfCsHwb44VmBZ5zHlAAJu70HWsolE59PDlPE/C89Jh680dp
        ajxG0gO0ozzQkpGXWJNZY6xYIkRZyWM637thFUFDM2gnbOYRfpirChqf8M1uOV42JHrATslFOyK
        QCpvWF5UsxjwBEKOqaimwJw==
X-Received: by 2002:a05:600c:2209:: with SMTP id z9mr20038382wml.70.1595858035175;
        Mon, 27 Jul 2020 06:53:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8T3WYkDDJyVBZk0vOV3Xvzou/NRMJtSKXBjdBGUAmkCaSBmPaaxVeHEWeMNixgTZXBHCw6w==
X-Received: by 2002:a05:600c:2209:: with SMTP id z9mr20038364wml.70.1595858034895;
        Mon, 27 Jul 2020 06:53:54 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:4502:3ee3:2bae:c612? ([2001:b07:6468:f312:4502:3ee3:2bae:c612])
        by smtp.gmail.com with ESMTPSA id y11sm13158673wrs.80.2020.07.27.06.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 06:53:54 -0700 (PDT)
Subject: Re: [PATCH] MIPS: KVM: Fix build error caused by 'kvm_run' cleanup
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc:     kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
References: <1595154207-9787-1-git-send-email-chenhc@lemote.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <21b0e23a-5974-dbcb-0e0a-e2c1847a97d4@redhat.com>
Date:   Mon, 27 Jul 2020 15:53:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595154207-9787-1-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 19/07/20 12:23, Huacai Chen wrote:
> Commit c34b26b98caca48ec9ee9 ("KVM: MIPS: clean up redundant 'kvm_run'
> parameters") remove the 'kvm_run' parameter in kvm_mips_complete_mmio_
> load(), but forget to update all callers.
> 
> Fixes: c34b26b98caca48ec9ee9 ("KVM: MIPS: clean up redundant 'kvm_run' parameters")
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
> I have reviewed Tianjia's patch but hadn't found the bug, I'm very very
> sorry for that.
> 
>  arch/mips/kvm/emulate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
> index d242300c..3b3f7b11 100644
> --- a/arch/mips/kvm/emulate.c
> +++ b/arch/mips/kvm/emulate.c
> @@ -2128,7 +2128,7 @@ enum emulation_result kvm_mips_emulate_load(union mips_instruction inst,
>  			run->mmio.phys_addr, run->mmio.len, run->mmio.data);
>  
>  	if (!r) {
> -		kvm_mips_complete_mmio_load(vcpu, run);
> +		kvm_mips_complete_mmio_load(vcpu);
>  		vcpu->mmio_needed = 0;
>  		return EMULATE_DONE;
>  	}
> 

Queued, thanks.

Paolo

