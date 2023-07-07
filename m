Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3781E74AD56
	for <lists+linux-mips@lfdr.de>; Fri,  7 Jul 2023 10:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232160AbjGGIuL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Jul 2023 04:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbjGGIuI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Jul 2023 04:50:08 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 644782100
        for <linux-mips@vger.kernel.org>; Fri,  7 Jul 2023 01:50:05 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-993a37b79e2so201605066b.1
        for <linux-mips@vger.kernel.org>; Fri, 07 Jul 2023 01:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688719804; x=1691311804;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5RjK+qC2yMFJgjkKw6erEN3Jd2b9gaqG22ipLAdc2dU=;
        b=XrbXfRmQCjUscV2Ba8aT4CeqI8SHGzhgNT19Z+cXVUVjsfjlY727uM5XgaL3/HGEmE
         rincuPV1ve3upDuPmcKf8yyDZ0uYqQ0RgcFsz3NX051UPBbVCeG/wcrgU9jKo7ealzIF
         FM0qSpBNBBwnXNaZMFUqTZnhoZ2vVMkDcoPBNiSUEvogy6JTo6ViMLgGEnZK5AtAJfUN
         H+KmB832D8xMunS52RPmzM8geXB3umrm+7r7KDi4I/dGdIg0v8AXc6NCT68I8aIHJms6
         zLIccr5zXTaQXVpoWOnsoxD2gaz+QSY9UbEMLWAKhEmS1P5om5naa7O7dZvbYo0reRWc
         z2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688719804; x=1691311804;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5RjK+qC2yMFJgjkKw6erEN3Jd2b9gaqG22ipLAdc2dU=;
        b=MNzy9tZt8cbYEeG2yFAUG5s4xWsDjxHUQJXvEK8hUyeeWx3Sbv90FOW0CaQGK86U3J
         46R2CQEiOVmJZLiGYL+dP6Oi0XE1CxD1L424lb1o/0WlEDP1K1EwK9JO4LTIuPxdJ1WZ
         0RTIWHoLF0EYprNHjMDyc2bH3swHooov02in0u/YMpgONaq21sdhHp2I5hjnqUNdMByY
         dkb1CoBtwtQtzL49yuu4Y7+b8Np7NMyJUoYI2q0lX9W/HvvNMFWWPkzVOfKqNRVUpkP+
         SQ3dJbfCOPEQKPJL/N6PeSGvaTfmMlFVoiO+Y8BuZfQJ916olxY0zp+BVf6pf9KWFAXC
         EFpw==
X-Gm-Message-State: ABy/qLYsUPJ+9BwTSczK+crUt939O9TjkEAHuhyFJImHcTJ9BaMUb6sc
        UI7CsEj8RkZYLVgDEwgH0QPy7Q==
X-Google-Smtp-Source: APBJJlFoSNKdTxcrVTzHzXQ9XY797yl1F/eHgY+ESTfu/TLkIN4acobfLB5NWFomyTRDzX+c+XGX5Q==
X-Received: by 2002:a17:906:5291:b0:973:e5d9:d6ff with SMTP id c17-20020a170906529100b00973e5d9d6ffmr2680060ejm.66.1688719803836;
        Fri, 07 Jul 2023 01:50:03 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.215.192])
        by smtp.gmail.com with ESMTPSA id v1-20020a170906b00100b00993a9a951fasm1933484ejy.11.2023.07.07.01.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 01:50:03 -0700 (PDT)
Message-ID: <d662fe0e-e463-5c22-2e31-31aec6307c05@linaro.org>
Date:   Fri, 7 Jul 2023 10:50:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] MIPS: kvm: Fix build error with
 KVM_MIPS_DEBUG_COP0_COUNTERS enabled
Content-Language: en-US
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230706163610.106938-1-tsbogend@alpha.franken.de>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230706163610.106938-1-tsbogend@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 6/7/23 18:36, Thomas Bogendoerfer wrote:
> Commit e4de20576986 ("MIPS: KVM: Fix NULL pointer dereference") missed
> converting one place accessing cop0 registers, which results in a build
> error, if KVM_MIPS_DEBUG_COP0_COUNTERS is enabled.
> 
> Fixes: e4de20576986 ("MIPS: KVM: Fix NULL pointer dereference")
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>   arch/mips/kvm/stats.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/kvm/stats.c b/arch/mips/kvm/stats.c
> index 53f851a61554..3e6682018fbe 100644
> --- a/arch/mips/kvm/stats.c
> +++ b/arch/mips/kvm/stats.c
> @@ -54,9 +54,9 @@ void kvm_mips_dump_stats(struct kvm_vcpu *vcpu)
>   	kvm_info("\nKVM VCPU[%d] COP0 Access Profile:\n", vcpu->vcpu_id);
>   	for (i = 0; i < N_MIPS_COPROC_REGS; i++) {
>   		for (j = 0; j < N_MIPS_COPROC_SEL; j++) {
> -			if (vcpu->arch.cop0->stat[i][j])
> +			if (vcpu->arch.cop0.stat[i][j])
>   				kvm_info("%s[%d]: %lu\n", kvm_cop0_str[i], j,
> -					 vcpu->arch.cop0->stat[i][j]);
> +					 vcpu->arch.cop0.stat[i][j]);
>   		}
>   	}
>   #endif

Oops, sorry I missed that :/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

