Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF7456A345A
	for <lists+linux-mips@lfdr.de>; Sun, 26 Feb 2023 23:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjBZWGQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Feb 2023 17:06:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbjBZWGP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 26 Feb 2023 17:06:15 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B07D712F28
        for <linux-mips@vger.kernel.org>; Sun, 26 Feb 2023 14:06:13 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so2248728wmq.1
        for <linux-mips@vger.kernel.org>; Sun, 26 Feb 2023 14:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XlGKZ7wdj+Qvqni5BfD6wPXmTTVswmPpgnANk96XNdk=;
        b=S7/1gPmyV420YYyzbgdhA7cfk+cbDYITgPhSFXOPu/N6gcrfKutB5xrVHbPCtKLrgH
         pgqablcflx4TFv3meiLROPzfXRz7qUTPNZBuEoe2uiEoeRaVtkSYpzSFjcXKXaPFTFRI
         57MGljjXcdEWsuR2queP95ZvWI/91LMMNqkOy1o3JSLkkVtr3qZoRFhC7sZhxi8tBSXC
         CYRNkRCh/2sDYAOAbsH7PHAzmVntbapyAjJeIi7l9UoooYmLSD8iAnvPQsqpHdbKL+3i
         Bzx6Wp8NmQf9vp2vcukCpXEMtN37MUhJ0f1zRY85Y++YGSEveibfa7vqz3VQcDC9Odnw
         LeeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XlGKZ7wdj+Qvqni5BfD6wPXmTTVswmPpgnANk96XNdk=;
        b=smpLMpmkgizlJb6zkPbnqAu5BybF/EJi5PJ8s9QDrQHY/HXOhnvPmAdJzZPmmR8F3A
         nMab50CwTVLHg/DkZEzeyDVE1iYUxfHrcAXOBIgv2Kxk46vsfVljJ8xwpjzlK/K/q7KH
         z9WzDHiJ3MOilA3Njn9CkQN96ijb9x107t3hIfpN5k2o+ymWydcG8F+0uo6V6JgFxr95
         UeolNfiOUcdZ3GucOpUEfvFKr1/YZnrTW0+kFte6n+oPraaPBhEnE6EuKGIQWCV1xDJ9
         6fnVET1g/hj3K8uQiwhqCe1SirDIYvNYCUAwz1HPzBcDtaPEC6yGlx1wqpFRN820hQS7
         7/zw==
X-Gm-Message-State: AO0yUKUOpe0mCMSkkU5uaMP3Qsqd+duqjBwC6b2VLusH529O0lG6BS4A
        9QSPBydj5SeFtFE0M18jcBzDtQ==
X-Google-Smtp-Source: AK7set8B6/ZqH3Pk5Tt7odXs1RODgI/1jz/ghOnjmhX1hJrHyKlILgpjOEaORuk1TqZEaINQd6mVsg==
X-Received: by 2002:a05:600c:2e93:b0:3eb:38a2:2bd2 with SMTP id p19-20020a05600c2e9300b003eb38a22bd2mr3492734wmn.11.1677449172163;
        Sun, 26 Feb 2023 14:06:12 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id i14-20020a05600c354e00b003e91b9a92c9sm7307719wmq.24.2023.02.26.14.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Feb 2023 14:06:11 -0800 (PST)
Message-ID: <1b4be71a-613e-9f27-eeb9-ddc48d15fa6b@linaro.org>
Date:   Sun, 26 Feb 2023 23:06:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] KVM: MIPS: Make kvm_mips_callbacks const
Content-Language: en-US
To:     Sean Christopherson <seanjc@google.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc:     linux-mips@vger.kernel.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230224192832.1286267-1-seanjc@google.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230224192832.1286267-1-seanjc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 24/2/23 20:28, Sean Christopherson wrote:
> Make kvm_mips_callbacks fully const as it's now hardcoded to point at
> kvm_vz_callbacks, the only remaining the set of callbacks.
> 
> Link: https://lore.kernel.org/all/beb697c2-dfad-780e-4638-76b229f28731@linaro.org
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/mips/include/asm/kvm_host.h | 2 +-
>   arch/mips/kvm/vz.c               | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks!
