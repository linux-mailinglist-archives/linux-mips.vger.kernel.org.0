Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D80FF72D522
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jun 2023 01:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238186AbjFLXqK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Jun 2023 19:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234959AbjFLXqK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Jun 2023 19:46:10 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B118D1727
        for <linux-mips@vger.kernel.org>; Mon, 12 Jun 2023 16:46:04 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5169f614977so8537655a12.3
        for <linux-mips@vger.kernel.org>; Mon, 12 Jun 2023 16:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686613563; x=1689205563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8wbDZKmo9VP00ABKYaLGQ28GM2QOo4QwYdlCxLvFQV0=;
        b=xTqZLje4stFH7gdg9tw2fGuaNoAlSVyZ9bZDgTUiGpVn1rKnmnRRB/wOdsBKdk3M45
         XyM6zqrGB41V6amFO878oAEpaEipM+J+IhZ6OUQnO6vb96iOf43xb+cTOPWDW6SPGUvU
         wbzhN3iKgf+ErheqSRMoxFxfGjuBsXPFyA9Nf8eealnhw6j5dxAexUg8TC0HYjPKNm9+
         cmH1X+muu7EXkJdtUp+5TMYcw4rbxC4VhQQvi+yG5WIIqUjSEFDaY+a9WqK4wgXHrhfU
         58f1vI8ofPwecC+2UBaX1dI7mOlCr37zZFNYbepf9z+FBvhotWk1bkOhqbtAhvfg0arh
         BtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686613563; x=1689205563;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8wbDZKmo9VP00ABKYaLGQ28GM2QOo4QwYdlCxLvFQV0=;
        b=hC8REQS7pSqCeqQ7LczcWvi/2F7airgW5Q6i5z7KXiv4SHWla/gScQAohsToHjO5nw
         9Gp6n6nUbo/AbhVHBmSpTKMMy8syq5elcIxJyqGZ4OerpA0+wI2tBn2/Z1SgzPzYt5FK
         skPL0gsLOUOBGxQymY7MI4XeG00RNowtjbMsC/Urj/o4jm3HFTYAzVlDxfEx6/HCUh5S
         ZP1KSe2aCBoRFgrQjp6B9h/ANwHKwWy4y+m9OKjHCTvPQO8OkDhWwxQTEtKIXxgbJwUW
         pF40VGB+LTi37e/0ZocOzJGTuHKiROxNGXEskS6mviljkOXV69W7DOyxDlHrugN8O2/3
         9MVA==
X-Gm-Message-State: AC+VfDyyvQeitg3tDIA983fEnnncrSAiQl290bCWpnVTQroQlJeTCx4o
        5oUkwnFOR2qlNPgbqa+dGbYWYg==
X-Google-Smtp-Source: ACHHUZ5ctYtCeisGQ2uomlCypPix/oMuhk7GCBAQ91QMqgz33FoH6mnEV6NDszFqNC1dju2nqgRtMA==
X-Received: by 2002:a05:6402:898:b0:514:77f5:d77c with SMTP id e24-20020a056402089800b0051477f5d77cmr6507743edy.1.1686613563154;
        Mon, 12 Jun 2023 16:46:03 -0700 (PDT)
Received: from [10.10.0.115] ([185.140.244.249])
        by smtp.gmail.com with ESMTPSA id x22-20020aa7cd96000000b0050bca43ff55sm5689515edv.68.2023.06.12.16.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 16:46:02 -0700 (PDT)
Message-ID: <a242cbd8-3ae5-62b0-fbb8-92a51dd7bc18@linaro.org>
Date:   Tue, 13 Jun 2023 01:46:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [patch V4 07/37] x86/smpboot: Restrict soft_restart_cpu() to SEV
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
 <20230512205255.822234014@linutronix.de>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230512205255.822234014@linutronix.de>
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
> Now that the CPU0 hotplug cruft is gone, the only user is AMD SEV.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Michael Kelley <mikelley@microsoft.com>
> ---
>   arch/x86/kernel/callthunks.c |    2 +-
>   arch/x86/kernel/head_32.S    |   14 --------------
>   arch/x86/kernel/head_64.S    |    2 +-
>   3 files changed, 2 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

