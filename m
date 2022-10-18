Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB3D0602704
	for <lists+linux-mips@lfdr.de>; Tue, 18 Oct 2022 10:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbiJRIfR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 18 Oct 2022 04:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbiJRIfQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 18 Oct 2022 04:35:16 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A47E67695E
        for <linux-mips@vger.kernel.org>; Tue, 18 Oct 2022 01:35:11 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id j16so22289806wrh.5
        for <linux-mips@vger.kernel.org>; Tue, 18 Oct 2022 01:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=irjEodZoDWyqh+myKZC6Ercv4pu3++KsqjUWNNDJUpE=;
        b=JPvqqXowX1wb/VJFyzoCz3lQa4JJH5ObSlbB4B0FMj9dt6WE0Kd1kJ3CmKi02AcCo3
         8gw8/mf2hMix3EFWeSmSLIIr+IXTqq7q6uRvTZfeIRNjMJr8rkWpUi8n1kntqaCPleY1
         BP9IJab7Y0EDsK7xTKSBhlah5agbyrTpl2dAqvBh8IaKEiXDGbub0JrVFoTueFbkXrML
         I70KbL+aC7IOfVXj9DLM1xR2o2FllF+p9ZNQwHJY0xwAcMqbgVHx8rXHoso3+dBsQ/OS
         +UacA5MFyJh3bMj9MkdT3Dnf0dD1isxZhKB96CfTk2qyVBtPghDyc72IvMYiQDpQhpNZ
         CQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=irjEodZoDWyqh+myKZC6Ercv4pu3++KsqjUWNNDJUpE=;
        b=lOAqMhkZ4b2LnxuZzANs8utG4gDaN3RqxbxWtHhk3l+9CNZ4fwSg5LLLOe5glR/N3d
         MC2+JM0TGfcIzb2MKprwsItgq16PxxjUAnK6hbpVzpsC6WS3z+9fJH6JInYHh25KuOLv
         59VWNvqBXBQfm6+/vkoVRHLk4Np4um9QzJZk3KFCkkl9ws05TGKueA+cJkvEElR8Jyjl
         hO6CmNhHgb+Cc6awelAD9e+yhZRRc4B3dXXSikejWdCVL8QQYuAsWi61JO+4pw8SfXC4
         FnKn874TiIdW9HYgAkaCz68fHodj41A8dL/cwfbqxlCyC1HfuwRYDgPvjImpJuYL1Amx
         PunQ==
X-Gm-Message-State: ACrzQf0aWRBxkLVeZEP1XvCkHsTgDyu5iSwYKFQC8wNPtXCPravioqju
        yhhVKPl2Ac9paWcNES1b+khEtw==
X-Google-Smtp-Source: AMsMyM58ioqGoCbBfImW8eqHlvEj78w0cBupGkEntr7jeLeD6WzEB9OB6IlXe5bzqWRzQ4y+5kArCA==
X-Received: by 2002:a05:6000:154e:b0:230:45ad:fb87 with SMTP id 14-20020a056000154e00b0023045adfb87mr1163550wry.270.1666082109826;
        Tue, 18 Oct 2022 01:35:09 -0700 (PDT)
Received: from [192.168.79.175] (93.red-88-29-179.dynamicip.rima-tde.net. [88.29.179.93])
        by smtp.gmail.com with ESMTPSA id bl13-20020adfe24d000000b00228de351fc0sm10301823wrb.38.2022.10.18.01.35.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Oct 2022 01:35:09 -0700 (PDT)
Message-ID: <ab62f6fc-10f4-a353-5c17-8fec82eea662@linaro.org>
Date:   Tue, 18 Oct 2022 10:35:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH 06/13] mips: ptrace: user_regset_copyin_ignore() always
 returns 0
Content-Language: en-US
To:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        Oleg Nesterov <oleg@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>
References: <20221014212235.10770-1-s.shtylyov@omp.ru>
 <20221014212235.10770-7-s.shtylyov@omp.ru>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221014212235.10770-7-s.shtylyov@omp.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 14/10/22 23:22, Sergey Shtylyov wrote:
> user_regset_copyin_ignore() always returns 0, so checking its result seems
> pointless -- don't do this anymore...
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---
>   arch/mips/kernel/ptrace.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

