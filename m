Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40B8C24033C
	for <lists+linux-mips@lfdr.de>; Mon, 10 Aug 2020 10:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgHJILy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 10 Aug 2020 04:11:54 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44476 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726115AbgHJILx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 10 Aug 2020 04:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597047111;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zC1toKyx2VR+U9KzPo/PLlhMRukBuugOL6OoEK15XWo=;
        b=SaVuQHoAemjvkwGob5LvIq1/GupOG5FcC/6gvtmNVKMNVv/j0+hATlwvSiVNrROZxSBe8q
        4llgTJEm3EtUMWIhYLyKcRusKIUf54UsiH1C7tDBRbgu4Tg2C9+Js96DVlcbV5GaktlOdt
        fUgYQ2Vdu0a2hpxvOK+sN2f3z+blDoY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-1OoPpLK3PbKHvBWeV4Ikxw-1; Mon, 10 Aug 2020 04:11:49 -0400
X-MC-Unique: 1OoPpLK3PbKHvBWeV4Ikxw-1
Received: by mail-wr1-f69.google.com with SMTP id j2so3917927wrr.14
        for <linux-mips@vger.kernel.org>; Mon, 10 Aug 2020 01:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zC1toKyx2VR+U9KzPo/PLlhMRukBuugOL6OoEK15XWo=;
        b=Y7XU0+pzpcX4bky9ECqasUFfjtgic/uslcZMvo9am4zDRXTB1veRorzV1bt2324Chc
         tnKEwgOg6IJm64Ubg8Jc1xJKOhm1Ycap6LVFPGiNpQihco/RBTKttMQqyHfmE/qnoGa/
         VO1E3ptPaulAY+IHpqlyZf5QeWsJ2zxQGvxcQeiLXo5IlQxb2NCoHVO7Gu/53qD4oxZg
         s8AOKjkFAPo/arSX9RsG1GQVc0MmNqYf/sQ6p8bVQl/wwKK+kS9AEX9OHNc8A/KK9PIc
         6BeO/c0rQjgeXVsW8/SOLohM0N+TcEqb+7/vzny99HGOP8RUuIZPAAmd9TinwZdxlzJa
         fDlg==
X-Gm-Message-State: AOAM530IAUCwqNz1A0xqSnlgkx57y4wdzQim78IWFpDt3pa3X/NFGBP1
        fuoXsWuckLkbPx8EZdTgq7VVlj9L+inyxKP13UpGYXLuB5FTPhkziYKwcJ5BAHxD7AQ+P/O0KNr
        sqQ1p8J02kzBKl53uzGVQgQ==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr22915224wrv.318.1597047108706;
        Mon, 10 Aug 2020 01:11:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx06vKPGNJTLrqXR4QKmwbxkXMvNDUzd/1ArhhCxhYjuqxYkRBJZpNV0anpK/U2bP0kmVxWYw==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr22915196wrv.318.1597047108466;
        Mon, 10 Aug 2020 01:11:48 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5d6c:f50:4462:5103? ([2001:b07:6468:f312:5d6c:f50:4462:5103])
        by smtp.gmail.com with ESMTPSA id f131sm20877690wme.40.2020.08.10.01.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2020 01:11:47 -0700 (PDT)
Subject: Re: [PATCH RESEND for-5.9] MIPS: KVM: Convert a fallthrough comment
 to fallthrough
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, kvm@vger.kernel.org
Cc:     Huacai Chen <chenhc@lemote.com>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200810011749.3211128-1-jiaxun.yang@flygoat.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <a479bd7f-a71b-441d-4e82-6bcc163bab71@redhat.com>
Date:   Mon, 10 Aug 2020 10:11:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200810011749.3211128-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/08/20 03:17, Jiaxun Yang wrote:
> There is a fallthrough comment being forgotten,
> GCC complains about it:
> 
> arch/mips/kvm/emulate.c: In function kvm_mips_emulate_load:
> arch/mips/kvm/emulate.c:1936:21: error: this statement may fall through
>  1936 |   vcpu->mmio_needed = 1; /* unsigned */
>       |   ~~~~~~~~~~~~~~~~~~^~~
> arch/mips/kvm/emulate.c:1939:2: note: here
>  1939 |  case lw_op:
> 
> Just fix it.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: Huacai Chen <chenhc@lemote.com>
> ---
> This is blocking KVM MIPS from build, so it needs to get into 5.9.
> ---
>  arch/mips/kvm/emulate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
> index 703782355318..d70c4f8e14e2 100644
> --- a/arch/mips/kvm/emulate.c
> +++ b/arch/mips/kvm/emulate.c
> @@ -1935,7 +1935,7 @@ enum emulation_result kvm_mips_emulate_load(union mips_instruction inst,
>  
>  	case lwu_op:
>  		vcpu->mmio_needed = 1;	/* unsigned */
> -		/* fall through */
> +		fallthrough;
>  #endif
>  	case lw_op:
>  		run->mmio.len = 4;
> 

Queued, thanks.

Paolo

