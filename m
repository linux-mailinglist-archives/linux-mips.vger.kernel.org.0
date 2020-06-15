Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB1A11F9357
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2020 11:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728825AbgFOJ0l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jun 2020 05:26:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55510 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728921AbgFOJ0l (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Jun 2020 05:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592213199;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yI7E/YvuE5G4Fcq1XlBfdWH6990iBDxnfkOv+u2TlXw=;
        b=PTXwmeFBtVMuggAUQT0izOriAkfmOkHrj133IkW1tL/KtM9+tq1tcMEYXeNrMtdbzKXms9
        RvuNlBIW/TaTs1OImgXbrrGJxnc3BWf32IJIYBXi1EerQBOC7Kehz/uYkQrV3OziRkS659
        Jj3e5nQq+Rz5aX1GG2DnBOl5Dbw1Fqs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-Q8CJsFk-OjCOjDl1hqfcHQ-1; Mon, 15 Jun 2020 05:26:38 -0400
X-MC-Unique: Q8CJsFk-OjCOjDl1hqfcHQ-1
Received: by mail-wr1-f70.google.com with SMTP id a4so6793776wrp.5
        for <linux-mips@vger.kernel.org>; Mon, 15 Jun 2020 02:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yI7E/YvuE5G4Fcq1XlBfdWH6990iBDxnfkOv+u2TlXw=;
        b=Q8wxjG1MWp/PzFvab3An8uBSUFQiz0+SNqzYBUmpacxomIONPzSu2KB71PDzR895gD
         SCDFog0g8ukiyj9MP1RROd2W7f/Rd6Jm/nGXm2ksGx8NLMM+KL5Q7Qn7CgN4aq7sXtxP
         lpDU7iTZLTstUNJY+eHZa+Q3LL+wdpVh0eB1DTPw92sxhRX52Dwbo8RgGO08sBxxgSiL
         aw4hQS4fgnWzOcPyNFlc+M2fk1sFUaeh491DL/4aQbMxs2n8VIMpGIpXqrUSAbXQvNnN
         D5aSRZDeT/+LU/SLV4Hq4T8naUF/GfxmobVv8X6FawCfeUJwti7VFAd6iMrcgY9LWNXz
         WYGQ==
X-Gm-Message-State: AOAM530ax8xPo+3+18jzCp7oQgOz/wR/kedFe/79zN9WDQ/2gLiVR46o
        hYkj+QrSl01mGfwp4VhRKmd4VbInFG6Rsl5QIV8uwN0fsoX2T4l5WWQALYzNKeuGkxzqTPuITeY
        CdnYMtpfAE6pwj2EY+R85MQ==
X-Received: by 2002:adf:f64c:: with SMTP id x12mr26458190wrp.281.1592213196406;
        Mon, 15 Jun 2020 02:26:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBtzTDMfu3sHAYPmv3xH0MlQ/aHw1xIOVTm9Cdt6pwa2j2+XFFTGe83BYVXxw0al8P+9Og3A==
X-Received: by 2002:adf:f64c:: with SMTP id x12mr26458166wrp.281.1592213196197;
        Mon, 15 Jun 2020 02:26:36 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.170.5])
        by smtp.gmail.com with ESMTPSA id d63sm22753270wmc.22.2020.06.15.02.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2020 02:26:35 -0700 (PDT)
Subject: Re: [PATCH] KVM: MIPS: Fix a build error for !CPU_LOONGSON64
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc:     kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <1592204215-28704-1-git-send-email-chenhc@lemote.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b22d90eb-5a4c-6d09-2585-f3aba45b72dc@redhat.com>
Date:   Mon, 15 Jun 2020 11:26:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1592204215-28704-1-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 15/06/20 08:56, Huacai Chen wrote:
> During the KVM merging progress, a CONFIG_CPU_LOONGSON64 guard in commit
> 7f2a83f1c2a941ebfee53 ("KVM: MIPS: Add CPUCFG emulation for Loongson-3")
> is missing by accident. So add it to avoid building error.
> 
> Fixes: 7f2a83f1c2a941ebfee53 ("KVM: MIPS: Add CPUCFG emulation for Loongson-3")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>  arch/mips/kvm/mips.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index 521bd58..666d335 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -67,8 +67,10 @@ struct kvm_stats_debugfs_item debugfs_entries[] = {
>  	VCPU_STAT("vz_ghfc", vz_ghfc_exits),
>  	VCPU_STAT("vz_gpa", vz_gpa_exits),
>  	VCPU_STAT("vz_resvd", vz_resvd_exits),
> +#ifdef CONFIG_CPU_LOONGSON64
>  	VCPU_STAT("vz_cpucfg", vz_cpucfg_exits),
>  #endif
> +#endif
>  	VCPU_STAT("halt_successful_poll", halt_successful_poll),
>  	VCPU_STAT("halt_attempted_poll", halt_attempted_poll),
>  	VCPU_STAT("halt_poll_invalid", halt_poll_invalid),
> 


Queued, thanks.

Paolo

