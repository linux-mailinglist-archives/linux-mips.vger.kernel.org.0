Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B614695BF8
	for <lists+linux-mips@lfdr.de>; Tue, 14 Feb 2023 09:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbjBNIFe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Feb 2023 03:05:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231749AbjBNIFP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Feb 2023 03:05:15 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A5F21A04
        for <linux-mips@vger.kernel.org>; Tue, 14 Feb 2023 00:05:12 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id l21-20020a05600c1d1500b003dfe462b7e4so707694wms.0
        for <linux-mips@vger.kernel.org>; Tue, 14 Feb 2023 00:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JF52YzZhW4elUM7Kky6bPhzQenJZTY4P/46jrbrklX0=;
        b=evhLL97JMkNYAYn9bGpom2GYrZHUYt2CtyFeYuIEml6T8racA9Aij5ni53nA2qN2B/
         7ol3c+EAOiUcR3bb0Nbg6oEblv3Vg7fMwY7/0LEF5VCVPbgg/9qJMYGdcPWyfh/NzUJP
         nVm8iXoCxY27TAbyblLvNVZ54uQ2sCsTY83Lokf3aopdz/EdDYYXBo8GWIClq0AGjewl
         aTkyCiKCaGx5UjLiSjzaakSSVH5DgeZyjpiMZih++pjBLki4KH45JDUvESt1xmw+rXib
         kUDSlfXab71A8Mkvhrw8TlHo9Ob8++YPLFpUADMuiGoEgIwoLSkBvntwalRx8rWTfTF1
         ikQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JF52YzZhW4elUM7Kky6bPhzQenJZTY4P/46jrbrklX0=;
        b=cLbnZqo/CaMdlxpBTazRvUNZd5SglMq9nzQqm0AschfYVtdOCnTygT8P05IUfv2Kcq
         h53tmN2JTEvmq8W2WE2p9zwlcokIZNLwFAKfwJ17wtQpHFgQKresBNi1u4winIgsZ/3x
         lIF/Aiin+TbVDG+ep2A559DCdEa1p0szPz7gojb+Yn7E8N2k0zZjtKN81LOF6G8mgzkl
         CHdr4+zgYmAI5ofBAHkDNEkk+TiwvYoEa5Jt0UkZ/RJvY6/6jHDsPLcPrea0XRSupfBa
         bJ/8CjR7EGXZ9gl/SGTkSI9rc1w3yqzgHgbhJSjIYPfKdD6QsykdmszXpSErXHP/8HUe
         H+aw==
X-Gm-Message-State: AO0yUKUv8AhtpnGvB3f3igl1rUJwX2SOVeVPKlH7VFSjOiFMwOU7D46F
        1sUyFnYZcoKOOwR0NDAamZRGpw==
X-Google-Smtp-Source: AK7set+HRG63gtrfZ+yNMRuCoXR1/Fc+yCbk1jg17GVbOh3n568w3mx2NtmeBnWmKBshSuBezAU6Uw==
X-Received: by 2002:a05:600c:3d98:b0:3e1:e149:b67b with SMTP id bi24-20020a05600c3d9800b003e1e149b67bmr8681792wmb.18.1676361911280;
        Tue, 14 Feb 2023 00:05:11 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id d5-20020a1c7305000000b003dc4baaedd3sm18757416wmb.37.2023.02.14.00.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 00:05:10 -0800 (PST)
Message-ID: <579b0715-dba2-246c-63a1-7e0ef4e9f9a5@linaro.org>
Date:   Tue, 14 Feb 2023 09:05:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 17/24] x86/cpu: Make sure play_dead() doesn't return
Content-Language: en-US
To:     Josh Poimboeuf <jpoimboe@kernel.org>, linux-kernel@vger.kernel.org
Cc:     jgross@suse.com, richard.henderson@linaro.org,
        ink@jurassic.park.msu.ru, mattst88@gmail.com,
        linux-alpha@vger.kernel.org, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
        will@kernel.org, guoren@kernel.org, linux-csky@vger.kernel.org,
        linux-ia64@vger.kernel.org, chenhuacai@kernel.org,
        kernel@xen0n.name, loongarch@lists.linux.dev, f.fainelli@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org, jiaxun.yang@flygoat.com,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org, ysato@users.sourceforge.jp,
        dalias@libc.org, linux-sh@vger.kernel.org, davem@davemloft.net,
        sparclinux@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com,
        linux-xtensa@linux-xtensa.org, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
        paulmck@kernel.org
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <11e6ac1cf10f92967882926e3ac16287b50642f2.1676358308.git.jpoimboe@kernel.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <11e6ac1cf10f92967882926e3ac16287b50642f2.1676358308.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 14/2/23 08:05, Josh Poimboeuf wrote:
> After commit 076cbf5d2163 ("x86/xen: don't let xen_pv_play_dead()
> return"), play_dead() never returns.  Make that more explicit with a
> BUG().
> 
> BUG() is preferable to unreachable() because BUG() is a more explicit
> failure mode and avoids undefined behavior like falling off the edge of
> the function into whatever code happens to be next.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>   arch/x86/include/asm/smp.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/include/asm/smp.h b/arch/x86/include/asm/smp.h
> index b4dbb20dab1a..8f628e08b25a 100644
> --- a/arch/x86/include/asm/smp.h
> +++ b/arch/x86/include/asm/smp.h
> @@ -96,6 +96,7 @@ static inline void __cpu_die(unsigned int cpu)
>   static inline void play_dead(void)
>   {
>   	smp_ops.play_dead();
> +	BUG();
>   }

Similarly, smp_ops::play_dead() should be decorated noreturn first.
