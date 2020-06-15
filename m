Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7961F9353
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2020 11:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728921AbgFOJ0N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jun 2020 05:26:13 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25063 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728180AbgFOJ0N (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 15 Jun 2020 05:26:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592213172;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hZRUtaUJ932ZlCQQbbYzNzjvtVWhAHymSOYbwBdTnCE=;
        b=A4x8o1OddXomIaU3Xpx21D/ai8WKXQX/U1JsYvVHNbhFsgAAZQauex02M5iED9+XxQTBkM
        KKfB02jDvCSDGoDGZuoueXsnSghcHgcvFA2N9K4lTS2x9M/ExQb4ppIv6GNim+YCzDQhTZ
        NyIJzaT2HVT+ASraUQFX2GyLI7Apg6g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-vdZNOGWROdqlSZzBxM-Qkg-1; Mon, 15 Jun 2020 05:26:08 -0400
X-MC-Unique: vdZNOGWROdqlSZzBxM-Qkg-1
Received: by mail-wr1-f71.google.com with SMTP id p9so6827774wrx.10
        for <linux-mips@vger.kernel.org>; Mon, 15 Jun 2020 02:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hZRUtaUJ932ZlCQQbbYzNzjvtVWhAHymSOYbwBdTnCE=;
        b=teEGzPlCRFAjWqTE0TVByVr50Rt3Pi16PLLHMqui2Wn2Dg8Y7PFI5rH350mMp7UJkr
         AVUkUqc5KHS5SBM5jrdc+bsR/kROGvc4BaW/RC95wcnFpBaY+/Hw8mPAg9ymegwyKCsg
         uUkCP2Mw2nn9KirKVF7Gvaw4OHtLRKekJpMVpdFVTn12s/mUNArtoHninEokzIu3NkUB
         jOFMHIuamVAHFIf3pUUTi/X5ugwnqSogoGtxR2Ky92QzajvI7um2RmNARBx1ckzqcXWJ
         Iddol85k3REdmVA+M7or+TwK7VG0y1ip3fuEErx6WmCo9tKxhjluXI/a1+R6/BfsLW+R
         U4PA==
X-Gm-Message-State: AOAM530d0bWz7i69gh3ttUoiorFBNWBtaGTsaU6YQFrcZlojvKFj+tgQ
        9UpCGYagzCQ/mcZeUbL+aeiZGOFPrDuEIRtD/87j/QmRVmvBUMhLLg22Aj9q8aZ1NF9K/YbAmTn
        KLIrg3lnTp5VjDj2baMTdng==
X-Received: by 2002:a5d:500d:: with SMTP id e13mr29684528wrt.150.1592213166872;
        Mon, 15 Jun 2020 02:26:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzv8DVyRZi9qtb8K0ghXXPE5Md7jQA6TvmLQFzaSBYlaUpm2+z2htDOIiu8mMzNA9/r75JKzw==
X-Received: by 2002:a5d:500d:: with SMTP id e13mr29684499wrt.150.1592213166643;
        Mon, 15 Jun 2020 02:26:06 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.170.5])
        by smtp.gmail.com with ESMTPSA id t8sm21120194wmi.46.2020.06.15.02.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2020 02:26:06 -0700 (PDT)
Subject: Re: [PATCH] KVM: MIPS: fix spelling mistake "Exteneded" -> "Extended"
To:     Colin King <colin.king@canonical.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        kvm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200615082636.7004-1-colin.king@canonical.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8719ff21-8344-a4d0-112b-c7876f0b6f29@redhat.com>
Date:   Mon, 15 Jun 2020 11:26:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200615082636.7004-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 15/06/20 10:26, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a couple of kvm_err messages. Fix them.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  arch/mips/kvm/emulate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
> index 5ae82d925197..d3d322f70fe0 100644
> --- a/arch/mips/kvm/emulate.c
> +++ b/arch/mips/kvm/emulate.c
> @@ -1861,7 +1861,7 @@ enum emulation_result kvm_mips_emulate_store(union mips_instruction inst,
>  				  vcpu->arch.gprs[rt], *(u64 *)data);
>  			break;
>  		default:
> -			kvm_err("Godson Exteneded GS-Store not yet supported (inst=0x%08x)\n",
> +			kvm_err("Godson Extended GS-Store not yet supported (inst=0x%08x)\n",
>  				inst.word);
>  			break;
>  		}
> @@ -2103,7 +2103,7 @@ enum emulation_result kvm_mips_emulate_load(union mips_instruction inst,
>  			vcpu->mmio_needed = 30;	/* signed */
>  			break;
>  		default:
> -			kvm_err("Godson Exteneded GS-Load for float not yet supported (inst=0x%08x)\n",
> +			kvm_err("Godson Extended GS-Load for float not yet supported (inst=0x%08x)\n",
>  				inst.word);
>  			break;
>  		}
> 

Queued, thanks.

Paolo

