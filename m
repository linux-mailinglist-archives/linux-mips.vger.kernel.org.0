Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9CD59E5D8
	for <lists+linux-mips@lfdr.de>; Tue, 23 Aug 2022 17:17:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235972AbiHWPQ4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Aug 2022 11:16:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242699AbiHWPNU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Aug 2022 11:13:20 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 519689C1FD
        for <linux-mips@vger.kernel.org>; Tue, 23 Aug 2022 03:23:36 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id x25so13054014ljm.5
        for <linux-mips@vger.kernel.org>; Tue, 23 Aug 2022 03:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=yn5Cp9zoeWqGbxL3HM65C3eQTNCudh4CzSg5Uvw3JAk=;
        b=QAJc4lxwTmf0W3KWKXRjlw6qcyC3eHPyQ5QoGuhnvAn60+muAHk9sdN/Zcrm1cUMIq
         s/MnHrcCQNq3gmf9HYQNuccxGkfgpsLZL3+qnn86GSOLQoFZfN1u8KnQ3gDYLaOCKcgW
         fLKxap4SHvHxX6tr3L632x2JnYqbZa2/5J3CopLcqmYJfyGRzPyGN50TuOW8DZUOhphs
         zIJsqGjIJRIiRgqM/V447asxh+qfPATLOZ2Ic9S7QL+s5C7vfITWKfI8dfruPLKw483q
         WpUr3abO2RFu4eWv6TQUVEkjTKgPnmC0rnSEyrkHDsyWTtzGPQEzEXrNtaE6dS5IrIWZ
         Kyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=yn5Cp9zoeWqGbxL3HM65C3eQTNCudh4CzSg5Uvw3JAk=;
        b=hqSGRO0Y5Ab4wucGzLIP2LCWPrnFp2WdQTr78J+LpbHPuFOXLcNASL5XWdLpPIfA4/
         su99muBPK3UQ596jlJJXqw8iXCTFUt0b1mWIY7X3lG3gvMY9S4SNWqlv7Emhef1kWMBI
         SJgQNdOcp8ylLInAXOsjGQDOtbqCrF5az6hljlNpiDPYK2A7K9KSSDTodm0y/GOSFpnc
         9dJCKlZ+Q41/hD5VIMLxemBKs/83x2M2Bm0195cZcLfaalgfIdLNfcchlCkGTkQhdW2/
         FKyV3awF7cVdDFIpQ4ttTTWQR3KOhE9F/r/30/X2OIg5BhnjuW8Vqxyryi5DgOISxzns
         W8aQ==
X-Gm-Message-State: ACgBeo1eMmc+FjR8V2jPBwyzvVzQWisF0DqlApe2duoQNDMoM5KPvfL/
        XkZiEl3fCyf1Mt1vsdjPsokKHA==
X-Google-Smtp-Source: AA6agR4D5aExJIR72fiYWF97zzNBynY+4arB6wbMmJjNpCzNC+/Ov4i9Sl/PcwnVnQxQKarFz5l0fg==
X-Received: by 2002:a05:651c:114b:b0:25b:e13b:6900 with SMTP id h11-20020a05651c114b00b0025be13b6900mr6417785ljo.462.1661250214179;
        Tue, 23 Aug 2022 03:23:34 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id c4-20020a196544000000b00489e2156285sm2434193lfj.104.2022.08.23.03.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 03:23:33 -0700 (PDT)
Message-ID: <c3831c5a-7e10-2112-83e0-4ec2d70001c2@linaro.org>
Date:   Tue, 23 Aug 2022 13:23:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH RESEND v10 6/7] clk: baikal-t1: Add DDR/PCIe directly
 controlled resets support
Content-Language: en-US
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220822182934.23734-1-Sergey.Semin@baikalelectronics.ru>
 <20220822182934.23734-7-Sergey.Semin@baikalelectronics.ru>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220822182934.23734-7-Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 22/08/2022 21:29, Serge Semin wrote:
> Aside with a set of the trigger-like resets Baikal-T1 CCU provides two
> additional blocks with directly controlled reset signals. In particular it
> concerns DDR full and initial resets and various PCIe sub-domains resets.
> Let's add the direct reset assertion/de-assertion of the corresponding
> flags support into the Baikal-T1 CCU driver then. It will be required at
> least for the PCIe platform driver. Obviously the DDR controller isn't
> supposed to be fully reset in the kernel, so the corresponding controls
> are added just for the sake of the interface implementation completeness.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> ---
> 
> Changelog v6:
> - Refactor the code to support the linear reset IDs only. (@Philipp)
> 
> Changelog v7:
> - Drop empty line from the sys_rst_info structure initialization block.
>   (@Philipp)
> ---
>  drivers/clk/baikal-t1/ccu-rst.c     | 66 +++++++++++++++++++++++++++++
>  drivers/clk/baikal-t1/ccu-rst.h     | 10 +++++
>  include/dt-bindings/reset/bt1-ccu.h |  9 ++++

Do not mix drivers and bindings. Bindings always go separately, so this
has to be split.

Best regards,
Krzysztof
