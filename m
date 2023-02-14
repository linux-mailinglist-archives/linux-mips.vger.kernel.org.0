Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AABF4695B83
	for <lists+linux-mips@lfdr.de>; Tue, 14 Feb 2023 08:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbjBNH6K (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Feb 2023 02:58:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231643AbjBNH5q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Feb 2023 02:57:46 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CA842278E
        for <linux-mips@vger.kernel.org>; Mon, 13 Feb 2023 23:57:44 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id j23so14737480wra.0
        for <linux-mips@vger.kernel.org>; Mon, 13 Feb 2023 23:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/y3DoebXU2aSRTyTPgatGNryU5LQnPO9lrblNWAcqag=;
        b=FL1ODDD/dH0Fe6e9PftNHR2p1QM5RdtNbSNzqlK8pNihYv6DfVt9L8P4pf7gFWx8t9
         y7Myyo7fNfEgvIVHxiwayOczBTVyPShNBJ+OyPBbO2TGT73uZHOhE3xZtTrnwGF0MT+v
         t8HDjwcNYJ3GyE9n9IqdapPU+YITuv62k93vOPRVKNP4lguYU+6Ab9dRsm/1X2dXcAVB
         5VOmuk01NjVUhEIq+/0xsdIu4HhgQwnS4aeU6D7zwtcEsT7QviV6e0w82yhAQ3D1LK0D
         EflN9bEH39Ng0giNeci5B2LCie2rjDM+BdrF7iU+PFyH9SNv22kw1gwN55V2cUJYlnUa
         Ft5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/y3DoebXU2aSRTyTPgatGNryU5LQnPO9lrblNWAcqag=;
        b=Z5cP9QOWfTuh9mK8wGzoyn+htB93rzI6J8P7Vf54HZDowyKiZHoEQ+zmbd+Rl+AKZd
         WIKhnkvppci2qCcQXChobBAoFlLnO7Sb7UGhHXuJSX+QwkXZdu7FRoWMBTu5cc7kKgX3
         iLXGMFESJTc3ESd8UyMjavs3iaXh+yo9RfUL37uMssMY5vfosSSXw/86VBvQKZHjHgd5
         JAz4XOy+Vmo52K49FtugbBccuJ9cwZKqq396QHiYNncBmURj/5QxlfyK+4MzMhICnKL7
         miawMCOQtjs3C20YLIWWyr7N/Dk9ebFye/FMr84CXdjliJerstANSQlBJnfn2rF4cS3U
         W+vw==
X-Gm-Message-State: AO0yUKW3TWZv2tDQEVKstqB7WuZs5afbEizBIFVlJ23957W2rlte5Nyb
        5Zr5SBq/vW4KJzJSy9CS8nLa3Q==
X-Google-Smtp-Source: AK7set/s62h/fO0i39nDWEPXBi6NKjg0gNVQNim1tERqh4PVsEAEgwi+kKdJTAleWFN9GVgtgNq8RA==
X-Received: by 2002:a05:6000:8b:b0:2bd:f5bd:5482 with SMTP id m11-20020a056000008b00b002bdf5bd5482mr1139258wrx.28.1676361462875;
        Mon, 13 Feb 2023 23:57:42 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id h12-20020adff4cc000000b002be505ab59asm12483785wrp.97.2023.02.13.23.57.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 23:57:42 -0800 (PST)
Message-ID: <2575e5f7-b11a-020f-06ef-ba42301d7415@linaro.org>
Date:   Tue, 14 Feb 2023 08:57:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v2 13/24] sh/cpu: Make sure play_dead() doesn't return
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
 <d0c3ff5349adfe8fd227acc236ae2c278a05eb4c.1676358308.git.jpoimboe@kernel.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d0c3ff5349adfe8fd227acc236ae2c278a05eb4c.1676358308.git.jpoimboe@kernel.org>
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
> play_dead() doesn't return.  Make that more explicit with a BUG().
> 
> BUG() is preferable to unreachable() because BUG() is a more explicit
> failure mode and avoids undefined behavior like falling off the edge of
> the function into whatever code happens to be next.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>   arch/sh/include/asm/smp-ops.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/sh/include/asm/smp-ops.h b/arch/sh/include/asm/smp-ops.h
> index e27702130eb6..63866b1595a0 100644
> --- a/arch/sh/include/asm/smp-ops.h
> +++ b/arch/sh/include/asm/smp-ops.h
> @@ -27,6 +27,7 @@ static inline void plat_smp_setup(void)
>   static inline void play_dead(void)
>   {
>   	mp_ops->play_dead();
> +	BUG();
>   }

Shouldn't we decorate plat_smp_ops::play_dead() as noreturn first?
