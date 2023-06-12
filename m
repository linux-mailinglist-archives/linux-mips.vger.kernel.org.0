Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D155972D51D
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jun 2023 01:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237728AbjFLXpt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Jun 2023 19:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236810AbjFLXpt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Jun 2023 19:45:49 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77AF3171A
        for <linux-mips@vger.kernel.org>; Mon, 12 Jun 2023 16:45:46 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5147dce372eso7301112a12.0
        for <linux-mips@vger.kernel.org>; Mon, 12 Jun 2023 16:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686613545; x=1689205545;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J6RKBwJ1snfOShsMKSa/kdTwHRc2sX8E52+VmBrW73M=;
        b=d3xgiOjtTog0mLVt0UUF6SYGGd8ZNr4HF7QbG3ANNB0F9pm2Mnfq6cMKvB6sbMuSRV
         QgWIqQPT0Bz/c6PzgCrCP7PjhIQEf53F9Hq1ZzRfje3zYm9eFWGopD2mOQlyY3W6Ct1C
         diLMaiEHR/d2lY6XdYCuUVT8MxiBw26YRbJ+vLXKhx4eckjH/IBs8Vu650PjnGgHLZfm
         F+52i+6LlG/DNA9AL6mhi/Ytu30a/yapXnU8e4vUqRcJdEh8s8OFO1YXOUJadub+iQHv
         z6vbdQtv6OfPN8ZdleCLjbUevHZa+Wcr6lxGX03ENnGWHZ1Zg+XQGmkr7kxiw7qx+njU
         qXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686613545; x=1689205545;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6RKBwJ1snfOShsMKSa/kdTwHRc2sX8E52+VmBrW73M=;
        b=gqJ1+mRdDvKJPpNQ+zWJx1DAE2ifPke/f8Cq/9QpOcilCONA85Ft/bGvX0odhZrSOm
         JQhN0FespaAuvkBZsSepL60Q/g45G5w/lFjHNQ8ca22O8hDndi1ey3X4yEk32p+qAbpV
         n735k7Fgf302l4Mb2j8S88Ehz2e0p4HKQMaq9LtsC+Be3o52UX9wSSHQqbuEFVHnfl/B
         jVbOvRjH1iaSYKdz4mMiflIpnki5aOSrE2O5p/WA4WWRAP5ts41XfkY6F8tJn9NRHaB1
         VvPy6fJz3cVLlaPKaPSoOLnyRA0+IOzAgWRRKLu//58YYpGjQPfC/lA96x8ivzleoqFN
         MQ2g==
X-Gm-Message-State: AC+VfDzTQBsmccJPJI7mpjrz+tiMPLcjrrN4DB5K85yqoBuif+GbOHMG
        MEy0rLQ2ZB43GZAjYO2rp/wllA==
X-Google-Smtp-Source: ACHHUZ6dtuV5DoYQYE0R52xSIR6NpJYLC8VAvw2sPNu3DqvDkPqqCuCfv+mCrhCPNNxlAI9Ns3XUug==
X-Received: by 2002:a17:906:dac3:b0:96f:9608:da7c with SMTP id xi3-20020a170906dac300b0096f9608da7cmr11947868ejb.36.1686613544905;
        Mon, 12 Jun 2023 16:45:44 -0700 (PDT)
Received: from [10.10.0.115] ([185.140.244.249])
        by smtp.gmail.com with ESMTPSA id h18-20020a1709063b5200b0097457363fc0sm5849378ejf.33.2023.06.12.16.45.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 16:45:44 -0700 (PDT)
Message-ID: <41b22e82-fd6c-5bcd-44ae-e5b799ed0175@linaro.org>
Date:   Tue, 13 Jun 2023 01:45:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [patch V4 04/37] x86/smpboot: Rename start_cpu0() to
 soft_restart_cpu()
Content-Language: en-US
To:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     x86@kernel.org, David Woodhouse <dwmw2@infradead.org>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Brian Gerst <brgerst@gmail.com>,
        Arjan van de Veen <arjan@linux.intel.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Paul McKenney <paulmck@kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Sean Christopherson <seanjc@google.com>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Piotr Gorski <lucjan.lucjanov@gmail.com>,
        Usama Arif <usama.arif@bytedance.com>,
        Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        xen-devel@lists.xenproject.org,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        linux-csky@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Sabin Rapan <sabrapan@amazon.com>,
        "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
        Ross Philipson <ross.philipson@oracle.com>
References: <20230512203426.452963764@linutronix.de>
 <20230512205255.662319599@linutronix.de>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230512205255.662319599@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/5/23 23:07, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> This is used in the SEV play_dead() implementation to re-online CPUs. But
> that has nothing to do with CPU0.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Michael Kelley <mikelley@microsoft.com>
> ---
>   arch/x86/include/asm/cpu.h   |    2 +-
>   arch/x86/kernel/callthunks.c |    2 +-
>   arch/x86/kernel/head_32.S    |   10 +++++-----
>   arch/x86/kernel/head_64.S    |   10 +++++-----
>   arch/x86/kernel/sev.c        |    2 +-
>   5 files changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

